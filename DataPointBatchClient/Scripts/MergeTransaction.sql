MERGE dbo.[Transaction] AS target
USING (SELECT @InvoiceId
    ,@Type
	,@TypeDescription
    ,@ClientPimsId
    ,@PatientPimsId
    ,@TransactionDate
    ,@Sequence
    ,@Code
    ,@Description
    ,@Quantity
    ,@Amount
    ,@Discount
    ,@Tax
    ,@DispensingFee
    ,@IsPosted
    ,@IsPayment
    ,@IsVoided
    ,@ProviderId
    ,@EnteredById
    ,@Comments
    ,@LocationId
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
AS source (InvoiceId
    ,Type
	,TypeDescription
    ,ClientPimsId
    ,PatientPimsId
    ,TransactionDate
    ,Sequence
    ,Code
    ,Description
    ,Quantity
    ,Amount
    ,Discount
    ,Tax
    ,DispensingFee
    ,IsPosted
    ,IsPayment
    ,IsVoided
    ,ProviderId
    ,EnteredById
    ,Comments
    ,LocationId
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
THEN UPDATE SET InvoiceId = source.InvoiceId
    ,Type = source.Type
	,TypeDescription = source.TypeDescription
    ,ClientPimsId = source.ClientPimsId
    ,PatientPimsId = source.PatientPimsId
    ,TransactionDate = source.TransactionDate
    ,Sequence = source.Sequence
    ,Code = source.Code
    ,Description = source.Description
    ,Quantity = source.Quantity
    ,Amount = source.Amount
    ,Discount = source.Discount
    ,Tax = source.Tax
    ,DispensingFee = source.DispensingFee
    ,IsPosted = source.IsPosted
    ,IsPayment = source.IsPayment
    ,IsVoided = source.IsVoided
    ,ProviderId = source.ProviderId
    ,EnteredById = source.EnteredById
    ,Comments = source.Comments
    ,LocationId = source.LocationId
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
THEN INSERT (InvoiceId
    ,Type
	,TypeDescription
    ,ClientPimsId
    ,PatientPimsId
    ,TransactionDate
    ,Sequence
    ,Code
    ,Description
    ,Quantity
    ,Amount
    ,Discount
    ,Tax
    ,DispensingFee
    ,IsPosted
    ,IsPayment
    ,IsVoided
    ,ProviderId
    ,EnteredById
    ,Comments
    ,LocationId
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
VALUES (source.InvoiceId
    ,source.Type
	,source.TypeDescription
    ,source.ClientPimsId
    ,source.PatientPimsId
    ,source.TransactionDate
    ,source.Sequence
    ,source.Code
    ,source.Description
    ,source.Quantity
    ,source.Amount
    ,source.Discount
    ,source.Tax
    ,source.DispensingFee
    ,source.IsPosted
    ,source.IsPayment
    ,source.IsVoided
    ,source.ProviderId
    ,source.EnteredById
    ,source.Comments
    ,source.LocationId
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