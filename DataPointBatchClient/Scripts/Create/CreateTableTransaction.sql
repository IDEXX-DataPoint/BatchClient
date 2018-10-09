SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Transaction](
    [invoiceId] [nvarchar](50) NULL,
    [type] [nvarchar](50) NULL,
    [clientPimsId] [nvarchar](50) NULL,
    [patientPimsId] [nvarchar](50) NULL,
    [transactionDate] [date] NULL,
    [sequence] [float] NULL,
    [code] [varchar] NULL,
    [description] [nvarchar](max) NULL,
    [quantity] [float] NULL,
    [amount] [float] NULL,
    [discount] [float] NULL,
    [tax] [float] NULL,
    [dispensingFee] [float] NULL,
    [isPosted] [bit] NULL,
    [isPayment] [bit] NULL,
    [isVoided] [bit] NULL,
    [providerId] [nvarchar](50) NULL,
    [enteredById] [nvarchar](50) NULL,
    [comments] [nvarchar](50) NULL,
    [locationId] [nvarchar](50) NULL,
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
    [dpCreateDate] [date] NULL,
    [dpModifiedDate] [date] NULL,
    [syncDate] [date] NULL,
    [correlationId] [uniqueidentifier] NULL,
    [lastModifiedByCorrelationId] [uniqueidentifier] NULL,
    [generation] [float] NULL,
    [deleted] [bit] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
