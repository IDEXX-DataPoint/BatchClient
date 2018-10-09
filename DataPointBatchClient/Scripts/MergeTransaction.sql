MERGE dbo.[Transaction] AS target
USING (SELECT @invoiceId
    ,@type
    ,@clientPimsId
    ,@patientPimsId
    ,@transactionDate
    ,@sequence
    ,@code
    ,@description
    ,@quantity
    ,@amount
    ,@discount
    ,@tax
    ,@dispensingFee
    ,@isPosted
    ,@isPayment
    ,@isVoided
    ,@providerId
    ,@enteredById
    ,@comments
    ,@locationId
    ,@normalizedCategory
    ,@revenueClassId
    ,@revenueGroupId
    ,@revenueTypeId
    ,@revenueSubTypeId
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
AS source (invoiceId
    ,type
    ,clientPimsId
    ,patientPimsId
    ,transactionDate
    ,sequence
    ,code
    ,description
    ,quantity
    ,amount
    ,discount
    ,tax
    ,dispensingFee
    ,isPosted
    ,isPayment
    ,isVoided
    ,providerId
    ,enteredById
    ,comments
    ,locationId
    ,normalizedCategory
    ,revenueClassId
    ,revenueGroupId
    ,revenueTypeId
    ,revenueSubTypeId
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
THEN UPDATE SET invoiceId = source.invoiceId
    ,type = source.type
    ,clientPimsId = source.clientPimsId
    ,patientPimsId = source.patientPimsId
    ,transactionDate = source.transactionDate
    ,sequence = source.sequence
    ,code = source.code
    ,description = source.description
    ,quantity = source.quantity
    ,amount = source.amount
    ,discount = source.discount
    ,tax = source.tax
    ,dispensingFee = source.dispensingFee
    ,isPosted = source.isPosted
    ,isPayment = source.isPayment
    ,isVoided = source.isVoided
    ,providerId = source.providerId
    ,enteredById = source.enteredById
    ,comments = source.comments
    ,locationId = source.locationId
    ,normalizedCategory = source.normalizedCategory
    ,revenueClassId = source.revenueClassId
    ,revenueGroupId = source.revenueGroupId
    ,revenueTypeId = source.revenueTypeId
    ,revenueSubTypeId = source.revenueSubTypeId
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
THEN INSERT (invoiceId
    ,type
    ,clientPimsId
    ,patientPimsId
    ,transactionDate
    ,sequence
    ,code
    ,description
    ,quantity
    ,amount
    ,discount
    ,tax
    ,dispensingFee
    ,isPosted
    ,isPayment
    ,isVoided
    ,providerId
    ,enteredById
    ,comments
    ,locationId
    ,normalizedCategory
    ,revenueClassId
    ,revenueGroupId
    ,revenueTypeId
    ,revenueSubTypeId
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
VALUES (source.invoiceId
    ,source.type
    ,source.clientPimsId
    ,source.patientPimsId
    ,source.transactionDate
    ,source.sequence
    ,source.code
    ,source.description
    ,source.quantity
    ,source.amount
    ,source.discount
    ,source.tax
    ,source.dispensingFee
    ,source.isPosted
    ,source.isPayment
    ,source.isVoided
    ,source.providerId
    ,source.enteredById
    ,source.comments
    ,source.locationId
    ,source.normalizedCategory
    ,source.revenueClassId
    ,source.revenueGroupId
    ,source.revenueTypeId
    ,source.revenueSubTypeId
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