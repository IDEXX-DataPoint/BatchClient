using System;

namespace DataPointBatchClient.Models
{
    public class Transaction : BatchBase
    {
        public string InvoiceId { get; set; }
        public string Type { get; set; }
        public string ClientPimsId { get; set; }
        public string PatientPimsId { get; set; }
        public DateTime? TransactionDate { get; set; }
        public double? Sequence { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public double? Quantity { get; set; }
        public double? Amount { get; set; }
        public double? Discount { get; set; }
        public double? Tax { get; set; }
        public double? DispensingFee { get; set; }
        public bool? IsPosted { get; set; }
        public bool? IsPayment { get; set; }
        public bool? IsVoided { get; set; }
        public string ProviderId { get; set; }
        public string EnteredById { get; set; }
        public string Comments { get; set; }
        public string LocationId { get; set; }
        public string NormalizedCategory { get; set; }
        public string RevenueClassId { get; set; }
        public string RevenueGroupId { get; set; }
        public string RevenueTypeId { get; set; }
        public string RevenueSubTypeId { get; set; }
    }
}