SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Resource](
    [abbreviation] [varchar](50) NULL,
    [lastName] [varchar](50) NULL,
    [firstName] [varchar](50) NULL,
    [middleName] [varchar](50) NULL,
    [title] [varchar](50) NULL,
    [address1] [varchar](50) NULL,
    [address2] [varchar](50) NULL,
    [city] [varchar](50) NULL,
    [state] [varchar](50) NULL,
    [postalCode] [varchar](50) NULL,
    [classId] [varchar](50) NULL,
    [license] [varchar](50) NULL,
    [note] [varchar](50) NULL,
    [status] [varchar](50) NULL,
    [locationId] [varchar](50) NULL,
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
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
