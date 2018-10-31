MERGE dbo.Code AS target
USING (SELECT @PimsType
    ,@Code
    ,@Description
    ,@CategoryCode
    ,@CategoryDescription
    ,@BasePrice
    ,@Inactive
    ,@LocationId
    ,@InvoiceDescription
    ,@UnitCost
    ,@MinPrice
    ,@DispensingFee
    ,@Markup
    ,@UnitOfMeasure
    ,@BarCode
    ,@NormalizedCategory
    ,@RevenueClassId
    ,@RevenueGroupId
    ,@RevenueTypeId
    ,@RevenueSubTypeId
	,@DpUid
	,@PimsId
	,@SiteId
	,@AgentVersion
	,@Action
	,@DpCreatedDate
	,@DpModifiedDate
	,@SyncDate
	,@CorrelationId
	,@LastModifiedByCorrelationId
	,@Generation
	,@Deleted)
AS source (PimsType
    ,Code
    ,Description
    ,CategoryCode
    ,CategoryDescription
    ,BasePrice
    ,Inactive
    ,LocationId
    ,InvoiceDescription
    ,UnitCost
    ,MinPrice
    ,DispensingFee
    ,Markup
    ,UnitOfMeasure
    ,BarCode
    ,NormalizedCategory
    ,RevenueClassId
    ,RevenueGroupId
    ,RevenueTypeId
    ,RevenueSubTypeId
	,DpUid
	,PimsId
	,SiteId
	,AgentVersion
	,Action
	,DpCreateDate
	,DpModifiedDate
	,SyncDate
	,CorrelationId
	,LastModifiedByCorrelationId
	,Generation
	,Deleted)
ON (target.DpUid = source.DpUid)

WHEN MATCHED AND source.Deleted = 1
THEN DELETE

WHEN MATCHED
THEN UPDATE SET PimsType = source.PimsType
    ,Code = source.Code
    ,Description = source.Description
    ,CategoryCode = source.CategoryCode
    ,CategoryDescription = source.CategoryDescription
    ,BasePrice = source.BasePrice
    ,Inactive = source.Inactive
    ,LocationId = source.LocationId
    ,InvoiceDescription = source.InvoiceDescription
    ,UnitCost = source.UnitCost
    ,MinPrice = source.MinPrice
    ,DispensingFee = source.DispensingFee
    ,Markup = source.Markup
    ,UnitOfMeasure = source.UnitOfMeasure
    ,BarCode = source.BarCode
    ,NormalizedCategory = source.NormalizedCategory
    ,RevenueClassId = source.RevenueClassId
    ,RevenueGroupId = source.RevenueGroupId
    ,RevenueTypeId = source.RevenueTypeId
    ,RevenueSubTypeId = source.RevenueSubTypeId
	--,DpUid = source.DpUid
	,PimsId = source.PimsId
	,SiteId = source.SiteId
	,AgentVersion = source.AgentVersion
	,Action = source.Action
	,DpCreateDate = source.DpCreateDate
	,DpModifiedDate = source.DpModifiedDate
	,SyncDate = source.SyncDate
	,CorrelationId = source.CorrelationId
	,LastModifiedByCorrelationId = source.LastModifiedByCorrelationId
	,Generation = source.Generation
	,Deleted = source.Deleted

WHEN NOT MATCHED
THEN INSERT (PimsType
    ,Code
    ,Description
    ,CategoryCode
    ,CategoryDescription
    ,BasePrice
    ,Inactive
    ,LocationId
    ,InvoiceDescription
    ,UnitCost
    ,MinPrice
    ,DispensingFee
    ,Markup
    ,UnitOfMeasure
    ,BarCode
    ,NormalizedCategory
    ,RevenueClassId
    ,RevenueGroupId
    ,RevenueTypeId
    ,RevenueSubTypeId
	,DpUid
	,PimsId
	,SiteId
	,AgentVersion
	,Action
	,DpCreateDate
	,DpModifiedDate
	,SyncDate
	,CorrelationId
	,LastModifiedByCorrelationId
	,Generation
	,Deleted)
VALUES (source.PimsType
    ,source.Code
    ,source.Description
    ,source.CategoryCode
    ,source.CategoryDescription
    ,source.BasePrice
    ,source.Inactive
    ,source.LocationId
    ,source.InvoiceDescription
    ,source.UnitCost
    ,source.MinPrice
    ,source.DispensingFee
    ,source.Markup
    ,source.UnitOfMeasure
    ,source.BarCode
    ,source.NormalizedCategory
    ,source.RevenueClassId
    ,source.RevenueGroupId
    ,source.RevenueTypeId
    ,source.RevenueSubTypeId
	,source.DpUid
	,source.PimsId
	,source.SiteId
	,source.AgentVersion
	,source.Action
	,source.DpCreateDate
	,source.DpModifiedDate
	,source.SyncDate
	,source.CorrelationId
	,source.LastModifiedByCorrelationId
	,source.Generation
	,source.Deleted);