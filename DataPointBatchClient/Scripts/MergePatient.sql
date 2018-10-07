MERGE dbo.Patient AS target
USING (SELECT @pimsPatientIdentifier
	,@name
	,@gender
	,@speciesDescription
	,@breedId
	,@breedDescription
	,@colorId
	,@microchipId
	,@colorDescription
	,@dateOfDeath
	,@dateOfBirth
	,@spayedOrNeutered
	,@inactive
	,@weight
	,@weightUnit
	,@weightUnitDescription
	,@rabiesTag
	,@clientPimsId
	,@pimsClientIdentifier
	,@locationId
	,@dpUid
	,@pimsId
	,@siteId
	,@agentVersion
	,@action
	,@dpCreateDate
	,@dpModifiedDate
	,@syncDate
	,@correlationId
	,@lastModifiedByCorrelationId
	,@generation
	,@deleted)
AS source (pimsPatientIdentifier
	,name
	,gender
	,speciesDescription
	,breedId
	,breedDescription
	,colorId
	,microchipId
	,colorDescription
	,dateOfDeath
	,dateOfBirth
	,spayedOrNeutered
	,inactive
	,weight
	,weightUnit
	,weightUnitDescription
	,rabiesTag
	,clientPimsId
	,pimsClientIdentifier
	,locationId
	,dpUid
	,pimsId
	,siteId
	,agentVersion
	,action
	,dpCreateDate
	,dpModifiedDate
	,syncDate
	,correlationId
	,lastModifiedByCorrelationId
	,generation
	,deleted)
ON (target.dpUid = source.dpUid)

WHEN MATCHED AND source.deleted = 1
THEN DELETE

WHEN MATCHED
THEN UPDATE SET pimsPatientIdentifier = source.pimsPatientIdentifier
	,name = source.name
	,gender = source.gender
	,speciesDescription = source.speciesDescription
	,breedId = source.breedId
	,breedDescription = source.breedDescription
	,colorId = source.colorId
	,microchipId = source.microchipId
	,colorDescription = source.colorDescription
	,dateOfDeath = source.dateOfDeath
	,dateOfBirth = source.dateOfBirth
	,spayedOrNeutered = source.spayedOrNeutered
	,inactive = source.inactive
	,weight = source.weight
	,weightUnit = source.weightUnit
	,weightUnitDescription = source.weightUnitDescription
	,rabiesTag = source.rabiesTag
	,clientPimsId = source.clientPimsId
	,pimsClientIdentifier = source.pimsClientIdentifier
	,locationId = source.locationId
	--,dpUid = source.dpUid
	,pimsId = source.pimsId
	,siteId = source.siteId
	,agentVersion = source.agentVersion
	,action = source.action
	,dpCreateDate = source.dpCreateDate
	,dpModifiedDate = source.dpModifiedDate
	,syncDate = source.syncDate
	,correlationId = source.correlationId
	,lastModifiedByCorrelationId = source.lastModifiedByCorrelationId
	,generation = source.generation
	,deleted = source.deleted

WHEN NOT MATCHED
THEN INSERT (pimsPatientIdentifier
	,name
	,gender
	,speciesDescription
	,breedId
	,breedDescription
	,colorId
	,microchipId
	,colorDescription
	,dateOfDeath
	,dateOfBirth
	,spayedOrNeutered
	,inactive
	,weight
	,weightUnit
	,weightUnitDescription
	,rabiesTag
	,clientPimsId
	,pimsClientIdentifier
	,locationId
	,dpUid
	,pimsId
	,siteId
	,agentVersion
	,action
	,dpCreateDate
	,dpModifiedDate
	,syncDate
	,correlationId
	,lastModifiedByCorrelationId
	,generation
	,deleted)
VALUES (source.pimsPatientIdentifier
	,source.name
	,source.gender
	,source.speciesDescription
	,source.breedId
	,source.breedDescription
	,source.colorId
	,source.microchipId
	,source.colorDescription
	,source.dateOfDeath
	,source.dateOfBirth
	,source.spayedOrNeutered
	,source.inactive
	,source.weight
	,source.weightUnit
	,source.weightUnitDescription
	,source.rabiesTag
	,source.clientPimsId
	,source.pimsClientIdentifier
	,source.locationId
	,source.dpUid
	,source.pimsId
	,source.siteId
	,source.agentVersion
	,source.action
	,source.dpCreateDate
	,source.dpModifiedDate
	,source.syncDate
	,source.correlationId
	,source.lastModifiedByCorrelationId
	,source.generation
	,source.deleted);