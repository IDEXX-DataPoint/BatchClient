SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Site](
    [Id] [nvarchar](50) NULL,
    [Name] [nvarchar](50) NULL,
    [Email] [nvarchar](255) NULL,
    [ContactPerson] [nvarchar](50) NULL,
    [Phone] [nvarchar](50) NULL,
    [Address] [nvarchar](50) NULL,
    [Address2] [nvarchar](50) NULL,
    [City] [nvarchar](50) NULL,
    [State] [nvarchar](50) NULL,
    [Zip] [nvarchar](50) NULL,
    [LastSyncDate] [datetime] NULL,
    [LastStatusUpdate] [datetime] NULL,
    [Status] [nvarchar](50) NULL,
    [ComputerName] [nvarchar](50) NULL,
    [AgentVersion] [nvarchar](50) NULL,
    [PimsVersion] [nvarchar](50) NULL,
    [LastRealtimeDiagnostic] [datetime] NULL,
    [HostIp] [nvarchar](50) NULL,
    [Key] [nvarchar](50) NULL,
    [MachineIp] [nvarchar](50) NULL,
    [PimsName] [nvarchar](50) NULL,
    [CustomerId] [nvarchar](50) NULL,
    [HasDownload] [bit] NULL,
    -- Groups
    -- MostRecentTransfer
    [CurrentGeneration] [int] NULL,
    [CurrentAzureGeneration] [int] NULL,
    [SapId] [int] NULL,
    [RealtimeEnabled] [bit] NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO