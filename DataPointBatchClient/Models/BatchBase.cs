using System;

namespace DataPointBatchClient.Models
{
    public class BatchBase
    {
        public Guid? DpUid { get; set; }
        public string PimsId { get; set; }
        public int? SiteId { get; set; }
        public string AgentVersion { get; set; }
        public string Action { get; set; }
        public DateTime? DpCreateDate { get; set; }
        public DateTime? DpModifiedDate { get; set; }
        public DateTime? SyncDate { get; set; }
        public Guid? CorrelationId { get; set; }
        public Guid? LastModifiedByCorrelationId { get; set; }
        public double? Generation { get; set; }
        public bool? Deleted { get; set; }
    }
}
