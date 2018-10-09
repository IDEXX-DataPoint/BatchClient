MERGE dbo.Client AS target
USING (SELECT @title
    ,@lastName
    ,@firstName
    ,@middleName
    ,@alternateFirstName
    ,@alternateLastName
    ,@pimsCreatedDate
    ,@inactive
    ,@suspendReminders
    ,@locationId
    ,@address1
    ,@address2
    ,@city
    ,@state
    ,@postalCode
    ,@alternateAddress1
    ,@alternateAddress2
    ,@alternateCity
    ,@alternateState
    ,@alternatePostalCode
    ,@phoneName1
    ,@phone1
    ,@phoneName2
    ,@phone2
    ,@phoneName3
    ,@phone3
    ,@email
    ,@pimsClientIdentifier
    ,@referralSource
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
AS source (title
    ,lastName
    ,firstName
    ,middleName
    ,alternateFirstName
    ,alternateLastName
    ,pimsCreatedDate
    ,inactive
    ,suspendReminders
    ,locationId
    ,address1
    ,address2
    ,city
    ,state
    ,postalCode
    ,alternateAddress1
    ,alternateAddress2
    ,alternateCity
    ,alternateState
    ,alternatePostalCode
    ,phoneName1
    ,phone1
    ,phoneName2
    ,phone2
    ,phoneName3
    ,phone3
    ,email
    ,pimsClientIdentifier
    ,referralSource
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
THEN UPDATE SET title = source.title
    ,lastName = source.lastName
    ,firstName = source.firstName
    ,middleName = source.middleName
    ,alternateFirstName = source.alternateFirstName
    ,alternateLastName = source.alternateLastName
    ,pimsCreatedDate = source.pimsCreatedDate
    ,inactive = source.inactive
    ,suspendReminders = source.suspendReminders
    ,locationId = source.locationId
    ,address1 = source.address1
    ,address2 = source.address2
    ,city = source.city
    ,state = source.state
    ,postalCode = source.postalCode
    ,alternateAddress1 = source.alternateAddress1
    ,alternateAddress2 = source.alternateAddress2
    ,alternateCity = source.alternateCity
    ,alternateState = source.alternateState
    ,alternatePostalCode = source.alternatePostalCode
    ,phoneName1 = source.phoneName1
    ,phone1 = source.phone1
    ,phoneName2 = source.phoneName2
    ,phone2 = source.phone2
    ,phoneName3 = source.phoneName3
    ,phone3 = source.phone3
    ,email = source.email
    ,pimsClientIdentifier = source.pimsClientIdentifier
    ,referralSource = source.referralSource
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
THEN INSERT (title
    ,lastName
    ,firstName
    ,middleName
    ,alternateFirstName
    ,alternateLastName
    ,pimsCreatedDate
    ,inactive
    ,suspendReminders
    ,locationId
    ,address1
    ,address2
    ,city
    ,state
    ,postalCode
    ,alternateAddress1
    ,alternateAddress2
    ,alternateCity
    ,alternateState
    ,alternatePostalCode
    ,phoneName1
    ,phone1
    ,phoneName2
    ,phone2
    ,phoneName3
    ,phone3
    ,email
    ,pimsClientIdentifier
    ,referralSource
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
VALUES (source.title
    ,source.lastName
    ,source.firstName
    ,source.middleName
    ,source.alternateFirstName
    ,source.alternateLastName
    ,source.pimsCreatedDate
    ,source.inactive
    ,source.suspendReminders
    ,source.locationId
    ,source.address1
    ,source.address2
    ,source.city
    ,source.state
    ,source.postalCode
    ,source.alternateAddress1
    ,source.alternateAddress2
    ,source.alternateCity
    ,source.alternateState
    ,source.alternatePostalCode
    ,source.phoneName1
    ,source.phone1
    ,source.phoneName2
    ,source.phone2
    ,source.phoneName3
    ,source.phone3
    ,source.email
    ,source.pimsClientIdentifier
    ,source.referralSource
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