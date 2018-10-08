MERGE dbo.MyTable AS target
USING (SELECT @source
    ,@type
    ,@clientPimsId
    ,@clientPimsIdentifier
    ,@patientPimsId
    ,@patientPimsIdentifier
    ,@date
    ,@duration
    ,@units
    ,@unitLength
    ,@status
    ,@room
    ,@reason
    ,@notes
    ,@resourceId
    ,@resourceName
    ,@locationId
    ,@scheduleType
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
AS sourceTable (source
    ,type
    ,clientPimsId
    ,clientPimsIdentifier
    ,patientPimsId
    ,patientPimsIdentifier
    ,date
    ,duration
    ,units
    ,unitLength
    ,status
    ,room
    ,reason
    ,notes
    ,resourceId
    ,resourceName
    ,locationId
    ,scheduleType
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
ON (target.dpUid = sourceTable.dpUid)

WHEN MATCHED AND sourceTable.deleted = 1
THEN DELETE

WHEN MATCHED
THEN UPDATE SET source = sourceTable.source
    ,type = sourceTable.type
    ,clientPimsId = sourceTable.clientPimsId
    ,clientPimsIdentifier = sourceTable.clientPimsIdentifier
    ,patientPimsId = sourceTable.patientPimsId
    ,patientPimsIdentifier = sourceTable.patientPimsIdentifier
    ,date = sourceTable.date
    ,duration = sourceTable.duration
    ,units = sourceTable.units
    ,unitLength = sourceTable.unitLength
    ,status = sourceTable.status
    ,room = sourceTable.room
    ,reason = sourceTable.reason
    ,notes = sourceTable.notes
    ,resourceId = sourceTable.resourceId
    ,resourceName = sourceTable.resourceName
    ,locationId = sourceTable.locationId
    ,scheduleType = sourceTable.scheduleType
	--,dpUid = sourceTable.dpUid
	,pimsId = sourceTable.pimsId
	,siteId = sourceTable.siteId
	,agentVersion = sourceTable.agentVersion
	,action = sourceTable.action
	,dpCreateDate = sourceTable.dpCreateDate
	,dpModifiedDate = sourceTable.dpModifiedDate
	,syncDate = sourceTable.syncDate
	,correlationId = sourceTable.correlationId
	,lastModifiedByCorrelationId = sourceTable.lastModifiedByCorrelationId
	,generation = sourceTable.generation
	,deleted = sourceTable.deleted

WHEN NOT MATCHED
THEN INSERT (source
    ,type
    ,clientPimsId
    ,clientPimsIdentifier
    ,patientPimsId
    ,patientPimsIdentifier
    ,date
    ,duration
    ,units
    ,unitLength
    ,status
    ,room
    ,reason
    ,notes
    ,resourceId
    ,resourceName
    ,locationId
    ,scheduleType
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
VALUES (sourceTable.source
    ,sourceTable.type
    ,sourceTable.clientPimsId
    ,sourceTable.clientPimsIdentifier
    ,sourceTable.patientPimsId
    ,sourceTable.patientPimsIdentifier
    ,sourceTable.date
    ,sourceTable.duration
    ,sourceTable.units
    ,sourceTable.unitLength
    ,sourceTable.status
    ,sourceTable.room
    ,sourceTable.reason
    ,sourceTable.notes
    ,sourceTable.resourceId
    ,sourceTable.resourceName
    ,sourceTable.locationId
    ,sourceTable.scheduleType
	,sourceTable.dpUid
	,sourceTable.pimsId
	,sourceTable.siteId
	,sourceTable.agentVersion
	,sourceTable.action
	,sourceTable.dpCreateDate
	,sourceTable.dpModifiedDate
	,sourceTable.syncDate
	,sourceTable.correlationId
	,sourceTable.lastModifiedByCorrelationId
	,sourceTable.generation
	,sourceTable.deleted);