using DataPointBatchClient.Models;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Repositories
{
    public class AppointmentSourceRepository : BatchSourceRepository<Appointment>
    {
        public override string Resource { get; } = "Appointments";

        public AppointmentSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class ClientSourceRepository : BatchSourceRepository<Client>
    {
        public override string Resource { get; } = "Clients";
        public ClientSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class CodeSourceRepository : BatchSourceRepository<CodeModel>
    {
        public override string Resource { get; } = "Codes";
        public CodeSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class InvoiceSourceRepository : BatchSourceRepository<Invoice>
    {
        public override string Resource { get; } = "Invoices";
        public InvoiceSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class PatientSourceRepository : BatchSourceRepository<Patient>
    {
        public override string Resource { get; } = "Patients";
        public PatientSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class PrescriptionSourceRepository : BatchSourceRepository<Prescription>
    {
        public override string Resource { get; } = "Prescriptions";
        public PrescriptionSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class ReminderSourceRepository : BatchSourceRepository<Reminder>
    {
        public override string Resource { get; } = "Reminders";
        public ReminderSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class ResourceSourceRepository : BatchSourceRepository<Resource>
    {
        public override string Resource { get; } = "Resources";
        public ResourceSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }

    public class TransactionSourceRepository : BatchSourceRepository<Transaction>
    {
        public override string Resource { get; } = "Transactions";
        public TransactionSourceRepository(BatchApiUtility batchApiUtility) : base(batchApiUtility) { }
    }
}
