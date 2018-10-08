namespace DataPointBatchClient.Models
{
    public class Code : BatchBase
    {
        public string pimsType { get; set; }
        public string code { get; set; }
        public string description { get; set; }
        public string categoryCode { get; set; }
        public string categoryDescription { get; set; }
        public double? basePrice { get; set; }
        public bool? inactive { get; set; }
        public string locationId { get; set; }
        public string invoiceDescription { get; set; }
        public double? unitCost { get; set; }
        public double? minPrice { get; set; }
        public double? dispensingFee { get; set; }
        public double? markup { get; set; }
        public string unitOfMeasure { get; set; }
        public string barCode { get; set; }
        public string normalizedCategory { get; set; }
        public string revenueClassId { get; set; }
        public string revenueGroupId { get; set; }
        public string revenueTypeId { get; set; }
        public string revenueSubTypeId { get; set; }
    }
}