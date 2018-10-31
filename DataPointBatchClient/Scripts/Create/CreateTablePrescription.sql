SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Prescription](
    [Code] [nvarchar](50) NULL,
    [Description] [nvarchar](max) NULL,
    [ProviderId] [nvarchar](50) NULL,
    [ProviderName] [nvarchar](50) NULL,
    [AdministeredDate] [datetime] NULL,
    [Quantity] [float] NULL,
    [Amount] [float] NULL,
    [Instructions] [nvarchar](max) NULL,
    [ClientPimsId] [nvarchar](50) NULL,
    [PatientPimsId] [nvarchar](50) NULL,
    [LocationId] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
    [SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
