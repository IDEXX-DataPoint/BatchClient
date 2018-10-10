using System;
using System.Threading.Tasks;
using DataPointBatchClient.Models;
using DataPointBatchClient.Repositories;

namespace DataPointBatchClient.Services
{
    public static class SettingsService
    {
        public static async Task<string> GetLastUpdated(string resourceName)
        {
            var settings = await SettingsRepository.Get(resourceName);
            var date = settings?.LastUpdated;
            return date?.ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'") ?? string.Empty;
        }

        public static void Update(string resourceName, DateTime lastUpdated)
        {
            var settings = new Settings
            {
                ResourceName = resourceName,
                LastUpdated = lastUpdated
            };
            SettingsRepository.Update(settings);
        }
    }
}
