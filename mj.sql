USE [Majarra]
GO
/****** Object:  Table [dbo].[comments_data]    Script Date: 09/05/2020 04:47:16 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[path_id] [int] NOT NULL,
	[added_by] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_comments_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_data]    Script Date: 09/05/2020 04:47:16 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[level] [int] NOT NULL,
	[type] [int] NOT NULL,
	[sub_path_id] [int] NOT NULL,
	[rate] [int] NOT NULL,
	[comments_count] [int] NOT NULL,
	[added_by] [int] NULL,
	[Icon] [nvarchar](100) NULL,
	[Course_link] [nvarchar](100) NULL,
 CONSTRAINT [PK_courses_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[path_data]    Script Date: 09/05/2020 04:47:16 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[path_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[about] [nvarchar](max) NULL,
	[to_learn] [nvarchar](max) NULL,
	[rate] [int] NOT NULL,
	[details] [nvarchar](max) NULL,
	[Pic] [nvarchar](100) NULL,
 CONSTRAINT [PK_path_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_path_data]    Script Date: 09/05/2020 04:47:16 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_path_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[about] [nvarchar](max) NULL,
	[path_id] [int] NOT NULL,
 CONSTRAINT [PK_sub_path_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_data]    Script Date: 09/05/2020 04:47:16 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_data](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[name] [nvarchar](max) NULL,
	[password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Majarra] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[comments_data] ADD  CONSTRAINT [DF_comments_data_added_by]  DEFAULT ((4)) FOR [added_by]
GO
ALTER TABLE [dbo].[comments_data] ADD  CONSTRAINT [DF_comments_data_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[courses_data] ADD  CONSTRAINT [DF_courses_data_name]  DEFAULT ('no_name') FOR [name]
GO
ALTER TABLE [dbo].[courses_data] ADD  CONSTRAINT [DF_courses_data_level]  DEFAULT ((0)) FOR [level]
GO
ALTER TABLE [dbo].[courses_data] ADD  CONSTRAINT [DF_courses_data_type]  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[courses_data] ADD  CONSTRAINT [DF_courses_data_sub_path_id]  DEFAULT ((0)) FOR [sub_path_id]
GO
ALTER TABLE [dbo].[courses_data] ADD  CONSTRAINT [DF_courses_data_rate]  DEFAULT ((0)) FOR [rate]
GO
ALTER TABLE [dbo].[courses_data] ADD  DEFAULT ('0') FOR [comments_count]
GO
ALTER TABLE [dbo].[courses_data] ADD  DEFAULT ('images/img-path-thumb-1.jpg') FOR [Icon]
GO
ALTER TABLE [dbo].[courses_data] ADD  DEFAULT ('#') FOR [Course_link]
GO
ALTER TABLE [dbo].[path_data] ADD  CONSTRAINT [DF_path_data_rate]  DEFAULT ((0)) FOR [rate]
GO
ALTER TABLE [dbo].[path_data] ADD  DEFAULT ('images/img-path-thumb-1.jpg') FOR [Pic]
GO
ALTER TABLE [dbo].[courses_data]  WITH CHECK ADD FOREIGN KEY([added_by])
REFERENCES [dbo].[users_data] ([user_id])
GO
ALTER TABLE [dbo].[courses_data]  WITH CHECK ADD FOREIGN KEY([sub_path_id])
REFERENCES [dbo].[sub_path_data] ([id])
GO
ALTER TABLE [dbo].[sub_path_data]  WITH CHECK ADD FOREIGN KEY([path_id])
REFERENCES [dbo].[path_data] ([id])
GO
