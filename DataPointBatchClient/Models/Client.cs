using System;

namespace DataPointBatchClient.Models
{
    public class Client : BaseModel
    {
        public string title { get; set; }
        public string lastName { get; set; }
        public string firstName { get; set; }
        public string middleName { get; set; }
        public string alternateFirstName { get; set; }
        public string alternateLastName { get; set; }
        public DateTime? pimsCreatedDate { get; set; }
        public bool? inactive { get; set; }
        public bool? suspendReminders { get; set; }
        public string locationId { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string postalCode { get; set; }
        public string alternateAddress1 { get; set; }
        public string alternateAddress2 { get; set; }
        public string alternateCity { get; set; }
        public string alternateState { get; set; }
        public string alternatePostalCode { get; set; }
        public string phoneName1 { get; set; }
        public string phone1 { get; set; }
        public string phoneName2 { get; set; }
        public string phone2 { get; set; }
        public string phoneName3 { get; set; }
        public string phone3 { get; set; }
        public string email { get; set; }
        public string pimsClientIdentifier { get; set; }
        public string referralSource { get; set; }
    }
}