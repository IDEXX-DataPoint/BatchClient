using System;

namespace DataPointBatchClient.Models
{
    public class Patient : BatchBase
    {
        public string PimsPatientIdentifier { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string SpeciesDescription { get; set; }
        public string BreedId { get; set; }
        public string BreedDescription { get; set; }
        public string ColorId { get; set; }
        public string MicrochipId { get; set; }
        public string ColorDescription { get; set; }
        public DateTime? PimsCreatedDate { get; set; }
        public DateTime? DateOfDeath { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public bool SpayedOrNeutered { get; set; }
        public bool Inactive { get; set; }
        public double? Weight { get; set; }
        public string WeightUnit { get; set; }
        public string WeightUnitDescription { get; set; }
        public string RabiesTag { get; set; }
        public string ClientPimsId { get; set; }
        public string PimsClientIdentifier { get; set; }
        public string LocationId { get; set; }
    }
}
