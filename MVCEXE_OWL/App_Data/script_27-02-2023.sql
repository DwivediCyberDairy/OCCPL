USE [master]
GO
/****** Object:  Database [OswalNextGen]    Script Date: 27-02-2023 17:04:03 ******/
CREATE DATABASE [OswalNextGen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OswalNextGen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OswalNextGen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OswalNextGen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OswalNextGen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OswalNextGen] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OswalNextGen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OswalNextGen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OswalNextGen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OswalNextGen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OswalNextGen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OswalNextGen] SET ARITHABORT OFF 
GO
ALTER DATABASE [OswalNextGen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OswalNextGen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OswalNextGen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OswalNextGen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OswalNextGen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OswalNextGen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OswalNextGen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OswalNextGen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OswalNextGen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OswalNextGen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OswalNextGen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OswalNextGen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OswalNextGen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OswalNextGen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OswalNextGen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OswalNextGen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OswalNextGen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OswalNextGen] SET RECOVERY FULL 
GO
ALTER DATABASE [OswalNextGen] SET  MULTI_USER 
GO
ALTER DATABASE [OswalNextGen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OswalNextGen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OswalNextGen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OswalNextGen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OswalNextGen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OswalNextGen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OswalNextGen', N'ON'
GO
ALTER DATABASE [OswalNextGen] SET QUERY_STORE = OFF
GO
USE [OswalNextGen]
GO
/****** Object:  Table [dbo].[OWL_CareersMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_CareersMaster](
	[ApplicationNo] [int] IDENTITY(1,1) NOT NULL,
	[ApplicaintName] [varchar](50) NULL,
	[Gender] [varchar](20) NULL,
	[ApplicaintEmail] [varchar](150) NOT NULL,
	[ApplicaintMobile] [varchar](20) NULL,
	[DOB] [datetime] NULL,
	[ApplicaintAddress] [varchar](255) NULL,
	[ApplicaintLocation] [int] NULL,
	[ApplicaintPreferedLocation] [int] NULL,
	[Qualification] [int] NULL,
	[DesignationName] [int] NULL,
	[DepartmentName] [int] NULL,
	[AttachedResume] [varchar](50) NULL,
	[BusinessName] [varchar](255) NULL,
	[RegDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsActive] [bit] NULL,
	[Remark] [varchar](255) NULL,
 CONSTRAINT [PK_OWL_CareersMaster] PRIMARY KEY CLUSTERED 
(
	[ApplicaintEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_CityMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_CityMaster](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[RelatedStateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_CountryMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_CountryMaster](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_DepartmentMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_DepartmentMaster](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](100) NULL,
 CONSTRAINT [PK_OWL_DepartmentMaster] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_DesignationMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_DesignationMaster](
	[DesignationId] [int] IDENTITY(101,1) NOT NULL,
	[DesignationName] [varchar](100) NULL,
 CONSTRAINT [PK_OWL_DesignationMaster] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_EmployeeMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_EmployeeMaster](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [int] NULL,
	[EmpName] [varchar](50) NULL,
	[EmpEmail] [varchar](150) NOT NULL,
	[EmpDept] [int] NULL,
	[Qualification] [int] NULL,
	[City] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK__OWL_Empl__74E4A3D7E443F309] PRIMARY KEY CLUSTERED 
(
	[EmpEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_EnqueryMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_EnqueryMaster](
	[EnqId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[MobileNo] [varchar](20) NULL,
	[Email] [varchar](150) NULL,
	[SubmittedByEmpId] [varchar](150) NULL,
	[OrganizationName] [varchar](50) NULL,
	[Message] [varchar](350) NULL,
	[EnqDate] [datetime] NULL,
	[IsDel] [bit] NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_OWL_EnqueryMaster] PRIMARY KEY CLUSTERED 
(
	[EnqId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_QualificationMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_QualificationMaster](
	[QualificationId] [int] IDENTITY(1,1) NOT NULL,
	[QualificationName] [varchar](100) NULL,
 CONSTRAINT [PK_OWL_QualificationMaster] PRIMARY KEY CLUSTERED 
(
	[QualificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_StateMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_StateMaster](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
	[RelatedCountryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_UserMaster]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_UserMaster](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OWL_CityMaster] ON 

INSERT [dbo].[OWL_CityMaster] ([CityId], [CityName], [RelatedStateId]) VALUES (1, N'Delhi', 1)
INSERT [dbo].[OWL_CityMaster] ([CityId], [CityName], [RelatedStateId]) VALUES (2, N'Noida', 3)
INSERT [dbo].[OWL_CityMaster] ([CityId], [CityName], [RelatedStateId]) VALUES (3, N'Prayagraj', 3)
INSERT [dbo].[OWL_CityMaster] ([CityId], [CityName], [RelatedStateId]) VALUES (4, N'Bhopal', 4)
INSERT [dbo].[OWL_CityMaster] ([CityId], [CityName], [RelatedStateId]) VALUES (5, N'Indore', 4)
INSERT [dbo].[OWL_CityMaster] ([CityId], [CityName], [RelatedStateId]) VALUES (6, N'Nagpur', 2)
INSERT [dbo].[OWL_CityMaster] ([CityId], [CityName], [RelatedStateId]) VALUES (7, N'Pune ', 2)
SET IDENTITY_INSERT [dbo].[OWL_CityMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_CountryMaster] ON 

INSERT [dbo].[OWL_CountryMaster] ([CountryId], [CountryName]) VALUES (1, N'India')
INSERT [dbo].[OWL_CountryMaster] ([CountryId], [CountryName]) VALUES (2, N'America')
INSERT [dbo].[OWL_CountryMaster] ([CountryId], [CountryName]) VALUES (3, N'Japan')
INSERT [dbo].[OWL_CountryMaster] ([CountryId], [CountryName]) VALUES (4, N'China')
INSERT [dbo].[OWL_CountryMaster] ([CountryId], [CountryName]) VALUES (5, N'Pakistan')
SET IDENTITY_INSERT [dbo].[OWL_CountryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_DepartmentMaster] ON 

INSERT [dbo].[OWL_DepartmentMaster] ([DepartmentId], [DepartmentName]) VALUES (1, N'IT')
INSERT [dbo].[OWL_DepartmentMaster] ([DepartmentId], [DepartmentName]) VALUES (2, N'Accounts')
INSERT [dbo].[OWL_DepartmentMaster] ([DepartmentId], [DepartmentName]) VALUES (3, N'Human Resource')
INSERT [dbo].[OWL_DepartmentMaster] ([DepartmentId], [DepartmentName]) VALUES (4, N'Admin')
INSERT [dbo].[OWL_DepartmentMaster] ([DepartmentId], [DepartmentName]) VALUES (5, N'Management')
INSERT [dbo].[OWL_DepartmentMaster] ([DepartmentId], [DepartmentName]) VALUES (6, N'Marketing')
INSERT [dbo].[OWL_DepartmentMaster] ([DepartmentId], [DepartmentName]) VALUES (7, N'SofrwareDevelopment')
SET IDENTITY_INSERT [dbo].[OWL_DepartmentMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_DesignationMaster] ON 

INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (101, N'Manager')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (102, N'TeamLead')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (103, N'SeniorDeveloper')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (104, N'JuniorDeveloper')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (105, N'Executive')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (106, N'Assistent')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (107, N'Head')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (108, N'Director')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (109, N'CEO')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (110, N'CTO')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (111, N'Incharge')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (112, N'TaleCaller')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (113, N'CRO')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (114, N'IT Hardware')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (115, N'Peon')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (116, N'Dev''s')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (117, N'HostingServer')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (118, N'Codinator')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (119, N'QA')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (120, N'ContentWriter')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (121, N'DigitalMarketing')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (122, N'Guard')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (123, N'Programmer')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (124, N'UI/UX')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (125, N'WebDeveloper')
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (126, N'SofrwareDeveloper')
SET IDENTITY_INSERT [dbo].[OWL_DesignationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_QualificationMaster] ON 

INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (1, N'M Tech')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (2, N'MCA')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (3, N'MBA')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (4, N'M Level')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (5, N'B Tech')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (6, N'BCA')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (7, N'B Level')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (8, N'BA')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (9, N'B Com')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (10, N'B Sc')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (11, N'ITI')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (12, N'BCS')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (13, N'PGDCA')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (14, N'Intermediate')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (15, N'High School')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (16, N'LLB')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (17, N'B Vock')
INSERT [dbo].[OWL_QualificationMaster] ([QualificationId], [QualificationName]) VALUES (18, N'O Level')
SET IDENTITY_INSERT [dbo].[OWL_QualificationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_StateMaster] ON 

INSERT [dbo].[OWL_StateMaster] ([StateId], [StateName], [RelatedCountryId]) VALUES (1, N'Delhi', 1)
INSERT [dbo].[OWL_StateMaster] ([StateId], [StateName], [RelatedCountryId]) VALUES (2, N'Maharastra', 1)
INSERT [dbo].[OWL_StateMaster] ([StateId], [StateName], [RelatedCountryId]) VALUES (3, N'UttarPradesh', 1)
INSERT [dbo].[OWL_StateMaster] ([StateId], [StateName], [RelatedCountryId]) VALUES (4, N'MadhayaPradesh', 1)
INSERT [dbo].[OWL_StateMaster] ([StateId], [StateName], [RelatedCountryId]) VALUES (5, N'Uttarakhand', 1)
INSERT [dbo].[OWL_StateMaster] ([StateId], [StateName], [RelatedCountryId]) VALUES (6, N'Washingotton ', 2)
INSERT [dbo].[OWL_StateMaster] ([StateId], [StateName], [RelatedCountryId]) VALUES (7, N'Cicago ', 4)
SET IDENTITY_INSERT [dbo].[OWL_StateMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_UserMaster] ON 

INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (1, N'Employee')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (2, N'Affilate')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (3, N'Consultaint')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (4, N'Guest')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (5, N'Other')
SET IDENTITY_INSERT [dbo].[OWL_UserMaster] OFF
GO
ALTER TABLE [dbo].[OWL_EnqueryMaster] ADD  CONSTRAINT [DF_OWL_EnqueryMaster_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[OWL_CareersMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_CareersMaster_OWL_CareersMaster] FOREIGN KEY([ApplicaintLocation])
REFERENCES [dbo].[OWL_CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[OWL_CareersMaster] CHECK CONSTRAINT [FK_OWL_CareersMaster_OWL_CareersMaster]
GO
ALTER TABLE [dbo].[OWL_CareersMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_CareersMaster_OWL_CityMaster] FOREIGN KEY([ApplicaintPreferedLocation])
REFERENCES [dbo].[OWL_CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[OWL_CareersMaster] CHECK CONSTRAINT [FK_OWL_CareersMaster_OWL_CityMaster]
GO
ALTER TABLE [dbo].[OWL_CareersMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_CareersMaster_OWL_DepartmentMaster] FOREIGN KEY([DepartmentName])
REFERENCES [dbo].[OWL_DepartmentMaster] ([DepartmentId])
GO
ALTER TABLE [dbo].[OWL_CareersMaster] CHECK CONSTRAINT [FK_OWL_CareersMaster_OWL_DepartmentMaster]
GO
ALTER TABLE [dbo].[OWL_CareersMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_CareersMaster_OWL_DesignationMaster] FOREIGN KEY([DesignationName])
REFERENCES [dbo].[OWL_DesignationMaster] ([DesignationId])
GO
ALTER TABLE [dbo].[OWL_CareersMaster] CHECK CONSTRAINT [FK_OWL_CareersMaster_OWL_DesignationMaster]
GO
ALTER TABLE [dbo].[OWL_CareersMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_CareersMaster_OWL_QualificationMaster] FOREIGN KEY([Qualification])
REFERENCES [dbo].[OWL_QualificationMaster] ([QualificationId])
GO
ALTER TABLE [dbo].[OWL_CareersMaster] CHECK CONSTRAINT [FK_OWL_CareersMaster_OWL_QualificationMaster]
GO
ALTER TABLE [dbo].[OWL_CityMaster]  WITH CHECK ADD FOREIGN KEY([RelatedStateId])
REFERENCES [dbo].[OWL_StateMaster] ([StateId])
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK__OWL_Emplo__UserT__34C8D9D1] FOREIGN KEY([UserType])
REFERENCES [dbo].[OWL_UserMaster] ([UserTypeId])
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster] CHECK CONSTRAINT [FK__OWL_Emplo__UserT__34C8D9D1]
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_EmployeeMaster_OWL_CityMaster] FOREIGN KEY([City])
REFERENCES [dbo].[OWL_CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster] CHECK CONSTRAINT [FK_OWL_EmployeeMaster_OWL_CityMaster]
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_EmployeeMaster_OWL_DepartmentMaster] FOREIGN KEY([EmpDept])
REFERENCES [dbo].[OWL_DepartmentMaster] ([DepartmentId])
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster] CHECK CONSTRAINT [FK_OWL_EmployeeMaster_OWL_DepartmentMaster]
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_EmployeeMaster_OWL_QualificationMaster] FOREIGN KEY([Qualification])
REFERENCES [dbo].[OWL_QualificationMaster] ([QualificationId])
GO
ALTER TABLE [dbo].[OWL_EmployeeMaster] CHECK CONSTRAINT [FK_OWL_EmployeeMaster_OWL_QualificationMaster]
GO
ALTER TABLE [dbo].[OWL_EnqueryMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_EnqueryMaster_OWL_EmployeeMaster] FOREIGN KEY([SubmittedByEmpId])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_EnqueryMaster] CHECK CONSTRAINT [FK_OWL_EnqueryMaster_OWL_EmployeeMaster]
GO
ALTER TABLE [dbo].[OWL_StateMaster]  WITH CHECK ADD FOREIGN KEY([RelatedCountryId])
REFERENCES [dbo].[OWL_CountryMaster] ([CountryId])
GO
/****** Object:  StoredProcedure [dbo].[EmployeeMasterOperation]    Script Date: 27-02-2023 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Prammod Dwivedi>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EmployeeMasterOperation]
	-- Add the parameters for the stored procedure here
	@EmpId int ,
	@UserType int,
	@EmpName varchar(50),
	@EmpEmail varchar(150),
	@EmpDept int ,
	@Qualification int ,
	@City int,
	@AddedOn datetime,
	@UpdatedOn datetime,
	@IsDel bit = 0,
	@Operation int,
	@Response varchar(max)
	/* <@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0> 
	*/
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	
	/* Data Insertion Operation */
	if(@Operation = 1)
	begin
	insert into OWL_EmployeeMaster values(@UserType,@EmpName,@EmpEmail,@EmpDept,@Qualification,@City, @AddedOn,@UpdatedOn,@IsDel);
	Select @Response = 'Record Saved successfully';
	end 
	/* Updation */
	else if(@Operation = 2)
	begin
	update OWL_EmployeeMaster set UserType=@UserType,EmpName = @EmpName,EmpEmail =  @EmpEmail, EmpDept = @EmpDept,Qualification=@Qualification,City=@City, UpdatedOn=@UpdatedOn,IsDel=@IsDel where EmpEmail= @EmpEmail;
	Select @Response = 'Record Updated successfully';
	end
	/* Soft Delete */ 
	else if(@Operation = 3)
	begin
	update OWL_EmployeeMaster set IsDel=1 where EmpEmail= @EmpEmail;
	Select @Response = 'Record deleted successfully';
	end
	/* Show Records */
	else if(@Operation = 4)
	begin
	Select * from OWL_EmployeeMaster Where  IsDel=0;
	end
	/* Show Specefic Records*/
	else if(@Operation = 5)
	begin
	Select * from OWL_EmployeeMaster Where EmpEmail=@EmpEmail and IsDel=0;
	end
	/* Parmanent(Hard) Delete */
	else if(@Operation = 6)
	begin
	delete from OWL_EmployeeMaster where EmpEmail= @EmpEmail;
	Select @Response = 'Record Parmanentaly deleted from database';
	end
END
GO
USE [master]
GO
ALTER DATABASE [OswalNextGen] SET  READ_WRITE 
GO
