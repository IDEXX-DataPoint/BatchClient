using System;
using System.Linq;
using System.Threading.Tasks;
using DataPointBatchClient.Models;
using DataPointBatchClient.Repositories;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Services
{
    public abstract class DataPointBatchToSqlService<T>
    {
        private readonly IBatchSourceRepository<T> _sourceRepo;
        private readonly IBatchDestinationRepository<T> _destinationRepo;

        protected DataPointBatchToSqlService(IBatchSourceRepository<T> sourceRepo,
            IBatchDestinationRepository<T> destinationRepo)
        {
            _sourceRepo = sourceRepo;
            _destinationRepo = destinationRepo;
        }

        public async Task<bool> Process()
        {
            int count;
            var processed = 0;
            var type = _sourceRepo.GetResourceType();

            do
            {
                var skip = processed;
                var items = await _sourceRepo.GetBatchItems(skip);
                var success = await _destinationRepo.MergeEntities(items);
                if (!success) return false;

                count = items.Count();
                processed += count;
                Console.WriteLine($"{type} processed: {processed}");

            } while (count == BatchApiUtility.Top);

            Console.WriteLine($"{type} complete");
            return true;
        }
    }

    public class AppointmentBatchToSqlService : DataPointBatchToSqlService<Appointment>
    {
        public AppointmentBatchToSqlService() : base(new AppointmentSourceRepository(), new AppointmentDestinationRepository())
        {
        }
    }

    public class ClientBatchToSqlService : DataPointBatchToSqlService<Client>
    {
        public ClientBatchToSqlService() : base(new ClientSourceRepository(), new ClientDestinationRepository())
        {
        }
    }

    public class CodeBatchToSqlService : DataPointBatchToSqlService<CodeModel>
    {
        public CodeBatchToSqlService() : base(new CodeSourceRepository(), new CodeDestinationRepository())
        {
        }
    }

    public class InvoiceBatchToSqlService : DataPointBatchToSqlService<Invoice>
    {
        public InvoiceBatchToSqlService() : base(new InvoiceSourceRepository(), new InvoiceDestinationRepository())
        {
        }
    }

    public class PatientBatchToSqlService : DataPointBatchToSqlService<Patient>
    {
        public PatientBatchToSqlService() : base(new PatientSourceRepository(), new PatientDestinationRepository())
        {
        }
    }

    public class PrescriptionBatchToSqlService : DataPointBatchToSqlService<Prescription>
    {
        public PrescriptionBatchToSqlService() : base(new PrescriptionSourceRepository(), new PrescriptionDestinationRepository())
        {
        }
    }

    public class ReminderBatchToSqlService : DataPointBatchToSqlService<Reminder>
    {
        public ReminderBatchToSqlService() : base(new ReminderSourceRepository(), new ReminderDestinationRepository())
        {
        }
    }

    public class ResourceBatchToSqlService : DataPointBatchToSqlService<Resource>
    {
        public ResourceBatchToSqlService() : base(new ResourceSourceRepository(), new ResourceDestinationRepository())
        {
        }
    }

    public class TransactionBatchToSqlService : DataPointBatchToSqlService<Transaction>
    {
        public TransactionBatchToSqlService() : base(new TransactionSourceRepository(), new TransactionDestinationRepository())
        {
        }
    }
}