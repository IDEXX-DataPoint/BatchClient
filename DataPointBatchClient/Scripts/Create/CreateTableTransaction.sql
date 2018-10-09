SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Transaction](
    [invoiceId] [varchar](50) NULL,
    [type] [varchar](50) NULL,
    [clientPimsId] [varchar](50) NULL,
    [patientPimsId] [varchar](50) NULL,
    [transactionDate] [date] NULL,
    [sequence] [float] NULL,
    [code] [varchar] NULL,
    [description] [varchar](255) NULL,
    [quantity] [float] NULL,
    [amount] [float] NULL,
    [discount] [float] NULL,
    [tax] [float] NULL,
    [dispensingFee] [float] NULL,
    [isPosted] [bit] NULL,
    [isPayment] [bit] NULL,
    [isVoided] [bit] NULL,
    [providerId] [varchar](50) NULL,
    [enteredById] [varchar](50) NULL,
    [comments] [varchar](50) NULL,
    [locationId] [varchar](50) NULL,
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
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
