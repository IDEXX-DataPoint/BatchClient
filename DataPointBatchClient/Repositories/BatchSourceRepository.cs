using System.Collections.Generic;
using System.Threading.Tasks;
using DataPointBatchClient.Utility;
using RestSharp;

namespace DataPointBatchClient.Repositories
{
    public interface IBatchSourceRepository<T>
    {
        Task<IEnumerable<T>> GetBatchItems(int skip);
    }

    public abstract class BatchSourceRepository<T> : IBatchSourceRepository<T>
    {
        private readonly string _resource;

        protected BatchSourceRepository(string resource)
        {
            _resource = resource;
        }

        private RestRequest GetRequest(int skip)
        {
            var request = new RestRequest(_resource);

            request.AddHeader("Authorization", BatchApiUtility.Authorization);
            request.AddParameter("$filter", BatchApiUtility.Filter);
            request.AddParameter("$top", BatchApiUtility.Top);
            request.AddParameter("$skip", skip);

            return request;
        }

        public async Task<IEnumerable<T>> GetBatchItems(int skip = 0)
        {
            var request = GetRequest(skip);
            var response = await BatchApiUtility.Client.ExecuteTaskAsync<BatchResponse<T>>(request);
            return response.Data.value;
        }
    }

    public class BatchResponse<T>
    {
        public IEnumerable<T> value { get; set; }
    }
}
