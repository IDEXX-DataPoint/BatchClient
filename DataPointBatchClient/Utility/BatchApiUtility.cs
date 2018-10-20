using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Authentication;
using System.Threading.Tasks;
using DataPointBatchClient.Models;
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
        private readonly Lazy<Task<List<string>>> _siteIdList;
        private readonly Lazy<Task<string>> _authToken;

        public BatchApiUtility()
        {
            Client = new RestClient(Endpoint);
            _siteIdList = new Lazy<Task<List<string>>>(InitializeSiteIdList);
            _authToken = new Lazy<Task<string>>(Authorize);
        }

        public Task<List<string>> GetSiteIdList()
        {
            return _siteIdList.Value;
        }

        private async Task<List<string>> InitializeSiteIdList()
        {
            var slug = ConfigurationManager.AppSettings["GroupName"];
            var request = new RestRequest($"api/sites/{slug}");
            request.AddHeader("Authorization", await GetAuthToken());
            var result = await Client.ExecuteTaskAsync<List<Site>>(request);
            if (result == null) throw new NullReferenceException("Empty SiteId list");
            return (from site in result.Data select site.Id).ToList();
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
