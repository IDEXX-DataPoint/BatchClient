using System;

namespace DataPointBatchClient.Models
{
    public class Reminder : BaseModel
    {
        public string clientPimsId { get; set; }
        public string patientPimsId { get; set; }
        public string code { get; set; }
        public string description { get; set; }
        public DateTime? dueDate { get; set; }
        public DateTime? lastRemindedDate { get; set; }
        public string locationId { get; set; }
    }
}