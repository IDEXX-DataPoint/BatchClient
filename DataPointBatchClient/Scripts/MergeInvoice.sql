MERGE dbo.Invoice AS target
USING (SELECT @invoiceId
    ,@amount
    ,@transactionDate
    ,@clientPimsId
    ,@patientPimsId
    ,@discountAmount
    ,@taxAmount
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
AS source (invoiceId
    ,amount
    ,transactionDate
    ,clientPimsId
    ,patientPimsId
    ,discountAmount
    ,taxAmount
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
THEN UPDATE SET invoiceId = source.invoiceId
    ,amount = source.amount
    ,transactionDate = source.transactionDate
    ,clientPimsId = source.clientPimsId
    ,patientPimsId = source.patientPimsId
    ,discountAmount = source.discountAmount
    ,taxAmount = source.taxAmount
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
THEN INSERT (invoiceId
    ,amount
    ,transactionDate
    ,clientPimsId
    ,patientPimsId
    ,discountAmount
    ,taxAmount
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
VALUES (source.invoiceId
    ,source.amount
    ,source.transactionDate
    ,source.clientPimsId
    ,source.patientPimsId
    ,source.discountAmount
    ,source.taxAmount
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