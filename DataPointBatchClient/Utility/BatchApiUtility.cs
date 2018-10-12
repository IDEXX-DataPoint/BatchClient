using System;
using System.Configuration;
using System.Security.Authentication;
using System.Threading.Tasks;
using RestSharp;

namespace DataPointBatchClient.Utility
{
    /// <summary>
    /// Initialized once for all resources
    /// </summary>
    public class BatchApiUtility
    {
        public const int Top = 5000; // for debugging

        private const string Endpoint = "https://io.datapointapi.com";

        public RestClient Client { get; }
        private Lazy<Task<string>> _authToken;

        public BatchApiUtility()
        {
            Client = new RestClient(Endpoint);
            _authToken = new Lazy<Task<string>>(Authorize);
        }

        public Task<string> GetAuthToken()
        {
            return _authToken.Value;
        }

        private async Task<string> Authorize()
        {
            var request = new RestRequest("token", Method.POST);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter("grant_type", "password");
            request.AddParameter("username", ConfigurationManager.AppSettings["Username"]);
            request.AddParameter("password", ConfigurationManager.AppSettings["Password"]);

            var result = await Client.ExecuteTaskAsync<Token>(request);
            if (result == null) throw new AuthenticationException("Invalid credentials");
            var token = result.Data.access_token;
            return $"Bearer {token}";
        }
    }

    public class Token
    {
        public string access_token { get; set; }
    }
}
