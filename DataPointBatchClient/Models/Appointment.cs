using System;

namespace DataPointBatchClient.Models
{
    public class Appointment : BaseModel
    {
        public string source { get; set; }
        public string type { get; set; }
        public string clientPimsId { get; set; }
        public string clientPimsIdentifier { get; set; }
        public string patientPimsId { get; set; }
        public string patientPimsIdentifier { get; set; }
        public DateTime? date { get; set; }
        public int duration { get; set; }
        public int units { get; set; }
        public int unitLength { get; set; }
        public string status { get; set; }
        public string room { get; set; }
        public string reason { get; set; }
        public string notes { get; set; }
        public string resourceId { get; set; }
        public string resourceName { get; set; }
        public string locationId { get; set; }
        public string scheduleType { get; set; }
    }
}
