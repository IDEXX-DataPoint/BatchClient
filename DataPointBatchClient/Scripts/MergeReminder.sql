MERGE dbo.Reminder AS target
USING (SELECT @clientPimsId
    ,@patientPimsId
    ,@code
    ,@description
    ,@dueDate
    ,@lastRemindedDate
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
AS source (clientPimsId
    ,patientPimsId
    ,code
    ,description
    ,dueDate
    ,lastRemindedDate
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
THEN UPDATE SET clientPimsId = source.clientPimsId
    ,patientPimsId = source.patientPimsId
    ,code = source.code
    ,description = source.description
    ,dueDate = source.dueDate
    ,lastRemindedDate = source.lastRemindedDate
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
THEN INSERT (clientPimsId
    ,patientPimsId
    ,code
    ,description
    ,dueDate
    ,lastRemindedDate
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
VALUES (source.clientPimsId
    ,source.patientPimsId
    ,source.code
    ,source.description
    ,source.dueDate
    ,source.lastRemindedDate
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