USE [quizdb]
GO
/****** Object:  Table [dbo].[administrativos]    Script Date: 23/03/2018 12:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrativos](
	[ID] [varchar](50) NULL,
	[nombres] [varchar](50) NULL,
	[primer_apellido] [varchar](30) NULL,
	[segundo_apellido] [varchar](30) NULL,
	[provincia] [int] NULL,
	[canton] [int] NULL,
	[distrito] [int] NULL,
	[sexo] [varchar](1) NULL,
	[telefono] [varchar](8) NULL,
	[fecha_de_nacimiento] [date] NULL,
	[nacionalidad] [int] NULL,
	[contrasena] [varchar](8) NULL,
	[cedula] [varchar](30) NULL,
	[tipo_persona] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cantones]    Script Date: 23/03/2018 12:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cantones](
	[ID_Canton] [int] NOT NULL,
	[ID_Provincia] [int] NULL,
	[Nombre] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Canton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colegios]    Script Date: 23/03/2018 12:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colegios](
	[ID_Colegio] [int] NOT NULL,
	[ID_Provincia] [int] NULL,
	[ID_Canton] [int] NULL,
	[Nombre] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Colegio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distritos]    Script Date: 23/03/2018 12:33:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distritos](
	[ID_Distrito] [int] NOT NULL,
	[ID_Provincia] [int] NULL,
	[ID_Canton] [int] NULL,
	[Nombre] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 23/03/2018 12:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[ID_Pais] [int] NOT NULL,
	[Nombre] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 23/03/2018 12:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[ID_Provincia] [int] NOT NULL,
	[Nombre] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_answer]    Script Date: 23/03/2018 12:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[questionid] [int] NOT NULL,
	[optionid] [int] NOT NULL,
	[lastupdated] [datetime] NULL,
 CONSTRAINT [PK_question_answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_options]    Script Date: 23/03/2018 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_options](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[questionid] [int] NOT NULL,
	[questionoption] [nvarchar](500) NULL,
	[lastupdated] [datetime] NULL,
 CONSTRAINT [PK_question_options] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_responses]    Script Date: 23/03/2018 12:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_responses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[responseid] [int] NULL,
	[questionid] [int] NULL,
	[optionid] [int] NULL,
	[lastupdated] [datetime] NULL,
 CONSTRAINT [PK_question_responses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_details]    Script Date: 23/03/2018 12:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NULL,
	[description] [nvarchar](4000) NULL,
	[completiondescription] [nvarchar](4000) NULL,
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[termsandconditions] [nvarchar](max) NULL,
	[lastupdated] [datetime] NOT NULL,
 CONSTRAINT [PK_quizdetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_questions]    Script Date: 23/03/2018 12:33:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quizid] [int] NOT NULL,
	[questionorder] [int] NULL,
	[type] [nvarchar](50) NULL,
	[title] [nvarchar](2000) NULL,
	[lastupdated] [datetime] NOT NULL,
	[image_name] [varchar](60) NULL,
	[content_type] [varchar](60) NULL,
	[data] [varbinary](max) NULL,
	[category] [varchar](60) NULL,
 CONSTRAINT [PK_quizquestions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quiz_responses]    Script Date: 23/03/2018 12:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz_responses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quizid] [int] NULL,
	[userid] [nvarchar](250) NULL,
	[question] [nvarchar](500) NULL,
	[accurate_answer] [char](1) NULL,
	[lastupdated] [datetime] NULL,
	[answer] [varchar](60) NULL,
	[correct_answer] [varchar](60) NULL,
	[quiz_name] [varchar](60) NULL,
 CONSTRAINT [PK_quizresponses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 23/03/2018 12:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionId] [nvarchar](88) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Expires] [datetime] NOT NULL,
	[LockDate] [datetime] NOT NULL,
	[LockCookie] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[SessionItem] [image] NULL,
	[Flags] [int] NOT NULL,
	[Timeout] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_persona]    Script Date: 23/03/2018 12:33:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_persona](
	[ID] [varchar](30) NOT NULL,
	[nombre] [varchar](30) NULL,
 CONSTRAINT [PK_tipo_persona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 23/03/2018 12:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[ID] [varchar](50) NULL,
	[nombres] [varchar](50) NULL,
	[primer_apellido] [varchar](30) NULL,
	[segundo_apellido] [varchar](30) NULL,
	[provincia] [int] NULL,
	[canton] [int] NULL,
	[distrito] [int] NULL,
	[institucion_academica] [varchar](30) NULL,
	[sexo] [varchar](1) NULL,
	[telefono] [varchar](8) NULL,
	[fecha_de_nacimiento] [date] NULL,
	[nacionalidad] [int] NULL,
	[contrasena] [varchar](8) NULL,
	[cedula] [varchar](30) NULL,
	[tipo_persona] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cantones]  WITH CHECK ADD FOREIGN KEY([ID_Provincia])
REFERENCES [dbo].[provincias] ([ID_Provincia])
GO
ALTER TABLE [dbo].[colegios]  WITH CHECK ADD FOREIGN KEY([ID_Canton])
REFERENCES [dbo].[cantones] ([ID_Canton])
GO
ALTER TABLE [dbo].[colegios]  WITH CHECK ADD FOREIGN KEY([ID_Provincia])
REFERENCES [dbo].[provincias] ([ID_Provincia])
GO
ALTER TABLE [dbo].[distritos]  WITH CHECK ADD FOREIGN KEY([ID_Canton])
REFERENCES [dbo].[cantones] ([ID_Canton])
GO
ALTER TABLE [dbo].[distritos]  WITH CHECK ADD FOREIGN KEY([ID_Provincia])
REFERENCES [dbo].[provincias] ([ID_Provincia])
GO
ALTER TABLE [dbo].[question_answer]  WITH CHECK ADD  CONSTRAINT [FK_question_answer_quizquestions] FOREIGN KEY([questionid])
REFERENCES [dbo].[quiz_questions] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[question_answer] CHECK CONSTRAINT [FK_question_answer_quizquestions]
GO
ALTER TABLE [dbo].[question_options]  WITH CHECK ADD  CONSTRAINT [FK_question_options_quizquestions] FOREIGN KEY([questionid])
REFERENCES [dbo].[quiz_questions] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[question_options] CHECK CONSTRAINT [FK_question_options_quizquestions]
GO
ALTER TABLE [dbo].[question_responses]  WITH CHECK ADD  CONSTRAINT [FK_question_responses_quizresponses] FOREIGN KEY([responseid])
REFERENCES [dbo].[quiz_responses] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[question_responses] CHECK CONSTRAINT [FK_question_responses_quizresponses]
GO
ALTER TABLE [dbo].[quiz_questions]  WITH CHECK ADD  CONSTRAINT [FK_quizquestions_quizdetails] FOREIGN KEY([quizid])
REFERENCES [dbo].[quiz_details] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[quiz_questions] CHECK CONSTRAINT [FK_quizquestions_quizdetails]
GO
ALTER TABLE [dbo].[quiz_responses]  WITH CHECK ADD  CONSTRAINT [FK_quizresponses_quizdetails] FOREIGN KEY([quizid])
REFERENCES [dbo].[quiz_details] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[quiz_responses] CHECK CONSTRAINT [FK_quizresponses_quizdetails]
GO
