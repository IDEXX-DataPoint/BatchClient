MERGE dbo.MyTable AS target
USING (SELECT @myColumn
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
AS source (myColumn
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
THEN UPDATE SET myColumn = source.myColumn
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
THEN INSERT (myColumn
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
VALUES (source.myColumn
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