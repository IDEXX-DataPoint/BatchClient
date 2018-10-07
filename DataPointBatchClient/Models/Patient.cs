using System;

namespace DataPointBatchClient.Models
{
    public class Patient
    {
        public string pimsPatientIdentifier { get; set; }
        public string name { get; set; }
        public string gender { get; set; }
        public string speciesDescription { get; set; }
        public string breedId { get; set; }
        public string breedDescription { get; set; }
        public string colorId { get; set; }
        public string microchipId { get; set; }
        public string colorDescription { get; set; }
        public DateTime? dateOfDeath { get; set; }
        public DateTime? dateOfBirth { get; set; }
        public bool? spayedOrNeutered { get; set; }
        public bool? inactive { get; set; }
        public string weight { get; set; }
        public string weightUnit { get; set; }
        public string weightUnitDescription { get; set; }
        public string rabiesTag { get; set; }
        public string clientPimsId { get; set; }
        public string pimsClientIdentifier { get; set; }
        public string locationId { get; set; }
        public Guid? dpUid { get; set; }
        public string pimsId { get; set; }
        public int? siteId { get; set; }
        public string agentVersion { get; set; }
        public string action { get; set; }
        public DateTime? dpCreateDate { get; set; }
        public DateTime? dpModifiedDate { get; set; }
        public DateTime? syncDate { get; set; }
        public Guid? correlationId { get; set; }
        public Guid? lastModifiedByCorrelationId { get; set; }
        public int? generation { get; set; }
        public bool? deleted { get; set; }
    }
}
