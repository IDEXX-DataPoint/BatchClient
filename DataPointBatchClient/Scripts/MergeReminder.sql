MERGE dbo.Reminder AS target
USING (SELECT @ClientPimsId
    ,@PatientPimsId
    ,@Code
    ,@Description
    ,@DueDate
    ,@LastRemindedDate
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
AS source (ClientPimsId
    ,PatientPimsId
    ,Code
    ,Description
    ,DueDate
    ,LastRemindedDate
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
THEN UPDATE SET ClientPimsId = source.ClientPimsId
    ,PatientPimsId = source.PatientPimsId
    ,Code = source.Code
    ,Description = source.Description
    ,DueDate = source.DueDate
    ,LastRemindedDate = source.LastRemindedDate
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
THEN INSERT (ClientPimsId
    ,PatientPimsId
    ,Code
    ,Description
    ,DueDate
    ,LastRemindedDate
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
VALUES (source.ClientPimsId
    ,source.PatientPimsId
    ,source.Code
    ,source.Description
    ,source.DueDate
    ,source.LastRemindedDate
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