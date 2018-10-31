SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Appointment](
    [Source] [nvarchar](50) NULL,
    [Type] [nvarchar](50) NULL,
    [ClientPimsId] [nvarchar](50) NULL,
    [ClientPimsIdentifier] [nvarchar](50) NULL,
    [PatientPimsId] [nvarchar](50) NULL,
    [PatientPimsIdentifier] [nvarchar](50) NULL,
    [Date] [datetime] NULL,
    [Duration] [int] NULL,
    [Units] [int] NULL,
    [UnitLength] [int] NULL,
    [Status] [nvarchar](50) NULL,
    [Room] [nvarchar](50) NULL,
    [Reason] [nvarchar](50) NULL,
    [Notes] [nvarchar](max) NULL,
    [ResourceId] [nvarchar](50) NULL,
    [ResourceName] [nvarchar](50) NULL,
    [LocationId] [nvarchar](50) NULL,
    [ScheduleType] [nvarchar](50) NULL,
    [StatusNormalizedId] [int] NULL,
    [StatusNormalizedDescription] [nvarchar](50) NULL,
    [StatusPimsId] [nvarchar](50) NULL,
    [StatusPimsDescription] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
    [SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
