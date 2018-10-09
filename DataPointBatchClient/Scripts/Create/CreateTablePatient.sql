SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Patient](
    [pimsPatientIdentifier] [nvarchar](50) NULL,
    [name] [nvarchar](50) NULL,
    [gender] [nvarchar](50) NULL,
    [speciesDescription] [nvarchar](50) NULL,
    [breedId] [nvarchar](50) NULL,
    [breedDescription] [nvarchar](50) NULL,
    [colorId] [nvarchar](50) NULL,
    [microchipId] [nvarchar](50) NULL,
    [colorDescription] [nvarchar](50) NULL,
    [dateOfDeath] [datetime] NULL,
    [dateOfBirth] [datetime] NULL,
    [spayedOrNeutered] [bit] NULL,
    [inactive] [bit] NULL,
    [weight] [nvarchar](50) NULL,
    [weightUnit] [nvarchar](50) NULL,
    [weightUnitDescription] [nvarchar](50) NULL,
    [rabiesTag] [nvarchar](50) NULL,
    [clientPimsId] [nvarchar](50) NULL,
    [pimsClientIdentifier] [nvarchar](50) NULL,
    [locationId] [nvarchar](50) NULL,
    [dpUid] [uniqueidentifier] NOT NULL,
    [pimsId] [nvarchar](50) NULL,
    [siteId] [int] NULL,
    [agentVersion] [nvarchar](50) NULL,
    [action] [nvarchar](50) NULL,
    [dpCreateDate] [datetime] NULL,
    [dpModifiedDate] [datetime] NULL,
    [syncDate] [datetime] NULL,
    [correlationId] [uniqueidentifier] NULL,
    [lastModifiedByCorrelationId] [nvarchar](50) NULL,
    [generation] [int] NULL,
    [deleted] [bit] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
