MERGE dbo.Appointment AS target
USING (SELECT @Source
    ,@Type
    ,@ClientPimsId
    ,@ClientPimsIdentifier
    ,@PatientPimsId
    ,@PatientPimsIdentifier
    ,@Date
    ,@Duration
    ,@Units
    ,@UnitLength
    ,@Status
    ,@Room
    ,@Reason
    ,@Notes
    ,@ResourceId
    ,@ResourceName
    ,@LocationId
    ,@ScheduleType
    ,@StatusNormalizedId
    ,@StatusNormalizedDescription
    ,@StatusPimsId
    ,@StatusPimsDescription
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
AS sourceTable (Source
    ,Type
    ,ClientPimsId
    ,ClientPimsIdentifier
    ,PatientPimsId
    ,PatientPimsIdentifier
    ,Date
    ,Duration
    ,Units
    ,UnitLength
    ,Status
    ,Room
    ,Reason
    ,Notes
    ,ResourceId
    ,ResourceName
    ,LocationId
    ,ScheduleType
    ,StatusNormalizedId
    ,StatusNormalizedDescription
    ,StatusPimsId
    ,StatusPimsDescription
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
ON (target.PimsId = sourceTable.PimsId AND target.SiteId = sourceTable.SiteId)

WHEN MATCHED AND sourceTable.Deleted = 1
THEN DELETE

WHEN MATCHED
THEN UPDATE SET Source = sourceTable.Source
    ,Type = sourceTable.Type
    ,ClientPimsId = sourceTable.ClientPimsId
    ,ClientPimsIdentifier = sourceTable.ClientPimsIdentifier
    ,PatientPimsId = sourceTable.PatientPimsId
    ,PatientPimsIdentifier = sourceTable.PatientPimsIdentifier
    ,Date = sourceTable.Date
    ,Duration = sourceTable.Duration
    ,Units = sourceTable.Units
    ,UnitLength = sourceTable.UnitLength
    ,Status = sourceTable.Status
    ,Room = sourceTable.Room
    ,Reason = sourceTable.Reason
    ,Notes = sourceTable.Notes
    ,ResourceId = sourceTable.ResourceId
    ,ResourceName = sourceTable.ResourceName
    ,LocationId = sourceTable.LocationId
    ,ScheduleType = sourceTable.ScheduleType
    ,StatusNormalizedId = sourceTable.StatusNormalizedId
    ,StatusNormalizedDescription = sourceTable.StatusNormalizedDescription
    ,StatusPimsId = sourceTable.StatusPimsId
    ,StatusPimsDescription = sourceTable.StatusPimsDescription
    --,DpUid = sourceTable.DpUid
    ,PimsId = sourceTable.PimsId
    ,SiteId = sourceTable.SiteId
    ,AgentVersion = sourceTable.AgentVersion
    ,Action = sourceTable.Action
    ,DpCreateDate = sourceTable.DpCreateDate
    ,DpModifiedDate = sourceTable.DpModifiedDate
    ,SyncDate = sourceTable.SyncDate
    ,CorrelationId = sourceTable.CorrelationId
    ,LastModifiedByCorrelationId = sourceTable.LastModifiedByCorrelationId
    ,Generation = sourceTable.Generation
    ,Deleted = sourceTable.Deleted

WHEN NOT MATCHED
THEN INSERT (Source
    ,Type
    ,ClientPimsId
    ,ClientPimsIdentifier
    ,PatientPimsId
    ,PatientPimsIdentifier
    ,Date
    ,Duration
    ,Units
    ,UnitLength
    ,Status
    ,Room
    ,Reason
    ,Notes
    ,ResourceId
    ,ResourceName
    ,LocationId
    ,ScheduleType
    ,StatusNormalizedId
    ,StatusNormalizedDescription
    ,StatusPimsId
    ,StatusPimsDescription
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
VALUES (sourceTable.Source
    ,sourceTable.Type
    ,sourceTable.ClientPimsId
    ,sourceTable.ClientPimsIdentifier
    ,sourceTable.PatientPimsId
    ,sourceTable.PatientPimsIdentifier
    ,sourceTable.Date
    ,sourceTable.Duration
    ,sourceTable.Units
    ,sourceTable.UnitLength
    ,sourceTable.Status
    ,sourceTable.Room
    ,sourceTable.Reason
    ,sourceTable.Notes
    ,sourceTable.ResourceId
    ,sourceTable.ResourceName
    ,sourceTable.LocationId
    ,sourceTable.ScheduleType
    ,sourceTable.StatusNormalizedId
    ,sourceTable.StatusNormalizedDescription
    ,sourceTable.StatusPimsId
    ,sourceTable.StatusPimsDescription
    ,sourceTable.DpUid
    ,sourceTable.PimsId
    ,sourceTable.SiteId
    ,sourceTable.AgentVersion
    ,sourceTable.Action
    ,sourceTable.DpCreateDate
    ,sourceTable.DpModifiedDate
    ,sourceTable.SyncDate
    ,sourceTable.CorrelationId
    ,sourceTable.LastModifiedByCorrelationId
    ,sourceTable.Generation
    ,sourceTable.Deleted);