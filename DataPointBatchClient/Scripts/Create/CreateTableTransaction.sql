SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Transaction](
    [InvoiceId] [nvarchar](50) NULL,
    [Type] [nvarchar](50) NULL,
	[TypeDescription] [nvarchar](max) NULL,
    [ClientPimsId] [nvarchar](50) NULL,
    [PatientPimsId] [nvarchar](50) NULL,
    [TransactionDate] [datetime] NULL,
    [Sequence] [float] NULL,
    [Code] [nvarchar](50) NULL,
    [Description] [nvarchar](max) NULL,
    [Quantity] [float] NULL,
    [Amount] [float] NULL,
    [Discount] [float] NULL,
    [Tax] [float] NULL,
    [DispensingFee] [float] NULL,
    [IsPosted] [bit] NULL,
    [IsPayment] [bit] NULL,
    [IsVoided] [bit] NULL,
    [ProviderId] [nvarchar](50) NULL,
    [EnteredById] [nvarchar](50) NULL,
    [Comments] [nvarchar](50) NULL,
    [LocationId] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO