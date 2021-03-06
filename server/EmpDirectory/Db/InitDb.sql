GO
/****** Object:  FullTextCatalog [ftc]    Script Date: 11/9/2016 3:19:11 PM ******/
CREATE FULLTEXT CATALOG [ftc]WITH ACCENT_SENSITIVITY = OFF

GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/9/2016 3:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Code] [nvarchar](10) NULL,
	[FTS]  AS ((isnull([Code],'')+' ')+[Name]) PERSISTED NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/9/2016 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NULL,
	[Title] [nvarchar](150) NULL,
	[MobilePhone] [varchar](15) NULL,
	[HomePhone] [varchar](15) NULL,
	[OfficePhone] [varchar](15) NULL,
	[PrimaryEmail] [nvarchar](50) NULL,
	[SecondaryEmail] [nvarchar](50) NULL,
	[Biography] [nvarchar](max) NULL,
	[HomeAddress] [nvarchar](max) NULL,
	[DOB] [datetime] NULL,
	[PictureUrl] [nvarchar](200) NULL,
	[FTS]  AS (((([FirstName]+' ')+[LastName])+' ')+[Title]) PERSISTED,
	[OfficeId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Office]    Script Date: 11/9/2016 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Office](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ShortName] [nvarchar](10) NULL,
	[FTS]  AS ((isnull([ShortName],'')+' ')+[Name]) PERSISTED NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
