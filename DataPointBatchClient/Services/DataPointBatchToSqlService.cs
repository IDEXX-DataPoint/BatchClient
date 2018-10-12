using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using DataPointBatchClient.Repositories;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Services
{
    public class DataPointBatchToSqlService
    {
        private readonly CancellationToken _token;
        private readonly BatchApiUtility _batchApiUtility;

        public DataPointBatchToSqlService(CancellationToken token, BatchApiUtility batchApiUtility = null)
        {
            _batchApiUtility = batchApiUtility ?? new BatchApiUtility();
            _token = token;
        }

        public async Task<bool> SyncAppointments() => await SyncEntity(new AppointmentSourceRepository(_batchApiUtility), new AppointmentDestinationRepository());
        public async Task<bool> SyncClients() => await SyncEntity(new ClientSourceRepository(_batchApiUtility), new ClientDestinationRepository());
        public async Task<bool> SyncCodes() => await SyncEntity(new CodeSourceRepository(_batchApiUtility), new CodeDestinationRepository());
        public async Task<bool> SyncInvoices() => await SyncEntity(new InvoiceSourceRepository(_batchApiUtility), new InvoiceDestinationRepository());
        public async Task<bool> SyncPatients() => await SyncEntity(new PatientSourceRepository(_batchApiUtility), new PatientDestinationRepository());
        public async Task<bool> SyncPrescriptions() => await SyncEntity(new PrescriptionSourceRepository(_batchApiUtility), new PrescriptionDestinationRepository());
        public async Task<bool> SyncReminders() => await SyncEntity(new ReminderSourceRepository(_batchApiUtility), new ReminderDestinationRepository());
        public async Task<bool> SyncResources() => await SyncEntity(new ResourceSourceRepository(_batchApiUtility), new ResourceDestinationRepository());
        public async Task<bool> SyncTransactions() => await SyncEntity(new TransactionSourceRepository(_batchApiUtility), new TransactionDestinationRepository());

        private async Task<bool> SyncEntity<T>(IBatchSourceRepository<T> sourceRepo, IBatchDestinationRepository<T> destinationRepo)
        {
            var type = sourceRepo.Resource;
            var startTime = DateTime.Now;

            int count;
            var processed = 0;

            do
            {
                var skip = processed;
                var items = await sourceRepo.GetBatchItems(skip, _token);
                var success = await destinationRepo.MergeEntities(items, _token);
                if (_token.IsCancellationRequested || !success) return false;

                count = items.Count();
                processed += count;
                Console.WriteLine($"{type} processed: {processed}");

            } while (count == BatchApiUtility.Top);

            SettingsService.Update(type, startTime);
            Console.WriteLine($"{type} complete");
            return true;
        }
    }
}