using System;
using System.Threading.Tasks;
using DataPointBatchClient.Models;
using DataPointBatchClient.Repositories;

namespace DataPointBatchClient.Services
{
    public class SettingsService
    {
        private readonly SettingsRepository _settingsRepository;

        public SettingsService(SettingsRepository settingsRepository)
        {
            _settingsRepository = settingsRepository;
        }

        public async Task<string> GetLastUpdated(string siteId, string resourceName)
        {
            var settings = await _settingsRepository.Get(siteId, resourceName);
            var date = settings?.LastUpdated;
            return date?.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'") ?? string.Empty;
        }

        public async Task Update(string siteId, string resourceName, DateTime lastUpdated)
        {
            var settings = new Settings
            {
                SiteId = siteId,
                ResourceName = resourceName,
                LastUpdated = lastUpdated
            };
            await _settingsRepository.Update(settings);
        }
    }
}
