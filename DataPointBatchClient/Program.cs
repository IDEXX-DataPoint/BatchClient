using System;
using System.Linq;
using System.Threading.Tasks;
using DataPointBatchClient.Repositories;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient
{
    internal class Program
    {
        private static void Main()
        {
            new BatchProcessAsync().Start();
        }
    }

    public class BatchProcessAsync
    {
        public void Start()
        {
            var startTime = GetStartTime();

            RunAsync();

            // todo only if all successful
            Properties.Settings.Default.LastUpdated = startTime;
        }

        private static string GetStartTime()
        {
            return DateTime.UtcNow.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'");
        }

        private static void RunAsync()
        {
            var tasks = new[]
            {
                Process(new AppointmentSourceRepository(), new AppointmentDestinationRepository()),
                Process(new ClientSourceRepository(), new ClientDestinationRepository()),
                Process(new CodeSourceRepository(), new CodeDestinationRepository()),
                Process(new InvoiceSourceRepository(), new InvoiceDestinationRepository()),
                Process(new PatientSourceRepository(), new PatientDestinationRepository()),
                Process(new PrescriptionSourceRepository(), new PrescriptionDestinationRepository()),
                Process(new ReminderSourceRepository(), new ReminderDestinationRepository()),
                Process(new ResourceSourceRepository(), new ResourceDestinationRepository()),
                Process(new TransactionSourceRepository(), new TransactionDestinationRepository()),
            };
            Task.WaitAll(tasks);
        }

        private static async Task Process<TEntity>(IBatchSourceRepository<TEntity> sourceRepository, IBatchDestinationRepository<TEntity> destinationRepository)
        {
            int count;
            var processed = 0;

            // todo get then update Settings.LastUpdated

            do
            {
                var skip = processed;
                var items = await sourceRepository.GetBatchItems(skip);
                destinationRepository.MergeEntities(items);

                count = items.Count();
                processed += count;

            } while (count == BatchApiUtility.Top);
        }
    }
}
