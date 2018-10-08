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
                Process(new AppointmentRepository(), new AppointmentDestinationRepository()),
                Process(new ClientRepository(), new ClientDestinationRepository()),
                Process(new CodeRepository(), new CodeDestinationRepository()),
                Process(new InvoiceRepository(), new InvoiceDestinationRepository()),
                Process(new PatientSourceRepository(), new PatientDestinationRepository()),
                Process(new PrescriptionRepository(), new PrescriptionDestinationRepository()),
                Process(new ReminderRepository(), new ReminderDestinationRepository()),
                Process(new ResourceRepository(), new ResourceDestinationRepository()),
                Process(new TransactionRepository(), new TransactionDestinationRepository()),
            };
            Task.WaitAll(tasks);
        }

        private static async Task Process<TEntity>(IBatchSourceRepository<TEntity> sourceSourceRepository, IBatchDestinationRepository<TEntity> destinationRepository)
        {
            int count;
            var processed = 0;

            // todo get then update Settings.LastUpdated

            do
            {
                var skip = processed;
                var items = await sourceSourceRepository.GetBatchItems(skip);
                destinationRepository.MergeEntities(items);

                count = items.Count();
                processed += count;

            } while (count == BatchApiUtility.Top);
        }
    }
}
