MERGE dbo.Patient AS target
USING (SELECT @PimsPatientIdentifier
	,@Name
	,@Gender
	,@SpeciesDescription
	,@BreedId
	,@BreedDescription
	,@ColorId
	,@MicrochipId
	,@ColorDescription
	,@PimsCreatedDate
	,@DateOfDeath
	,@DateOfBirth
	,@SpayedOrNeutered
	,@Inactive
	,@Weight
	,@WeightUnit
	,@WeightUnitDescription
	,@RabiesTag
	,@ClientPimsId
	,@PimsClientIdentifier
	,@LocationId
	,@DpUid
	,@PimsId
	,@SiteId
	,@AgentVersion
	,@Action
	,@DpCreatedDate
	,@DpModifiedDate
	,@SyncDate
	,@CorrelationId
	,@LastModifiedByCorrelationId
	,@Generation
	,@Deleted)
AS source (PimsPatientIdentifier
	,Name
	,Gender
	,SpeciesDescription
	,BreedId
	,BreedDescription
	,ColorId
	,MicrochipId
	,ColorDescription
	,PimsCreatedDate
	,DateOfDeath
	,DateOfBirth
	,SpayedOrNeutered
	,Inactive
	,Weight
	,WeightUnit
	,WeightUnitDescription
	,RabiesTag
	,ClientPimsId
	,PimsClientIdentifier
	,LocationId
	,DpUid
	,PimsId
	,SiteId
	,AgentVersion
	,Action
	,DpCreateDate
	,DpModifiedDate
	,SyncDate
	,CorrelationId
	,LastModifiedByCorrelationId
	,Generation
	,Deleted)
ON (target.DpUid = source.DpUid)

WHEN MATCHED AND source.Deleted = 1
THEN DELETE

WHEN MATCHED
THEN UPDATE SET PimsPatientIdentifier = source.PimsPatientIdentifier
	,Name = source.Name
	,Gender = source.Gender
	,SpeciesDescription = source.SpeciesDescription
	,BreedId = source.BreedId
	,BreedDescription = source.BreedDescription
	,ColorId = source.ColorId
	,MicrochipId = source.MicrochipId
	,ColorDescription = source.ColorDescription
	,PimsCreatedDate = source.PimsCreatedDate
	,DateOfDeath = source.DateOfDeath
	,DateOfBirth = source.DateOfBirth
	,SpayedOrNeutered = source.SpayedOrNeutered
	,Inactive = source.Inactive
	,Weight = source.Weight
	,WeightUnit = source.WeightUnit
	,WeightUnitDescription = source.WeightUnitDescription
	,RabiesTag = source.RabiesTag
	,ClientPimsId = source.ClientPimsId
	,PimsClientIdentifier = source.PimsClientIdentifier
	,LocationId = source.LocationId
	--,DpUid = source.DpUid
	,PimsId = source.PimsId
	,SiteId = source.SiteId
	,AgentVersion = source.AgentVersion
	,Action = source.Action
	,DpCreateDate = source.DpCreateDate
	,DpModifiedDate = source.DpModifiedDate
	,SyncDate = source.SyncDate
	,CorrelationId = source.CorrelationId
	,LastModifiedByCorrelationId = source.LastModifiedByCorrelationId
	,Generation = source.Generation
	,Deleted = source.Deleted

WHEN NOT MATCHED
THEN INSERT (PimsPatientIdentifier
	,Name
	,Gender
	,SpeciesDescription
	,BreedId
	,BreedDescription
	,ColorId
	,MicrochipId
	,ColorDescription
	,PimsCreatedDate
	,DateOfDeath
	,DateOfBirth
	,SpayedOrNeutered
	,Inactive
	,Weight
	,WeightUnit
	,WeightUnitDescription
	,RabiesTag
	,ClientPimsId
	,PimsClientIdentifier
	,LocationId
	,DpUid
	,PimsId
	,SiteId
	,AgentVersion
	,Action
	,DpCreateDate
	,DpModifiedDate
	,SyncDate
	,CorrelationId
	,LastModifiedByCorrelationId
	,Generation
	,Deleted)
VALUES (source.PimsPatientIdentifier
	,source.Name
	,source.Gender
	,source.SpeciesDescription
	,source.BreedId
	,source.BreedDescription
	,source.ColorId
	,source.MicrochipId
	,source.ColorDescription
	,source.PimsCreatedDate
	,source.DateOfDeath
	,source.DateOfBirth
	,source.SpayedOrNeutered
	,source.Inactive
	,source.Weight
	,source.WeightUnit
	,source.WeightUnitDescription
	,source.RabiesTag
	,source.ClientPimsId
	,source.PimsClientIdentifier
	,source.LocationId
	,source.DpUid
	,source.PimsId
	,source.SiteId
	,source.AgentVersion
	,source.Action
	,source.DpCreateDate
	,source.DpModifiedDate
	,source.SyncDate
	,source.CorrelationId
	,source.LastModifiedByCorrelationId
	,source.Generation
	,source.Deleted);