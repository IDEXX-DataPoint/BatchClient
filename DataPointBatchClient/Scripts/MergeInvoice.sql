MERGE dbo.Invoice AS target
USING (SELECT @InvoiceId
    ,@Amount
    ,@TransactionDate
    ,@ClientPimsId
    ,@PatientPimsId
    ,@DiscountAmount
    ,@TaxAmount
    ,@LocationId
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
    ,Amount
    ,TransactionDate
    ,ClientPimsId
    ,PatientPimsId
    ,DiscountAmount
    ,TaxAmount
    ,LocationId
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
    ,Amount = source.Amount
    ,TransactionDate = source.TransactionDate
    ,ClientPimsId = source.ClientPimsId
    ,PatientPimsId = source.PatientPimsId
    ,DiscountAmount = source.DiscountAmount
    ,TaxAmount = source.TaxAmount
    ,LocationId = source.LocationId
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
    ,Amount
    ,TransactionDate
    ,ClientPimsId
    ,PatientPimsId
    ,DiscountAmount
    ,TaxAmount
    ,LocationId
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
    ,source.Amount
    ,source.TransactionDate
    ,source.ClientPimsId
    ,source.PatientPimsId
    ,source.DiscountAmount
    ,source.TaxAmount
    ,source.LocationId
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