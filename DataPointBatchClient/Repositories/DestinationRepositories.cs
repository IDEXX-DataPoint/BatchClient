using DataPointBatchClient.Models;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Repositories
{
    public class AppointmentDestinationRepository : BatchDestinationRepository<Appointment>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeAppointment.sql";
        public AppointmentDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class ClientDestinationRepository : BatchDestinationRepository<Client>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeClient.sql";
        public ClientDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class CodeDestinationRepository : BatchDestinationRepository<Code>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeCode.sql";
        public CodeDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class InvoiceDestinationRepository : BatchDestinationRepository<Invoice>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeInvoice.sql";
        public InvoiceDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class PatientDestinationRepository : BatchDestinationRepository<Patient>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergePatient.sql";
        public PatientDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class PrescriptionDestinationRepository : BatchDestinationRepository<Prescription>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergePrescription.sql";
        public PrescriptionDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class ReminderDestinationRepository : BatchDestinationRepository<Reminder>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeReminder.sql";
        public ReminderDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class ResourceDestinationRepository : BatchDestinationRepository<Resource>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeResource.sql";
        public ResourceDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }

    public class TransactionDestinationRepository : BatchDestinationRepository<Transaction>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeTransaction.sql";
        public TransactionDestinationRepository() : base(EmbeddedResource.Get(Path)) { }
    }
}
