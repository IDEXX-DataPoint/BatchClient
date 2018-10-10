using System.Collections.Generic;
using System.Threading.Tasks;
using DataPointBatchClient.Services;
using DataPointBatchClient.Utility;
using RestSharp;

namespace DataPointBatchClient.Repositories
{
    public interface IBatchSourceRepository<T>
    {
        string GetResourceType();
        Task<IEnumerable<T>> GetBatchItems(int skip);
    }

    public abstract class BatchSourceRepository<T> : IBatchSourceRepository<T>
    {
        private readonly string _resource;

        protected BatchSourceRepository(string resource)
        {
            _resource = resource;
        }

        public string GetResourceType()
        {
            return _resource;
        }

        public async Task<IEnumerable<T>> GetBatchItems(int skip = 0)
        {
            var request = await GetRequest(skip);
            var response = await BatchApiUtility.Client.ExecuteTaskAsync<BatchResponse<T>>(request);
            return response.Data.value;
        }

        private async Task<RestRequest> GetRequest(int skip)
        {
            var request = new RestRequest($"odata/{_resource}");

            request.AddHeader("Authorization", BatchApiUtility.Authorization);
            request.AddParameter("$filter", await GetFilter());
            request.AddParameter("$top", BatchApiUtility.Top);
            request.AddParameter("$skip", skip);

            return request;
        }

        private async Task<string> GetFilter()
        {
            var siteId = Properties.Settings.Default.SiteId;
            var lastUpdated = await SettingsService.GetLastUpdated(_resource);

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
