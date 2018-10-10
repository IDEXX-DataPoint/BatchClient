using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using DataPointBatchClient.Services;
using Topshelf;

namespace DataPointBatchClient
{
    internal class Program
    {
        private static void Main()
        {
            IgnoreLastUpdatedOption();

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

        private static void IgnoreLastUpdatedOption()
        {
            // todo move LastUpdated logic into db
            if (!Debugger.IsAttached) return;

            var lastUpdated = Properties.Settings.Default.LastUpdated;
            if (string.IsNullOrEmpty(lastUpdated)) return;

            Console.Write($"Ignore LastUpdated '{lastUpdated}'? (y/n): ");
            var result = Console.ReadLine();
            if (result?.ToLower().FirstOrDefault() == 'y')
                Properties.Settings.Default.LastUpdated = string.Empty;
        }
    }

    public class BatchProcessAsync
    {
        public void Start()
        {
            var startTime = GetStartTime();

            // todo wrap in timer
            var success = RunAsync();
            if (success)
            {
                Console.WriteLine($"LastUpdated set to: {startTime}");
                Properties.Settings.Default.LastUpdated = startTime;
                Properties.Settings.Default.Save();
            }
        }

        public void Stop()
        {
            // todo dispose timer
            // todo link cancellation token
        }

        private static string GetStartTime()
        {
            return DateTime.UtcNow.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'");
        }

        private static bool RunAsync()
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

            return ValidateSuccess(tasks);
        }

        private static bool ValidateSuccess(IEnumerable<Task<bool>> tasks)
        {
            var success = true;
            var message = "All tasks complete";
            foreach (var task in tasks)
            {
                if (!task.Result)
                {
                    success = false;
                    message += " with error(s)";
                }
            }

            Console.WriteLine(message);
            return success;
        }
    }
}
