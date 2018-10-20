using System.Threading;
using DataPointBatchClient.Models;

namespace DataPointBatchClient.Repositories
{
    public class AppointmentDestinationRepository : BatchDestinationRepository<Appointment>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeAppointment.sql";
        public AppointmentDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class ClientDestinationRepository : BatchDestinationRepository<Client>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeClient.sql";
        public ClientDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class CodeDestinationRepository : BatchDestinationRepository<CodeModel>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeCode.sql";
        public CodeDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class InvoiceDestinationRepository : BatchDestinationRepository<Invoice>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeInvoice.sql";
        public InvoiceDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class PatientDestinationRepository : BatchDestinationRepository<Patient>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergePatient.sql";
        public PatientDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class PrescriptionDestinationRepository : BatchDestinationRepository<Prescription>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergePrescription.sql";
        public PrescriptionDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class ReminderDestinationRepository : BatchDestinationRepository<Reminder>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeReminder.sql";
        public ReminderDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class ResourceDestinationRepository : BatchDestinationRepository<Resource>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeResource.sql";
        public ResourceDestinationRepository(CancellationToken token) : base(Path, token) { }
    }

    public class TransactionDestinationRepository : BatchDestinationRepository<Transaction>
    {
        private static string Path { get; } = "DataPointBatchClient.Scripts.MergeTransaction.sql";
        public TransactionDestinationRepository(CancellationToken token) : base(Path, token) { }
    }
}
