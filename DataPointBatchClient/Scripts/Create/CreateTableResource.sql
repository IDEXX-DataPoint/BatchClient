SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Resource](
    [abbreviation] [nvarchar](50) NULL,
    [lastName] [nvarchar](50) NULL,
    [firstName] [nvarchar](50) NULL,
    [middleName] [nvarchar](50) NULL,
    [title] [nvarchar](50) NULL,
    [address1] [nvarchar](50) NULL,
    [address2] [nvarchar](50) NULL,
    [city] [nvarchar](50) NULL,
    [state] [nvarchar](50) NULL,
    [postalCode] [nvarchar](50) NULL,
    [classId] [nvarchar](50) NULL,
    [license] [nvarchar](50) NULL,
    [note] [nvarchar](50) NULL,
    [status] [nvarchar](50) NULL,
    [locationId] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
