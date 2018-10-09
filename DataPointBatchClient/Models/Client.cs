using System;

namespace DataPointBatchClient.Models
{
    public class Client : BatchBase
    {
        public string Title { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string AlternateFirstName { get; set; }
        public string AlternateLastName { get; set; }
        public DateTime? PimsCreatedDate { get; set; }
        public bool? Inactive { get; set; }
        public bool? SuspendReminders { get; set; }
        public string LocationId { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string AlternateAddress1 { get; set; }
        public string AlternateAddress2 { get; set; }
        public string AlternateCity { get; set; }
        public string AlternateState { get; set; }
        public string AlternatePostalCode { get; set; }
        public string PhoneName1 { get; set; }
        public string Phone1 { get; set; }
        public string PhoneName2 { get; set; }
        public string Phone2 { get; set; }
        public string PhoneName3 { get; set; }
        public string Phone3 { get; set; }
        public string Email { get; set; }
        public string PimsClientIdentifier { get; set; }
        public string ReferralSource { get; set; }
    }
}