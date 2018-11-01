MERGE dbo.Client AS target
USING (SELECT @Title
    ,@LastName
    ,@FirstName
    ,@MiddleName
    ,@AlternateFirstName
    ,@AlternateLastName
    ,@PimsCreatedDate
    ,@Inactive
    ,@SuspendReminders
    ,@LocationId
    ,@Address1
    ,@Address2
    ,@City
    ,@State
    ,@PostalCode
    ,@AlternateAddress1
    ,@AlternateAddress2
    ,@AlternateCity
    ,@AlternateState
    ,@AlternatePostalCode
    ,@PhoneName1
    ,@Phone1
    ,@PhoneName2
    ,@Phone2
    ,@PhoneName3
    ,@Phone3
    ,@Email
    ,@PimsClientIdentifier
    ,@ReferralSource
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
AS source (Title
    ,LastName
    ,FirstName
    ,MiddleName
    ,AlternateFirstName
    ,AlternateLastName
    ,PimsCreatedDate
    ,Inactive
    ,SuspendReminders
    ,LocationId
    ,Address1
    ,Address2
    ,City
    ,State
    ,PostalCode
    ,AlternateAddress1
    ,AlternateAddress2
    ,AlternateCity
    ,AlternateState
    ,AlternatePostalCode
    ,PhoneName1
    ,Phone1
    ,PhoneName2
    ,Phone2
    ,PhoneName3
    ,Phone3
    ,Email
    ,PimsClientIdentifier
    ,ReferralSource
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
THEN UPDATE SET Title = source.Title
    ,LastName = source.LastName
    ,FirstName = source.FirstName
    ,MiddleName = source.MiddleName
    ,AlternateFirstName = source.AlternateFirstName
    ,AlternateLastName = source.AlternateLastName
    ,PimsCreatedDate = source.PimsCreatedDate
    ,Inactive = source.Inactive
    ,SuspendReminders = source.SuspendReminders
    ,LocationId = source.LocationId
    ,Address1 = source.Address1
    ,Address2 = source.Address2
    ,City = source.City
    ,State = source.State
    ,PostalCode = source.PostalCode
    ,AlternateAddress1 = source.AlternateAddress1
    ,AlternateAddress2 = source.AlternateAddress2
    ,AlternateCity = source.AlternateCity
    ,AlternateState = source.AlternateState
    ,AlternatePostalCode = source.AlternatePostalCode
    ,PhoneName1 = source.PhoneName1
    ,Phone1 = source.Phone1
    ,PhoneName2 = source.PhoneName2
    ,Phone2 = source.Phone2
    ,PhoneName3 = source.PhoneName3
    ,Phone3 = source.Phone3
    ,Email = source.Email
    ,PimsClientIdentifier = source.PimsClientIdentifier
    ,ReferralSource = source.ReferralSource
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
THEN INSERT (Title
    ,LastName
    ,FirstName
    ,MiddleName
    ,AlternateFirstName
    ,AlternateLastName
    ,PimsCreatedDate
    ,Inactive
    ,SuspendReminders
    ,LocationId
    ,Address1
    ,Address2
    ,City
    ,State
    ,PostalCode
    ,AlternateAddress1
    ,AlternateAddress2
    ,AlternateCity
    ,AlternateState
    ,AlternatePostalCode
    ,PhoneName1
    ,Phone1
    ,PhoneName2
    ,Phone2
    ,PhoneName3
    ,Phone3
    ,Email
    ,PimsClientIdentifier
    ,ReferralSource
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
VALUES (source.Title
    ,source.LastName
    ,source.FirstName
    ,source.MiddleName
    ,source.AlternateFirstName
    ,source.AlternateLastName
    ,source.PimsCreatedDate
    ,source.Inactive
    ,source.SuspendReminders
    ,source.LocationId
    ,source.Address1
    ,source.Address2
    ,source.City
    ,source.State
    ,source.PostalCode
    ,source.AlternateAddress1
    ,source.AlternateAddress2
    ,source.AlternateCity
    ,source.AlternateState
    ,source.AlternatePostalCode
    ,source.PhoneName1
    ,source.Phone1
    ,source.PhoneName2
    ,source.Phone2
    ,source.PhoneName3
    ,source.Phone3
    ,source.Email
    ,source.PimsClientIdentifier
    ,source.ReferralSource
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