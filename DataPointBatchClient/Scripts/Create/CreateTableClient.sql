SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Client](
    [Title] [nvarchar](50) NULL,
    [LastName] [nvarchar](50) NULL,
    [FirstName] [nvarchar](50) NULL,
    [MiddleName] [nvarchar](50) NULL,
    [AlternateFirstName] [nvarchar](50) NULL,
    [AlternateLastName] [nvarchar](50) NULL,
    [PimsCreatedDate] [datetime] NULL,
    [Inactive] [bit] NULL,
    [SuspendReminders] [bit] NULL,
    [LocationId] [nvarchar](50) NULL,
    [Address1] [nvarchar](50) NULL,
    [Address2] [nvarchar](50) NULL,
    [City] [nvarchar](50) NULL,
    [State] [nvarchar](50) NULL,
    [PostalCode] [nvarchar](50) NULL,
    [AlternateAddress1] [nvarchar](50) NULL,
    [AlternateAddress2] [nvarchar](50) NULL,
    [AlternateCity] [nvarchar](50) NULL,
    [AlternateState] [nvarchar](50) NULL,
    [AlternatePostalCode] [nvarchar](50) NULL,
    [PhoneName1] [nvarchar](50) NULL,
    [Phone1] [nvarchar](50) NULL,
    [PhoneName2] [nvarchar](50) NULL,
    [Phone2] [nvarchar](50) NULL,
    [PhoneName3] [nvarchar](50) NULL,
    [Phone3] [nvarchar](50) NULL,
    [Email] [nvarchar](255) NULL,
    [PimsClientIdentifier] [nvarchar](50) NULL,
    [ReferralSource] [nvarchar](50) NULL,
    [DpUid] [uniqueidentifier] NULL,
    [PimsId] [nvarchar](50) NOT NULL,
    [SiteId] [int] NOT NULL,
    [AgentVersion] [nvarchar](50) NULL,
    [Action] [nvarchar](50) NULL,
    [DpCreateDate] [datetime] NULL,
    [DpModifiedDate] [datetime] NULL,
    [SyncDate] [datetime] NULL,
    [CorrelationId] [uniqueidentifier] NULL,
    [LastModifiedByCorrelationId] [uniqueidentifier] NULL,
    [Generation] [float] NULL,
    [Deleted] [bit] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
    [SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
