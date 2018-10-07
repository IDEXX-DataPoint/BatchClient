namespace DataPointBatchClient.Models
{
    public class TokenRequest
    {
        public string grant_type { get; set; }
        public string username { get; set; }
        public string password { get; set; }
    }

    public class TokenResponse
    {
        public string access_token { get; set; }
    }
}
