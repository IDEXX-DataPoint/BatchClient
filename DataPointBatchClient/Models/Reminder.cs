using System;

namespace DataPointBatchClient.Models
{
    public class Reminder : BatchBase
    {
        public string ClientPimsId { get; set; }
        public string PatientPimsId { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public DateTime? DueDate { get; set; }
        public DateTime? LastRemindedDate { get; set; }
        public string LocationId { get; set; }
    }
}