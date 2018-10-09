MERGE dbo.Code AS target
USING (SELECT @pimsType
    ,@code
    ,@description
    ,@categoryCode
    ,@categoryDescription
    ,@basePrice
    ,@inactive
    ,@locationId
    ,@invoiceDescription
    ,@unitCost
    ,@minPrice
    ,@dispensingFee
    ,@markup
    ,@unitOfMeasure
    ,@barCode
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
AS source (pimsType
    ,code
    ,description
    ,categoryCode
    ,categoryDescription
    ,basePrice
    ,inactive
    ,locationId
    ,invoiceDescription
    ,unitCost
    ,minPrice
    ,dispensingFee
    ,markup
    ,unitOfMeasure
    ,barCode
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
THEN UPDATE SET pimsType = source.pimsType
    ,code = source.code
    ,description = source.description
    ,categoryCode = source.categoryCode
    ,categoryDescription = source.categoryDescription
    ,basePrice = source.basePrice
    ,inactive = source.inactive
    ,locationId = source.locationId
    ,invoiceDescription = source.invoiceDescription
    ,unitCost = source.unitCost
    ,minPrice = source.minPrice
    ,dispensingFee = source.dispensingFee
    ,markup = source.markup
    ,unitOfMeasure = source.unitOfMeasure
    ,barCode = source.barCode
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
THEN INSERT (pimsType
    ,code
    ,description
    ,categoryCode
    ,categoryDescription
    ,basePrice
    ,inactive
    ,locationId
    ,invoiceDescription
    ,unitCost
    ,minPrice
    ,dispensingFee
    ,markup
    ,unitOfMeasure
    ,barCode
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
VALUES (source.pimsType
    ,source.code
    ,source.description
    ,source.categoryCode
    ,source.categoryDescription
    ,source.basePrice
    ,source.inactive
    ,source.locationId
    ,source.invoiceDescription
    ,source.unitCost
    ,source.minPrice
    ,source.dispensingFee
    ,source.markup
    ,source.unitOfMeasure
    ,source.barCode
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