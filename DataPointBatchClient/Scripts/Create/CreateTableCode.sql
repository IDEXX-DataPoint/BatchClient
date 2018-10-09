SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Code](
    [pimsType] [varchar](50) NULL,
    [code] [varchar](50) NULL,
    [description] [varchar](50) NULL,
    [categoryCode] [varchar](50) NULL,
    [categoryDescription] [varchar](50) NULL,
    [basePrice] [float] NULL,
    [inactive] [bit] NULL,
    [locationId] [varchar](50) NULL,
    [invoiceDescription] [varchar](50) NULL,
    [unitCost] [float] NULL,
    [minPrice] [float] NULL,
    [dispensingFee] [float] NULL,
    [markup] [float] NULL,
    [unitOfMeasure] [varchar](50) NULL,
    [barCode] [varchar](50) NULL,
    [normalizedCategory] [varchar](50) NULL,
    [revenueClassId] [varchar](50) NULL,
    [revenueGroupId] [varchar](50) NULL,
    [revenueTypeId] [varchar](50) NULL,
    [revenueSubTypeId] [varchar](50) NULL,
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
 CONSTRAINT [PK_Code] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
