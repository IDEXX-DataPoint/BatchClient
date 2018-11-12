using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using DataPointBatchClient.Models;
using DataPointBatchClient.Repositories;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Services
{
    public class BatchToSqlService
    {
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();
        private readonly Site _site;
        private readonly string _siteId;
        private readonly CancellationToken _token;
        private readonly BatchApiUtility _batchApiUtility;
        private readonly SettingsService _settingsService;

        public BatchToSqlService(Site site, CancellationToken token, BatchApiUtility batchApiUtility = null, SettingsService settingsService = null)
        {
            _site = site;
            _siteId = site.Id;
            _token = token;
            _batchApiUtility = batchApiUtility ?? new BatchApiUtility();
            _settingsService = settingsService ?? new SettingsService(new SettingsRepository());
        }

        public async Task<bool> SyncAppointments() => await SyncEntity(new AppointmentSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new AppointmentDestinationRepository(_token));
        public async Task<bool> SyncClients() => await SyncEntity(new ClientSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new ClientDestinationRepository(_token));
        public async Task<bool> SyncCodes() => await SyncEntity(new CodeSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new CodeDestinationRepository(_token));
        public async Task<bool> SyncInvoices() => await SyncEntity(new InvoiceSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new InvoiceDestinationRepository(_token));
        public async Task<bool> SyncPatients() => await SyncEntity(new PatientSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new PatientDestinationRepository(_token));
        public async Task<bool> SyncPrescriptions() => await SyncEntity(new PrescriptionSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new PrescriptionDestinationRepository(_token));
        public async Task<bool> SyncReminders() => await SyncEntity(new ReminderSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new ReminderDestinationRepository(_token));
        public async Task<bool> SyncResources() => await SyncEntity(new ResourceSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new ResourceDestinationRepository(_token));
        public async Task<bool> SyncSite() => await new SiteDestinationRepository(_token).MergeEntities(new []{_site});
        public async Task<bool> SyncTransactions() => await SyncEntity(new TransactionSourceRepository(_siteId, _token, _batchApiUtility, _settingsService), new TransactionDestinationRepository(_token));

        private async Task<bool> SyncEntity<T>(IBatchSourceRepository<T> sourceRepo, IBatchDestinationRepository<T> destinationRepo)
        {
            var type = sourceRepo.Resource;
            var startTime = DateTime.Now;

            int count;
            var processed = 0;

            do
            {
                var skip = processed;
                var items = await sourceRepo.GetBatchItems(skip);
                var success = await destinationRepo.MergeEntities(items);
                if (_token.IsCancellationRequested || !success) return false;

                count = items.Count();
                processed += count;
                Logger.Trace("{0} processed: {1}", type, processed);

            } while (count == BatchApiUtility.Top);

            await _settingsService.Update(_siteId, type, startTime);
            Logger.Trace("{0} complete", type);
            return true;
        }
    }
}