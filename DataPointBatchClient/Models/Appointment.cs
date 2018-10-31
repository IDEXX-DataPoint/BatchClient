using System;

namespace DataPointBatchClient.Models
{
    public class Appointment : BatchBase
    {
        public string Source { get; set; }
        public string Type { get; set; }
        public string ClientPimsId { get; set; }
        public string ClientPimsIdentifier { get; set; }
        public string PatientPimsId { get; set; }
        public string PatientPimsIdentifier { get; set; }
        public DateTime? Date { get; set; }
        public int? Duration { get; set; }
        public int? Units { get; set; }
        public int? UnitLength { get; set; }
        public string Status { get; set; }
        public string Room { get; set; }
        public string Reason { get; set; }
        public string Notes { get; set; }
        public string ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string LocationId { get; set; }
        public string ScheduleType { get; set; }
        public int StatusNormalizedId { get; set; }
        public string StatusNormalizedDescription { get; set; }
        public string StatusPimsId { get; set; }
        public string StatusPimsDescription { get; set; }
    }
}
