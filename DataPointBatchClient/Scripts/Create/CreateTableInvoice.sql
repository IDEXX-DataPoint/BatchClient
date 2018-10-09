SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Invoice](
    [invoiceId] [varchar](50) NULL,
    [amount] [float] NULL,
    [transactionDate] [date] NULL,
    [clientPimsId] [varchar](50) NULL,
    [patientPimsId] [varchar](50) NULL,
    [discountAmount] [float] NULL,
    [taxAmount] [float] NULL,
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
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
