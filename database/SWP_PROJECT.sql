USE [master]
GO

CREATE DATABASE [SWP_PROJECT]
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Listening_ChooseAnswer](
	[answer_id] [int] identity(1,1) NOT NULL,
	[questListen_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Listening_ChooseAnswer] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Listening_Write](
	[answer_id] [int] identity(1,1) NOT NULL,
	[quest_Listen] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Listening_Write] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Reading](
	[answer_id] [int] identity(1,1) NOT NULL,
	[questRead_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[content_Answer] [text] NOT NULL,
 CONSTRAINT [PK_Answer_Reading] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Speaking](
	[answer_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer_Writing](
	[answer_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandPoint_Speaking](
	[brand_id] [int] identity(1,1) NOT NULL,
	[quest_id] [int] NOT NULL,
	[BrandPoint] [text] NOT NULL,
 CONSTRAINT [PK_BrandPoint_Speaking] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandPoint_Writing](
	[brand_id] [int] identity(1,1) NOT NULL,
	[quest_id] [int] NOT NULL,
	[BrandPoint] [text] NOT NULL,
 CONSTRAINT [PK_BrandPoint_Writing] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device_Readiness_Checks](
	[check_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Notifications](
	[notification_id] [int] identity(1,1) NOT NULL,
	[test_id] [int] NOT NULL,
	[message] [text] NOT NULL,
	[sent_at] [timestamp] NOT NULL,
 CONSTRAINT [PK_Exam_Notifications] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table [dbo].[ForgetPassword](
[fp_id] [int] identity(1,1) NOT NULL,
[token] [varchar](255) NOT NULL,
[expiryTime] [TimeStamp] NOT NULL,
[isUsed] [bit] NOT NULL,
[user_id] [int] NOT NULL,
 CONSTRAINT [PK_ForgetPassword] PRIMARY KEY CLUSTERED 
(
	[fp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Help_Center_FAQs](
	[faq_id] [int] identity(1,1) NOT NULL,
	[question] [text] NOT NULL,
	[answer] [text] NOT NULL,
	[t_id] [int] NOT NULL,
 CONSTRAINT [PK_Help_Center_FAQs] PRIMARY KEY CLUSTERED 
(
	[faq_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listening](
	[listen_id] [int] identity(1,1) NOT NULL,
	[topic_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[Video_listen] [text] NOT NULL,
 CONSTRAINT [PK_Listening] PRIMARY KEY CLUSTERED 
(
	[listen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listening_Write](
	[PointListenWrite_id] [int] identity(1,1) NOT NULL,
	[Coord_id] [int] NOT NULL,
	[True_False] [int] NOT NULL,
	[answer_id] [int] NOT NULL,
 CONSTRAINT [PK_Listening_Write] PRIMARY KEY CLUSTERED 
(
	[PointListenWrite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Listening](
	[point_id] [int] identity(1,1) NOT NULL,
	[Coord_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[result_id] [int] NOT NULL,
 CONSTRAINT [PK_Point_Listening] PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Reading](
	[point_id] [int] identity(1,1) NOT NULL,
	[Coord_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[result_id] [int] NULL,
 CONSTRAINT [PK_Point_Reading] PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Speaking](
	[point_id] [int] identity(1,1) NOT NULL,
	[Coord_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[result_id] [int] NOT NULL,
 CONSTRAINT [PK_Point_Speaking] PRIMARY KEY CLUSTERED 
(
	[point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point_Writing](
	[point_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Listening_Write](
	[quest_Listen] [int] identity(1,1) NOT NULL,
	[listen_id] [int] NOT NULL,
	[question_text] [text] NOT NULL,
 CONSTRAINT [PK_Question_Listening_Write] PRIMARY KEY CLUSTERED 
(
	[quest_Listen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Speaking](
	[quest_Speak] [int] identity(1,1) NOT NULL,
	[speak_id] [int] NOT NULL,
	[question_text] [text] NOT NULL,
 CONSTRAINT [PK_Question_Speaking] PRIMARY KEY CLUSTERED 
(
	[quest_Speak] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Listening_ChooseAnswer](
	[questListen_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Reading](
	[questRead_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reading](
	[read_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[user_id] [int] identity(1,1) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speaking](
	[speak_id] [int] identity(1,1) NOT NULL,
	[topic_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
 CONSTRAINT [PK_Speaking] PRIMARY KEY CLUSTERED 
(
	[speak_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Results](
	[result_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[System_Update](
	[update_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[test_id] [int] identity(1,1) NOT NULL,
	[student_name] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[test_exist] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[test_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[exam_id] [int] identity(1,1) NOT NULL,
	[test_name] [varchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[time_exam] [int] NOT NULL,
	[create_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic_Exam](
	[topic_id] [int] identity(1,1) NOT NULL,
	[create_id] [int] NOT NULL,
 CONSTRAINT [PK_Topic_Exam] PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] identity(1,1) NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[google_login_id] [varchar](255) NOT NULL,
	[created_at] [datetime] DEFAULT CURRENT_TIMESTAMP,
	[last_login] [datetime] DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writing](
	[write_id] [int] identity(1,1) NOT NULL,
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table [dbo].[Page_Inform](
[pi_id] [int] identity(1,1) NOT NULL,
[Title] [text] NOT NULL,
[content] [text] NOT NULL,
[t_id] [int] NOT NULL,
 CONSTRAINT [PK_Page_Inform] PRIMARY KEY CLUSTERED 
(
	[pi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table [dbo].[Document](
[d_id] [int] identity(1,1) NOT NULL,
[Title] [text] NOT NULL,
[content] [text] NOT NULL,
[t_id] [int] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[d_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create table [dbo].[Type_Information](
[t_id] [int] identity(1,1) NOT NULL,
[createTime] [datetime] DEFAULT CURRENT_TIMESTAMP,
[t_tile] [text] NOT NULL,
[hashtag] [text] NULL,
[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Type_Information] PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Practice_Questions_Reading](
	[questRead_id] [int] identity(1,1) NOT NULL,
	[question_text] [text] NOT NULL,
	[answer_options] [text] NOT NULL,
	[correct_answer] [text] NOT NULL,
	[explanation] [text] NULL,
	[read_id] [int] NOT NULL,
 CONSTRAINT [PK_Practice_Questions_Reading] PRIMARY KEY CLUSTERED 
(
	[questRead_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Reading](
	[read_id] [int] identity(1,1) NOT NULL,
	[practice_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Content] [text] NOT NULL,
 CONSTRAINT [PK_Practice_Reading] PRIMARY KEY CLUSTERED 
(
	[read_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Speaking](
	[speak_id] [int] identity(1,1) NOT NULL,
	[practice_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
 CONSTRAINT [PK_Practice_Speaking] PRIMARY KEY CLUSTERED 
(
	[speak_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Question_Speaking](
	[quest_Speak] [int] identity(1,1) NOT NULL,
	[speak_id] [int] NOT NULL,
	[question_text] [text] NOT NULL,
 CONSTRAINT [PK_Practice_Question_Speaking] PRIMARY KEY CLUSTERED 
(
	[quest_Speak] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_BrandPoint_Speaking](
	[brand_id] [int] identity(1,1) NOT NULL,
	[quest_id] [int] NOT NULL,
	[BrandPoint] [text] NOT NULL,
 CONSTRAINT [PK_Practice_BrandPoint_Speaking] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Listening](
	[listen_id] [int] identity(1,1) NOT NULL,
	[practice_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[Video_listen] [text] NOT NULL,
 CONSTRAINT [PK_Practice_Listening] PRIMARY KEY CLUSTERED 
(
	[listen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Questions_Listening](
	[questListen_id] [int] identity(1,1) NOT NULL,
	[question_text] [text] NOT NULL,
	[answer_options] [text] NOT NULL,
	[correct_answer] [text] NOT NULL,
	[explanation] [text] NULL,
	[listen_id] [int] NOT NULL,
 CONSTRAINT [PK_Practice_Questions_Listening] PRIMARY KEY CLUSTERED 
(
	[questListen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_BrandPoint_Writing](
	[brand_id] [int] identity(1,1) NOT NULL,
	[quest_id] [int] NOT NULL,
	[BrandPoint] [text] NOT NULL,
 CONSTRAINT [PK_Practice_BrandPoint_Writing] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Writing](
	[write_id] [int] identity(1,1) NOT NULL,
	[practice_id] [int] NOT NULL,
	[duration] [int] NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Content] [text] NOT NULL,
 CONSTRAINT [PK_Practice_Writing] PRIMARY KEY CLUSTERED 
(
	[write_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Exam](
	[practice_id] [int] identity(1,1) NOT NULL,
	[create_id] [int] NOT NULL,
 CONSTRAINT [PK_Practice_Exam] PRIMARY KEY CLUSTERED 
(
	[practice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[ForgetPassword]  WITH CHECK ADD  CONSTRAINT [FK_Users_ForgetPassword] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ForgetPassword] CHECK CONSTRAINT [FK_Users_ForgetPassword]
GO
ALTER TABLE [dbo].[Help_Center_FAQs]  WITH CHECK ADD  CONSTRAINT [FK_Help_Center_FAQs_Type_Information] FOREIGN KEY([t_id])
REFERENCES [dbo].[Type_Information] ([t_id])
GO
ALTER TABLE [dbo].[Help_Center_FAQs] CHECK CONSTRAINT [FK_Help_Center_FAQs_Type_Information]
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
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([exam_id])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Exam]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Topic_Exam] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic_Exam] ([topic_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Topic_Exam]
GO
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Tests_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Tests_Users]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Users] FOREIGN KEY([create_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Users]
GO
ALTER TABLE [dbo].[Topic_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Exam_Users] FOREIGN KEY([create_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Topic_Exam] CHECK CONSTRAINT [FK_Topic_Exam_Users]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Writing]  WITH CHECK ADD  CONSTRAINT [FK_Writing_Topic_Exam] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic_Exam] ([topic_id])
GO
ALTER TABLE [dbo].[Writing] CHECK CONSTRAINT [FK_Writing_Topic_Exam]
GO
ALTER TABLE [dbo].[Page_Inform]  WITH CHECK ADD  CONSTRAINT [FK_Page_Inform_Type_Information] FOREIGN KEY([t_id])
REFERENCES [dbo].[Type_Information] ([t_id])
GO
ALTER TABLE [dbo].[Page_Inform] CHECK CONSTRAINT [FK_Page_Inform_Type_Information]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Type_Information] FOREIGN KEY([t_id])
REFERENCES [dbo].[Type_Information] ([t_id])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Type_Information]
GO
ALTER TABLE [dbo].[Type_Information]  WITH CHECK ADD  CONSTRAINT [FK_Type_Information_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Type_Information] CHECK CONSTRAINT [FK_Type_Information_Users]
GO
ALTER TABLE [dbo].[Practice_Questions_Reading]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Questions_Reading_Practice_Reading] FOREIGN KEY([read_id])
REFERENCES [dbo].[Practice_Reading] ([read_id])
GO
ALTER TABLE [dbo].[Practice_Questions_Reading] CHECK CONSTRAINT [FK_Practice_Questions_Reading_Practice_Reading]
GO
ALTER TABLE [dbo].[Practice_Question_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Question_Speaking_Practice_Speaking] FOREIGN KEY([speak_id])
REFERENCES [dbo].[Practice_Speaking] ([speak_id])
GO
ALTER TABLE [dbo].[Practice_Question_Speaking] CHECK CONSTRAINT [FK_Practice_Question_Speaking_Practice_Speaking]
GO
ALTER TABLE [dbo].[Practice_BrandPoint_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Practice_BrandPoint_Speaking_Practice_Question_Speaking] FOREIGN KEY([quest_id])
REFERENCES [dbo].[Practice_Question_Speaking] ([quest_Speak])
GO
ALTER TABLE [dbo].[Practice_BrandPoint_Speaking] CHECK CONSTRAINT [FK_Practice_BrandPoint_Speaking_Practice_Question_Speaking]
GO
ALTER TABLE [dbo].[Practice_Questions_Listening]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Questions_Listening_Practice_Listening] FOREIGN KEY([questListen_id])
REFERENCES [dbo].[Practice_Listening] ([listen_id])
GO
ALTER TABLE [dbo].[Practice_Questions_Listening] CHECK CONSTRAINT [FK_Practice_Questions_Listening_Practice_Listening]
GO
ALTER TABLE [dbo].[Practice_BrandPoint_Writing]  WITH CHECK ADD  CONSTRAINT [FK_Practice_BrandPoint_Writing_Practice_Writing] FOREIGN KEY([quest_id])
REFERENCES [dbo].[Practice_Writing] ([write_id])
GO
ALTER TABLE [dbo].[Practice_BrandPoint_Writing] CHECK CONSTRAINT [FK_Practice_BrandPoint_Writing_Practice_Writing]
GO
ALTER TABLE [dbo].[Practice_Reading]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Reading_Practice_Exam] FOREIGN KEY([practice_id])
REFERENCES [dbo].[Practice_Exam] ([practice_id])
GO
ALTER TABLE [dbo].[Practice_Reading] CHECK CONSTRAINT [FK_Practice_Reading_Practice_Exam]
GO
ALTER TABLE [dbo].[Practice_Speaking]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Speaking_Practice_Exam] FOREIGN KEY([practice_id])
REFERENCES [dbo].[Practice_Exam] ([practice_id])
GO
ALTER TABLE [dbo].[Practice_Speaking] CHECK CONSTRAINT [FK_Practice_Speaking_Practice_Exam]
GO
ALTER TABLE [dbo].[Practice_Listening]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Listening_Practice_Exam] FOREIGN KEY([practice_id])
REFERENCES [dbo].[Practice_Exam] ([practice_id])
GO
ALTER TABLE [dbo].[Practice_Listening] CHECK CONSTRAINT [FK_Practice_Listening_Practice_Exam]
GO
ALTER TABLE [dbo].[Practice_Writing]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Writing_Practice_Exam] FOREIGN KEY([practice_id])
REFERENCES [dbo].[Practice_Exam] ([practice_id])
GO
ALTER TABLE [dbo].[Practice_Writing] CHECK CONSTRAINT [FK_Practice_Writing_Practice_Exam]
GO
ALTER TABLE [dbo].[Practice_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Practice_Exam_Users] FOREIGN KEY([create_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Practice_Exam] CHECK CONSTRAINT [FK_Practice_Exam_Users]
GO
USE [master]
GO
ALTER DATABASE [SWP_PROJECT] SET  READ_WRITE 
GO




