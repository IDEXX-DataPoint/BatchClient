using RestSharp;

namespace DataPointBatchClient.Utility
{
    /// <summary>
    /// Variables which only be initialized once for all resources
    /// </summary>
    public static class BatchApiUtility
    {
        public static readonly RestClient Client;
        public static readonly string Authorization;
        public static readonly string Filter;
        public static int Top => 5000; // for debugging

        private const string Endpoint = "https://io.datapointapi.com";

        static BatchApiUtility()
        {
            // todo test singleton constructor called only once
            Client = new RestClient(Endpoint);
            Authorization = GetAuthorization();
            Filter = GetFilter();
        }

        private static string GetAuthorization()
        {
            var request = new RestRequest("token", Method.POST);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddParameter("grant_type", "password");
            request.AddParameter("username", Properties.Settings.Default.Username);
            request.AddParameter("password", Properties.Settings.Default.Password);

            var token = Client.Execute<Token>(request).Data.access_token;
            return $"Bearer {token}";
        }

        private static string GetFilter()
        {
            var siteId = Properties.Settings.Default.SiteId;
            var lastUpdated = Properties.Settings.Default.LastUpdated;

            return string.IsNullOrEmpty(lastUpdated)
                ? $"siteId eq {siteId}"
                : $"siteId eq {siteId} and dpModifiedDate gt {lastUpdated}";
        }
    }

    public class Token
    {
        public string access_token { get; set; }
    }
}
