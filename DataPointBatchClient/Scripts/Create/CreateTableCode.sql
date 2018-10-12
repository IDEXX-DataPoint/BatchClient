SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Code](
    [pimsType] [nvarchar](50) NULL,
    [code] [nvarchar](50) NULL,
    [description] [nvarchar](max) NULL,
    [categoryCode] [nvarchar](50) NULL,
    [categoryDescription] [nvarchar](50) NULL,
    [basePrice] [float] NULL,
    [inactive] [bit] NULL,
    [locationId] [nvarchar](50) NULL,
    [invoiceDescription] [nvarchar](50) NULL,
    [unitCost] [float] NULL,
    [minPrice] [float] NULL,
    [dispensingFee] [float] NULL,
    [markup] [float] NULL,
    [unitOfMeasure] [nvarchar](50) NULL,
    [barCode] [nvarchar](50) NULL,
    [normalizedCategory] [nvarchar](50) NULL,
    [revenueClassId] [nvarchar](50) NULL,
    [revenueGroupId] [nvarchar](50) NULL,
    [revenueTypeId] [nvarchar](50) NULL,
    [revenueSubTypeId] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Code] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
