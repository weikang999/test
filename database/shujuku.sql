USE [master]
GO
/****** Object:  Database [aspnet03797zdzxdxtmcqxt]    Script Date: 11/15/2020 11:10:43 ******/
CREATE DATABASE [aspnet03797zdzxdxtmcqxt] ON  PRIMARY 
( NAME = N'aspnet03797zdzxdxtmcqxt', FILENAME = N'D:\sql\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\aspnet03797zdzxdxtmcqxt.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'aspnet03797zdzxdxtmcqxt_log', FILENAME = N'D:\sql\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\aspnet03797zdzxdxtmcqxt_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aspnet03797zdzxdxtmcqxt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET ANSI_NULLS OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET ANSI_PADDING OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET ARITHABORT OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET  DISABLE_BROKER
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET  READ_WRITE
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET RECOVERY SIMPLE
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET  MULTI_USER
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [aspnet03797zdzxdxtmcqxt] SET DB_CHAINING OFF
GO
USE [aspnet03797zdzxdxtmcqxt]
GO
/****** Object:  Table [dbo].[wrongtopic]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wrongtopic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subjectid] [int] NOT NULL,
	[courseId] [nvarchar](50) NOT NULL,
	[coursename] [nvarchar](255) NOT NULL,
	[publisher] [nvarchar](50) NOT NULL,
	[question] [nvarchar](255) NOT NULL,
	[answer] [nvarchar](50) NOT NULL,
	[score] [int] NOT NULL,
	[letter] [nvarchar](50) NOT NULL,
	[examiners] [nvarchar](50) NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [wrongtopic_subjectid_index] ON [dbo].[wrongtopic] 
(
	[subjectid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[wrongtopic] ON
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (8, 6, N'10300927562382', N'JAVA笔试题', N'100', N'下列说法正确的是（ ）（单选）', N'B、AbstractSet继承自Set', 0, N'B', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (9, 6, N'10300927562382', N'JAVA笔试题', N'100', N'下面哪个流类属于面向字符的输入流？（ ）（单选）', N'B、FileInputStream', 0, N'B', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (10, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I think drinking milk is good () our health.－Yes, I agree with you.', N'C、with', 0, N'C', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (11, 8, N'11151100524322', N'测试科目名称', N'100', N'测试题目二', N'B、答案二', 0, N'B', N'001', CAST(0x0000AC7400B68D34 AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (12, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'用眼睛、鼻子、舌头辨别物体时的顺序，依次为？（单选）', N'B、先看后尝再闻', 0, N'B', N'001', CAST(0x0000AC7400B6B764 AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (13, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My parents often () me to () to Mr. Gao after school.', N'B、speaks; tell', 0, N'B', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (14, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'We need one musician () our school band.', N'C、of', 0, N'C', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (15, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I want you () me () my English.', N'B、to help; for', 0, N'B', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (16, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I think drinking milk is good () our health.－Yes, I agree with you.', N'C、with', 0, N'C', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (17, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My brother can () well. He wants to join the () club.', N'B、swim; swimming', 0, N'B', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[wrongtopic] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [answer], [score], [letter], [examiners], [addtime]) VALUES (18, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My friend Jenny often helps () with () English.', N'C、my; me', 0, N'C', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
SET IDENTITY_INSERT [dbo].[wrongtopic] OFF
/****** Object:  Table [dbo].[testresult]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testresult](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subjectid] [int] NOT NULL,
	[courseId] [nvarchar](50) NOT NULL,
	[coursename] [nvarchar](255) NOT NULL,
	[publisher] [nvarchar](50) NOT NULL,
	[MultipleChoiceScore] [int] NOT NULL,
	[MultipleChoiceQuestionScore] [int] NOT NULL,
	[TotalScore] [int] NOT NULL,
	[examiners] [nvarchar](50) NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [testresult_subjectid_index] ON [dbo].[testresult] 
(
	[subjectid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[testresult] ON
INSERT [dbo].[testresult] ([id], [subjectid], [courseId], [coursename], [publisher], [MultipleChoiceScore], [MultipleChoiceQuestionScore], [TotalScore], [examiners], [addtime]) VALUES (12, 6, N'10300927562382', N'JAVA笔试题', N'100', 50, 0, 50, N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[testresult] ([id], [subjectid], [courseId], [coursename], [publisher], [MultipleChoiceScore], [MultipleChoiceQuestionScore], [TotalScore], [examiners], [addtime]) VALUES (13, 4, N'10300829475341', N'Junior high school English test questions', N'100', 70, 0, 70, N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[testresult] ([id], [subjectid], [courseId], [coursename], [publisher], [MultipleChoiceScore], [MultipleChoiceQuestionScore], [TotalScore], [examiners], [addtime]) VALUES (14, 8, N'11151100524322', N'测试科目名称', N'100', 10, 20, 30, N'001', CAST(0x0000AC7400B68D34 AS DateTime))
INSERT [dbo].[testresult] ([id], [subjectid], [courseId], [coursename], [publisher], [MultipleChoiceScore], [MultipleChoiceQuestionScore], [TotalScore], [examiners], [addtime]) VALUES (15, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', 40, 0, 40, N'001', CAST(0x0000AC7400B6B764 AS DateTime))
INSERT [dbo].[testresult] ([id], [subjectid], [courseId], [coursename], [publisher], [MultipleChoiceScore], [MultipleChoiceQuestionScore], [TotalScore], [examiners], [addtime]) VALUES (16, 4, N'10300829475341', N'Junior high school English test questions', N'100', 20, 0, 20, N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
SET IDENTITY_INSERT [dbo].[testresult] OFF
/****** Object:  Table [dbo].[teacher]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[sex] [nvarchar](255) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phonenumber] [nvarchar](50) NOT NULL,
	[idnumbe] [nvarchar](50) NOT NULL,
	[addr] [nvarchar](255) NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[teacher] ON
INSERT [dbo].[teacher] ([id], [username], [pwd], [name], [sex], [email], [phonenumber], [idnumbe], [addr], [addtime]) VALUES (1, N'100', N'100', N'Miss Li', N'woman', N'12345@qq.com', N'13600136111', N'321654987123654789', N'长沙市xx街道xx号', CAST(0x0000AC74003AE1D4 AS DateTime))
INSERT [dbo].[teacher] ([id], [username], [pwd], [name], [sex], [email], [phonenumber], [idnumbe], [addr], [addtime]) VALUES (2, N'200', N'200', N'李华', N'woman', N'12345@qq.com', N'13600136000', N'123456789123456789', N'xx市xx街道', CAST(0x0000AC7400B11728 AS DateTime))
SET IDENTITY_INSERT [dbo].[teacher] OFF
/****** Object:  Table [dbo].[subject]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [nvarchar](50) NOT NULL,
	[coursename] [nvarchar](255) NOT NULL,
	[publisher] [nvarchar](50) NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[subject] ON
INSERT [dbo].[subject] ([id], [courseId], [coursename], [publisher], [addtime]) VALUES (4, N'10300829475341', N'Junior high school English test questions', N'100', CAST(0x0000AC74008C0D84 AS DateTime))
INSERT [dbo].[subject] ([id], [courseId], [coursename], [publisher], [addtime]) VALUES (5, N'10300913001286', N'初二寒假理论基础测验', N'100', CAST(0x0000AC740097E528 AS DateTime))
INSERT [dbo].[subject] ([id], [courseId], [coursename], [publisher], [addtime]) VALUES (6, N'10300927562382', N'JAVA笔试题', N'100', CAST(0x0000AC74009BFF28 AS DateTime))
INSERT [dbo].[subject] ([id], [courseId], [coursename], [publisher], [addtime]) VALUES (8, N'11151100524322', N'测试科目名称', N'100', CAST(0x0000AC7400B58C90 AS DateTime))
INSERT [dbo].[subject] ([id], [courseId], [coursename], [publisher], [addtime]) VALUES (9, N'11151108286720', N'测试测试', N'200', CAST(0x0000AC7400B79F6C AS DateTime))
SET IDENTITY_INSERT [dbo].[subject] OFF
/****** Object:  Table [dbo].[student]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[sex] [nvarchar](255) NOT NULL,
	[phonenumber] [nvarchar](50) NOT NULL,
	[birth] [nvarchar](25) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[idnumbe] [nvarchar](50) NOT NULL,
	[addr] [nvarchar](255) NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[student] ON
INSERT [dbo].[student] ([id], [username], [pwd], [name], [sex], [phonenumber], [birth], [email], [idnumbe], [addr], [addtime]) VALUES (1, N'001', N'001', N'Mary', N'woman', N'13800138111', N'2000-10-30', N'12345@qq.com', N'123456789123456789', N'xx市xx街道', CAST(0x0000AC74003697C8 AS DateTime))
INSERT [dbo].[student] ([id], [username], [pwd], [name], [sex], [phonenumber], [birth], [email], [idnumbe], [addr], [addtime]) VALUES (2, N'002', N'002', N'John', N'man', N'13600136000', N'1999-10-30', N'12345@qq.com', N'123456789123456789', N'长沙市xx街道xx号', CAST(0x0000AC74006F3C90 AS DateTime))
INSERT [dbo].[student] ([id], [username], [pwd], [name], [sex], [phonenumber], [birth], [email], [idnumbe], [addr], [addtime]) VALUES (5, N'003', N'003', N'李四', N'man', N'13600136000', N'2020-11-15', N'12345@qq.com', N'123456789456132789', N'长沙市xx街道xx号', CAST(0x0000AC7400B75B74 AS DateTime))
SET IDENTITY_INSERT [dbo].[student] OFF
/****** Object:  Table [dbo].[result]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subjectid] [int] NOT NULL,
	[courseId] [nvarchar](50) NOT NULL,
	[coursename] [nvarchar](255) NOT NULL,
	[publisher] [nvarchar](50) NOT NULL,
	[question] [nvarchar](255) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[answer] [nvarchar](50) NOT NULL,
	[score] [int] NOT NULL,
	[letter] [nvarchar](50) NOT NULL,
	[examiners] [nvarchar](50) NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [result_subjectid_index] ON [dbo].[result] 
(
	[subjectid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[result] ON
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (17, 6, N'10300927562382', N'JAVA笔试题', N'100', N'2.下面哪些不是Thread类的方法（ ）（单选）', N'单选题', N'A、start()', 10, N'A', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (18, 6, N'10300927562382', N'JAVA笔试题', N'100', N'下列说法正确的是（ ）（单选）', N'单选题', N'B、AbstractSet继承自Set', 0, N'B', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (19, 6, N'10300927562382', N'JAVA笔试题', N'100', N'0.6332的数据类型是？（单选）', N'单选题', N'A、float', 10, N'A', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (20, 6, N'10300927562382', N'JAVA笔试题', N'100', N'下面哪个流类属于面向字符的输入流？（ ）（单选）', N'单选题', N'B、FileInputStream', 0, N'B', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (21, 6, N'10300927562382', N'JAVA笔试题', N'100', N'struts框架中，使用以下（ ）标签可以显示数据验证错误信息。（单选）', N'单选题', N'A、html:error/', 10, N'A', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (22, 6, N'10300927562382', N'JAVA笔试题', N'100', N'7.ArrayList list = new ArrayList(20);中的list扩充几次（ ）？（单选）', N'单选题', N'A、0', 10, N'A', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (23, 6, N'10300927562382', N'JAVA笔试题', N'100', N'对XML文档的描述，错误的是（ ）？（单选）', N'单选题', N'A、XML 文档必须有根元素', 10, N'A', N'001', CAST(0x0000AC7400B36BA4 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (24, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'David is from the UK，but he can () much Chinese.', N'单选题', N'C、speak', 10, N'C', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (25, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My parents often () me to () to Mr. Gao after school.', N'单选题', N'C、tell; talk', 10, N'C', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (26, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'We need one musician () our school band.', N'单选题', N'D、for', 10, N'D', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (27, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I want you () me () my English.', N'单选题', N'C、to help; with', 10, N'C', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (28, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I think drinking milk is good () our health.－Yes, I agree with you.', N'单选题', N'C、with', 0, N'C', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (29, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My brother can () well. He wants to join the () club.', N'单选题', N'D、swimming; swim', 10, N'D', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (30, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My friend Jenny often helps () with () English.', N'单选题', N'B、me; my', 10, N'B', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (31, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'Let him () with his friends.', N'单选题', N'A、goes', 10, N'A', N'001', CAST(0x0000AC7400B3EB60 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (32, 8, N'11151100524322', N'测试科目名称', N'100', N'测试题目一', N'单选题', N'A、测试一', 10, N'A', N'001', CAST(0x0000AC7400B68D34 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (33, 8, N'11151100524322', N'测试科目名称', N'100', N'测试题目二', N'单选题', N'B、答案二', 0, N'B', N'001', CAST(0x0000AC7400B68D34 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (34, 8, N'11151100524322', N'测试科目名称', N'100', N'测试多选题目一', N'多选题', N'A、多选一,B、多选二', 20, N'A,B', N'001', CAST(0x0000AC7400B68D34 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (35, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'删除Windows桌面上某个应用程序的快捷方式图标，意味着（ ）（单选）', N'单选题', N'A、只删除了图标，对应的应用程序被保留', 10, N'A', N'001', CAST(0x0000AC7400B6B764 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (36, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'世界上种类最多，数量最多的动物是？（单选）', N'单选题', N'B、哺乳动物', 10, N'B', N'001', CAST(0x0000AC7400B6B764 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (37, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'键盘主键盘区有一个键位是 ，如果想输入“*”号，需要借助（ ）键（单选）', N'单选题', N'B、Shift', 10, N'B', N'001', CAST(0x0000AC7400B6B764 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (38, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'用眼睛、鼻子、舌头辨别物体时的顺序，依次为？（单选）', N'单选题', N'B、先看后尝再闻', 0, N'B', N'001', CAST(0x0000AC7400B6B764 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (39, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'月球的引力，比地球的小得多，只相当于地球引力的？（单选）', N'单选题', N'B、六分之一', 10, N'B', N'001', CAST(0x0000AC7400B6B764 AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (40, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'David is from the UK，but he can () much Chinese.', N'单选题', N'C、speak', 10, N'C', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (41, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My parents often () me to () to Mr. Gao after school.', N'单选题', N'B、speaks; tell', 0, N'B', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (42, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'We need one musician () our school band.', N'单选题', N'C、of', 0, N'C', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (43, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I want you () me () my English.', N'单选题', N'B、to help; for', 0, N'B', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (44, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I think drinking milk is good () our health.－Yes, I agree with you.', N'单选题', N'C、with', 0, N'C', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (45, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My brother can () well. He wants to join the () club.', N'单选题', N'B、swim; swimming', 0, N'B', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (46, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My friend Jenny often helps () with () English.', N'单选题', N'C、my; me', 0, N'C', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
INSERT [dbo].[result] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [score], [letter], [examiners], [addtime]) VALUES (47, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'Let him () with his friends.', N'单选题', N'A、goes', 10, N'A', N'002', CAST(0x0000AC7400B6F1FC AS DateTime))
SET IDENTITY_INSERT [dbo].[result] OFF
/****** Object:  Table [dbo].[questionInfo]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questionInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subjectid] [int] NOT NULL,
	[courseId] [nvarchar](50) NOT NULL,
	[coursename] [nvarchar](255) NOT NULL,
	[publisher] [nvarchar](50) NOT NULL,
	[question] [nvarchar](255) NOT NULL,
	[type] [nvarchar](255) NOT NULL,
	[answer] [ntext] NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [questioninfo_subjectid_index] ON [dbo].[questionInfo] 
(
	[subjectid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[questionInfo] ON
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (1, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'David is from the UK，but he can () much Chinese.', N'单选题', N'[{"zimu":"A","title":"talk","point":"0"},{"zimu":"B","title":"tell","point":"0"},{"zimu":"C","title":"speak","point":"10"},{"zimu":"D","title":"say","point":"0"}]', CAST(0x0000AC740093C9FC AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (2, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My parents often () me to () to Mr. Gao after school.', N'单选题', N'[{"zimu":"A","title":"tell; tell","point":"0"},{"zimu":"B","title":"speaks; tell","point":"0"},{"zimu":"C","title":"tell; talk","point":"10"},{"zimu":"D","title":"talk; speak","point":"0"}]', CAST(0x0000AC7400944634 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (3, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'We need one musician () our school band.', N'单选题', N'[{"zimu":"A","title":"on","point":"0"},{"zimu":"B","title":"to","point":"0"},{"zimu":"C","title":"of","point":"0"},{"zimu":"D","title":"for","point":"10"}]', CAST(0x0000AC7400952158 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (4, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I want you () me () my English.', N'单选题', N'[{"zimu":"A","title":"help; with","point":"0"},{"zimu":"B","title":"to help; for","point":"0"},{"zimu":"C","title":"to help; with","point":"10"},{"zimu":"D","title":"help; for","point":"0"}]', CAST(0x0000AC74009560A0 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (5, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'I think drinking milk is good () our health.－Yes, I agree with you.', N'单选题', N'[{"zimu":"A","title":"for","point":"10"},{"zimu":"B","title":"to","point":"0"},{"zimu":"C","title":"with","point":"0"},{"zimu":"D","title":"at","point":"0"}]', CAST(0x0000AC7400958E54 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (6, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My brother can () well. He wants to join the () club.', N'单选题', N'[{"zimu":"A","title":"swim; swim","point":"0"},{"zimu":"B","title":"swim; swimming","point":"0"},{"zimu":"C","title":"swimming; swimming","point":"0"},{"zimu":"D","title":"swimming; swim","point":"10"}]', CAST(0x0000AC740095C694 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (7, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'My friend Jenny often helps () with () English.', N'单选题', N'[{"zimu":"A","title":"I; me","point":"0"},{"zimu":"B","title":"me; my","point":"10"},{"zimu":"C","title":"my; me","point":"0"},{"zimu":"D","title":"I; my","point":"0"}]', CAST(0x0000AC740096B6D0 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (8, 4, N'10300829475341', N'Junior high school English test questions', N'100', N'Let him () with his friends.', N'单选题', N'[{"zimu":"A","title":"goes","point":"10"},{"zimu":"B","title":"to go","point":"0"},{"zimu":"C","title":"going","point":"0"},{"zimu":"D","title":"go","point":"0"}]', CAST(0x0000AC74009752AC AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (9, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'删除Windows桌面上某个应用程序的快捷方式图标，意味着（ ）（单选）', N'单选题', N'[{"zimu":"A","title":"只删除了图标，对应的应用程序被保留","point":"10"},{"zimu":"B","title":"该应用程序连同其图标一起被删除","point":"0"},{"zimu":"C","title":"该应用程序连同其图标一起被隐藏","point":"0"},{"zimu":"D","title":"只删除了该应用程序，对应的图标被隐藏","point":"0"}]', CAST(0x0000AC7400985B84 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (10, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'世界上种类最多，数量最多的动物是？（单选）', N'单选题', N'[{"zimu":"A","title":"鸟类","point":"0"},{"zimu":"B","title":"哺乳动物","point":"10"},{"zimu":"C","title":"爬行动物","point":"0"},{"zimu":"D","title":"昆虫","point":"0"}]', CAST(0x0000AC74009B4F60 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (11, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'键盘主键盘区有一个键位是 ，如果想输入“*”号，需要借助（ ）键（单选）', N'单选题', N'[{"zimu":"A","title":"Tab","point":"0"},{"zimu":"B","title":"Shift","point":"10"},{"zimu":"C","title":"Ctrl","point":"0"},{"zimu":"D","title":"Alt","point":"0"}]', CAST(0x0000AC74009B760C AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (12, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'用眼睛、鼻子、舌头辨别物体时的顺序，依次为？（单选）', N'单选题', N'[{"zimu":"A","title":"先看后闻再尝","point":"10"},{"zimu":"B","title":"先看后尝再闻","point":"0"},{"zimu":"C","title":"先尝后看再闻","point":"0"}]', CAST(0x0000AC74009BA168 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (13, 5, N'10300913001286', N'初二寒假理论基础测验', N'100', N'月球的引力，比地球的小得多，只相当于地球引力的？（单选）', N'单选题', N'[{"zimu":"A","title":"二分之一","point":"0"},{"zimu":"B","title":"六分之一","point":"10"},{"zimu":"C","title":"十分之一","point":"0"}]', CAST(0x0000AC74009BD624 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (14, 6, N'10300927562382', N'JAVA笔试题', N'100', N'2.下面哪些不是Thread类的方法（ ）（单选）', N'单选题', N'[{"zimu":"A","title":"start()","point":"10"},{"zimu":"B","title":"run()","point":"0"},{"zimu":"C","title":"exit()","point":"0"},{"zimu":"D","title":"getPriority()","point":"0"}]', CAST(0x0000AC74009C2BB0 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (15, 6, N'10300927562382', N'JAVA笔试题', N'100', N'下列说法正确的是（ ）（单选）', N'单选题', N'[{"zimu":"A","title":"LinkedList继承自List","point":"10"},{"zimu":"B","title":"AbstractSet继承自Set","point":"0"},{"zimu":"C","title":"WeakMap继承自HashMap","point":"0"},{"zimu":"D","title":"以上说法都不对","point":"0"}]', CAST(0x0000AC74009C5004 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (16, 6, N'10300927562382', N'JAVA笔试题', N'100', N'0.6332的数据类型是？（单选）', N'单选题', N'[{"zimu":"A","title":"float","point":"10"},{"zimu":"B","title":"double","point":"0"},{"zimu":"C","title":"Float","point":"0"},{"zimu":"D","title":"Double","point":"0"}]', CAST(0x0000AC74009C76B0 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (17, 6, N'10300927562382', N'JAVA笔试题', N'100', N'下面哪个流类属于面向字符的输入流？（ ）（单选）', N'单选题', N'[{"zimu":"A","title":"BufferedWriter","point":"10"},{"zimu":"B","title":"FileInputStream","point":"0"},{"zimu":"C","title":"ObjectInputStream","point":"0"},{"zimu":"D","title":"InputStreamReader","point":"0"}]', CAST(0x0000AC74009C92D0 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (18, 6, N'10300927562382', N'JAVA笔试题', N'100', N'struts框架中，使用以下（ ）标签可以显示数据验证错误信息。（单选）', N'单选题', N'[{"zimu":"A","title":"html:error/","point":"10"},{"zimu":"B","title":"html:errors/","point":"0"},{"zimu":"C","title":"logic:error/","point":"0"},{"zimu":"D","title":"logic:errors/","point":"0"}]', CAST(0x0000AC74009CB97C AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (19, 6, N'10300927562382', N'JAVA笔试题', N'100', N'7.ArrayList list = new ArrayList(20);中的list扩充几次（ ）？（单选）', N'单选题', N'[{"zimu":"A","title":"0","point":"10"},{"zimu":"B","title":"1","point":"0"},{"zimu":"C","title":"2","point":"0"},{"zimu":"D","title":"3","point":"0"}]', CAST(0x0000AC74009CE028 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (20, 6, N'10300927562382', N'JAVA笔试题', N'100', N'对XML文档的描述，错误的是（ ）？（单选）', N'单选题', N'[{"zimu":"A","title":"XML 文档必须有根元素","point":"10"},{"zimu":"B","title":"XML 的属性值须加引号","point":"0"},{"zimu":"C","title":"XML 标签对大小写不敏感","point":"0"},{"zimu":"D","title":"所有 XML 元素都须有关闭标签","point":"0"}]', CAST(0x0000AC74009D00F8 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (24, 8, N'11151100524322', N'测试科目名称', N'100', N'测试题目一', N'单选题', N'[{"zimu":"A","title":"测试一","point":"10"},{"zimu":"B","title":"测试二","point":"0"},{"zimu":"C","title":"测试三","point":"0"},{"zimu":"D","title":"测试四","point":"0"}]', CAST(0x0000AC7400B5B210 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (25, 8, N'11151100524322', N'测试科目名称', N'100', N'测试题目二', N'单选题', N'[{"zimu":"A","title":"答案一","point":"10"},{"zimu":"B","title":"答案二","point":"0"},{"zimu":"C","title":"答案三","point":"0"},{"zimu":"D","title":"答案四","point":"0"}]', CAST(0x0000AC7400B5D088 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (26, 8, N'11151100524322', N'测试科目名称', N'100', N'测试多选题目一', N'多选题', N'[{"zimu":"A","title":"多选一","point":"10"},{"zimu":"B","title":"多选二","point":"10"},{"zimu":"C","title":"多选三","point":"10"},{"zimu":"D","title":"多选四","point":"0"}]', CAST(0x0000AC7400B5F734 AS DateTime))
INSERT [dbo].[questionInfo] ([id], [subjectid], [courseId], [coursename], [publisher], [question], [type], [answer], [addtime]) VALUES (27, 9, N'11151108286720', N'测试测试', N'200', N'测试', N'单选题', N'[{"zimu":"A","title":"对","point":"10"},{"zimu":"B","title":"错","point":"0"}]', CAST(0x0000AC7400B7B100 AS DateTime))
SET IDENTITY_INSERT [dbo].[questionInfo] OFF
/****** Object:  Table [dbo].[administrators]    Script Date: 11/15/2020 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrators](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[pwd] [nvarchar](50) NOT NULL,
	[addtime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[administrators] ON
INSERT [dbo].[administrators] ([id], [username], [pwd], [addtime]) VALUES (1, N'admin', N'admin', CAST(0x0000AC7400F6B3DC AS DateTime))
SET IDENTITY_INSERT [dbo].[administrators] OFF
/****** Object:  Default [DF__wrongtopi__addti__22AA2996]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[wrongtopic] ADD  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF__testresul__addti__276EDEB3]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[testresult] ADD  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF__teacher__addtime__0AD2A005]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[teacher] ADD  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF__subject__addtime__0F975522]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[subject] ADD  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF__student__addtime__060DEAE8]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[student] ADD  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF__result__addtime__30F848ED]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[result] ADD  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF__questionI__addti__2C3393D0]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[questionInfo] ADD  DEFAULT (getdate()) FOR [addtime]
GO
/****** Object:  Default [DF__administr__addti__014935CB]    Script Date: 11/15/2020 11:10:44 ******/
ALTER TABLE [dbo].[administrators] ADD  DEFAULT (getdate()) FOR [addtime]
GO
