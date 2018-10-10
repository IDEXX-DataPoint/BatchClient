using System;
using System.Collections.Generic;
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
        public void Start()
        {
            // todo wrap in timer
            RunAsync();
        }

        public void Stop()
        {
            // todo dispose timer
            // todo link cancellation token
        }

        private static void RunAsync()
        {
            var service = new DataPointBatchToSqlService();
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

        private static void ValidateSuccess(IEnumerable<Task<bool>> tasks)
        {
            var message = "All tasks complete";
            foreach (var task in tasks)
            {
                if (!task.Result)
                {
                    message += " with error(s)";
                }
            }

            Console.WriteLine(message);
        }
    }
}
