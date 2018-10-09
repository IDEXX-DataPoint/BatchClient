SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Client](
    [title] [varchar](50) NULL,
    [lastName] [varchar](50) NULL,
    [firstName] [varchar](50) NULL,
    [middleName] [varchar](50) NULL,
    [alternateFirstName] [varchar](50) NULL,
    [alternateLastName] [varchar](50) NULL,
    [pimsCreatedDate] [date] NULL,
    [inactive] [bit] NULL,
    [suspendReminders] [bit] NULL,
    [locationId] [varchar](50) NULL,
    [address1] [varchar](50) NULL,
    [address2] [varchar](50) NULL,
    [city] [varchar](50) NULL,
    [state] [varchar](50) NULL,
    [postalCode] [varchar](50) NULL,
    [alternateAddress1] [varchar](50) NULL,
    [alternateAddress2] [varchar](50) NULL,
    [alternateCity] [varchar](50) NULL,
    [alternateState] [varchar](50) NULL,
    [alternatePostalCode] [varchar](50) NULL,
    [phoneName1] [varchar](50) NULL,
    [phone1] [varchar](50) NULL,
    [phoneName2] [varchar](50) NULL,
    [phone2] [varchar](50) NULL,
    [phoneName3] [varchar](50) NULL,
    [phone3] [varchar](50) NULL,
    [email] [varchar](50) NULL,
    [pimsClientIdentifier] [varchar](50) NULL,
    [referralSource] [varchar](50) NULL,
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
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
    [dpUid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
