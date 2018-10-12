using System;
using System.Collections.Generic;
using System.Configuration;
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
        Task<IEnumerable<T>> GetBatchItems(int skip, CancellationToken token);
    }

    public abstract class BatchSourceRepository<T> : IBatchSourceRepository<T>
    {
        private readonly BatchApiUtility _batchApiUtility;
        private readonly SettingsService _settingsService;

        protected BatchSourceRepository(BatchApiUtility batchApiUtility, SettingsService settingsService)
        {
            _batchApiUtility = batchApiUtility;
            _settingsService = settingsService;
        }

        public abstract string Resource { get; }

        public async Task<IEnumerable<T>> GetBatchItems(int skip, CancellationToken token)
        {
            var request = await GetRequest(skip);

            try
            {
                var response = await _batchApiUtility.Client.ExecuteTaskAsync<BatchResponse<T>>(request, token);
                return response.Data.value;
            }
            catch (OperationCanceledException)
            {
                Console.WriteLine("Cancellation requested");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
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
            var siteId = ConfigurationManager.AppSettings["SiteId"];
            var lastUpdated = await _settingsService.GetLastUpdated(Resource);

            return string.IsNullOrEmpty(lastUpdated)
                ? $"siteId eq {siteId}"
                : $"siteId eq {siteId} and dpModifiedDate gt {lastUpdated}";
        }
    }

    public class BatchResponse<T>
    {
        public IEnumerable<T> value { get; set; }
    }
}
