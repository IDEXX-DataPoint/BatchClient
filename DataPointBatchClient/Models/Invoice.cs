using System;

namespace DataPointBatchClient.Models
{
    public class Invoice : BatchBase
    {
        public string InvoiceId { get; set; }
        public double? Amount { get; set; }
        public DateTime? TransactionDate { get; set; }
        public string ClientPimsId { get; set; }
        public string PatientPimsId { get; set; }
        public double? DiscountAmount { get; set; }
        public double? TaxAmount { get; set; }
        public string LocationId { get; set; }
    }
}