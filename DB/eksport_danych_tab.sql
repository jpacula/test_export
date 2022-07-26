USE [Test_eksport]
GO

/****** Object:  Table [dbo].[eksport_danych]    Script Date: 2022-07-26 12:24:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[eksport_danych](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazwa_eksportu] [nvarchar](50) NULL,
	[data_eksportu] [datetime] NULL,
	[nazwa_uzytkownika] [varchar](100) NULL,
	[nazwa_lokalu] [nvarchar](100) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

