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
            Task.Run(StartJob);
        }

        public void Stop()
        {
            TokenSource.Cancel();
        }

        private static async Task StartJob()
        {
            var hours = new TimeSpan(2, 0, 0); // 2 hours
            while (true)
            {
                await Sync();
                var nextTime = DateTime.Now.Date.AddDays(1).Add(hours) - DateTime.Now;
                await Task.Delay(nextTime);
            }
        }

        private static async Task Sync()
        {
            try
            {
                var service = new BatchToSqlService(TokenSource.Token);
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

                await Task.WhenAll(tasks);
                ValidateSuccess(tasks);
            }
            catch (OperationCanceledException)
            {
                Console.WriteLine("Sync cancelled");
            }
            catch (Exception e)
            {
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
