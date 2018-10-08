using DataPointBatchClient.Models;
using DataPointBatchClient.Utility;
using RestSharp;

namespace DataPointBatchClient.Repositories
{
    public class PatientSourceRepository : BatchSourceRepository<Patient>
    {
        public override RestRequest RestRequest(int skip)
        {
            var request = new RestRequest("odata/Patients");
            request.AddHeader("Authorization", $"Bearer {BatchApiUtility.Token}");
            // todo $filter by siteId and dpModifiedDate
            request.AddParameter("$top", BatchApiUtility.Top);
            request.AddParameter("$skip", skip);

            return request;
        }
    }
}
