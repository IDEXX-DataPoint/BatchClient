SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Client](
    [title] [nvarchar](50) NULL,
    [lastName] [nvarchar](50) NULL,
    [firstName] [nvarchar](50) NULL,
    [middleName] [nvarchar](50) NULL,
    [alternateFirstName] [nvarchar](50) NULL,
    [alternateLastName] [nvarchar](50) NULL,
    [pimsCreatedDate] [datetime] NULL,
    [inactive] [bit] NULL,
    [suspendReminders] [bit] NULL,
    [locationId] [nvarchar](50) NULL,
    [address1] [nvarchar](50) NULL,
    [address2] [nvarchar](50) NULL,
    [city] [nvarchar](50) NULL,
    [state] [nvarchar](50) NULL,
    [postalCode] [nvarchar](50) NULL,
    [alternateAddress1] [nvarchar](50) NULL,
    [alternateAddress2] [nvarchar](50) NULL,
    [alternateCity] [nvarchar](50) NULL,
    [alternateState] [nvarchar](50) NULL,
    [alternatePostalCode] [nvarchar](50) NULL,
    [phoneName1] [nvarchar](50) NULL,
    [phone1] [nvarchar](50) NULL,
    [phoneName2] [nvarchar](50) NULL,
    [phone2] [nvarchar](50) NULL,
    [phoneName3] [nvarchar](50) NULL,
    [phone3] [nvarchar](50) NULL,
    [email] [nvarchar](255) NULL,
    [pimsClientIdentifier] [nvarchar](50) NULL,
    [referralSource] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
