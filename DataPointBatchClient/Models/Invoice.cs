using System;

namespace DataPointBatchClient.Models
{
    public class Invoice : BaseModel
    {
        public string invoiceId { get; set; }
        public double? amount { get; set; }
        public DateTime? transactionDate { get; set; }
        public string clientPimsId { get; set; }
        public string patientPimsId { get; set; }
        public double? discountAmount { get; set; }
        public double? taxAmount { get; set; }
        public string locationId { get; set; }
    }
}