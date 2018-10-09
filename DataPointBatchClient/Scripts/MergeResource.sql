MERGE dbo.Resource AS target
USING (SELECT @abbreviation
    ,@lastName
    ,@firstName
    ,@middleName
    ,@title
    ,@address1
    ,@address2
    ,@city
    ,@state
    ,@postalCode
    ,@classId
    ,@license
    ,@note
    ,@status
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
AS source (abbreviation
    ,lastName
    ,firstName
    ,middleName
    ,title
    ,address1
    ,address2
    ,city
    ,state
    ,postalCode
    ,classId
    ,license
    ,note
    ,status
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
THEN UPDATE SET abbreviation = source.abbreviation
    ,lastName = source.lastName
    ,firstName = source.firstName
    ,middleName = source.middleName
    ,title = source.title
    ,address1 = source.address1
    ,address2 = source.address2
    ,city = source.city
    ,state = source.state
    ,postalCode = source.postalCode
    ,classId = source.classId
    ,license = source.license
    ,note = source.note
    ,status = source.status
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
THEN INSERT (abbreviation
    ,lastName
    ,firstName
    ,middleName
    ,title
    ,address1
    ,address2
    ,city
    ,state
    ,postalCode
    ,classId
    ,license
    ,note
    ,status
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
VALUES (source.abbreviation
    ,source.lastName
    ,source.firstName
    ,source.middleName
    ,source.title
    ,source.address1
    ,source.address2
    ,source.city
    ,source.state
    ,source.postalCode
    ,source.classId
    ,source.license
    ,source.note
    ,source.status
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