using System;
using System.Collections.Generic;
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

            var success = RunAsync();

            if (success)
            {
                Console.WriteLine($"LastUpdate to new startTime {startTime}");
                Properties.Settings.Default.LastUpdated = startTime;
                Properties.Settings.Default.Save();
            }
            
            if (System.Diagnostics.Debugger.IsAttached) Console.ReadLine();
        }

        private static string GetStartTime()
        {
            return DateTime.UtcNow.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'");
        }

        private static bool RunAsync()
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

        private static async Task<bool> Process<TEntity>(IBatchSourceRepository<TEntity> sourceRepository, IBatchDestinationRepository<TEntity> destinationRepository)
        {
            int count;
            var processed = 0;
            var type = sourceRepository.GetResourceType();

            do
            {
                var skip = processed;
                var items = await sourceRepository.GetBatchItems(skip);
                var success = destinationRepository.MergeEntities(items);
                if (!success) return false; // todo review / discuss how to improve sql error handling
                
                count = items.Count();
                processed += count;
                Console.WriteLine($"{processed} {type} processed");

            } while (count == BatchApiUtility.Top);

            Console.WriteLine($"{processed} total {type} processed");
            return true;
        }
    }
}
