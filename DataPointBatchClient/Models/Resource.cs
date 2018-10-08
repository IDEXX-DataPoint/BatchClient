namespace DataPointBatchClient.Models
{
    public class Resource : BatchBase
    {
        public string abbreviation { get; set; }
        public string lastName { get; set; }
        public string firstName { get; set; }
        public string middleName { get; set; }
        public string title { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string postalCode { get; set; }
        public string classId { get; set; }
        public string license { get; set; }
        public string note { get; set; }
        public string status { get; set; }
        public string locationId { get; set; }
    }
}