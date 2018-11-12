MERGE dbo.[Site] AS target
USING (SELECT @Id
    ,@Name
    ,@Email
    ,@ContactPerson
    ,@Phone
    ,@Address
    ,@Address2
    ,@City
    ,@State
    ,@Zip
    ,@LastSyncDate
    ,@LastStatusUpdate
    ,@Status
    ,@ComputerName
    ,@AgentVersion
    ,@PimsVersion
    ,@LastRealtimeDiagnostic
    ,@HostIp
    ,@Key
    ,@MachineIp
    ,@PimsName
    ,@CustomerId
    ,@HasDownload
    ,@CurrentGeneration
    ,@CurrentAzureGeneration
    ,@SapId
    ,@RealtimeEnabled)
AS source (Id
    ,Name
    ,Email
    ,ContactPerson
    ,Phone
    ,Address
    ,Address2
    ,City
    ,State
    ,Zip
    ,LastSyncDate
    ,LastStatusUpdate
    ,Status
    ,ComputerName
    ,AgentVersion
    ,PimsVersion
    ,LastRealtimeDiagnostic
    ,HostIp
    ,[Key]
    ,MachineIp
    ,PimsName
    ,CustomerId
    ,HasDownload
    ,CurrentGeneration
    ,CurrentAzureGeneration
    ,SapId
    ,RealtimeEnabled)
ON (target.Id = source.Id)

WHEN MATCHED
THEN UPDATE SET Id = source.Id
    ,Name = source.Name
    ,Email = source.Email
    ,ContactPerson = source.ContactPerson
    ,Phone = source.Phone
    ,Address = source.Address
    ,Address2 = source.Address2
    ,City = source.City
    ,State = source.State
    ,Zip = source.Zip
    ,LastSyncDate = source.LastSyncDate
    ,LastStatusUpdate = source.LastStatusUpdate
    ,Status = source.Status
    ,ComputerName = source.ComputerName
    ,AgentVersion = source.AgentVersion
    ,PimsVersion = source.PimsVersion
    ,LastRealtimeDiagnostic = source.LastRealtimeDiagnostic
    ,HostIp = source.HostIp
    ,[Key] = source.[Key]
    ,MachineIp = source.MachineIp
    ,PimsName = source.PimsName
    ,CustomerId = source.CustomerId
    ,HasDownload = source.HasDownload
    ,CurrentGeneration = source.CurrentGeneration
    ,CurrentAzureGeneration = source.CurrentAzureGeneration
    ,SapId = source.SapId
    ,RealtimeEnabled = source.RealtimeEnabled

WHEN NOT MATCHED
THEN INSERT (Id
    ,Name
    ,Email
    ,ContactPerson
    ,Phone
    ,Address
    ,Address2
    ,City
    ,State
    ,Zip
    ,LastSyncDate
    ,LastStatusUpdate
    ,Status
    ,ComputerName
    ,AgentVersion
    ,PimsVersion
    ,LastRealtimeDiagnostic
    ,HostIp
    ,[Key]
    ,MachineIp
    ,PimsName
    ,CustomerId
    ,HasDownload
    ,CurrentGeneration
    ,CurrentAzureGeneration
    ,SapId
    ,RealtimeEnabled)
VALUES (source.Id
    ,source.Name
    ,source.Email
    ,source.ContactPerson
    ,source.Phone
    ,source.Address
    ,source.Address2
    ,source.City
    ,source.State
    ,source.Zip
    ,source.LastSyncDate
    ,source.LastStatusUpdate
    ,source.Status
    ,source.ComputerName
    ,source.AgentVersion
    ,source.PimsVersion
    ,source.LastRealtimeDiagnostic
    ,source.HostIp
    ,source.[Key]
    ,source.MachineIp
    ,source.PimsName
    ,source.CustomerId
    ,source.HasDownload
    ,source.CurrentGeneration
    ,source.CurrentAzureGeneration
    ,source.SapId
    ,source.RealtimeEnabled);