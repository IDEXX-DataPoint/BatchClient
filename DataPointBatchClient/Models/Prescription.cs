using System;

namespace DataPointBatchClient.Models
{
    public class Prescription : BaseModel
    {
        public string code { get; set; }
        public string description { get; set; }
        public string providerId { get; set; }
        public string providerName { get; set; }
        public DateTime? administeredDate { get; set; }
        public double? quantity { get; set; }
        public double? amount { get; set; }
        public string instructions { get; set; }
        public string clientPimsId { get; set; }
        public string patientPimsId { get; set; }
        public string locationId { get; set; }
    }
}