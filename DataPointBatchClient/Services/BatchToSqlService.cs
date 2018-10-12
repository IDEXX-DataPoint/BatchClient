using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using DataPointBatchClient.Repositories;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Services
{
    public class BatchToSqlService
    {
        private readonly CancellationToken _token;
        private readonly BatchApiUtility _batchApiUtility;
        private readonly SettingsService _settingsService;

        public BatchToSqlService(CancellationToken token, BatchApiUtility batchApiUtility = null, SettingsService settingsService = null)
        {
            _token = token;
            _batchApiUtility = batchApiUtility ?? new BatchApiUtility();
            _settingsService = settingsService ?? new SettingsService(new SettingsRepository());
        }

        public async Task<bool> SyncAppointments() => await SyncEntity(new AppointmentSourceRepository(_batchApiUtility, _settingsService), new AppointmentDestinationRepository());
        public async Task<bool> SyncClients() => await SyncEntity(new ClientSourceRepository(_batchApiUtility, _settingsService), new ClientDestinationRepository());
        public async Task<bool> SyncCodes() => await SyncEntity(new CodeSourceRepository(_batchApiUtility, _settingsService), new CodeDestinationRepository());
        public async Task<bool> SyncInvoices() => await SyncEntity(new InvoiceSourceRepository(_batchApiUtility, _settingsService), new InvoiceDestinationRepository());
        public async Task<bool> SyncPatients() => await SyncEntity(new PatientSourceRepository(_batchApiUtility, _settingsService), new PatientDestinationRepository());
        public async Task<bool> SyncPrescriptions() => await SyncEntity(new PrescriptionSourceRepository(_batchApiUtility, _settingsService), new PrescriptionDestinationRepository());
        public async Task<bool> SyncReminders() => await SyncEntity(new ReminderSourceRepository(_batchApiUtility, _settingsService), new ReminderDestinationRepository());
        public async Task<bool> SyncResources() => await SyncEntity(new ResourceSourceRepository(_batchApiUtility, _settingsService), new ResourceDestinationRepository());
        public async Task<bool> SyncTransactions() => await SyncEntity(new TransactionSourceRepository(_batchApiUtility, _settingsService), new TransactionDestinationRepository());

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

            await _settingsService.Update(type, startTime);
            Console.WriteLine($"{type} complete");
            return true;
        }
    }
}