INSERT [dbo].[Department] ([Id], [Name], [Description], [Code]) VALUES (N'4c851303-3c97-431c-533c-08d4031fec1d', N'Human Resources', NULL, N'HR')
GO
INSERT [dbo].[Department] ([Id], [Name], [Description], [Code]) VALUES (N'b26089e1-fc34-48a1-7cdb-08d403221ac3', N'Information Technology', NULL, N'IT')
GO
INSERT [dbo].[Department] ([Id], [Name], [Description], [Code]) VALUES (N'a75a134a-309f-4e5f-8a41-47427bec25ca', N'Marketing', NULL, N'MKT')
GO
INSERT [dbo].[Department] ([Id], [Name], [Description], [Code]) VALUES (N'b75a134a-309f-4e5f-8a41-47427bec25ca', N'Management', NULL, N'MAN')
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'd7fc5217-8699-4046-a3a5-00101ab5f13c', N'Kelvin', N'Stevens', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2013-01-01 23:00:00.000' AS DateTime), N'Web Content Developer', NULL, NULL, NULL, N'thekeys@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/193355/pexels-photo-193355-large.jpeg', N'ce5d4ede-91e1-46e6-a830-a58fbc5de564')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'127cd5d2-dbe5-4671-9faf-11411665ec33', N'Angelina', N'Morton', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2014-11-25 23:00:00.000' AS DateTime), N'Personal Assistant', N'555 333 555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/61100/pexels-photo-61100-medium.jpeg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'9049c983-26a2-4846-83ea-201cd4fd0793', N'Jane', N'Forda', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2016-11-15 23:00:00.000' AS DateTime), N'Social Marketing Expert', NULL, NULL, NULL, N'jane@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/27411/pexels-photo-27411-large.jpg', N'ce5d4ede-91e1-46e6-a830-a58fbc5de564')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'3db6614a-265d-49f8-b807-2b48b51b2fe6', N'Lester', N'Turner', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', NULL, N'Web Artist', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/26939/pexels-photo-26939-medium.jpg', N'ce3ab5a8-9bea-411e-8c74-ea4d68551881')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'6f78202a-15b0-484c-8f87-2c1fc51f0bbb', N'Myrtle	', N'Ray', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2011-01-14 23:00:00.000' AS DateTime), N'Classified Advertising Manager', NULL, NULL, NULL, N'myrtle.ray@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/27949/pexels-photo-27949-large.jpg', N'ce5d4ede-91e1-46e6-a830-a58fbc5de564')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'be020883-a30a-4a4a-b90c-342a95ab0555', N'Gina	', N'Barton', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2015-04-05 22:00:00.000' AS DateTime), N'Building Rental Manager', NULL, NULL, NULL, N'gina.b@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/51969/model-female-girl-beautiful-51969-large.jpeg', N'55269563-ed9b-4322-b725-e57c613f0a8c')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'9fb3851e-4081-4121-ace4-3ebcceda0cc8', N'Preston', N'Greene', NULL, N'4c851303-3c97-431c-533c-08d4031fec1d', CAST(N'2010-07-06 22:00:00.000' AS DateTime), N'Labor Relations Director', NULL, NULL, NULL, N'p.greene@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/185847/pexels-photo-185847-large.jpeg', N'ce5d4ede-91e1-46e6-a830-a58fbc5de564')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'd6915d55-c842-42ca-a27b-46357daf946a', N'Melinda', N'Flowers', NULL, N'4c851303-3c97-431c-533c-08d4031fec1d', CAST(N'1993-11-09 23:00:00.000' AS DateTime), N'Personnel Manager', NULL, NULL, NULL, N'm.flowers@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/133749/pexels-photo-133749-large.jpeg', N'8519efbe-443f-4803-a337-71824d352489')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'2fa608a5-b62c-4822-a7be-4c114bcea2fe', N'Bonnie', N'Phillips', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', NULL, N'IT Associate', N'555 333 111', NULL, NULL, N'bonnie@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/62365/pexels-photo-62365-large.jpeg', N'ce5d4ede-91e1-46e6-a830-a58fbc5de564')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'1c5b4642-8d9b-49b3-a807-531bea82f977', N'Tamara	', N'Vasquez', NULL, N'4c851303-3c97-431c-533c-08d4031fec1d', CAST(N'2012-06-04 22:00:00.000' AS DateTime), N'Job Analysis Manager', NULL, NULL, NULL, N'tammieva@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/1654/fashion-person-woman-girl-large.jpg', N'55269563-ed9b-4322-b725-e57c613f0a8c')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'ab763ee6-0481-4937-abc1-5b12a976f765', N'Ralph', N'Walker', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', NULL, N'Account Executive', N'333 444 333', NULL, NULL, N'ralph@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/6972/summer-office-student-work-medium.jpg', N'ce5d4ede-91e1-46e6-a830-a58fbc5de564')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'cf7723e3-7dfa-4311-85cd-64ad9099109b', N'Hugh	', N'Webster', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2011-11-06 23:00:00.000' AS DateTime), N'Marketing Administrator', NULL, NULL, NULL, N'h.webster@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/52648/pexels-photo-52648-large.jpeg', N'8519efbe-443f-4803-a337-71824d352489')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'b40db75c-efc8-455a-9120-70b6f8e0e3d3', N'Clyde	', N'Hammond', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'1989-03-08 23:00:00.000' AS DateTime), N'Computer Systems Software Architect', NULL, NULL, NULL, N'c.hammond@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/211050/pexels-photo-211050-large.jpeg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'79061a22-95e3-4b83-9c82-7964fcfd5220', N'Pam', N'Martinez', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2003-11-03 23:00:00.000' AS DateTime), N'Toy Designer', NULL, NULL, NULL, N'p.martinez@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/104516/pexels-photo-104516-medium.jpeg', N'b1d2252f-195e-4f71-9765-cd5b90bdf4b4')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'85cb2674-6042-4e4f-a973-82045cb901f0', N'Amos	', N'Douglas', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2011-10-11 22:00:00.000' AS DateTime), N'Regional Sales Manager', NULL, NULL, NULL, N'a.douglas@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/7110/desk-office-workspace-coworking-medium.jpg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'6f8b9f59-26e3-40cf-aa76-87e49ef1b493', N'Janis', N'Quinn', NULL, N'4c851303-3c97-431c-533c-08d4031fec1d', CAST(N'2002-08-05 22:00:00.000' AS DateTime), N'Position Description Manager', NULL, NULL, NULL, N'j.quinn@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/134068/pexels-photo-134068-large.jpeg', N'fcf5bdb9-6b9c-44bf-b119-b771c23d9985')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'd968391d-054c-404a-9c7b-8936afb7778d', N'Baby', N'Coder', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2016-11-29 23:00:00.000' AS DateTime), N'Junior developer for life :)', N'Too young ....', NULL, NULL, N'test@test.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/35537/child-children-girl-happy-medium.jpg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'59b002de-721b-4ac6-91b1-8cebaed7dc16', N'Kimberly	', N'Vargas', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2016-11-07 23:00:00.000' AS DateTime), N'Employee Benefits Manager', NULL, NULL, NULL, N'k.vargas@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/7394/pexels-photo-large.jpg', N'55269563-ed9b-4322-b725-e57c613f0a8c')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'7fa0478c-5fe9-4713-a36e-907071219391', N'Tom', N'Patrick', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', NULL, N'Board Member', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/108048/pexels-photo-108048-medium.jpeg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'e62155d5-c679-4fb5-ac5e-938781b539de', N'Leah	', N'Matsushina', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2005-06-15 22:00:00.000' AS DateTime), N'Enterprise Systems Engineer', NULL, NULL, NULL, N'l.schultz@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/28456/pexels-photo-28456-large.jpg', N'55269563-ed9b-4322-b725-e57c613f0a8c')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'd0ce0778-d04c-416b-9f75-98f72320d010', N'Bryant	', N'Andrews', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2014-10-14 22:00:00.000' AS DateTime), N'E-Learning Manager', NULL, NULL, NULL, N'b.andrews@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/175687/pexels-photo-175687-large.jpeg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'3145e9b9-bae4-4910-a545-a803c2588f8c', N'Alyssa', N'Flowers', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', NULL, N'CMO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/21273/pexels-photo-medium.jpg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'ef560083-f8bd-4141-bea0-b044cdd872c0', N'Yuan', N'Moore', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', NULL, N'Software Developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/157023/pexels-photo-157023-large.jpeg', N'00540f36-2c02-4c92-819e-69d753edcff5')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'f1458ba0-6a23-4dfe-8d95-b4a51bbcddfe', N'Kodey', N'Seagh', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2008-11-18 23:00:00.000' AS DateTime), N'Social Media Marketer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/119705/pexels-photo-119705-medium.jpeg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'cdfe2cc9-9e17-488f-9a6a-b682822c8f0f', N'Rosa	', N'Wu', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2015-06-15 22:00:00.000' AS DateTime), N'Computer Laboratory Technician', NULL, NULL, NULL, N'r.wu@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/121483/pexels-photo-121483-large.jpeg', N'00540f36-2c02-4c92-819e-69d753edcff5')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'7921f091-edcd-41da-88e5-bf20448671ed', N'Jimmie	', N'Ward', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2010-08-09 22:00:00.000' AS DateTime), N'DBMS Specialist', NULL, NULL, NULL, N'jimmie@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/52608/pexels-photo-52608-large.jpeg', N'8519efbe-443f-4803-a337-71824d352489')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'ccca7ea2-9d3d-48a5-a277-ce88ddce7301', N'John', N'Smith', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', NULL, N'CEO', NULL, NULL, NULL, N'john@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/7062/man-people-space-desk-medium.jpg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'b8e54029-6a61-4e3c-bc20-d8cc4b6c5ebd', N'Bret	', N'Horowitz', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'1984-10-02 22:00:00.000' AS DateTime), N'Commissioner of Internal Revenue', NULL, NULL, NULL, N'b.horowitz@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/25759/pexels-photo-large.jpg', N'fcf5bdb9-6b9c-44bf-b119-b771c23d9985')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'cbba9077-10bc-4f1c-b7d2-e05d0a869e3e', N'Herman	', N'Gibbs', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2006-11-07 23:00:00.000' AS DateTime), N'Computer Systems Consultant', NULL, NULL, NULL, N'h.gibbs@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/105472/pexels-photo-105472.jpeg', N'b1d2252f-195e-4f71-9765-cd5b90bdf4b4')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'9aba190a-a2cd-4fa6-ba45-e2a81e6642b6', N'Melinda	', N'Casey', NULL, N'b75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2003-06-12 22:00:00.000' AS DateTime), N'Labor Training Manager', NULL, NULL, NULL, N'm.casey@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/10988/pexels-photo-10988-large.jpeg', N'b1d2252f-195e-4f71-9765-cd5b90bdf4b4')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'52310496-acab-4750-9272-e748188d8401', N'Marvin	', N'Horton', NULL, N'4c851303-3c97-431c-533c-08d4031fec1d', CAST(N'2016-10-30 23:00:00.000' AS DateTime), N'Wage and Salary Administrator', NULL, NULL, NULL, N'marvo@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/192439/pexels-photo-192439-small.jpeg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'e3245348-299a-4a20-b505-e9bfe84fe9c1', N'Landon	', N'Lewandowski', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'2012-02-11 23:00:00.000' AS DateTime), N'Film Editor', NULL, NULL, NULL, N'lewando@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/69212/pexels-photo-69212-large.jpeg', N'ce3ab5a8-9bea-411e-8c74-ea4d68551881')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'eec0b5c0-21e3-475b-a10e-edb8768ef507', N'Clint', N'Reynolds', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', NULL, N'Web Developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/101584/pexels-photo-101584-medium.jpeg', N'bdc81aa9-b024-47ab-be72-21785b730686')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'318fe9ee-3c6a-4e3a-b7c7-fe84cc19c0c8', N'Joshua', N'Stewart', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2013-11-11 23:00:00.000' AS DateTime), N'Data Planner', N'111 222 333', NULL, NULL, N'josh@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/7077/man-people-office-writing.jpg', N'b1d2252f-195e-4f71-9765-cd5b90bdf4b4')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'e63b9486-9599-45f3-ac93-fec857095d87', N'Doreen	', N'Schmidt', NULL, N'a75a134a-309f-4e5f-8a41-47427bec25ca', CAST(N'1993-05-11 22:00:00.000' AS DateTime), N'Promotion Manager', NULL, NULL, NULL, N'dora.s@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/157622/woman-bench-stand-by-blonde-157622-large.jpeg', N'b1d2252f-195e-4f71-9765-cd5b90bdf4b4')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [MiddleName], [DepartmentId], [StartDate], [Title], [MobilePhone], [HomePhone], [OfficePhone], [PrimaryEmail], [SecondaryEmail], [Biography], [HomeAddress], [DOB], [PictureUrl], [OfficeId]) VALUES (N'3a6c6eec-a3e1-4890-bcd5-ff30a07268ef', N'Miroslav', N'Zavala', NULL, N'b26089e1-fc34-48a1-7cdb-08d403221ac3', CAST(N'2005-05-11 22:00:00.000' AS DateTime), N'Network Diagnostic Support Specialist', NULL, NULL, NULL, N'miro.zavala@c.com', NULL, NULL, NULL, NULL, N'https://static.pexels.com/photos/78225/pexels-photo-78225-large.jpeg', N'ce3ab5a8-9bea-411e-8c74-ea4d68551881')
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'bdc81aa9-b024-47ab-be72-21785b730686', N'New York', NULL, N'NY')
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'00540f36-2c02-4c92-819e-69d753edcff5', N'Beijing', NULL, NULL)
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'8519efbe-443f-4803-a337-71824d352489', N'Tokyo', NULL, NULL)
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'ce5d4ede-91e1-46e6-a830-a58fbc5de564', N'Sydney', NULL, NULL)
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'fcf5bdb9-6b9c-44bf-b119-b771c23d9985', N'Frankfurt', NULL, NULL)
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'b1d2252f-195e-4f71-9765-cd5b90bdf4b4', N'London', NULL, NULL)
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'55269563-ed9b-4322-b725-e57c613f0a8c', N'Paris', NULL, NULL)
GO
INSERT [dbo].[Office] ([Id], [Name], [Description], [ShortName]) VALUES (N'ce3ab5a8-9bea-411e-8c74-ea4d68551881', N'Berlin', NULL, NULL)
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_Employee_Department]    Script Date: 11/9/2016 3:19:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_Department] ON [dbo].[Employee]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employee_Office]    Script Date: 11/9/2016 3:19:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employee_Office] ON [dbo].[Employee]
(
	[OfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  FullTextIndex     Script Date: 11/9/2016 3:19:12 PM ******/
CREATE FULLTEXT INDEX ON [dbo].[Department](
[FTS] LANGUAGE 'Neutral')
KEY INDEX [PK_Department]ON ([ftc], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = [Empty])


GO
/****** Object:  FullTextIndex     Script Date: 11/9/2016 3:19:12 PM ******/
CREATE FULLTEXT INDEX ON [dbo].[Employee](
[FTS] LANGUAGE 'English')
KEY INDEX [PK_Employee]ON ([ftc], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)


GO
/****** Object:  FullTextIndex     Script Date: 11/9/2016 3:19:12 PM ******/
CREATE FULLTEXT INDEX ON [dbo].[Office](
[FTS] LANGUAGE 'English')
KEY INDEX [PK_Office]ON ([ftc], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)


GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Office] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Office]
GO
