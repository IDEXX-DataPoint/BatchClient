MERGE dbo.Prescription AS target
USING (SELECT @code
    ,@description
    ,@providerId
    ,@providerName
    ,@administeredDate
    ,@quantity
    ,@amount
    ,@instructions
    ,@clientPimsId
    ,@patientPimsId
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
AS source (code
    ,description
    ,providerId
    ,providerName
    ,administeredDate
    ,quantity
    ,amount
    ,instructions
    ,clientPimsId
    ,patientPimsId
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
THEN UPDATE SET code = source.code
    ,description = source.description
    ,providerId = source.providerId
    ,providerName = source.providerName
    ,administeredDate = source.administeredDate
    ,quantity = source.quantity
    ,amount = source.amount
    ,instructions = source.instructions
    ,clientPimsId = source.clientPimsId
    ,patientPimsId = source.patientPimsId
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
THEN INSERT (code
    ,description
    ,providerId
    ,providerName
    ,administeredDate
    ,quantity
    ,amount
    ,instructions
    ,clientPimsId
    ,patientPimsId
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
VALUES (source.code
    ,source.description
    ,source.providerId
    ,source.providerName
    ,source.administeredDate
    ,source.quantity
    ,source.amount
    ,source.instructions
    ,source.clientPimsId
    ,source.patientPimsId
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