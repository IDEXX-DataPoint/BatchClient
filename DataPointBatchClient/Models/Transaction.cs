using System;

namespace DataPointBatchClient.Models
{
    public class Transaction : BatchBase
    {
        public string invoiceId { get; set; }
        public string type { get; set; }
        public string clientPimsId { get; set; }
        public string patientPimsId { get; set; }
        public DateTime? transactionDate { get; set; }
        public double? sequence { get; set; }
        public string code { get; set; }
        public string description { get; set; }
        public double? quantity { get; set; }
        public double? amount { get; set; }
        public double? discount { get; set; }
        public double? tax { get; set; }
        public double? dispensingFee { get; set; }
        public bool? isPosted { get; set; }
        public bool? isPayment { get; set; }
        public bool? isVoided { get; set; }
        public string providerId { get; set; }
        public string enteredById { get; set; }
        public string comments { get; set; }
        public string locationId { get; set; }
        public string normalizedCategory { get; set; }
        public string revenueClassId { get; set; }
        public string revenueGroupId { get; set; }
        public string revenueTypeId { get; set; }
        public string revenueSubTypeId { get; set; }
    }
}