MERGE dbo.Prescription AS target
USING (SELECT @Code
    ,@Description
    ,@ProviderId
    ,@ProviderName
    ,@AdministeredDate
    ,@Quantity
    ,@Amount
    ,@Instructions
    ,@ClientPimsId
    ,@PatientPimsId
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
AS source (Code
    ,Description
    ,ProviderId
    ,ProviderName
    ,AdministeredDate
    ,Quantity
    ,Amount
    ,Instructions
    ,ClientPimsId
    ,PatientPimsId
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
ON (target.PimsId = source.PimsId AND target.SiteId = source.SiteId)

WHEN MATCHED AND source.Deleted = 1
THEN DELETE

WHEN MATCHED
THEN UPDATE SET Code = source.Code
    ,Description = source.Description
    ,ProviderId = source.ProviderId
    ,ProviderName = source.ProviderName
    ,AdministeredDate = source.AdministeredDate
    ,Quantity = source.Quantity
    ,Amount = source.Amount
    ,Instructions = source.Instructions
    ,ClientPimsId = source.ClientPimsId
    ,PatientPimsId = source.PatientPimsId
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
THEN INSERT (Code
    ,Description
    ,ProviderId
    ,ProviderName
    ,AdministeredDate
    ,Quantity
    ,Amount
    ,Instructions
    ,ClientPimsId
    ,PatientPimsId
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
VALUES (source.Code
    ,source.Description
    ,source.ProviderId
    ,source.ProviderName
    ,source.AdministeredDate
    ,source.Quantity
    ,source.Amount
    ,source.Instructions
    ,source.ClientPimsId
    ,source.PatientPimsId
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