using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using DataPointBatchClient.Services;
using DataPointBatchClient.Utility;
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
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();
        private static readonly CancellationTokenSource TokenSource = new CancellationTokenSource();

        public void Start()
        {
            if (SqlConnectionValid())
            {
                Task.Run(StartJob);
            }
        }

        public void Stop()
        {
            TokenSource.Cancel();
        }

        private static bool SqlConnectionValid()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["DestinationData"].ConnectionString;
            using (var conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    return true;
                }
                catch (Exception e)
                {
                    Logger.Fatal(e);
                    return false;
                }
            }
        }

        private static async Task StartJob()
        {
            // todo config validation
            var hours = new TimeSpan(2, 0, 0); // 2 hours
            while (true)
            {
                await SyncSites();
                var nextTime = DateTime.Now.Date.AddDays(1).Add(hours) - DateTime.Now;
                await Task.Delay(nextTime);
            }
        }

        private static async Task SyncSites()
        {
            var siteIdList = await new BatchApiUtility().GetSiteIdList();
            foreach (var siteId in siteIdList)
            {
                await SyncSite(siteId);
            }
        }

        private static async Task SyncSite(string siteId)
        {
            try
            {
                var service = new BatchToSqlService(siteId, TokenSource.Token);
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
                Logger.Info("Cancellation exception caught in Program.Sync()");
            }
            catch (Exception e)
            {
                Logger.Error(e);
            }
        }

        private static void ValidateSuccess(IEnumerable<Task<bool>> tasks)
        {
            var message = "All tasks complete";

            if (tasks.Any(x => !x.Result))
                message += " with error(s)";
            
            Logger.Info(message);
        }
    }
}
