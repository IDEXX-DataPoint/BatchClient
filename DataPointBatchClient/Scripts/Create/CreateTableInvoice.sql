SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Invoice](
    [InvoiceId] [nvarchar](50) NULL,
    [Amount] [float] NULL,
    [TransactionDate] [datetime] NULL,
    [ClientPimsId] [nvarchar](50) NULL,
    [PatientPimsId] [nvarchar](50) NULL,
    [DiscountAmount] [float] NULL,
    [TaxAmount] [float] NULL,
    [LocationId] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
    [SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
