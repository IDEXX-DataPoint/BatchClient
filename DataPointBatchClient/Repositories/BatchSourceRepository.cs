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
        public abstract RestRequest RestRequest(int skip);

        public async Task<IEnumerable<T>> GetBatchItems(int skip = 0)
        {
            var request = RestRequest(skip);
            var response = await BatchApiUtility.Client.ExecuteTaskAsync<BatchResponse<T>>(request);
            return response.Data.value;
        }

        public class BatchResponse<T>
        {
            public IEnumerable<T> value { get; set; }
        }
    }
}
