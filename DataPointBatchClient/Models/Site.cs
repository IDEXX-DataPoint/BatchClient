using System;

namespace DataPointBatchClient.Models
{
    public class Site
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string ContactPerson { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public DateTime? LastSyncDate { get; set; }
        public DateTime? LastStatusUpdate { get; set; }
        public string Status { get; set; }
        public string ComputerName { get; set; }
        public string AgentVersion { get; set; }
        public string PimsVersion { get; set; }
        public DateTime? LastRealtimeDiagnostic { get; set; }
        public string HostIp { get; set; }
        public string Key { get; set; }
        public string MachineIp { get; set; }
        public string PimsName { get; set; }
        public string CustomerId { get; set; }
        public bool HasDownload { get; set; }
        //public IEnumerable<GroupDto> Groups { get; set; }
        //public TransferDto MostRecentTransfer { get; set; }
        public int CurrentGeneration { get; set; }
        public int CurrentAzureGeneration { get; set; }
        public int? SapId { get; set; }
        public bool RealtimeEnabled { get; set; }
    }

    public class GroupDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Slug { get; set; }
    }

    public class TransferDto
    {
        public DateTime SyncDate { get; set; }
        public int CodeCount { get; set; }
        public int ClientCount { get; set; }
        public int InvoiceCount { get; set; }
        public int PatientCount { get; set; }
        public int ReminderCount { get; set; }
        public int ResourceCount { get; set; }
        public int TransactionCount { get; set; }
        public int PrescriptionCount { get; set; }
        public int AppointmentCount { get; set; }
    }
}