MERGE dbo.Resource AS target
USING (SELECT @Abbreviation
    ,@LastName
    ,@FirstName
    ,@MiddleName
    ,@Title
    ,@Address1
    ,@Address2
    ,@City
    ,@State
    ,@PostalCode
    ,@ClassId
    ,@License
    ,@Inactive
    ,@DeletePimsId
    ,@Note
    ,@Status
    ,@LocationId
    ,@DpStatus
    ,@DpStatusDescription
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
AS source (Abbreviation
    ,LastName
    ,FirstName
    ,MiddleName
    ,Title
    ,Address1
    ,Address2
    ,City
    ,State
    ,PostalCode
    ,ClassId
    ,License
    ,Inactive
    ,DeletePimsId
    ,Note
    ,Status
    ,LocationId
    ,DpStatus
    ,DpStatusDescription
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
THEN UPDATE SET Abbreviation = source.Abbreviation
    ,LastName = source.LastName
    ,FirstName = source.FirstName
    ,MiddleName = source.MiddleName
    ,Title = source.Title
    ,Address1 = source.Address1
    ,Address2 = source.Address2
    ,City = source.City
    ,State = source.State
    ,PostalCode = source.PostalCode
    ,ClassId = source.ClassId
    ,License = source.License
    ,Inactive = source.Inactive
    ,DeletePimsId = source.DeletePimsId
    ,Note = source.Note
    ,Status = source.Status
    ,LocationId = source.LocationId
    ,DpStatus = source.DpStatus
    ,DpStatusDescription = source.DpStatusDescription
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
THEN INSERT (Abbreviation
    ,LastName
    ,FirstName
    ,MiddleName
    ,Title
    ,Address1
    ,Address2
    ,City
    ,State
    ,PostalCode
    ,ClassId
    ,License
    ,Inactive
    ,DeletePimsId
    ,Note
    ,Status
    ,LocationId
    ,DpStatus
    ,DpStatusDescription
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
VALUES (source.Abbreviation
    ,source.LastName
    ,source.FirstName
    ,source.MiddleName
    ,source.Title
    ,source.Address1
    ,source.Address2
    ,source.City
    ,source.State
    ,source.PostalCode
    ,source.ClassId
    ,source.License
    ,source.Inactive
    ,source.DeletePimsId
    ,source.Note
    ,source.Status
    ,source.LocationId
    ,source.DpStatus
    ,source.DpStatusDescription
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