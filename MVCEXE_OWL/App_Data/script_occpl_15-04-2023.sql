USE [master]
GO
/****** Object:  Database [OswalNextGen]    Script Date: 15-04-2023 17:59:37 ******/
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
/****** Object:  Table [dbo].[OWL_BusinessPlanMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_BusinessPlanMaster](
	[PlanNo] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [varchar](100) NULL,
	[SectorType] [int] NULL,
	[Services] [varchar](255) NULL,
	[Advantage] [varchar](255) NULL,
	[AdditionalFeatuer] [varchar](255) NULL,
	[Cost] [money] NULL,
	[CurrencyType] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[PostStatus] [int] NULL,
	[CreatedBy] [varchar](150) NULL,
	[CreationDT] [datetime] NULL,
	[UpdatedON] [datetime] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_BusinessPlanMaster] PRIMARY KEY CLUSTERED 
(
	[PlanNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_BusinessServicesMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_BusinessServicesMaster](
	[ServiceNo] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](100) NULL,
	[ServiceCategory] [int] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_BusinessServicesMaster] PRIMARY KEY CLUSTERED 
(
	[ServiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_CareersMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_CareersMaster](
	[ApplicationNo] [int] IDENTITY(1,1) NOT NULL,
	[ApplicaintName] [varchar](50) NULL,
	[Gender] [varchar](20) NULL,
	[ApplicaintEmail] [varchar](150) NULL,
	[ApplicaintMobile] [varchar](20) NULL,
	[DOB] [datetime] NULL,
	[ApplicaintAddress] [varchar](255) NULL,
	[ApplicaintLocation] [int] NULL,
	[ApplicaintPreferedLocation] [int] NULL,
	[Qualification] [int] NULL,
	[DesignationName] [int] NULL,
	[DepartmentName] [int] NULL,
	[AttachmentFolderName] [varchar](50) NULL,
	[AttachedResume] [nvarchar](max) NULL,
	[AttachmentExtension] [varchar](50) NULL,
	[BusinessName] [varchar](255) NULL,
	[RegDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsActive] [bit] NULL,
	[Remark] [varchar](255) NULL,
 CONSTRAINT [PK_OWL_CareersMaster] PRIMARY KEY CLUSTERED 
(
	[ApplicationNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_CityMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
/****** Object:  Table [dbo].[OWL_ClientMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_ClientMaster](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](255) NULL,
	[BelongResource] [int] NULL,
	[SectorType] [int] NULL,
	[AuthorizedPerson] [varchar](50) NULL,
	[Designation] [int] NULL,
	[Email] [varchar](150) NOT NULL,
	[MobileNo] [varchar](20) NULL,
	[Address] [varchar](255) NULL,
	[RelatedState] [int] NULL,
	[RelatedCity] [int] NULL,
	[Url] [nvarchar](max) NULL,
	[BusinessPlan] [int] NULL,
	[Status] [int] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_ClientMaster] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_CountryMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
/****** Object:  Table [dbo].[OWL_DepartmentMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
/****** Object:  Table [dbo].[OWL_DesignationMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
/****** Object:  Table [dbo].[OWL_DocCategoryMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_DocCategoryMaster](
	[DocCategoryNo] [int] IDENTITY(101,1) NOT NULL,
	[DocCategoryName] [varchar](150) NULL,
	[RelatedDocType_Id] [int] NULL,
 CONSTRAINT [PK_OWL_DocCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[DocCategoryNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_DocTypeMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_DocTypeMaster](
	[DocTypeNo] [int] IDENTITY(1001,1) NOT NULL,
	[DocType] [varchar](100) NULL,
 CONSTRAINT [PK_OWL_DocTypeMaster] PRIMARY KEY CLUSTERED 
(
	[DocTypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_DocumentMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_DocumentMaster](
	[DocNo] [int] IDENTITY(1,1) NOT NULL,
	[DocTitle] [varchar](100) NULL,
	[DocName] [varchar](255) NULL,
	[DocUploadedBy] [varchar](150) NULL,
	[DocCategoryName] [int] NULL,
	[DocRelatedYear] [datetime] NULL,
	[DocUploadedOn] [datetime] NULL,
	[DocUpdatedOn] [datetime] NULL,
	[Description] [varchar](150) NULL,
	[FolderName] [varchar](255) NULL,
	[DocFileType] [varchar](50) NULL,
	[DocFileSizeIn_KB] [float] NULL,
	[IsDel] [bit] NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_OWL_DocumentMaster_1] PRIMARY KEY CLUSTERED 
(
	[DocNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_EmployeeDetail]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_EmployeeDetail](
	[EmpEmail] [varchar](150) NOT NULL,
	[ProfilePic] [varchar](255) NULL,
	[About] [varchar](355) NULL,
	[CompanyName] [varchar](150) NULL,
	[JobDesignation] [int] NULL,
	[Country] [int] NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[TwitterProfileUrl] [varchar](355) NULL,
	[FacebookProfileUrl] [varchar](355) NULL,
	[InstagramProfileUrl] [varchar](355) NULL,
	[LinkedinProfileUrl] [varchar](355) NULL,
	[LinkType] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_OWL_EmployeeDetail] PRIMARY KEY CLUSTERED 
(
	[EmpEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_EmployeeMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_EmployeeMaster](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [int] NULL,
	[EmpName] [varchar](50) NULL,
	[EmpEmail] [varchar](150) NOT NULL,
	[Gender] [varchar](20) NULL,
	[EmpDept] [int] NULL,
	[Qualification] [int] NULL,
	[City] [int] NULL,
	[UserPassword] [varchar](255) NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK__OWL_Empl__74E4A3D7E443F309] PRIMARY KEY CLUSTERED 
(
	[EmpEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_EnqueryMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
	[Subject] [varchar](100) NULL,
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
/****** Object:  Table [dbo].[OWL_JobModeMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_JobModeMaster](
	[ModeId] [int] IDENTITY(1,1) NOT NULL,
	[JobMode] [varchar](50) NULL,
 CONSTRAINT [PK_OWL_JobModeMaster] PRIMARY KEY CLUSTERED 
(
	[ModeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_JobsPostMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_JobsPostMaster](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[JobTitle] [varchar](100) NULL,
	[Qualification] [int] NULL,
	[KeySkills] [varchar](150) NULL,
	[Exp_InYears] [int] NULL,
	[Available_NoOfPost] [int] NULL,
	[JobType] [int] NULL,
	[JobMode] [int] NULL,
	[JobLocation] [int] NULL,
	[PublishedBy] [varchar](150) NULL,
	[PublishedOn] [datetime] NULL,
	[Status] [int] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_JobPostMaster] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_JobTypeMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_JobTypeMaster](
	[JobTypeId] [int] IDENTITY(1,1) NOT NULL,
	[JobType] [varchar](50) NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_JobTypeMaster] PRIMARY KEY CLUSTERED 
(
	[JobTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_LoginMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_LoginMaster](
	[UserId] [varchar](150) NOT NULL,
	[UserPassword] [varchar](255) NULL,
	[UserType] [int] NULL,
	[UserStatus] [bit] NULL,
	[LoginCount] [int] NULL,
	[LastLogin_DT] [datetime] NULL,
	[LastLogin_IP] [varchar](100) NULL,
 CONSTRAINT [PK_OWL_LoginMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_PostsMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_PostsMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostAuthor] [varchar](150) NULL,
	[PostDate] [datetime] NULL,
	[PostContent] [nvarchar](max) NULL,
	[FeaturedImg] [varchar](150) NULL,
	[ThumbImg] [varchar](150) NULL,
	[FileFolderName] [varchar](255) NULL,
	[PostTitle] [varchar](150) NULL,
	[PostExcerpt] [varchar](150) NULL,
	[BulletPoint] [varchar](500) NULL,
	[PostStatus] [int] NULL,
	[CommentStatus] [int] NULL,
	[PostPassword] [varchar](50) NULL,
	[PostName] [varchar](355) NULL,
	[ToPingTags] [varchar](150) NULL,
	[Pinged] [varchar](150) NULL,
	[PostUpdatedOn] [datetime] NULL,
	[PostContentFiltered] [varchar](max) NULL,
	[PostParent] [int] NULL,
	[Guid] [varchar](255) NULL,
	[MenuOrder] [int] NULL,
	[PostType] [int] NULL,
	[PostMimeType] [varchar](100) NULL,
	[CommentCount] [int] NULL,
	[Url] [varchar](355) NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_PostsMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_PostTypeMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_PostTypeMaster](
	[PostTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PostType] [varchar](50) NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_Owl_PostTypeMaster] PRIMARY KEY CLUSTERED 
(
	[PostTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_QualificationMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
/****** Object:  Table [dbo].[OWL_QuestionMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_QuestionMaster](
	[QuestionNo] [int] IDENTITY(1,1) NOT NULL,
	[SectorType] [int] NULL,
	[Question] [varchar](355) NULL,
	[Answer] [nvarchar](max) NULL,
	[CreationDT] [datetime] NULL,
	[UpdationDT] [datetime] NULL,
	[CreatedBy] [varchar](150) NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_QuestionMaster] PRIMARY KEY CLUSTERED 
(
	[QuestionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_ResourceMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_ResourceMaster](
	[ResourceId] [int] IDENTITY(11001,1) NOT NULL,
	[ResourceName] [varchar](150) NULL,
	[ResourceUrl] [nvarchar](max) NULL,
	[ResourceEmail] [varchar](150) NULL,
	[AuthorizedPerson] [varchar](50) NULL,
	[MobileNo] [varchar](20) NULL,
	[CreatedBy] [varchar](150) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_ResourceMaster] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_SectorTypeMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_SectorTypeMaster](
	[SectorTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SectorType] [varchar](100) NULL,
 CONSTRAINT [PK_OWL_SectorTypeMaster] PRIMARY KEY CLUSTERED 
(
	[SectorTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_ServicesCategoryMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_ServicesCategoryMaster](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_ServicesCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_StateMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
/****** Object:  Table [dbo].[OWL_StatusListMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_StatusListMaster](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusValue] [varchar](50) NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_StatusListMaster] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_TagsMaster]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_TagsMaster](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](50) NULL,
	[TagReleatedSector] [int] NULL,
	[IsDel] [bit] NULL,
 CONSTRAINT [PK_OWL_TagsMaster] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_TestTbl]    Script Date: 15-04-2023 17:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWL_TestTbl](
	[Id] [int] NULL,
	[Name] [varchar](50) NULL,
	[City] [int] NULL,
	[Address] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWL_UserMaster]    Script Date: 15-04-2023 17:59:37 ******/
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
SET IDENTITY_INSERT [dbo].[OWL_BusinessServicesMaster] ON 

INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (1, N'5-GB', 1, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (2, N'10-GB', 1, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (3, N'100-GB', 1, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (4, N'1-Email', 5, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (5, N'5-Email', 5, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (6, N'10-Email', 5, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (7, N'Working-Hours', 9, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (8, N'On-Requrest', 9, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (9, N'24*7', 9, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (10, N'Technical', 6, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (11, N'Guidenss', 6, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (12, N'Suggestion', 6, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (13, N'Yearly', 4, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (14, N'Monthly', 4, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (15, N'Daily', 4, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (16, N'EnquiryData', 16, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (17, N'BusinessDoc', 16, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (18, N'All', 16, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (19, N'Enquiry', 15, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (20, N'Sale', 15, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (21, N'Product', 15, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (22, N'Mobile', 2, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (23, N'Desktop', 2, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (24, N'Laptop', 2, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (25, N'Informational', 14, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (26, N'Operational', 14, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (27, N'Non', 14, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (28, N'Non-Ssl', 7, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (29, N'Ssl', 7, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (30, N'TierSchema', 7, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (31, N'IpTracker', 7, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (32, N'Storage', 13, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (33, N'Speed', 13, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (34, N'Email', 13, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (35, N'Promotion', 13, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (36, N'20/GBPS', 3, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (37, N'50/GBPS', 3, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (38, N'100/GBPS', 3, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (39, N'General', 8, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (40, N'EmailServer', 8, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (41, N'Full', 8, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (42, N'WebSite', 10, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (43, N'Product', 10, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (44, N'Service', 10, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (45, N'SEO', 11, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (46, N'SMO', 11, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (47, N'Paid', 11, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (48, N'Business', 12, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (49, N'Sale', 12, 0)
INSERT [dbo].[OWL_BusinessServicesMaster] ([ServiceNo], [ServiceName], [ServiceCategory], [IsDel]) VALUES (50, N'Activities', 12, 0)
SET IDENTITY_INSERT [dbo].[OWL_BusinessServicesMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_CareersMaster] ON 

INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (1, N'Pramod Dwivedi', N'Male', N'Pramod.growel@gmail.com', N'8856885543', NULL, N'Karwi,Chitrakoot', 3, 5, 1, 126, 1, NULL, N'D:\Pramod Dwivedi\ASP.NET MVC\MVCEXE_OWL\MVCEXE_OWL\Content\CareersApplicationResumes\SomeFile.xls', NULL, N'OCCPL', CAST(N'2023-03-23T14:43:30.393' AS DateTime), 1, 0, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (2, N'Ashish', N'Male', N'Ashish@testmail.com', N'9793000092', NULL, N'Vijay Nagar, Indore', 5, 1, 3, 102, 7, NULL, N'D:\Pramod Dwivedi\ASP.NET MVC\MVCEXE_OWL\MVCEXE_OWL\Content\CareersApplicationResumes\sample_MOU_template.doc', NULL, N'OCCPL', CAST(N'2023-03-23T16:34:03.010' AS DateTime), 1, 0, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (3, N'Mannju', N'Male', N'manju@testmail.com', N'9793000092', NULL, N'NEW ASHOK , VIHAR', 1, 5, 2, 107, 3, NULL, N'D:\Pramod Dwivedi\ASP.NET MVC\MVCEXE_OWL\MVCEXE_OWL\Content\CareersApplicationResumes\sample_MOU_template.doc', NULL, N'OCCPL', CAST(N'2023-03-23T16:41:29.797' AS DateTime), 1, 0, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (5, N'Durgesh', N'Male', N'Durgesh@Techhost.com', N'7997588587', NULL, N'Subhash Nagar', 5, 1, 5, 102, 7, NULL, N'D:\Pramod Dwivedi\ASP.NET MVC\MVCEXE_OWL\MVCEXE_OWL\Content\CareersApplicationResumes\logformImg.jpg', NULL, N'OCCPL', CAST(N'2023-03-23T16:47:11.993' AS DateTime), 1, 0, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (7, N'Ashish Kumar', N'Male', N'KumarAshish@Testmail.com', N'9875855887', NULL, N'Lalbag Palace ', 5, 1, 1, 126, 7, NULL, N'D:\Pramod Dwivedi\ASP.NET MVC\MVCEXE_OWL\MVCEXE_OWL\Content\CareersApplicationResumes\PramodDwivedi.jpeg', NULL, N'OCCPL', CAST(N'2023-03-23T16:57:32.260' AS DateTime), 1, 0, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (8, N'Dwivedi Cyber', N'Male', N'DwivediCyber@gmail.com', N'778785899665', NULL, N'New Ashok magar', 3, 5, 2, 126, 7, N'CareersApplicationResumes', N'4uf3nzzz.d40_23_03_YY__05_54_09sample_MOU_template.doc', N'.DOC', N'OCCPL', CAST(N'2023-03-23T17:54:09.337' AS DateTime), 1, 1, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (9, N'Ritesh Kumar', N'Male', N'Ritesh@oswaldata@.com', N'8586859885', NULL, N'Mayur vihar Phase -II', 1, 1, 1, 101, 1, N'CareersApplicationResumes', N'4hsoa3wt.tny_23_03_YY__06_15_56Memorandum-of-Understanding-Template-06.pdf', N'.PDF', N'OCCPL', CAST(N'2023-03-23T18:15:56.430' AS DateTime), 1, 1, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (10, N'Dwivedi Cyber', N'Male', N'DwivediCyber@gmail.com', N'778785899665', NULL, N'New Ashok magar', 3, 5, 2, 126, 7, N'CareersApplicationResumes', N'4uf3nzzz.d40_23_03_YY__05_54_09sample_MOU_template.doc', N'.DOC', N'OCCPL', CAST(N'2023-03-23T17:54:09.337' AS DateTime), 1, 1, NULL)
INSERT [dbo].[OWL_CareersMaster] ([ApplicationNo], [ApplicaintName], [Gender], [ApplicaintEmail], [ApplicaintMobile], [DOB], [ApplicaintAddress], [ApplicaintLocation], [ApplicaintPreferedLocation], [Qualification], [DesignationName], [DepartmentName], [AttachmentFolderName], [AttachedResume], [AttachmentExtension], [BusinessName], [RegDate], [Status], [IsActive], [Remark]) VALUES (11, N'Anupam', N'Male', N'Anupam@gmail.com', N'8585685856', NULL, N'Sultampur , Uttar Pradesh', 3, 5, 5, 123, 1, N'CareersApplicationResumes', N'hetcor4h.fsy_03_04_YY__03_48_20JUL2022_ICICIStatement_Cr.pdf', N'.PDF', N'OCCPL', CAST(N'2023-04-03T15:48:26.347' AS DateTime), 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[OWL_CareersMaster] OFF
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
INSERT [dbo].[OWL_DesignationMaster] ([DesignationId], [DesignationName]) VALUES (126, N'SoftwareDeveloper')
SET IDENTITY_INSERT [dbo].[OWL_DesignationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_DocCategoryMaster] ON 

INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (101, N'PrivacyPolicy', 1001)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (102, N'TermandCondition', 1001)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (103, N'OfferLatter', 1003)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (104, N'Mou', 1004)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (105, N'CertificateofIncorporation', 1004)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (106, N'Gst', 1004)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (107, N'WardCare', 1002)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (108, N'PowerManagement', 1002)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (109, N'Marketing', 1003)
INSERT [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo], [DocCategoryName], [RelatedDocType_Id]) VALUES (115, N'AnnualReturn', 1004)
SET IDENTITY_INSERT [dbo].[OWL_DocCategoryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_DocTypeMaster] ON 

INSERT [dbo].[OWL_DocTypeMaster] ([DocTypeNo], [DocType]) VALUES (1001, N'GeneralInfo')
INSERT [dbo].[OWL_DocTypeMaster] ([DocTypeNo], [DocType]) VALUES (1002, N'Bound')
INSERT [dbo].[OWL_DocTypeMaster] ([DocTypeNo], [DocType]) VALUES (1003, N'Proposal')
INSERT [dbo].[OWL_DocTypeMaster] ([DocTypeNo], [DocType]) VALUES (1004, N'Legal')
SET IDENTITY_INSERT [dbo].[OWL_DocTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_DocumentMaster] ON 

INSERT [dbo].[OWL_DocumentMaster] ([DocNo], [DocTitle], [DocName], [DocUploadedBy], [DocCategoryName], [DocRelatedYear], [DocUploadedOn], [DocUpdatedOn], [Description], [FolderName], [DocFileType], [DocFileSizeIn_KB], [IsDel], [Remark]) VALUES (1, N'Discussion With Employee ', N'vs0ojxfv.5za_15_03_YY__04_28_52emp_ritesh.jpg', N'Ritesh@gmail.com', 103, NULL, CAST(N'2023-03-15T16:29:03.133' AS DateTime), CAST(N'2023-03-15T16:29:04.173' AS DateTime), N'Hi test.,
File', N'Admin_Uploaded_Document', N'.JPG', 11, 0, NULL)
INSERT [dbo].[OWL_DocumentMaster] ([DocNo], [DocTitle], [DocName], [DocUploadedBy], [DocCategoryName], [DocRelatedYear], [DocUploadedOn], [DocUpdatedOn], [Description], [FolderName], [DocFileType], [DocFileSizeIn_KB], [IsDel], [Remark]) VALUES (2, N'Discussion With Employee ', N'jhuknzrq.uti_15_03_YY__04_34_33emp_ritesh.jpg', N'Ritesh@gmail.com', 103, NULL, CAST(N'2023-03-15T16:34:39.750' AS DateTime), CAST(N'2023-03-15T16:34:39.977' AS DateTime), N'Hi test.,
File', N'Admin_Uploaded_Document', N'.JPG', 11, 0, NULL)
INSERT [dbo].[OWL_DocumentMaster] ([DocNo], [DocTitle], [DocName], [DocUploadedBy], [DocCategoryName], [DocRelatedYear], [DocUploadedOn], [DocUpdatedOn], [Description], [FolderName], [DocFileType], [DocFileSizeIn_KB], [IsDel], [Remark]) VALUES (3, N'Awareness Info ', N'0vyushuq.aye_15_03_YY__05_57_58OCCPL_Web_TandC.docx', N'Ritesh@gmail.com', 102, NULL, CAST(N'2023-03-15T17:57:58.037' AS DateTime), CAST(N'2023-03-15T17:57:58.037' AS DateTime), N'T&C', N'Admin_Uploaded_Document', N'.DOCX', 13, 0, NULL)
INSERT [dbo].[OWL_DocumentMaster] ([DocNo], [DocTitle], [DocName], [DocUploadedBy], [DocCategoryName], [DocRelatedYear], [DocUploadedOn], [DocUpdatedOn], [Description], [FolderName], [DocFileType], [DocFileSizeIn_KB], [IsDel], [Remark]) VALUES (4, N'Oswal Privacy Policy', N'lmylxvlw.boj_16_03_YY__10_37_56OCCPL_Web__Privacy_Policies.docx', N'Ritesh@gmail.com', 101, NULL, CAST(N'2023-03-16T10:37:56.330' AS DateTime), CAST(N'2023-03-16T10:37:56.330' AS DateTime), N'OCCPL Privacy Policy', N'Admin_Uploaded_Document', N'.DOCX', 38, 0, NULL)
INSERT [dbo].[OWL_DocumentMaster] ([DocNo], [DocTitle], [DocName], [DocUploadedBy], [DocCategoryName], [DocRelatedYear], [DocUploadedOn], [DocUpdatedOn], [Description], [FolderName], [DocFileType], [DocFileSizeIn_KB], [IsDel], [Remark]) VALUES (5, N'Annual Report2021-22', N'vtoouymc.lin_10_04_YY__04_12_24Form_MGT_7_final_21_22.pdf', N'Ritesh@gmail.com', 115, NULL, CAST(N'2023-04-10T16:12:24.937' AS DateTime), CAST(N'2023-04-10T16:12:24.937' AS DateTime), N'Year 2021-2022', N'Admin_Uploaded_Document', N'.PDF', 2438, 0, NULL)
SET IDENTITY_INSERT [dbo].[OWL_DocumentMaster] OFF
GO
INSERT [dbo].[OWL_EmployeeDetail] ([EmpEmail], [ProfilePic], [About], [CompanyName], [JobDesignation], [Country], [Address], [Phone], [TwitterProfileUrl], [FacebookProfileUrl], [InstagramProfileUrl], [LinkedinProfileUrl], [LinkType], [UpdatedOn]) VALUES (N'pramod.growel@gmail.com', NULL, NULL, NULL, 2, NULL, NULL, N'7651986885', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OWL_EmployeeDetail] ([EmpEmail], [ProfilePic], [About], [CompanyName], [JobDesignation], [Country], [Address], [Phone], [TwitterProfileUrl], [FacebookProfileUrl], [InstagramProfileUrl], [LinkedinProfileUrl], [LinkType], [UpdatedOn]) VALUES (N'Ritesh@gmail.com', N'nzc2jsh2.oar_03_04_YY__04_25_06empintrectionImg.png', N'I''m working here as Computer management head ', N'Oswal Computers & Consultaints ', 110, 1, N'Subhash Nagar, Pardeshipura , Indore MP', N'7754855747', N'http://twitter.com/Rites', N'http://twitter.com/Ritesh', N'http://twitter.com/Ritesh', N'http://twitter.com/Ritesh', NULL, CAST(N'2023-04-03T16:25:06.890' AS DateTime))
INSERT [dbo].[OWL_EmployeeDetail] ([EmpEmail], [ProfilePic], [About], [CompanyName], [JobDesignation], [Country], [Address], [Phone], [TwitterProfileUrl], [FacebookProfileUrl], [InstagramProfileUrl], [LinkedinProfileUrl], [LinkType], [UpdatedOn]) VALUES (N'Scot@testmail.com', N'qfsvexzb.z5q_13_03_YY__03_18_24OswalTeam_BhagatSingh.jfif', N'Dev''s engineer', N'Oswal Computers & Consultaints ', 103, 3, N'60, Electric Complex , Indore MP', N'7754855745', N'http://twitter.com/oswalCompu ', N'http://facebook.com/oswalCompu ', N'http://Instagram.com/oswalCompu', N'http://LinkedIn.com/oswalCompu', NULL, CAST(N'2023-03-13T15:20:42.453' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[OWL_EmployeeMaster] ON 

INSERT [dbo].[OWL_EmployeeMaster] ([EmpId], [UserType], [EmpName], [EmpEmail], [Gender], [EmpDept], [Qualification], [City], [UserPassword], [AddedOn], [UpdatedOn], [IsDel]) VALUES (2, 2, N'Anup Kumar', N'Anupkumar734854@gmail.com', N'Male', 1, 11, 3, N'876', CAST(N'2023-03-06T12:10:40.827' AS DateTime), CAST(N'2023-03-06T12:10:40.827' AS DateTime), 0)
INSERT [dbo].[OWL_EmployeeMaster] ([EmpId], [UserType], [EmpName], [EmpEmail], [Gender], [EmpDept], [Qualification], [City], [UserPassword], [AddedOn], [UpdatedOn], [IsDel]) VALUES (1, 1, N'JAY Jojaph', N'Pramod.growel@gmail.com', N'Male', 1, 2, 1, N'123', CAST(N'2023-03-06T11:39:12.393' AS DateTime), CAST(N'2023-03-06T11:39:12.393' AS DateTime), 0)
INSERT [dbo].[OWL_EmployeeMaster] ([EmpId], [UserType], [EmpName], [EmpEmail], [Gender], [EmpDept], [Qualification], [City], [UserPassword], [AddedOn], [UpdatedOn], [IsDel]) VALUES (5, 6, N'Ritesh ', N'Ritesh@gmail.com', N'Male', 4, 3, 5, N'  @   ', CAST(N'2023-03-14T11:43:10.580' AS DateTime), CAST(N'2023-03-14T11:43:10.580' AS DateTime), 0)
INSERT [dbo].[OWL_EmployeeMaster] ([EmpId], [UserType], [EmpName], [EmpEmail], [Gender], [EmpDept], [Qualification], [City], [UserPassword], [AddedOn], [UpdatedOn], [IsDel]) VALUES (4, 1, N'Bhagat Singh', N'Scot@testmail.com', N'Male', 1, 5, 1, N'876', CAST(N'2023-03-10T12:54:57.577' AS DateTime), CAST(N'2023-03-10T12:54:57.577' AS DateTime), 0)
INSERT [dbo].[OWL_EmployeeMaster] ([EmpId], [UserType], [EmpName], [EmpEmail], [Gender], [EmpDept], [Qualification], [City], [UserPassword], [AddedOn], [UpdatedOn], [IsDel]) VALUES (3, 1, N'Shree', N'Shree@testmail.com', N'Male', 5, 3, 4, N'8765', CAST(N'2023-03-10T12:47:57.220' AS DateTime), CAST(N'2023-03-10T12:47:57.220' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[OWL_EmployeeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_EnqueryMaster] ON 

INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (1, N'pramod', N'7651879878', N'pramod@test.com', NULL, N'Oswal Computers ', N'test', N'ttr', CAST(N'2023-03-02T12:54:08.557' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (2, N'SheeGi', N'7474558475', N'Shee@test.com', NULL, N'Shree Dham', N'test', N'Hi tesssssssssssssssssssst', CAST(N'2023-03-02T12:57:00.493' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (3, N'SheeGi', N'7474558475', N'Shee@test.com', NULL, N'Shree Dham', N'test', N'Hi tesssssssssssssssssssst', CAST(N'2023-03-02T13:00:49.670' AS DateTime), 0, N'DONE')
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (4, N'Scot Smith', N'7858756565', N'ScotSmith@test.com', NULL, N'Scot Smith Export', N'Info ', NULL, CAST(N'2023-03-13T17:36:51.577' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (5, N'Ashish', N'9885688568', N'Ashish@test.com', NULL, N'e-Study Corner', N'Info Quatation', NULL, CAST(N'2023-03-13T17:43:19.423' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (6, N'Shreekant', N'7651879858', N'Shreekant@test.com', NULL, N'Shreekant CDDC Assosiation', N'Info Quatation', NULL, CAST(N'2023-03-13T18:03:37.280' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (7, N'Pramod Dwivedi', N'87584758475', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info Suggetion', NULL, CAST(N'2023-03-13T18:10:54.613' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (8, N'Pramod Dwivedi', N'87584758475', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info Suggetion', NULL, CAST(N'2023-03-13T18:11:07.140' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (9, N'Pramod Dwivedi', N'87584758475', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info Suggetion', NULL, CAST(N'2023-03-13T18:11:20.723' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (10, N'Pramod Dwivedi', N'7651879878', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info| Offer | Quatation', NULL, CAST(N'2023-03-13T18:12:56.647' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (11, N'Pramod Dwivedi', N'7651879878', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info| Offer | Quatation', NULL, CAST(N'2023-03-13T18:13:50.053' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (12, N'Pramod Dwivedi', N'7651879878', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info| Offer | Quatation', NULL, CAST(N'2023-03-13T18:13:52.820' AS DateTime), 0, N'done')
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (13, N'Pramod Dwivedi', N'7651879878', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info| Offer | Quatation', NULL, CAST(N'2023-03-13T18:13:54.820' AS DateTime), 0, N'DONE')
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (14, N'Pramod Dwivedi', N'7651879878', N'Dwivedi@test.com', NULL, N'Dwivedi Cyber Dairy', N'Info| Offer | Quatation', NULL, CAST(N'2023-03-13T18:13:54.990' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (20, N'pramod', NULL, N'pramod@test.com', NULL, NULL, NULL, NULL, CAST(N'2023-03-28T12:35:15.097' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (21, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:17.003' AS DateTime), 0, N'done')
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (22, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:20.610' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (23, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:24.783' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (24, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:25.050' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (25, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:25.240' AS DateTime), 0, N'done')
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (26, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:25.417' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (27, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:25.607' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (28, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T12:54:27.553' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (29, N'Burli Chali', N'7885856558', N'ChalBurl@yahoo.com', NULL, N'DCD', N'Info | Business ', NULL, CAST(N'2023-03-28T13:15:01.730' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (30, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:17.250' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (31, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:20.417' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (32, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:20.650' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (33, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:20.807' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (34, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:20.983' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (35, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:21.490' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (36, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:21.697' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (37, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:21.897' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (38, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:30.377' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (39, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:33.840' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (40, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:37.010' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (41, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:37.177' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (42, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:37.343' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (43, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:37.490' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (44, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:37.650' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (45, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:37.800' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (46, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:37.937' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (47, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:38.087' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (48, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:38.440' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (49, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:38.607' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (50, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:38.840' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (51, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:39.000' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (52, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:39.183' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (53, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:39.377' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (54, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:39.543' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (55, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:39.720' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (56, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:39.920' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (57, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:40.903' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (58, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:41.080' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (59, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:41.240' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (60, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:41.433' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (61, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:41.647' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (62, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:41.847' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (63, N'pramod', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'Business Proposal', NULL, CAST(N'2023-03-28T13:16:42.057' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (64, N'SCot Burl', N'9878878977', N'bruli@outlook.com', NULL, N'Tech Burl', N'Proposal', NULL, CAST(N'2023-03-28T13:18:05.763' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (65, N'SCot Burl', N'9878878977', N'bruli@outlook.com', NULL, N'Tech Burl', N'Proposal', NULL, CAST(N'2023-03-28T13:18:07.640' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (66, N'Scvot Burli', N'876787655676', N'Biurl@yahhoo.IN', NULL, N'bUEL TECH', N'iNFO', NULL, CAST(N'2023-03-28T13:20:49.737' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (67, N'Brusli', N'9897678878', N'Brusli@yahhoo.com', NULL, N'BhariTech', N'Info', NULL, CAST(N'2023-03-28T14:13:51.953' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (68, N'SheeGi', N'7651879878', N'Shee@test.com', NULL, N'Oswal Computers ', N'info |business ', NULL, CAST(N'2023-03-28T14:17:32.377' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (69, N'pramod', NULL, N'pramod@test.com', NULL, NULL, N'info', NULL, CAST(N'2023-03-28T14:35:51.480' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (70, N'pramod', N'7651879878', N'Shee@test.com', NULL, NULL, N'offer', N'hi check', CAST(N'2023-03-28T14:36:24.083' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (71, N'pramod', N'7651879878', N'pramod@test.com', NULL, N'Shree Dham', N'offer 2', N'Vheck hello check', CAST(N'2023-03-28T14:37:39.553' AS DateTime), 0, NULL)
INSERT [dbo].[OWL_EnqueryMaster] ([EnqId], [Name], [MobileNo], [Email], [SubmittedByEmpId], [OrganizationName], [Subject], [Message], [EnqDate], [IsDel], [Remark]) VALUES (72, N'Anup Kumar', N'7847584785', N'AnupKumar@testmail.com', NULL, N' Anupam Traders', N'Info | Business Promotion', N'Hi Team, 

We want to enhance our business with you.
What do you help us .


Regards  ', CAST(N'2023-04-03T15:54:49.257' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[OWL_EnqueryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_JobModeMaster] ON 

INSERT [dbo].[OWL_JobModeMaster] ([ModeId], [JobMode]) VALUES (1, N'WorkFromOffice')
INSERT [dbo].[OWL_JobModeMaster] ([ModeId], [JobMode]) VALUES (2, N'WorkFromHome')
INSERT [dbo].[OWL_JobModeMaster] ([ModeId], [JobMode]) VALUES (3, N'Heibrete')
SET IDENTITY_INSERT [dbo].[OWL_JobModeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_JobsPostMaster] ON 

INSERT [dbo].[OWL_JobsPostMaster] ([JobId], [JobTitle], [Qualification], [KeySkills], [Exp_InYears], [Available_NoOfPost], [JobType], [JobMode], [JobLocation], [PublishedBy], [PublishedOn], [Status], [IsDel]) VALUES (1, N'Dot-NetMVC-Developer ', 1, N'C# | MSSql | Designing |Cloud', 5, 5, 1, 1, 5, N'Ritesh@gmail.com', CAST(N'2023-03-27T16:47:12.227' AS DateTime), 1, 0)
INSERT [dbo].[OWL_JobsPostMaster] ([JobId], [JobTitle], [Qualification], [KeySkills], [Exp_InYears], [Available_NoOfPost], [JobType], [JobMode], [JobLocation], [PublishedBy], [PublishedOn], [Status], [IsDel]) VALUES (2, N'Business-Analyst ', 3, N'TO-DO-List | Startup Standing | QA | Assets Point Annalise ', 2, 2, 1, 1, 5, N'Ritesh@gmail.com', CAST(N'2023-03-27T16:54:09.547' AS DateTime), 1, 0)
INSERT [dbo].[OWL_JobsPostMaster] ([JobId], [JobTitle], [Qualification], [KeySkills], [Exp_InYears], [Available_NoOfPost], [JobType], [JobMode], [JobLocation], [PublishedBy], [PublishedOn], [Status], [IsDel]) VALUES (3, N'Quality-Analyst', 12, N'Zira|Github|Team Player|SDLC|SRS', 1, 2, 1, 1, 4, N'Ritesh@gmail.com', CAST(N'2023-03-28T11:51:38.110' AS DateTime), 1, 0)
INSERT [dbo].[OWL_JobsPostMaster] ([JobId], [JobTitle], [Qualification], [KeySkills], [Exp_InYears], [Available_NoOfPost], [JobType], [JobMode], [JobLocation], [PublishedBy], [PublishedOn], [Status], [IsDel]) VALUES (4, N'Cloud-Engineer', 5, N'MSSql|Screm|Agile|Automation|WebServices|API', 2, 1, 1, 1, 5, N'Ritesh@gmail.com', CAST(N'2023-03-28T11:55:09.743' AS DateTime), 1, 0)
INSERT [dbo].[OWL_JobsPostMaster] ([JobId], [JobTitle], [Qualification], [KeySkills], [Exp_InYears], [Available_NoOfPost], [JobType], [JobMode], [JobLocation], [PublishedBy], [PublishedOn], [Status], [IsDel]) VALUES (5, N'Software-Engineer', 5, N'Logic_Architect|SDLC|SRS|WebServices', 6, 5, 1, 1, 5, N'Ritesh@gmail.com', CAST(N'2023-03-28T12:01:59.450' AS DateTime), 1, 0)
INSERT [dbo].[OWL_JobsPostMaster] ([JobId], [JobTitle], [Qualification], [KeySkills], [Exp_InYears], [Available_NoOfPost], [JobType], [JobMode], [JobLocation], [PublishedBy], [PublishedOn], [Status], [IsDel]) VALUES (6, N'Android-Developer', 6, N'Xamarin| DJango|API', 2, 2, 1, 3, 5, N'Ritesh@gmail.com', CAST(N'2023-03-31T12:42:28.417' AS DateTime), 1, 0)
INSERT [dbo].[OWL_JobsPostMaster] ([JobId], [JobTitle], [Qualification], [KeySkills], [Exp_InYears], [Available_NoOfPost], [JobType], [JobMode], [JobLocation], [PublishedBy], [PublishedOn], [Status], [IsDel]) VALUES (7, N'Android-Developer', 6, N'Xamarin| DJango|API', 2, 2, 1, 3, 5, N'Ritesh@gmail.com', CAST(N'2023-03-31T12:42:28.917' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[OWL_JobsPostMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_JobTypeMaster] ON 

INSERT [dbo].[OWL_JobTypeMaster] ([JobTypeId], [JobType], [IsDel]) VALUES (1, N'Parmanent', NULL)
INSERT [dbo].[OWL_JobTypeMaster] ([JobTypeId], [JobType], [IsDel]) VALUES (2, N'ContractBase', NULL)
INSERT [dbo].[OWL_JobTypeMaster] ([JobTypeId], [JobType], [IsDel]) VALUES (3, N'PartTime', NULL)
SET IDENTITY_INSERT [dbo].[OWL_JobTypeMaster] OFF
GO
INSERT [dbo].[OWL_LoginMaster] ([UserId], [UserPassword], [UserType], [UserStatus], [LoginCount], [LastLogin_DT], [LastLogin_IP]) VALUES (N'Anupkumar734854@gmail.com', N'876', 2, 1, 0, NULL, NULL)
INSERT [dbo].[OWL_LoginMaster] ([UserId], [UserPassword], [UserType], [UserStatus], [LoginCount], [LastLogin_DT], [LastLogin_IP]) VALUES (N'Pramod.growel@gmail.com', N'876', 1, 1, 10, CAST(N'2023-03-17T16:46:18.733' AS DateTime), NULL)
INSERT [dbo].[OWL_LoginMaster] ([UserId], [UserPassword], [UserType], [UserStatus], [LoginCount], [LastLogin_DT], [LastLogin_IP]) VALUES (N'Ritesh@gmail.com', N'  @   ', 6, 1, 177, CAST(N'2023-04-15T10:35:36.080' AS DateTime), NULL)
INSERT [dbo].[OWL_LoginMaster] ([UserId], [UserPassword], [UserType], [UserStatus], [LoginCount], [LastLogin_DT], [LastLogin_IP]) VALUES (N'Scot@testmail.com', N'876', 1, 1, 50, CAST(N'2023-03-17T17:04:24.130' AS DateTime), NULL)
INSERT [dbo].[OWL_LoginMaster] ([UserId], [UserPassword], [UserType], [UserStatus], [LoginCount], [LastLogin_DT], [LastLogin_IP]) VALUES (N'Shree@testmail.com', N'8765', 1, 1, 1, CAST(N'2023-03-10T12:48:32.420' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[OWL_PostsMaster] ON 

INSERT [dbo].[OWL_PostsMaster] ([Id], [PostAuthor], [PostDate], [PostContent], [FeaturedImg], [ThumbImg], [FileFolderName], [PostTitle], [PostExcerpt], [BulletPoint], [PostStatus], [CommentStatus], [PostPassword], [PostName], [ToPingTags], [Pinged], [PostUpdatedOn], [PostContentFiltered], [PostParent], [Guid], [MenuOrder], [PostType], [PostMimeType], [CommentCount], [Url], [IsDel]) VALUES (1, N'Ritesh@gmail.com', CAST(N'2023-03-21T12:52:03.333' AS DateTime), NULL, N'', N'', N'UploadedFiles', N'About us', NULL, NULL, NULL, 1, NULL, N'about us', NULL, NULL, CAST(N'2023-03-21T12:52:06.543' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, 5, NULL, 1)
INSERT [dbo].[OWL_PostsMaster] ([Id], [PostAuthor], [PostDate], [PostContent], [FeaturedImg], [ThumbImg], [FileFolderName], [PostTitle], [PostExcerpt], [BulletPoint], [PostStatus], [CommentStatus], [PostPassword], [PostName], [ToPingTags], [Pinged], [PostUpdatedOn], [PostContentFiltered], [PostParent], [Guid], [MenuOrder], [PostType], [PostMimeType], [CommentCount], [Url], [IsDel]) VALUES (2, N'Ritesh@gmail.com', CAST(N'2023-03-21T13:24:08.540' AS DateTime), N'Oswal Computers & Consultants Pvt. Ltd (OCCPL) has a long standing of 41 years. The Company has a strong client base amongst government, Urban Local bodies and other autonomous public organizations. OCCPL''s major strength has been its ability to understand the needs & mind set ofpublic functionaries and suggest suitable changes by re-engineering in their daily working and add many features &tools in easy to understand user friendly Systems. Established in the year 1980 as a data processing unit, we expanded our horizons to serve our clients with system consultancy, hardware & software support, network services, website design & data processing activities.

OCCPL has number of in-house professionals having computer and commercial background with a total of nearly 700 members. These experienced and dedicated professionals are Chartered Accountants, Company Secretaries, Management Consultants and Software developers.

Today new technologies & processes are shaping the way virtually for every business house, industry & government. At OCCPL, we continue to develop innovative products and provide services to help our clients save valuable time&make proper use of most of their bottom line.', N'jymwyxw1.xqo_21_03_YY__01_23_56empintrectionImg.png', N'mwrfh5bz.zux_21_03_YY__01_23_59setingImg.jpg', N'Posts_Uploaded_ContentFile', N'About Us', N'Oswal Computers & Consultants Pvt. Ltd (OCCPL) has a long standing of 41 years.', N'Info | Company Detail', 1, 1, NULL, N'about us', N'18', NULL, CAST(N'2023-03-21T13:24:09.513' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, 5, NULL, 0)
SET IDENTITY_INSERT [dbo].[OWL_PostsMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_PostTypeMaster] ON 

INSERT [dbo].[OWL_PostTypeMaster] ([PostTypeId], [PostType], [IsDel]) VALUES (1, N'Post', 0)
INSERT [dbo].[OWL_PostTypeMaster] ([PostTypeId], [PostType], [IsDel]) VALUES (2, N'Page', 0)
INSERT [dbo].[OWL_PostTypeMaster] ([PostTypeId], [PostType], [IsDel]) VALUES (3, N'Blog', 0)
INSERT [dbo].[OWL_PostTypeMaster] ([PostTypeId], [PostType], [IsDel]) VALUES (4, N'Service', 0)
INSERT [dbo].[OWL_PostTypeMaster] ([PostTypeId], [PostType], [IsDel]) VALUES (5, N'Portfolio', 0)
INSERT [dbo].[OWL_PostTypeMaster] ([PostTypeId], [PostType], [IsDel]) VALUES (6, N'Testimonial', 0)
SET IDENTITY_INSERT [dbo].[OWL_PostTypeMaster] OFF
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
SET IDENTITY_INSERT [dbo].[OWL_QuestionMaster] ON 

INSERT [dbo].[OWL_QuestionMaster] ([QuestionNo], [SectorType], [Question], [Answer], [CreationDT], [UpdationDT], [CreatedBy], [IsDel]) VALUES (1, 3, N'Aadhaar Enrolment Form.? ', N'Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.', CAST(N'2023-04-12T12:46:55.947' AS DateTime), CAST(N'2023-04-12T12:46:55.947' AS DateTime), N'Ritesh@gmail.com', 0)
INSERT [dbo].[OWL_QuestionMaster] ([QuestionNo], [SectorType], [Question], [Answer], [CreationDT], [UpdationDT], [CreatedBy], [IsDel]) VALUES (2, 1, N'How we can get Get Your Aadhaar No.?', N'Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.', CAST(N'2023-04-12T12:48:02.180' AS DateTime), CAST(N'2023-04-12T12:48:02.180' AS DateTime), N'Ritesh@gmail.com', 0)
INSERT [dbo].[OWL_QuestionMaster] ([QuestionNo], [SectorType], [Question], [Answer], [CreationDT], [UpdationDT], [CreatedBy], [IsDel]) VALUES (3, 1, N'What''s the Process To Update Aadhaar Data? ', N'Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis', CAST(N'2023-04-12T12:49:16.963' AS DateTime), CAST(N'2023-04-12T12:49:16.963' AS DateTime), N'Ritesh@gmail.com', 0)
INSERT [dbo].[OWL_QuestionMaster] ([QuestionNo], [SectorType], [Question], [Answer], [CreationDT], [UpdationDT], [CreatedBy], [IsDel]) VALUES (4, 1, N'How To Download e-Aadhaar?', N'Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.', CAST(N'2023-04-12T12:48:19.343' AS DateTime), CAST(N'2023-04-12T12:48:19.343' AS DateTime), N'Ritesh@gmail.com', 0)
INSERT [dbo].[OWL_QuestionMaster] ([QuestionNo], [SectorType], [Question], [Answer], [CreationDT], [UpdationDT], [CreatedBy], [IsDel]) VALUES (5, 1, N'New Update RBI Notification on e-Aadhaar?', N'Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in', CAST(N'2023-04-12T12:41:00.827' AS DateTime), CAST(N'2023-04-12T12:41:00.827' AS DateTime), N'Ritesh@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[OWL_QuestionMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_ResourceMaster] ON 

INSERT [dbo].[OWL_ResourceMaster] ([ResourceId], [ResourceName], [ResourceUrl], [ResourceEmail], [AuthorizedPerson], [MobileNo], [CreatedBy], [CreatedOn], [UpdatedOn], [IsDel]) VALUES (11001, N'Ajmer MC', N'http://www.ajmermc.org', N'info@ajmermc.org', N'Peson1', N'99999999', NULL, CAST(N'2023-04-01T11:35:43.833' AS DateTime), CAST(N'2023-04-01T18:01:28.760' AS DateTime), 0)
INSERT [dbo].[OWL_ResourceMaster] ([ResourceId], [ResourceName], [ResourceUrl], [ResourceEmail], [AuthorizedPerson], [MobileNo], [CreatedBy], [CreatedOn], [UpdatedOn], [IsDel]) VALUES (11005, N'Bikaner MC', N'http://www.bikanermc.org', N'info@bikanermc.org', N'Peson2', N'9999999999', NULL, CAST(N'2023-04-01T12:25:55.730' AS DateTime), CAST(N'2023-04-01T12:25:55.730' AS DateTime), 0)
INSERT [dbo].[OWL_ResourceMaster] ([ResourceId], [ResourceName], [ResourceUrl], [ResourceEmail], [AuthorizedPerson], [MobileNo], [CreatedBy], [CreatedOn], [UpdatedOn], [IsDel]) VALUES (11006, N'Jaipur MC', N'www.jaipurmc.org', N'info@jaipurmc.org', N'ShreeSocot ', N'9770072305', NULL, CAST(N'2023-04-01T13:04:58.457' AS DateTime), CAST(N'2023-04-08T18:15:53.670' AS DateTime), 1)
INSERT [dbo].[OWL_ResourceMaster] ([ResourceId], [ResourceName], [ResourceUrl], [ResourceEmail], [AuthorizedPerson], [MobileNo], [CreatedBy], [CreatedOn], [UpdatedOn], [IsDel]) VALUES (11007, N'Jodhpur MC', N'www.jodhpurmc.org', N'info@jodhpurmc.org', N'Peson4', N'9999999999', NULL, CAST(N'2023-04-01T13:06:12.130' AS DateTime), CAST(N'2023-04-01T13:06:12.130' AS DateTime), 0)
INSERT [dbo].[OWL_ResourceMaster] ([ResourceId], [ResourceName], [ResourceUrl], [ResourceEmail], [AuthorizedPerson], [MobileNo], [CreatedBy], [CreatedOn], [UpdatedOn], [IsDel]) VALUES (11008, N'kota MC', N'www.kotamc.org', N'info@kotamc.org', N'Kota Ministry ', N'7474558475', NULL, CAST(N'2023-04-01T13:07:11.257' AS DateTime), CAST(N'2023-04-08T18:12:06.070' AS DateTime), 0)
INSERT [dbo].[OWL_ResourceMaster] ([ResourceId], [ResourceName], [ResourceUrl], [ResourceEmail], [AuthorizedPerson], [MobileNo], [CreatedBy], [CreatedOn], [UpdatedOn], [IsDel]) VALUES (11009, N'Udaipur MC', N'www.udaipurmc.org', N'info@udaipurmc.org', N'Peson6', N'9999999999', NULL, CAST(N'2023-04-01T13:08:09.973' AS DateTime), CAST(N'2023-04-01T13:08:09.973' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OWL_ResourceMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_SectorTypeMaster] ON 

INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (1, N'Information ')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (2, N'Marketing')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (3, N'Promotion')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (4, N'Education')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (5, N'Retail')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (6, N'Business')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (7, N'Medical')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (8, N'Sports')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (9, N'Justice')
INSERT [dbo].[OWL_SectorTypeMaster] ([SectorTypeId], [SectorType]) VALUES (10, N'Govt')
SET IDENTITY_INSERT [dbo].[OWL_SectorTypeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_ServicesCategoryMaster] ON 

INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (1, N'Storage', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (2, N'Access', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (3, N'Speed', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (4, N'Backup', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (5, N'Email', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (6, N'Support', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (7, N'Security', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (8, N'Setup', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (9, N'Chat', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (10, N'Marketing', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (11, N'Promotion', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (12, N'Analysis', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (13, N'Enhancement', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (14, N'ControlPanel', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (15, N'Report', 0)
INSERT [dbo].[OWL_ServicesCategoryMaster] ([CategoryId], [Category], [IsDel]) VALUES (16, N'Data', 0)
SET IDENTITY_INSERT [dbo].[OWL_ServicesCategoryMaster] OFF
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
SET IDENTITY_INSERT [dbo].[OWL_StatusListMaster] ON 

INSERT [dbo].[OWL_StatusListMaster] ([StatusId], [StatusValue], [IsDel]) VALUES (1, N'Active', 0)
INSERT [dbo].[OWL_StatusListMaster] ([StatusId], [StatusValue], [IsDel]) VALUES (2, N'Draft', 0)
INSERT [dbo].[OWL_StatusListMaster] ([StatusId], [StatusValue], [IsDel]) VALUES (3, N'Checking', 0)
INSERT [dbo].[OWL_StatusListMaster] ([StatusId], [StatusValue], [IsDel]) VALUES (4, N'Open', 0)
INSERT [dbo].[OWL_StatusListMaster] ([StatusId], [StatusValue], [IsDel]) VALUES (5, N'Close', 0)
SET IDENTITY_INSERT [dbo].[OWL_StatusListMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_TagsMaster] ON 

INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (1, N'NewBrand', 2, 0)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (2, N'Opening', 6, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (3, N'News', 1, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (4, N'Branding', 3, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (5, N'Admission', 4, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (6, N'BigSale', 5, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (7, N'EventOffer', 5, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (8, N'EventSale', 5, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (9, N'Startup', 6, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (10, N'Admit', 7, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (11, N'Process', 7, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (12, N'Event', 8, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (13, N'Game', 8, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (14, N'PlayActivities', 8, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (15, N'Decition', 9, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (16, N'Hering', 9, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (17, N'Law', 9, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (18, N'Update', 10, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (19, N'Rules', 10, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (20, N'GovtRules', 10, NULL)
INSERT [dbo].[OWL_TagsMaster] ([TagId], [TagName], [TagReleatedSector], [IsDel]) VALUES (21, N'CountryUpdate', 10, NULL)
SET IDENTITY_INSERT [dbo].[OWL_TagsMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OWL_UserMaster] ON 

INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (1, N'Employee')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (2, N'Affilate')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (3, N'Consultaint')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (4, N'Guest')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (5, N'Other')
INSERT [dbo].[OWL_UserMaster] ([UserTypeId], [UserTypeName]) VALUES (6, N'SubAdmin')
SET IDENTITY_INSERT [dbo].[OWL_UserMaster] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [constraint_name]    Script Date: 15-04-2023 17:59:38 ******/
ALTER TABLE [dbo].[OWL_ResourceMaster] ADD  CONSTRAINT [constraint_name] UNIQUE NONCLUSTERED 
(
	[ResourceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OWL_BusinessPlanMaster] ADD  CONSTRAINT [DF_OWL_BusinessPlanMaster_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[OWL_EnqueryMaster] ADD  CONSTRAINT [DF_OWL_EnqueryMaster_IsDel]  DEFAULT ((0)) FOR [IsDel]
GO
ALTER TABLE [dbo].[OWL_BusinessPlanMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_BusinessPlanMaster_OWL_EmployeeMaster] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_BusinessPlanMaster] CHECK CONSTRAINT [FK_OWL_BusinessPlanMaster_OWL_EmployeeMaster]
GO
ALTER TABLE [dbo].[OWL_BusinessPlanMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_BusinessPlanMaster_OWL_SectorTypeMaster] FOREIGN KEY([SectorType])
REFERENCES [dbo].[OWL_SectorTypeMaster] ([SectorTypeId])
GO
ALTER TABLE [dbo].[OWL_BusinessPlanMaster] CHECK CONSTRAINT [FK_OWL_BusinessPlanMaster_OWL_SectorTypeMaster]
GO
ALTER TABLE [dbo].[OWL_BusinessPlanMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_BusinessPlanMaster_OWL_StatusListMaster] FOREIGN KEY([PostStatus])
REFERENCES [dbo].[OWL_StatusListMaster] ([StatusId])
GO
ALTER TABLE [dbo].[OWL_BusinessPlanMaster] CHECK CONSTRAINT [FK_OWL_BusinessPlanMaster_OWL_StatusListMaster]
GO
ALTER TABLE [dbo].[OWL_BusinessServicesMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_BusinessServicesMaster_OWL_ServicesCategoryMaster] FOREIGN KEY([ServiceCategory])
REFERENCES [dbo].[OWL_ServicesCategoryMaster] ([CategoryId])
GO
ALTER TABLE [dbo].[OWL_BusinessServicesMaster] CHECK CONSTRAINT [FK_OWL_BusinessServicesMaster_OWL_ServicesCategoryMaster]
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
ALTER TABLE [dbo].[OWL_CareersMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_CareersMaster_OWL_StatusListMaster] FOREIGN KEY([Status])
REFERENCES [dbo].[OWL_StatusListMaster] ([StatusId])
GO
ALTER TABLE [dbo].[OWL_CareersMaster] CHECK CONSTRAINT [FK_OWL_CareersMaster_OWL_StatusListMaster]
GO
ALTER TABLE [dbo].[OWL_CityMaster]  WITH CHECK ADD FOREIGN KEY([RelatedStateId])
REFERENCES [dbo].[OWL_StateMaster] ([StateId])
GO
ALTER TABLE [dbo].[OWL_ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ClientMaster_OWL_BusinessPlanMaster] FOREIGN KEY([BusinessPlan])
REFERENCES [dbo].[OWL_BusinessPlanMaster] ([PlanNo])
GO
ALTER TABLE [dbo].[OWL_ClientMaster] CHECK CONSTRAINT [FK_OWL_ClientMaster_OWL_BusinessPlanMaster]
GO
ALTER TABLE [dbo].[OWL_ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ClientMaster_OWL_CityMaster] FOREIGN KEY([Status])
REFERENCES [dbo].[OWL_StatusListMaster] ([StatusId])
GO
ALTER TABLE [dbo].[OWL_ClientMaster] CHECK CONSTRAINT [FK_OWL_ClientMaster_OWL_CityMaster]
GO
ALTER TABLE [dbo].[OWL_ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ClientMaster_OWL_ClientMaster] FOREIGN KEY([Email])
REFERENCES [dbo].[OWL_ClientMaster] ([Email])
GO
ALTER TABLE [dbo].[OWL_ClientMaster] CHECK CONSTRAINT [FK_OWL_ClientMaster_OWL_ClientMaster]
GO
ALTER TABLE [dbo].[OWL_ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ClientMaster_OWL_DesignationMaster] FOREIGN KEY([Designation])
REFERENCES [dbo].[OWL_DesignationMaster] ([DesignationId])
GO
ALTER TABLE [dbo].[OWL_ClientMaster] CHECK CONSTRAINT [FK_OWL_ClientMaster_OWL_DesignationMaster]
GO
ALTER TABLE [dbo].[OWL_ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ClientMaster_OWL_ResourceMaster] FOREIGN KEY([BelongResource])
REFERENCES [dbo].[OWL_ResourceMaster] ([ResourceId])
GO
ALTER TABLE [dbo].[OWL_ClientMaster] CHECK CONSTRAINT [FK_OWL_ClientMaster_OWL_ResourceMaster]
GO
ALTER TABLE [dbo].[OWL_ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ClientMaster_OWL_SectorTypeMaster] FOREIGN KEY([SectorType])
REFERENCES [dbo].[OWL_SectorTypeMaster] ([SectorTypeId])
GO
ALTER TABLE [dbo].[OWL_ClientMaster] CHECK CONSTRAINT [FK_OWL_ClientMaster_OWL_SectorTypeMaster]
GO
ALTER TABLE [dbo].[OWL_ClientMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ClientMaster_OWL_StateMaster] FOREIGN KEY([RelatedState])
REFERENCES [dbo].[OWL_StateMaster] ([StateId])
GO
ALTER TABLE [dbo].[OWL_ClientMaster] CHECK CONSTRAINT [FK_OWL_ClientMaster_OWL_StateMaster]
GO
ALTER TABLE [dbo].[OWL_DocCategoryMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_DocCategoryMaster_OWL_DocTypeMaster] FOREIGN KEY([RelatedDocType_Id])
REFERENCES [dbo].[OWL_DocTypeMaster] ([DocTypeNo])
GO
ALTER TABLE [dbo].[OWL_DocCategoryMaster] CHECK CONSTRAINT [FK_OWL_DocCategoryMaster_OWL_DocTypeMaster]
GO
ALTER TABLE [dbo].[OWL_DocumentMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_DocumentMaster_OWL_DocCategoryMaster1] FOREIGN KEY([DocCategoryName])
REFERENCES [dbo].[OWL_DocCategoryMaster] ([DocCategoryNo])
GO
ALTER TABLE [dbo].[OWL_DocumentMaster] CHECK CONSTRAINT [FK_OWL_DocumentMaster_OWL_DocCategoryMaster1]
GO
ALTER TABLE [dbo].[OWL_DocumentMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_DocumentMaster_OWL_EmployeeMaster1] FOREIGN KEY([DocUploadedBy])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_DocumentMaster] CHECK CONSTRAINT [FK_OWL_DocumentMaster_OWL_EmployeeMaster1]
GO
ALTER TABLE [dbo].[OWL_EmployeeDetail]  WITH CHECK ADD  CONSTRAINT [FK_OWL_EmployeeDetail_OWL_EmployeeMaster] FOREIGN KEY([EmpEmail])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_EmployeeDetail] CHECK CONSTRAINT [FK_OWL_EmployeeDetail_OWL_EmployeeMaster]
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
ALTER TABLE [dbo].[OWL_JobsPostMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_JobsPostMaster_OWL_CityMaster] FOREIGN KEY([JobLocation])
REFERENCES [dbo].[OWL_CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster] CHECK CONSTRAINT [FK_OWL_JobsPostMaster_OWL_CityMaster]
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_JobsPostMaster_OWL_EmployeeMaster] FOREIGN KEY([PublishedBy])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster] CHECK CONSTRAINT [FK_OWL_JobsPostMaster_OWL_EmployeeMaster]
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_JobsPostMaster_OWL_JobModeMaster] FOREIGN KEY([JobMode])
REFERENCES [dbo].[OWL_JobModeMaster] ([ModeId])
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster] CHECK CONSTRAINT [FK_OWL_JobsPostMaster_OWL_JobModeMaster]
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_JobsPostMaster_OWL_JobTypeMaster] FOREIGN KEY([JobType])
REFERENCES [dbo].[OWL_JobTypeMaster] ([JobTypeId])
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster] CHECK CONSTRAINT [FK_OWL_JobsPostMaster_OWL_JobTypeMaster]
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_JobsPostMaster_OWL_QualificationMaster] FOREIGN KEY([Qualification])
REFERENCES [dbo].[OWL_QualificationMaster] ([QualificationId])
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster] CHECK CONSTRAINT [FK_OWL_JobsPostMaster_OWL_QualificationMaster]
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_JobsPostMaster_OWL_StatusListMaster] FOREIGN KEY([Status])
REFERENCES [dbo].[OWL_StatusListMaster] ([StatusId])
GO
ALTER TABLE [dbo].[OWL_JobsPostMaster] CHECK CONSTRAINT [FK_OWL_JobsPostMaster_OWL_StatusListMaster]
GO
ALTER TABLE [dbo].[OWL_LoginMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_LoginMaster_OWL_EmployeeMaster] FOREIGN KEY([UserId])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_LoginMaster] CHECK CONSTRAINT [FK_OWL_LoginMaster_OWL_EmployeeMaster]
GO
ALTER TABLE [dbo].[OWL_PostsMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_PostsMaster_OWL_EmployeeMaster] FOREIGN KEY([PostAuthor])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_PostsMaster] CHECK CONSTRAINT [FK_OWL_PostsMaster_OWL_EmployeeMaster]
GO
ALTER TABLE [dbo].[OWL_PostsMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_PostsMaster_OWL_PostsMaster] FOREIGN KEY([PostParent])
REFERENCES [dbo].[OWL_PostsMaster] ([Id])
GO
ALTER TABLE [dbo].[OWL_PostsMaster] CHECK CONSTRAINT [FK_OWL_PostsMaster_OWL_PostsMaster]
GO
ALTER TABLE [dbo].[OWL_PostsMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_PostsMaster_OWL_PostsMaster1] FOREIGN KEY([PostType])
REFERENCES [dbo].[OWL_PostTypeMaster] ([PostTypeId])
GO
ALTER TABLE [dbo].[OWL_PostsMaster] CHECK CONSTRAINT [FK_OWL_PostsMaster_OWL_PostsMaster1]
GO
ALTER TABLE [dbo].[OWL_PostsMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_PostsMaster_OWL_StatusListMaster] FOREIGN KEY([PostStatus])
REFERENCES [dbo].[OWL_StatusListMaster] ([StatusId])
GO
ALTER TABLE [dbo].[OWL_PostsMaster] CHECK CONSTRAINT [FK_OWL_PostsMaster_OWL_StatusListMaster]
GO
ALTER TABLE [dbo].[OWL_PostsMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_PostsMaster_OWL_StatusListMaster1] FOREIGN KEY([CommentStatus])
REFERENCES [dbo].[OWL_StatusListMaster] ([StatusId])
GO
ALTER TABLE [dbo].[OWL_PostsMaster] CHECK CONSTRAINT [FK_OWL_PostsMaster_OWL_StatusListMaster1]
GO
ALTER TABLE [dbo].[OWL_QuestionMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_QuestionMaster_OWL_EmployeeMaster] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_QuestionMaster] CHECK CONSTRAINT [FK_OWL_QuestionMaster_OWL_EmployeeMaster]
GO
ALTER TABLE [dbo].[OWL_QuestionMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_QuestionMaster_OWL_SectorTypeMaster] FOREIGN KEY([SectorType])
REFERENCES [dbo].[OWL_SectorTypeMaster] ([SectorTypeId])
GO
ALTER TABLE [dbo].[OWL_QuestionMaster] CHECK CONSTRAINT [FK_OWL_QuestionMaster_OWL_SectorTypeMaster]
GO
ALTER TABLE [dbo].[OWL_ResourceMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_ResourceMaster_OWL_EmployeeMaster] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[OWL_EmployeeMaster] ([EmpEmail])
GO
ALTER TABLE [dbo].[OWL_ResourceMaster] CHECK CONSTRAINT [FK_OWL_ResourceMaster_OWL_EmployeeMaster]
GO
ALTER TABLE [dbo].[OWL_StateMaster]  WITH CHECK ADD FOREIGN KEY([RelatedCountryId])
REFERENCES [dbo].[OWL_CountryMaster] ([CountryId])
GO
ALTER TABLE [dbo].[OWL_TagsMaster]  WITH CHECK ADD  CONSTRAINT [FK_OWL_TagsMaster_OWL_SectorTypeMaster] FOREIGN KEY([TagReleatedSector])
REFERENCES [dbo].[OWL_SectorTypeMaster] ([SectorTypeId])
GO
ALTER TABLE [dbo].[OWL_TagsMaster] CHECK CONSTRAINT [FK_OWL_TagsMaster_OWL_SectorTypeMaster]
GO
/****** Object:  StoredProcedure [dbo].[EmployeeMasterOperation]    Script Date: 15-04-2023 17:59:38 ******/
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
