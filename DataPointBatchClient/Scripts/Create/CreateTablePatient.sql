SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Patient](
    [pimsPatientIdentifier] [varchar](50) NULL,
    [name] [varchar](50) NULL,
    [gender] [varchar](50) NULL,
    [speciesDescription] [varchar](50) NULL,
    [breedId] [varchar](50) NULL,
    [breedDescription] [varchar](50) NULL,
    [colorId] [varchar](50) NULL,
    [microchipId] [varchar](50) NULL,
    [colorDescription] [varchar](50) NULL,
    [dateOfDeath] [datetime] NULL,
    [dateOfBirth] [datetime] NULL,
    [spayedOrNeutered] [bit] NULL,
    [inactive] [bit] NULL,
    [weight] [varchar](50) NULL,
    [weightUnit] [varchar](50) NULL,
    [weightUnitDescription] [varchar](50) NULL,
    [rabiesTag] [varchar](50) NULL,
    [clientPimsId] [varchar](50) NULL,
    [pimsClientIdentifier] [varchar](50) NULL,
    [locationId] [varchar](50) NULL,
    [dpUid] [uniqueidentifier] NOT NULL,
    [pimsId] [varchar](50) NULL,
    [siteId] [int] NULL,
    [agentVersion] [varchar](50) NULL,
    [action] [varchar](50) NULL,
    [dpCreateDate] [datetime] NULL,
    [dpModifiedDate] [datetime] NULL,
    [syncDate] [datetime] NULL,
    [correlationId] [uniqueidentifier] NULL,
    [lastModifiedByCorrelationId] [varchar](50) NULL,
    [generation] [int] NULL,
    [deleted] [bit] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
