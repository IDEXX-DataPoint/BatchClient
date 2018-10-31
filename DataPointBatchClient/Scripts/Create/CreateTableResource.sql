SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Resource](
    [Abbreviation] [nvarchar](50) NULL,
    [LastName] [nvarchar](50) NULL,
    [FirstName] [nvarchar](50) NULL,
    [MiddleName] [nvarchar](50) NULL,
    [Title] [nvarchar](50) NULL,
    [Address1] [nvarchar](50) NULL,
    [Address2] [nvarchar](50) NULL,
    [City] [nvarchar](50) NULL,
    [State] [nvarchar](50) NULL,
    [PostalCode] [nvarchar](50) NULL,
    [ClassId] [nvarchar](50) NULL,
    [License] [nvarchar](50) NULL,
    [Inactive] [bit] NULL,
    [DeletePimsId] [uniqueidentifier] NULL,
    [Note] [nvarchar](max) NULL,
    [Status] [nvarchar](50) NULL,
    [LocationId] [nvarchar](50) NULL,
    [DpStatus] [int] NULL,
    [DpStatusDescription] [nvarchar](max) NULL,
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
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
    [SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
