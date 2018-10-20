using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DataPointBatchClient.Services;
using DataPointBatchClient.Utility;
using RestSharp;

namespace DataPointBatchClient.Repositories
{
    public interface IBatchSourceRepository<T>
    {
        string Resource { get; }
        Task<IEnumerable<T>> GetBatchItems(int skip);
    }

    public abstract class BatchSourceRepository<T> : IBatchSourceRepository<T>
    {
        private readonly NLog.Logger _logger = NLog.LogManager.GetCurrentClassLogger();
        private readonly string _siteId;
        private readonly CancellationToken _token;
        private readonly BatchApiUtility _batchApiUtility;
        private readonly SettingsService _settingsService;

        protected BatchSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
        {
            _siteId = siteId;
            _token = token;
            _batchApiUtility = batchApiUtility;
            _settingsService = settingsService;
        }

        public abstract string Resource { get; }

        public async Task<IEnumerable<T>> GetBatchItems(int skip)
        {
            var request = await GetRequest(skip);

            try
            {
                var response = await _batchApiUtility.Client.ExecuteTaskAsync<BatchResponse<T>>(request, _token);
                return response.Data.value;
            }
            catch (OperationCanceledException)
            {
                _logger.Info("Cancellation invoked during request");
            }
            catch (Exception e)
            {
                _logger.Error(e);
            }

            return new List<T>();
        }

        private async Task<RestRequest> GetRequest(int skip)
        {
            var request = new RestRequest($"odata/{Resource}");

            request.AddHeader("Authorization", await _batchApiUtility.GetAuthToken());
            request.AddParameter("$filter", await GetFilter());
            request.AddParameter("$top", BatchApiUtility.Top);
            request.AddParameter("$skip", skip);

            return request;
        }

        private async Task<string> GetFilter()
        {
            var lastUpdated = await _settingsService.GetLastUpdated(_siteId, Resource);
            return string.IsNullOrEmpty(lastUpdated)
                ? $"siteId eq {_siteId}"
                : $"siteId eq {_siteId} and dpModifiedDate gt {lastUpdated}";
        }
    }

    public class BatchResponse<T>
    {
        public IEnumerable<T> value { get; set; }
    }
}
