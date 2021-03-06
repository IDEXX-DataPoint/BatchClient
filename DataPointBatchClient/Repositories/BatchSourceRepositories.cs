﻿using System.Threading;
using DataPointBatchClient.Models;
using DataPointBatchClient.Services;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Repositories
{
    public class AppointmentSourceRepository : BatchSourceRepository<Appointment>
    {
        public override string Resource { get; } = "Appointments";
        public AppointmentSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class ClientSourceRepository : BatchSourceRepository<Client>
    {
        public override string Resource { get; } = "Clients";
        public ClientSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class CodeSourceRepository : BatchSourceRepository<CodeModel>
    {
        public override string Resource { get; } = "Codes";
        public CodeSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class InvoiceSourceRepository : BatchSourceRepository<Invoice>
    {
        public override string Resource { get; } = "Invoices";
        public InvoiceSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class PatientSourceRepository : BatchSourceRepository<Patient>
    {
        public override string Resource { get; } = "Patients";
        public PatientSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class PrescriptionSourceRepository : BatchSourceRepository<Prescription>
    {
        public override string Resource { get; } = "Prescriptions";
        public PrescriptionSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class ReminderSourceRepository : BatchSourceRepository<Reminder>
    {
        public override string Resource { get; } = "Reminders";
        public ReminderSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class ResourceSourceRepository : BatchSourceRepository<Resource>
    {
        public override string Resource { get; } = "Resources";
        public ResourceSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }

    public class TransactionSourceRepository : BatchSourceRepository<Transaction>
    {
        public override string Resource { get; } = "Transactions";
        public TransactionSourceRepository(string siteId, CancellationToken token, BatchApiUtility batchApiUtility, SettingsService settingsService)
            : base(siteId, token, batchApiUtility, settingsService) { }
    }
}
