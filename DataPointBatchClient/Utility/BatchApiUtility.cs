using DataPointBatchClient.Models;
using RestSharp;

namespace DataPointBatchClient.Utility
{
    public static class BatchApiUtility
    {
        public static readonly RestClient Client;
        public static readonly string Token;
        public static int Top => 10; // for debugging

        private const string Endpoint = "https://io.datapointapi.com";

        static BatchApiUtility()
        {
            Client = new RestClient(Endpoint);
            Token = GetToken();
        }

        private static string GetToken()
        {
            var request = new RestRequest("token", Method.POST);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter("grant_type", "password");
            
            request.AddParameter("username", Properties.Settings.Default.Username);
            request.AddParameter("password", Properties.Settings.Default.Password);

            return Client.Execute<TokenResponse>(request).Data.access_token;
        }
    }
}
