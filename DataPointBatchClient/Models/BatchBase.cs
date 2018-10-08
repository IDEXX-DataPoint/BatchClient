using System;

namespace DataPointBatchClient.Models
{
    public class BatchBase
    {
        public Guid? dpUid { get; set; }
        public string pimsId { get; set; }
        public int? siteId { get; set; }
        public string agentVersion { get; set; }
        public string action { get; set; }
        public DateTime? dpCreateDate { get; set; }
        public DateTime? dpModifiedDate { get; set; }
        public DateTime? syncDate { get; set; }
        public Guid? correlationId { get; set; }
        public Guid? lastModifiedByCorrelationId { get; set; }
        public double? generation { get; set; }
        public bool? deleted { get; set; }
    }
}
