using System;

namespace DataPointBatchClient.Models
{
    public class Prescription : BatchBase
    {
        public string Code { get; set; }
        public string Description { get; set; }
        public string ProviderId { get; set; }
        public string ProviderName { get; set; }
        public DateTime? AdministeredDate { get; set; }
        public double? Quantity { get; set; }
        public double? Amount { get; set; }
        public string Instructions { get; set; }
        public string ClientPimsId { get; set; }
        public string PatientPimsId { get; set; }
        public string LocationId { get; set; }
    }
}