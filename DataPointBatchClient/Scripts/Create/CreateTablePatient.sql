SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Patient](
    [PimsPatientIdentifier] [nvarchar](50) NULL,
    [Name] [nvarchar](50) NULL,
    [Gender] [nvarchar](50) NULL,
    [SpeciesDescription] [nvarchar](50) NULL,
    [BreedId] [nvarchar](50) NULL,
    [BreedDescription] [nvarchar](50) NULL,
    [ColorId] [nvarchar](50) NULL,
    [MicrochipId] [nvarchar](50) NULL,
    [ColorDescription] [nvarchar](50) NULL,
	[PimsCreatedDate] [datetime] NULL,
    [DateOfDeath] [datetime] NULL,
    [DateOfBirth] [datetime] NULL,
    [SpayedOrNeutered] [bit] NULL,
    [Inactive] [bit] NULL,
    [Weight] [nvarchar](50) NULL,
    [WeightUnit] [nvarchar](50) NULL,
    [WeightUnitDescription] [nvarchar](50) NULL,
    [RabiesTag] [nvarchar](50) NULL,
    [ClientPimsId] [nvarchar](50) NULL,
    [PimsClientIdentifier] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
    [PimsId] ASC,
    [SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
