using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using DataPointBatchClient.Services;
using Topshelf;

namespace DataPointBatchClient
{
    internal class Program
    {
        private static void Main()
        {
            HostFactory.Run(host =>
            {
                host.Service<BatchProcessAsync>(service =>
                {
                    service.ConstructUsing(() => new BatchProcessAsync());
                    service.WhenStarted(x => x.Start());
                    service.WhenStopped(x => x.Stop());
                });

                host.RunAsLocalSystem();

                host.SetDescription("Pull DataPoint batch API data into a local database");
                host.SetDisplayName("DataPoint Batch Client");
                host.SetServiceName("DataPoint Batch Client");
            });
        }
    }

    public class BatchProcessAsync
    {
        private static readonly CancellationTokenSource TokenSource = new CancellationTokenSource();

        public void Start()
        {
            // todo wrap in timer
            RunAsync();
        }

        public void Stop()
        {
            TokenSource.Cancel();
        }

        private static void RunAsync()
        {
            try
            {
                var service = new DataPointBatchToSqlService(TokenSource.Token);
                var tasks = new[]
                {
                    service.SyncAppointments(),
                    service.SyncClients(),
                    service.SyncCodes(),
                    service.SyncInvoices(),
                    service.SyncPatients(),
                    service.SyncPrescriptions(),
                    service.SyncReminders(),
                    service.SyncResources(),
                    service.SyncTransactions(),
                };

                Task.WaitAll(tasks);
                ValidateSuccess(tasks);
            }
            catch (OperationCanceledException)
            {
                Console.WriteLine("Sync cancelled");
            }
            catch (Exception e)
            {// one or more errors occured
                Console.WriteLine(e.Message);
            }
        }

        private static void ValidateSuccess(IEnumerable<Task<bool>> tasks)
        {
            var message = "All tasks complete";

            if (tasks.Any(x => !x.Result))
                message += " with error(s)";

            Console.WriteLine(message);
        }
    }
}
