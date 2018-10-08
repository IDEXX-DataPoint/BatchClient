using DataPointBatchClient.Models;

namespace DataPointBatchClient.Repositories
{
    public class AppointmentRepository : BatchSourceRepository<Appointment>
    {
        private static string Resource { get; } = "odata/Appointments";
        public AppointmentRepository() : base(Resource) { }
    }

    public class ClientRepository : BatchSourceRepository<Client>
    {
        private static string Resource { get; } = "odata/Clients";
        public ClientRepository() : base(Resource) { }
    }

    public class CodeRepository : BatchSourceRepository<Code>
    {
        private static string Resource { get; } = "odata/Codes";
        public CodeRepository() : base(Resource) { }
    }

    public class InvoiceRepository : BatchSourceRepository<Invoice>
    {
        private static string Resource { get; } = "odata/Invoices";
        public InvoiceRepository() : base(Resource) { }
    }

    public class PatientSourceRepository : BatchSourceRepository<Patient>
    {
        private static string Resource { get; } = "odata/Patients";
        public PatientSourceRepository() : base(Resource) { }
    }

    public class PrescriptionRepository : BatchSourceRepository<Prescription>
    {
        private static string Resource { get; } = "odata/Prescriptions";
        public PrescriptionRepository() : base(Resource) { }
    }

    public class ReminderRepository : BatchSourceRepository<Reminder>
    {
        private static string Resource { get; } = "odata/Reminders";
        public ReminderRepository() : base(Resource) { }
    }

    public class ResourceRepository : BatchSourceRepository<Resource>
    {
        private static string Resource { get; } = "odata/Resources";
        public ResourceRepository() : base(Resource) { }
    }

    public class TransactionRepository : BatchSourceRepository<Transaction>
    {
        private static string Resource { get; } = "odata/Transactions";
        public TransactionRepository() : base(Resource) { }
    }
}
