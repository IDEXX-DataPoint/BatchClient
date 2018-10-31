namespace DataPointBatchClient.Models
{
    public class CodeModel : BatchBase
    {
        public string PimsType { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public string CategoryCode { get; set; }
        public string CategoryDescription { get; set; }
        public double? BasePrice { get; set; }
        public bool Inactive { get; set; }
        public string LocationId { get; set; }
        public string InvoiceDescription { get; set; }
        public double? UnitCost { get; set; }
        public double? MinPrice { get; set; }
        public double? DispensingFee { get; set; }
        public double? Markup { get; set; }
        public string UnitOfMeasure { get; set; }
        public string BarCode { get; set; }
        public string NormalizedCategory { get; set; }
        public string RevenueClassId { get; set; }
        public string RevenueGroupId { get; set; }
        public string RevenueTypeId { get; set; }
        public string RevenueSubTypeId { get; set; }
    }
}