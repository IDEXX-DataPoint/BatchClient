SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Appointment](
    [source] [varchar](50) NULL,
    [type] [varchar](50) NULL,
    [clientPimsId] [varchar](50) NULL,
    [clientPimsIdentifier] [varchar](50) NULL,
    [patientPimsId] [varchar](50) NULL,
    [patientPimsIdentifier] [varchar](50) NULL,
    [date] [date] NULL,
    [duration] [int] NULL,
    [units] [int] NULL,
    [unitLength] [int] NULL,
    [status] [varchar](50) NULL,
    [room] [varchar](50) NULL,
    [reason] [varchar](50) NULL,
    [notes] [varchar](50) NULL,
    [resourceId] [varchar](50) NULL,
    [resourceName] [varchar](50) NULL,
    [locationId] [varchar](50) NULL,
    [scheduleType] [varchar](50) NULL,
    [dpUid] [uniqueidentifier] NOT NULL,
    [pimsId] [varchar](50) NULL,
    [siteId] [int] NULL,
    [agentVersion] [varchar](50) NULL,
    [action] [varchar](50) NULL,
    [dpCreateDate] [date] NULL,
    [dpModifiedDate] [date] NULL,
    [syncDate] [date] NULL,
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
