namespace DataPointBatchClient.Models
{
    public class Resource : BatchBase
    {
        public string Abbreviation { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string Title { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string ClassId { get; set; }
        public string License { get; set; }
        public string Note { get; set; }
        public string Status { get; set; }
        public string LocationId { get; set; }
    }
}