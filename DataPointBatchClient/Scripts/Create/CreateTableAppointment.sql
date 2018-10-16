SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Appointment](
    [source] [nvarchar](50) NULL,
    [type] [nvarchar](50) NULL,
    [clientPimsId] [nvarchar](50) NULL,
    [clientPimsIdentifier] [nvarchar](50) NULL,
    [patientPimsId] [nvarchar](50) NULL,
    [patientPimsIdentifier] [nvarchar](50) NULL,
    [date] [datetime] NULL,
    [duration] [int] NULL,
    [units] [int] NULL,
    [unitLength] [int] NULL,
    [status] [nvarchar](50) NULL,
    [room] [nvarchar](50) NULL,
    [reason] [nvarchar](50) NULL,
    [notes] [nvarchar](50) NULL,
    [resourceId] [nvarchar](50) NULL,
    [resourceName] [nvarchar](50) NULL,
    [locationId] [nvarchar](50) NULL,
    [scheduleType] [nvarchar](50) NULL,
    [dpUid] [uniqueidentifier] NOT NULL,
    [pimsId] [nvarchar](50) NULL,
    [siteId] [int] NULL,
    [agentVersion] [nvarchar](50) NULL,
    [action] [nvarchar](50) NULL,
    [dpCreateDate] [datetime] NULL,
    [dpModifiedDate] [datetime] NULL,
    [syncDate] [datetime] NULL,
    [correlationId] [uniqueidentifier] NULL,
    [lastModifiedByCorrelationId] [uniqueidentifier] NULL,
    [generation] [float] NULL,
    [deleted] [bit] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
