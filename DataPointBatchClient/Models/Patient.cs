using System;

namespace DataPointBatchClient.Models
{
    public class Patient : BaseModel
    {
        public string pimsPatientIdentifier { get; set; }
        public string name { get; set; }
        public string gender { get; set; }
        public string speciesDescription { get; set; }
        public string breedId { get; set; }
        public string breedDescription { get; set; }
        public string colorId { get; set; }
        public string microchipId { get; set; }
        public string colorDescription { get; set; }
        public DateTime? dateOfDeath { get; set; }
        public DateTime? dateOfBirth { get; set; }
        public bool? spayedOrNeutered { get; set; }
        public bool? inactive { get; set; }
        public double? weight { get; set; }
        public string weightUnit { get; set; }
        public string weightUnitDescription { get; set; }
        public string rabiesTag { get; set; }
        public string clientPimsId { get; set; }
        public string pimsClientIdentifier { get; set; }
        public string locationId { get; set; }
    }
}
