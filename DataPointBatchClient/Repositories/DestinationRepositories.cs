using DataPointBatchClient.Models;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Repositories
{
    public class PatientDestinationRepository : BatchDestinationRepository<Patient>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergePatient.sql";

        public PatientDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }
}
