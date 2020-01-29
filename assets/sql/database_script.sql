USE [master]
GO
/****** Object:  Database [pecacompativel]    Script Date: 14/09/2019 00:52:12 ******/
CREATE DATABASE [pecacompativel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pecacompativel', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\pecacompativel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pecacompativel_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\pecacompativel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pecacompativel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pecacompativel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pecacompativel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pecacompativel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pecacompativel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pecacompativel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pecacompativel] SET ARITHABORT OFF 
GO
ALTER DATABASE [pecacompativel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pecacompativel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pecacompativel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pecacompativel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pecacompativel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pecacompativel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pecacompativel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pecacompativel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pecacompativel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pecacompativel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pecacompativel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pecacompativel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pecacompativel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pecacompativel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pecacompativel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pecacompativel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pecacompativel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pecacompativel] SET RECOVERY FULL 
GO
ALTER DATABASE [pecacompativel] SET  MULTI_USER 
GO
ALTER DATABASE [pecacompativel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pecacompativel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pecacompativel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pecacompativel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pecacompativel] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'pecacompativel', N'ON'
GO
ALTER DATABASE [pecacompativel] SET QUERY_STORE = OFF
GO
USE [pecacompativel]
GO
/****** Object:  Table [dbo].[automovel_marca]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automovel_marca](
	[id_automovel_marca] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](300) NOT NULL,
	[ativo] [bit] NOT NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
 CONSTRAINT [PK_automovel_marca] PRIMARY KEY CLUSTERED 
(
	[id_automovel_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[automovel_modelo]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automovel_modelo](
	[id_automovel_modelo] [int] IDENTITY(1,1) NOT NULL,
	[fk_id_automovel_tipo] [int] NOT NULL,
	[nome] [varchar](max) NOT NULL,
	[fk_id_automovel_marca] [int] NOT NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
 CONSTRAINT [PK_automovel_modelo] PRIMARY KEY CLUSTERED 
(
	[id_automovel_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[automovel_peca]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automovel_peca](
	[id_automovel_peca] [int] IDENTITY(1,1) NOT NULL,
	[fk_id_automovel_modelo] [int] NOT NULL,
	[ativo] [bit] NOT NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
	[nome] [varchar](max) NOT NULL,
	[descricao] [varchar](max) NULL,
	[fk_id_criador] [int] NOT NULL,
 CONSTRAINT [PK_automovel_peca] PRIMARY KEY CLUSTERED 
(
	[id_automovel_peca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[automovel_peca_compativel]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automovel_peca_compativel](
	[id_automovel_peca_compativel] [int] IDENTITY(1,1) NOT NULL,
	[fk_id_automovel_peca] [int] NOT NULL,
	[fk_id_peca_compativel] [int] NOT NULL,
	[curtidas_positivas] [int] NOT NULL,
	[curtidas_negativas] [int] NOT NULL,
	[fk_id_criador] [int] NOT NULL,
	[descricao] [varchar](max) NOT NULL,
	[ativo] [bit] NOT NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
 CONSTRAINT [PK_automovel_peca_compativel] PRIMARY KEY CLUSTERED 
(
	[id_automovel_peca_compativel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[automovel_peca_compativel_comentario]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automovel_peca_compativel_comentario](
	[id_automovel_peca_compativel_comentario] [int] IDENTITY(1,1) NOT NULL,
	[comentario] [varchar](max) NOT NULL,
	[fk_id_usuario] [int] NOT NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
	[fk_id_automovel_peca_compativel] [int] NOT NULL,
 CONSTRAINT [PK_automovel_peca_compativel_comentario] PRIMARY KEY CLUSTERED 
(
	[id_automovel_peca_compativel_comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[automovel_peca_compativel_curtida]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automovel_peca_compativel_curtida](
	[id_automovel_peca_compativel_curtida] [int] IDENTITY(1,1) NOT NULL,
	[fk_id_automovel_peca_compativel] [int] NOT NULL,
	[fk_id_usuario] [int] NOT NULL,
	[comentario] [varchar](max) NOT NULL,
	[curtiu] [bit] NOT NULL,
	[spam] [bit] NOT NULL,
 CONSTRAINT [PK_automovel_peca_compativel_curtida] PRIMARY KEY CLUSTERED 
(
	[id_automovel_peca_compativel_curtida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[automovel_tipo]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[automovel_tipo](
	[id_automovel_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](300) NOT NULL,
	[ativo] [bit] NOT NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
 CONSTRAINT [PK_automovel_tipo] PRIMARY KEY CLUSTERED 
(
	[id_automovel_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peca_compativel]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peca_compativel](
	[id_peca_compativel] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](max) NOT NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
	[fk_id_automovel_modelo] [int] NULL,
 CONSTRAINT [PK_peca_compativel] PRIMARY KEY CLUSTERED 
(
	[id_peca_compativel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 14/09/2019 00:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](300) NOT NULL,
	[email] [varchar](300) NOT NULL,
	[token] [varchar](300) NULL,
	[data_alteracao] [datetime] NULL,
	[data_criacao] [datetime] NOT NULL,
	[senha] [varchar](100) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[automovel_peca_compativel] ADD  CONSTRAINT [DF_automovel_peca_compativel_curtidas_positivas]  DEFAULT ((0)) FOR [curtidas_positivas]
GO
ALTER TABLE [dbo].[automovel_peca_compativel] ADD  CONSTRAINT [DF_automovel_peca_compativel_curtidas_negativas]  DEFAULT ((0)) FOR [curtidas_negativas]
GO
ALTER TABLE [dbo].[automovel_modelo]  WITH CHECK ADD  CONSTRAINT [FK_automovel_modelo_automovel_marca] FOREIGN KEY([fk_id_automovel_marca])
REFERENCES [dbo].[automovel_marca] ([id_automovel_marca])
GO
ALTER TABLE [dbo].[automovel_modelo] CHECK CONSTRAINT [FK_automovel_modelo_automovel_marca]
GO
ALTER TABLE [dbo].[automovel_modelo]  WITH CHECK ADD  CONSTRAINT [FK_automovel_modelo_automovel_tipo] FOREIGN KEY([fk_id_automovel_tipo])
REFERENCES [dbo].[automovel_tipo] ([id_automovel_tipo])
GO
ALTER TABLE [dbo].[automovel_modelo] CHECK CONSTRAINT [FK_automovel_modelo_automovel_tipo]
GO
ALTER TABLE [dbo].[automovel_peca]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_automovel_modelo] FOREIGN KEY([fk_id_automovel_modelo])
REFERENCES [dbo].[automovel_modelo] ([id_automovel_modelo])
GO
ALTER TABLE [dbo].[automovel_peca] CHECK CONSTRAINT [FK_automovel_peca_automovel_modelo]
GO
ALTER TABLE [dbo].[automovel_peca]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_usuario] FOREIGN KEY([fk_id_criador])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[automovel_peca] CHECK CONSTRAINT [FK_automovel_peca_usuario]
GO
ALTER TABLE [dbo].[automovel_peca_compativel]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_compativel_automovel_peca] FOREIGN KEY([fk_id_automovel_peca])
REFERENCES [dbo].[automovel_peca] ([id_automovel_peca])
GO
ALTER TABLE [dbo].[automovel_peca_compativel] CHECK CONSTRAINT [FK_automovel_peca_compativel_automovel_peca]
GO
ALTER TABLE [dbo].[automovel_peca_compativel]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_compativel_peca_compativel] FOREIGN KEY([fk_id_peca_compativel])
REFERENCES [dbo].[peca_compativel] ([id_peca_compativel])
GO
ALTER TABLE [dbo].[automovel_peca_compativel] CHECK CONSTRAINT [FK_automovel_peca_compativel_peca_compativel]
GO
ALTER TABLE [dbo].[automovel_peca_compativel]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_compativel_usuario] FOREIGN KEY([fk_id_criador])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[automovel_peca_compativel] CHECK CONSTRAINT [FK_automovel_peca_compativel_usuario]
GO
ALTER TABLE [dbo].[automovel_peca_compativel_comentario]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_compativel_comentario_automovel_peca_compativel] FOREIGN KEY([fk_id_automovel_peca_compativel])
REFERENCES [dbo].[automovel_peca_compativel] ([id_automovel_peca_compativel])
GO
ALTER TABLE [dbo].[automovel_peca_compativel_comentario] CHECK CONSTRAINT [FK_automovel_peca_compativel_comentario_automovel_peca_compativel]
GO
ALTER TABLE [dbo].[automovel_peca_compativel_comentario]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_compativel_comentario_usuario] FOREIGN KEY([fk_id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[automovel_peca_compativel_comentario] CHECK CONSTRAINT [FK_automovel_peca_compativel_comentario_usuario]
GO
ALTER TABLE [dbo].[automovel_peca_compativel_curtida]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_compativel_curtida_automovel_peca_compativel] FOREIGN KEY([fk_id_automovel_peca_compativel])
REFERENCES [dbo].[automovel_peca_compativel] ([id_automovel_peca_compativel])
GO
ALTER TABLE [dbo].[automovel_peca_compativel_curtida] CHECK CONSTRAINT [FK_automovel_peca_compativel_curtida_automovel_peca_compativel]
GO
ALTER TABLE [dbo].[automovel_peca_compativel_curtida]  WITH CHECK ADD  CONSTRAINT [FK_automovel_peca_compativel_curtida_usuario] FOREIGN KEY([fk_id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[automovel_peca_compativel_curtida] CHECK CONSTRAINT [FK_automovel_peca_compativel_curtida_usuario]
GO
ALTER TABLE [dbo].[peca_compativel]  WITH CHECK ADD  CONSTRAINT [FK_peca_compativel_automovel_modelo] FOREIGN KEY([fk_id_automovel_modelo])
REFERENCES [dbo].[automovel_modelo] ([id_automovel_modelo])
GO
ALTER TABLE [dbo].[peca_compativel] CHECK CONSTRAINT [FK_peca_compativel_automovel_modelo]
GO
USE [master]
GO
ALTER DATABASE [pecacompativel] SET  READ_WRITE 
GO
