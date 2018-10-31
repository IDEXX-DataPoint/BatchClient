SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Code](
    [PimsType] [nvarchar](50) NULL,
    [Code] [nvarchar](50) NULL,
    [Description] [nvarchar](max) NULL,
    [CategoryCode] [nvarchar](50) NULL,
    [CategoryDescription] [nvarchar](50) NULL,
    [BasePrice] [float] NULL,
    [Inactive] [bit] NULL,
    [LocationId] [nvarchar](50) NULL,
    [InvoiceDescription] [nvarchar](50) NULL,
    [UnitCost] [float] NULL,
    [MinPrice] [float] NULL,
    [DispensingFee] [float] NULL,
    [Markup] [float] NULL,
    [UnitOfMeasure] [nvarchar](50) NULL,
    [BarCode] [nvarchar](50) NULL,
    [NormalizedCategory] [nvarchar](50) NULL,
    [RevenueClassId] [nvarchar](50) NULL,
    [RevenueGroupId] [nvarchar](50) NULL,
    [RevenueTypeId] [nvarchar](50) NULL,
    [RevenueSubTypeId] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Code] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
    [SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
