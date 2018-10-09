using DataPointBatchClient.Models;

namespace DataPointBatchClient.Repositories
{
    public class AppointmentSourceRepository : BatchSourceRepository<Appointment>
    {
        private static string Resource { get; } = "Appointments";
        public AppointmentSourceRepository() : base(Resource) { }
    }

    public class ClientSourceRepository : BatchSourceRepository<Client>
    {
        private static string Resource { get; } = "Clients";
        public ClientSourceRepository() : base(Resource) { }
    }

    public class CodeSourceRepository : BatchSourceRepository<Code>
    {
        private static string Resource { get; } = "Codes";
        public CodeSourceRepository() : base(Resource) { }
    }

    public class InvoiceSourceRepository : BatchSourceRepository<Invoice>
    {
        private static string Resource { get; } = "Invoices";
        public InvoiceSourceRepository() : base(Resource) { }
    }

    public class PatientSourceRepository : BatchSourceRepository<Patient>
    {
        private static string Resource { get; } = "Patients";
        public PatientSourceRepository() : base(Resource) { }
    }

    public class PrescriptionSourceRepository : BatchSourceRepository<Prescription>
    {
        private static string Resource { get; } = "Prescriptions";
        public PrescriptionSourceRepository() : base(Resource) { }
    }

    public class ReminderSourceRepository : BatchSourceRepository<Reminder>
    {
        private static string Resource { get; } = "Reminders";
        public ReminderSourceRepository() : base(Resource) { }
    }

    public class ResourceSourceRepository : BatchSourceRepository<Resource>
    {
        private static string Resource { get; } = "Resources";
        public ResourceSourceRepository() : base(Resource) { }
    }

    public class TransactionSourceRepository : BatchSourceRepository<Transaction>
    {
        private static string Resource { get; } = "Transactions";
        public TransactionSourceRepository() : base(Resource) { }
    }
}
