USE [master]
GO
/****** Object:  Database [SWP_PROJECT]    Script Date: 13/02/2025 12:39:56 CH ******/
CREATE DATABASE [SWP_PROJECT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP_PROJECT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP_PROJECT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_PROJECT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP_PROJECT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP_PROJECT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_PROJECT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP_PROJECT] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_PROJECT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_PROJECT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_PROJECT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_PROJECT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_PROJECT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP_PROJECT] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP_PROJECT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP_PROJECT]
GO
/****** Object:  Table [dbo].[Answer_Listening_ChooseAnswer]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Listening_ChooseAnswer](
	[answer_id] [int] NOT NULL,
	[questListen_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Listening_ChooseAnswer] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer_Listening_Write]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Listening_Write](
	[answer_id] [int] NOT NULL,
	[quest_Listen] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Listening_Write] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer_Reading]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Reading](
	[answer_id] [int] NOT NULL,
	[questRead_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Reading] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer_Speaking]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Speaking](
	[answer_id] [int] NOT NULL,
	[quest_Speak] [int] NOT NULL,
	[duration_do] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[Content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Speaking] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer_Writing]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Writing](
	[answer_id] [int] NOT NULL,
	[write_id] [int] NOT NULL,
	[duration_do] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[Content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Writing] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrandPoint_Speaking]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandPoint_Speaking](
	[brand_id] [int] NOT NULL,
	[quest_id] [int] NOT NULL,
	[BrandPoint] [text] NOT NULL,
 CONSTRAINT [PK_BrandPoint_Speaking] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrandPoint_Writing]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandPoint_Writing](
	[brand_id] [int] NOT NULL,
	[quest_id] [int] NOT NULL,
	[BrandPoint] [text] NOT NULL,
 CONSTRAINT [PK_BrandPoint_Writing] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Device_Readiness_Checks]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_Readiness_Checks](
	[check_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[network_status] [varchar](255) NOT NULL,
	[device_status] [varchar](255) NOT NULL,
	[checked_at] [timestamp] NOT NULL,
 CONSTRAINT [PK_Device_Readiness_Checks] PRIMARY KEY CLUSTERED 
(
	[check_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_Notifications]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Notifications](
	[notification_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[message] [text] NOT NULL,
	[sent_at] [timestamp] NOT NULL,
 CONSTRAINT [PK_Exam_Notifications] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Help_Center_FAQs]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Help_Center_FAQs](
	[faq_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[question] [text] NOT NULL,
	[answer] [text] NOT NULL,
 CONSTRAINT [PK_Help_Center_FAQs] PRIMARY KEY CLUSTERED 
(
	[faq_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listening]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listening](
	[listen_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[Video_listen] [text] NOT NULL,
 CONSTRAINT [PK_Listening] PRIMARY KEY CLUSTERED 
(
	[listen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listening_Write]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listening_Write](
	[PointListenWrite_id] [int] NOT NULL,
	[Coord_id] [int] NOT NULL,
	[True_False] [int] NOT NULL,
	[answer_id] [int] NOT NULL,
 CONSTRAINT [PK_Listening_Write] PRIMARY KEY CLUSTERED 
(
	[PointListenWrite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point_Listening]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Listening](
	[point_id] [int] NOT NULL,
	[Coord_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[result_id] [int] NOT NULL,
 CONSTRAINT [PK_Point_Listening] PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point_Reading]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Reading](
	[point_id] [int] NOT NULL,
	[Coord_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[result_id] [int] NULL,
 CONSTRAINT [PK_Point_Reading] PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point_Speaking]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Speaking](
	[point_id] [int] NOT NULL,
	[Coord_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[result_id] [int] NOT NULL,
 CONSTRAINT [PK_Point_Speaking] PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point_Writing]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Writing](
	[point_id] [int] NOT NULL,
	[Coord_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[answer_id] [int] NOT NULL,
	[result_id] [int] NOT NULL,
 CONSTRAINT [PK_Point_Writing] PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Listening_Write]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Listening_Write](
	[quest_Listen] [int] NOT NULL,
	[listen_id] [int] NOT NULL,
	[question_text] [text] NOT NULL,
 CONSTRAINT [PK_Question_Listening_Write] PRIMARY KEY CLUSTERED 
(
	[quest_Listen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Speaking]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Speaking](
	[quest_Speak] [int] NOT NULL,
	[speak_id] [int] NOT NULL,
	[question_text] [text] NOT NULL,
 CONSTRAINT [PK_Question_Speaking] PRIMARY KEY CLUSTERED 
(
	[quest_Speak] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions_Listening_ChooseAnswer]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Listening_ChooseAnswer](
	[questListen_id] [int] NOT NULL,
	[question_text] [text] NOT NULL,
	[answer_options] [text] NOT NULL,
	[correct_answer] [text] NOT NULL,
	[explanation] [text] NULL,
	[listen_id] [int] NOT NULL,
 CONSTRAINT [PK_Questions_Listening_ChooseAnswer] PRIMARY KEY CLUSTERED 
(
	[questListen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions_Reading]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Reading](
	[questRead_id] [int] NOT NULL,
	[question_text] [text] NOT NULL,
	[answer_options] [text] NOT NULL,
	[correct_answer] [text] NOT NULL,
	[explanation] [text] NULL,
	[read_id] [int] NOT NULL,
 CONSTRAINT [PK_Questions_Reading] PRIMARY KEY CLUSTERED 
(
	[questRead_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reading]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reading](
	[read_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Content] [text] NOT NULL,
 CONSTRAINT [PK_Reading] PRIMARY KEY CLUSTERED 
(
	[read_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[user_id] [int] NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speaking]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speaking](
	[speak_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
 CONSTRAINT [PK_Speaking] PRIMARY KEY CLUSTERED 
(
	[speak_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Results]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Results](
	[result_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[score] [int] NOT NULL,
	[completed_at] [timestamp] NOT NULL,
 CONSTRAINT [PK_Student_Results] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[System_Update]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Update](
	[update_id] [int] NOT NULL,
	[update_title] [varchar](255) NOT NULL,
	[update_description] [text] NOT NULL,
	[it_id] [int] NOT NULL,
	[date update] [datetime] NOT NULL,
 CONSTRAINT [PK_System_Update] PRIMARY KEY CLUSTERED 
(
	[update_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[test_id] [int] NOT NULL,
	[test_name] [varchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[test_exist] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[test_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic_Exam]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic_Exam](
	[topic_id] [int] NOT NULL,
	[create_id] [int] NOT NULL,
 CONSTRAINT [PK_Topic_Exam] PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[google_login_id] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[last_login] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writing]    Script Date: 13/02/2025 12:39:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writing](
	[write_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Content] [text] NOT NULL,
 CONSTRAINT [PK_Writing] PRIMARY KEY CLUSTERED 
(
	[write_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [last_login]
GO
ALTER TABLE [dbo].[Answer_Listening_ChooseAnswer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Listening_ChooseAnswer_Questions_Listening_ChooseAnswer] FOREIGN KEY([questListen_id])
REFERENCES [dbo].[Questions_Listening_ChooseAnswer] ([questListen_id])
GO
ALTER TABLE [dbo].[Answer_Listening_ChooseAnswer] CHECK CONSTRAINT [FK_Answer_Listening_ChooseAnswer_Questions_Listening_ChooseAnswer]
GO
ALTER TABLE [dbo].[Answer_Listening_ChooseAnswer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Listening_ChooseAnswer_Tests] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Answer_Listening_ChooseAnswer] CHECK CONSTRAINT [FK_Answer_Listening_ChooseAnswer_Tests]
GO
ALTER TABLE [dbo].[Answer_Listening_Write]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Listening_Write_Question_Listening_Write] FOREIGN KEY([quest_Listen])
REFERENCES [dbo].[Question_Listening_Write] ([quest_Listen])
GO
ALTER TABLE [dbo].[Answer_Listening_Write] CHECK CONSTRAINT [FK_Answer_Listening_Write_Question_Listening_Write]
GO
ALTER TABLE [dbo].[Answer_Listening_Write]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Listening_Write_Tests] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Answer_Listening_Write] CHECK CONSTRAINT [FK_Answer_Listening_Write_Tests]
GO
ALTER TABLE [dbo].[Answer_Reading]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Reading_Questions_Reading] FOREIGN KEY([questRead_id])
REFERENCES [dbo].[Questions_Reading] ([questRead_id])
GO
ALTER TABLE [dbo].[Answer_Reading] CHECK CONSTRAINT [FK_Answer_Reading_Questions_Reading]
GO
ALTER TABLE [dbo].[Answer_Reading]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Reading_Tests] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Answer_Reading] CHECK CONSTRAINT [FK_Answer_Reading_Tests]
GO
ALTER TABLE [dbo].[Answer_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Speaking_Question_Speaking] FOREIGN KEY([quest_Speak])
REFERENCES [dbo].[Question_Speaking] ([quest_Speak])
GO
ALTER TABLE [dbo].[Answer_Speaking] CHECK CONSTRAINT [FK_Answer_Speaking_Question_Speaking]
GO
ALTER TABLE [dbo].[Answer_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Speaking_Tests] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Answer_Speaking] CHECK CONSTRAINT [FK_Answer_Speaking_Tests]
GO
ALTER TABLE [dbo].[Answer_Writing]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Writing_Tests] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Answer_Writing] CHECK CONSTRAINT [FK_Answer_Writing_Tests]
GO
ALTER TABLE [dbo].[Answer_Writing]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Writing_Writing] FOREIGN KEY([write_id])
REFERENCES [dbo].[Writing] ([write_id])
GO
ALTER TABLE [dbo].[Answer_Writing] CHECK CONSTRAINT [FK_Answer_Writing_Writing]
GO
ALTER TABLE [dbo].[BrandPoint_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_BrandPoint_Speaking_Question_Speaking] FOREIGN KEY([quest_id])
REFERENCES [dbo].[Question_Speaking] ([quest_Speak])
GO
ALTER TABLE [dbo].[BrandPoint_Speaking] CHECK CONSTRAINT [FK_BrandPoint_Speaking_Question_Speaking]
GO
ALTER TABLE [dbo].[BrandPoint_Writing]  WITH CHECK ADD  CONSTRAINT [FK_BrandPoint_Writing_Writing] FOREIGN KEY([quest_id])
REFERENCES [dbo].[Writing] ([write_id])
GO
ALTER TABLE [dbo].[BrandPoint_Writing] CHECK CONSTRAINT [FK_BrandPoint_Writing_Writing]
GO
ALTER TABLE [dbo].[Device_Readiness_Checks]  WITH CHECK ADD  CONSTRAINT [FK_Device_Readiness_Checks_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Device_Readiness_Checks] CHECK CONSTRAINT [FK_Device_Readiness_Checks_Users]
GO
ALTER TABLE [dbo].[Exam_Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Notifications_Tests] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Exam_Notifications] CHECK CONSTRAINT [FK_Exam_Notifications_Tests]
GO
ALTER TABLE [dbo].[Help_Center_FAQs]  WITH CHECK ADD  CONSTRAINT [FK_Help_Center_FAQs_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Help_Center_FAQs] CHECK CONSTRAINT [FK_Help_Center_FAQs_Users]
GO
ALTER TABLE [dbo].[Listening]  WITH CHECK ADD  CONSTRAINT [FK_Listening_Topic_Exam] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic_Exam] ([topic_id])
GO
ALTER TABLE [dbo].[Listening] CHECK CONSTRAINT [FK_Listening_Topic_Exam]
GO
ALTER TABLE [dbo].[Listening_Write]  WITH CHECK ADD  CONSTRAINT [FK_Listening_Write_Answer_Listening_Write] FOREIGN KEY([answer_id])
REFERENCES [dbo].[Answer_Listening_Write] ([answer_id])
GO
ALTER TABLE [dbo].[Listening_Write] CHECK CONSTRAINT [FK_Listening_Write_Answer_Listening_Write]
GO
ALTER TABLE [dbo].[Listening_Write]  WITH CHECK ADD  CONSTRAINT [FK_Listening_Write_Users] FOREIGN KEY([Coord_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Listening_Write] CHECK CONSTRAINT [FK_Listening_Write_Users]
GO
ALTER TABLE [dbo].[Point_Listening]  WITH CHECK ADD  CONSTRAINT [FK_Point_Listening_Student_Results] FOREIGN KEY([result_id])
REFERENCES [dbo].[Student_Results] ([result_id])
GO
ALTER TABLE [dbo].[Point_Listening] CHECK CONSTRAINT [FK_Point_Listening_Student_Results]
GO
ALTER TABLE [dbo].[Point_Listening]  WITH CHECK ADD  CONSTRAINT [FK_Point_Listening_Users] FOREIGN KEY([Coord_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Point_Listening] CHECK CONSTRAINT [FK_Point_Listening_Users]
GO
ALTER TABLE [dbo].[Point_Reading]  WITH CHECK ADD  CONSTRAINT [FK_Point_Reading_Student_Results] FOREIGN KEY([result_id])
REFERENCES [dbo].[Student_Results] ([result_id])
GO
ALTER TABLE [dbo].[Point_Reading] CHECK CONSTRAINT [FK_Point_Reading_Student_Results]
GO
ALTER TABLE [dbo].[Point_Reading]  WITH CHECK ADD  CONSTRAINT [FK_Point_Reading_Users] FOREIGN KEY([Coord_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Point_Reading] CHECK CONSTRAINT [FK_Point_Reading_Users]
GO
ALTER TABLE [dbo].[Point_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Point_Speaking_Student_Results] FOREIGN KEY([result_id])
REFERENCES [dbo].[Student_Results] ([result_id])
GO
ALTER TABLE [dbo].[Point_Speaking] CHECK CONSTRAINT [FK_Point_Speaking_Student_Results]
GO
ALTER TABLE [dbo].[Point_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Point_Speaking_Users] FOREIGN KEY([Coord_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Point_Speaking] CHECK CONSTRAINT [FK_Point_Speaking_Users]
GO
ALTER TABLE [dbo].[Point_Writing]  WITH CHECK ADD  CONSTRAINT [FK_Point_Writing_Answer_Writing] FOREIGN KEY([answer_id])
REFERENCES [dbo].[Answer_Writing] ([answer_id])
GO
ALTER TABLE [dbo].[Point_Writing] CHECK CONSTRAINT [FK_Point_Writing_Answer_Writing]
GO
ALTER TABLE [dbo].[Point_Writing]  WITH CHECK ADD  CONSTRAINT [FK_Point_Writing_Student_Results] FOREIGN KEY([result_id])
REFERENCES [dbo].[Student_Results] ([result_id])
GO
ALTER TABLE [dbo].[Point_Writing] CHECK CONSTRAINT [FK_Point_Writing_Student_Results]
GO
ALTER TABLE [dbo].[Point_Writing]  WITH CHECK ADD  CONSTRAINT [FK_Point_Writing_Users] FOREIGN KEY([Coord_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Point_Writing] CHECK CONSTRAINT [FK_Point_Writing_Users]
GO
ALTER TABLE [dbo].[Question_Listening_Write]  WITH CHECK ADD  CONSTRAINT [FK_Question_Listening_Write_Listening] FOREIGN KEY([listen_id])
REFERENCES [dbo].[Listening] ([listen_id])
GO
ALTER TABLE [dbo].[Question_Listening_Write] CHECK CONSTRAINT [FK_Question_Listening_Write_Listening]
GO
ALTER TABLE [dbo].[Question_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Question_Speaking_Speaking] FOREIGN KEY([speak_id])
REFERENCES [dbo].[Speaking] ([speak_id])
GO
ALTER TABLE [dbo].[Question_Speaking] CHECK CONSTRAINT [FK_Question_Speaking_Speaking]
GO
ALTER TABLE [dbo].[Questions_Listening_ChooseAnswer]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Listening_ChooseAnswer_Listening] FOREIGN KEY([listen_id])
REFERENCES [dbo].[Listening] ([listen_id])
GO
ALTER TABLE [dbo].[Questions_Listening_ChooseAnswer] CHECK CONSTRAINT [FK_Questions_Listening_ChooseAnswer_Listening]
GO
ALTER TABLE [dbo].[Questions_Reading]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Reading_Reading] FOREIGN KEY([read_id])
REFERENCES [dbo].[Reading] ([read_id])
GO
ALTER TABLE [dbo].[Questions_Reading] CHECK CONSTRAINT [FK_Questions_Reading_Reading]
GO
ALTER TABLE [dbo].[Reading]  WITH CHECK ADD  CONSTRAINT [FK_Reading_Topic_Exam] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic_Exam] ([topic_id])
GO
ALTER TABLE [dbo].[Reading] CHECK CONSTRAINT [FK_Reading_Topic_Exam]
GO
ALTER TABLE [dbo].[Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Speaking_Topic_Exam] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic_Exam] ([topic_id])
GO
ALTER TABLE [dbo].[Speaking] CHECK CONSTRAINT [FK_Speaking_Topic_Exam]
GO
ALTER TABLE [dbo].[Student_Results]  WITH CHECK ADD  CONSTRAINT [FK_Student_Results_Tests] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Student_Results] CHECK CONSTRAINT [FK_Student_Results_Tests]
GO
ALTER TABLE [dbo].[Student_Results]  WITH CHECK ADD  CONSTRAINT [FK_Student_Results_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Student_Results] CHECK CONSTRAINT [FK_Student_Results_Users]
GO
ALTER TABLE [dbo].[System_Update]  WITH CHECK ADD  CONSTRAINT [FK_System_Update_Users] FOREIGN KEY([it_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[System_Update] CHECK CONSTRAINT [FK_System_Update_Users]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Topic_Exam] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic_Exam] ([topic_id])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Topic_Exam]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Users]
GO
ALTER TABLE [dbo].[Topic_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Exam_Users] FOREIGN KEY([create_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Topic_Exam] CHECK CONSTRAINT [FK_Topic_Exam_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([user_id])
REFERENCES [dbo].[Role] ([user_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Writing]  WITH CHECK ADD  CONSTRAINT [FK_Writing_Topic_Exam] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic_Exam] ([topic_id])
GO
ALTER TABLE [dbo].[Writing] CHECK CONSTRAINT [FK_Writing_Topic_Exam]
GO
USE [master]
GO
ALTER DATABASE [SWP_PROJECT] SET  READ_WRITE 
GO


--role : 1 la thi sinh ; 2 la giao vien ; 3 la it
INSERT INTO [dbo].[Users] (user_id, full_name, email, password, google_login_id, created_at, last_login)
VALUES
(1, 'Nguyen Van A', 'nguyenvana1@gmail.com', 'password123',  '123456789012345678901', DEFAULT, DEFAULT),
(2, 'Tran Thi B', 'tranthib2@gmail.com', 'password456',  '234567890123456789012', DEFAULT, DEFAULT),
(3, 'Le Van C', 'levanc3@gmail.com', 'password789',  '345678901234567890123', DEFAULT, DEFAULT),
(4, 'Pham Thi D', 'phamthid4@gmail.com', 'password123',  '456789012345678901234', DEFAULT, DEFAULT),
(5, 'Hoang Van E', 'hoangvane5@gmail.com', 'password456',  '567890123456789012345', DEFAULT, DEFAULT),
(6, 'Bui Thi F', 'buithif6@gmail.com', 'password789',  '678901234567890123456', DEFAULT, DEFAULT),
(7, 'Nguyen Van G', 'nguyenvang7@gmail.com', 'password123',  '789012345678901234567', DEFAULT, DEFAULT),
(8, 'Le Van I', 'levani9@gmail.com', 'password789',  '901234567890123456789', DEFAULT, DEFAULT),
(10, 'Pham Thi J', 'phamthij10@gmail.com', 'password123',  '012345678901234567890', DEFAULT, DEFAULT),
(12, 'Hoang Van K', 'hoangvank11@gmail.com', 'password456',  '123456789012345678900', DEFAULT, DEFAULT),
(14, 'Tran Thi N', 'tranthin14@gmail.com', 'password456', '456789012345678901023', DEFAULT, DEFAULT),
(15, 'Le Van O', 'levano15@gmail.com', 'password789',  '567890123456789012034', DEFAULT, DEFAULT),
(16, 'Pham Thi P', 'phamthip16@gmail.com', 'password123',  '678901234567890123045', DEFAULT, DEFAULT),
(18, 'Hoang Van Q', 'hoangvanq25@gmail.com', 'password456',  '789012345678901234056', DEFAULT, DEFAULT),
(19, 'Nguyen Van S', 'nguyenvans22@gmail.com', 'password123','901234567890123456078',DEFAULT, DEFAULT),
(20, 'Tran Thi T', 'tranthit24@gmail.com', 'password456', '012345678901234567089', DEFAULT, DEFAULT),
(21, 'Bac', 'bac23@gmail.com', 'password123',  '012345678905454465181', DEFAULT, DEFAULT),
(22, 'Trung Kien', 'trungkien19@gmail.com', 'password456',  '012345678901454545864', DEFAULT, DEFAULT),
(23, 'Duc Tuan', 'ductian20@gmail.com', 'password789', '012345678905656661581', DEFAULT, DEFAULT),
(24, 'Chi Bang', 'chibang20@gmail.com', 'password123',  '012345678901561568379', DEFAULT, DEFAULT),
(25, 'Lam Tung', 'tranthit20@gmail.com', 'password456',  '012345678901252661515', DEFAULT, DEFAULT);

INSERT INTO [dbo].[Role]
VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,2),
(8,1),
(10,1),
(12,1),
(14,2),
(15,1),
(16,2),
(18,1),
(19,1),
(20,2),
(21,3),
(22,3),
(23,3),
(24,3),
(25,3);

INSERT INTO [dbo].[Topic_Exam] (topic_id,create_id)
VALUES
(1,7),
(2,16),
(3,20),
(4,14),
(5,16),
(6,14),
(7,7),
(8,20),
(9,16),
(10,20);

INSERT INTO [dbo].[Reading] 
VAlUES
()

INSERT INTO [dbo].[Writing]
VALUES
(1,1,60,'The Ethical Dilemma of Profit in Health Care: Weighing the Disadvantages and Advantages of Private Health Services','Some people think that good health is a basic human need, so the medical services should not be run by profit-making companies.Do you think the disadvantages of private health care outweigh the advantages?'),
(2,2,60,'Breaking Barriers: The Debate on Women s Role in the Police and Military Forces','Some people believe that women should play an equal role as men in a country‘s police force or military force, such as the army, while others think women are not suitable for these kinds of jobs. Discuss both view and give ur opinion?'),
(3,3,60,'The Great Sacrifice: Weighing the Pros and Cons of Relocating for Employment','In many countries, if people want to find a job, they have to get away from their families and friends.Do the advans outweigh the disadvans ?'),
(4,4,60,'Relocating for Work: Do the Advantages Outweigh the Disadvantages?','In many country, when people want to find work, they have to move away from their friends and their family. Advantages và disadvantages, which is outweigh'),
(5,5,60,'The Role of Student Feedback: Enhancing Education or Undermining Authority?','Some people think that in order to continuously improve quality of education, high school students should be encouraged to criticise their teachers. Other think that would results in a loss of principle in class. Discussion both views and give your opinion.'),
(6,6,60,'The High Cost of Glory: Do Major Sporting Events Benefit or Burden Host Nations?','Hosting sporting events such as the Olympics and the World Cup can bring benefits to the host countries. Some people think it is wasted money. Discuss both view and give your own opinion.'),
(7,7,60,'Robots and the Future of Humanity: Catalyst for Progress or Societal Threat?','Some believe that robots play a crucial role in shaping humanity’s future, whereas others argue that they pose risks and could harm society. Consider both arguments and present your viewpoint. Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.'),
(8,8,60,'Mandatory Education Until 18: A Path to Success or an Unnecessary Constraint?','There is a belief that young individuals must attend school full-time until they are at least 18 years old. To what degree do you support or oppose this idea? Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.'),
(9,9,60,'Homeschooling vs Traditional Schooling: Do the Benefits Outweigh the Drawbacks?','Some parents in certain countries are increasingly opting to homeschool their children rather than enrolling them in traditional schools. Are the benefits of this change greater than the drawbacks? Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.'),
(10,10,60,'Government Funding for the Arts: A Worthy Investment or a Misuse of Public Funds?','Some believe that the government should support artists like musicians, painters, and poets, while others argue that this is a misuse of funds. Consider both arguments and present your viewpoint. Explain your viewpoint with reasons and include appropriate examples based on your knowledge or experiences.');

INSERT INTO [dbo].[Speaking]
VALUES
(1,1,15),
(2,2,15),
(3,3,15),
(4,4,15),
(5,5,15),
(6,6,15),
(7,7,15),
(8,8,15),
(9,9,15),
(10,10,15);

INSERT INTO [dbo].[Question_Speaking]
VALUES
(1,1,'Do you like challenges?'),
(2,1,'What is the biggest challenge in your future?'),
(3,1,'What subject do you think is the most challenging at school?'),
(4,1,'Do you like to challenge yourself?'),
(5,1,'Do you like to live a life that has a lot of challenges?'),
(6,1,'How do you usually deal with challenges in daily life?'),
(7,2,'Where did you go for your last holiday?'),
(8,2,'Do you like holidays? Why?'),
(9,2,'Which public holiday do you like best?'),
(10,2,'What do you usually do in your holidays?'),
(11,2,'Do you like to spend your day at home?'),
(12,2,'Do you prefer a leisurely or a busy holiday?'),
(13,3,'Do you keep plants at home?'),
(14,3,'What plant did you grow when you were young?'),
(15,3,'Do you know anything about growing a plant?'),
(16,3,'Do Vietnamese people send plants as gifts?'),
(17,4,'What’s your morning /weekend routine?'),
(18,4,'Do you want to change your morning routine?'),
(19,4,'Are there any differences between what you do in the morning now and what you did in the past?'),
(20,4,'What is your daily routine?'),
(21,4,'Have you ever changed your routine?'),
(22,4,'Which part of your daily routine do you like best?'),
(23,5,'What would you do to relax?'),
(24,5,'Do you think doing sports is a good way to relax?'),
(25,5,'Do you think vacation is a good time to relax?'),
(26,5,'Do you think students need more relaxing time?'),
(27,6,'Do you usually help people around you?'),
(28,6,'How do you help people around you?'),
(29,6,'Do your parents teach you how to help others?'),
(30,6,'Did your parents help you a lot when you were young?'),
(31,6,'What have you done to help the elderly?'),
(32,7,'Do you like chatting with friends?'),
(33,7,'What do you usually chat about with friends?'),
(34,7,'Do you prefer to chat with a group of people or with only one friend?'),
(35,7,'Do you prefer to communicate face-to-face or via social media?'),
(36,7,'Do you argue with friends?'),
(37,8,'Does your family use social media platforms?'),
(38,8,'Do you think Vietnamese users spend lots of time on social medias?'),
(39,8,'Why do people still use social media?'),
(40,8,'Do you use credit cards?'),
(41,8,'Do you think you will stop using cash in the future?'),
(42,9,'What is your favorite color?'),
(43,9,'Color is important when you choose clothes?'),
(44,9,'Are there any colors that have a special meaning in your country?'),
(45,9,'What color will you choose when buying a car in the future?'),
(46,10,'Do you think we need to understand computers on a deeper level?'),
(47,10,'What is the most impactful piece of technology in our time?'),
(48,10,'How do computers affect our everyday life?'),
(49,10,'What modern technological devices are most common in your country?'),
(50,10,'What are the advantages of modern technology?');




