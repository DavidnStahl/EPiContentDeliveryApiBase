USE [master]
GO
/****** Object:  Database [EPiserver.Cms]    Script Date: 12/3/2020 3:17:39 PM ******/
CREATE DATABASE [EPiserver.Cms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EPiserver.Cms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EPiserver.Cms.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EPiserver.Cms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EPiserver.Cms_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EPiserver.Cms] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EPiserver.Cms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EPiserver.Cms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET ARITHABORT OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EPiserver.Cms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EPiserver.Cms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EPiserver.Cms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EPiserver.Cms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET RECOVERY FULL 
GO
ALTER DATABASE [EPiserver.Cms] SET  MULTI_USER 
GO
ALTER DATABASE [EPiserver.Cms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EPiserver.Cms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EPiserver.Cms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EPiserver.Cms] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EPiserver.Cms] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EPiserver.Cms] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EPiserver.Cms', N'ON'
GO
ALTER DATABASE [EPiserver.Cms] SET QUERY_STORE = OFF
GO
USE [EPiserver.Cms]
GO
/****** Object:  UserDefinedTableType [dbo].[AddApprovalDefinitionReviewerTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[AddApprovalDefinitionReviewerTable] AS TABLE(
	[StepIndex] [int] NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[ReviewerType] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[AddApprovalDefinitionStepTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[AddApprovalDefinitionStepTable] AS TABLE(
	[StepIndex] [int] NOT NULL,
	[StepName] [nvarchar](255) NULL,
	[ApprovesNeeded] [int] NULL,
	[SelfApprove] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[AddApprovalTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[AddApprovalTable] AS TABLE(
	[ApprovalDefinitionVersionID] [int] NOT NULL,
	[ApprovalKey] [nvarchar](255) NOT NULL,
	[LanguageBranchID] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[BigTableDeleteItemInternalTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[BigTableDeleteItemInternalTable] AS TABLE(
	[Id] [bigint] NULL,
	[NestLevel] [int] NULL,
	[ObjectPath] [varchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ChangeNotificationGuidTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[ChangeNotificationGuidTable] AS TABLE(
	[Value] [uniqueidentifier] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ChangeNotificationIntTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[ChangeNotificationIntTable] AS TABLE(
	[Value] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ChangeNotificationStringTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[ChangeNotificationStringTable] AS TABLE(
	[Value] [nvarchar](450) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ContentReferenceTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[ContentReferenceTable] AS TABLE(
	[ID] [int] NULL,
	[WorkID] [int] NULL,
	[Provider] [nvarchar](255) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[DateTimeConversion_DateTimeOffset]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[DateTimeConversion_DateTimeOffset] AS TABLE(
	[IntervalStart] [datetime] NOT NULL,
	[IntervalEnd] [datetime] NOT NULL,
	[Offset] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[editDeletePageInternalTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[editDeletePageInternalTable] AS TABLE(
	[pkID] [int] NOT NULL,
	[PageGUID] [uniqueidentifier] NULL,
	PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[GuidParameterTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[GuidParameterTable] AS TABLE(
	[Id] [uniqueidentifier] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[HostDefinitionTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[HostDefinitionTable] AS TABLE(
	[Name] [varchar](max) NULL,
	[Type] [int] NULL,
	[Language] [varchar](50) NULL,
	[Https] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IDTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[IDTable] AS TABLE(
	[ID] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LongParameterTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[LongParameterTable] AS TABLE(
	[Id] [bigint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProjectItemTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[ProjectItemTable] AS TABLE(
	[ID] [int] NULL,
	[ProjectID] [int] NULL,
	[ContentLinkID] [int] NULL,
	[ContentLinkWorkID] [int] NULL,
	[ContentLinkProvider] [nvarchar](255) NULL,
	[Language] [nvarchar](17) NULL,
	[Category] [nvarchar](255) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProjectMemberTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[ProjectMemberTable] AS TABLE(
	[ID] [int] NULL,
	[Name] [varchar](255) NULL,
	[Type] [smallint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StringParameterTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[StringParameterTable] AS TABLE(
	[String] [nvarchar](255) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UriPartsTable]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE TYPE [dbo].[UriPartsTable] AS TABLE(
	[Host] [nvarchar](255) NOT NULL,
	[Path] [nvarchar](2048) NOT NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[BigTableDateTimeSubtract]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[BigTableDateTimeSubtract]
(
	@DateTime1 DateTime,
	@DateTime2 DateTime
)
RETURNS BigInt
AS
BEGIN
declare @Return BigInt
Select @Return = (Convert(BigInt, 
	DATEDIFF(day, @DateTime1, @DateTime2)) * 86400000) + 
	(DATEDIFF(millisecond, 
		DATEADD(day, 
			DATEDIFF(day, @DateTime1, @DateTime2)
		, @DateTime1)
	, @DateTime2
	)
)
return @Return
END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertScopeName]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertScopeName]
(
	@ScopeName nvarchar(450),
	@OldDefinitionID int,
	@NewDefinitionID int	
)
RETURNS nvarchar(450)
AS
BEGIN
	DECLARE @ConvertedScopeName nvarchar(450)
	set @ConvertedScopeName = REPLACE(@ScopeName, 
						'.' + CAST(@OldDefinitionID as varchar) + '.', 
						'.'+ CAST(@NewDefinitionID as varchar) +'.')
	RETURN @ConvertedScopeName
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetExistingScopesForDefinition]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetExistingScopesForDefinition] 
(
	@PropertyDefinitionID int
)
RETURNS @ScopedPropertiesTable TABLE 
(
	ScopeName nvarchar(450)
)
AS
BEGIN
	--Get blocktype if property is block property
	DECLARE @ContentTypeID INT;
	SET @ContentTypeID = (SELECT tblContentType.pkID FROM 
		tblPropertyDefinition
		INNER JOIN tblPropertyDefinitionType ON tblPropertyDefinition.fkPropertyDefinitionTypeID = tblPropertyDefinitionType.pkID
		INNER JOIN tblContentType ON tblPropertyDefinitionType.fkContentTypeGUID = tblContentType.ContentTypeGUID
		WHERE tblPropertyDefinition.pkID = @PropertyDefinitionID);
		
	IF (@ContentTypeID IS NOT NULL)
	BEGIN
		INSERT INTO @ScopedPropertiesTable
		SELECT DISTINCT Property.ScopeName FROM
			tblWorkContentProperty as Property WITH(INDEX(IDX_tblWorkContentProperty_ScopeName))
			INNER JOIN dbo.GetScopedBlockProperties(@ContentTypeID) as ScopedProperties ON 
				Property.ScopeName LIKE (ScopedProperties.ScopeName + '%')
				WHERE ScopedProperties.ScopeName LIKE ('%.' + CAST(@PropertyDefinitionID as VARCHAR)+ '.')
	END
	
	RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetScopedBlockProperties]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetScopedBlockProperties] 
(
	@ContentTypeID int
)
RETURNS @ScopedPropertiesTable TABLE 
(
	ScopeName nvarchar(450)
)
AS
BEGIN
	WITH ScopedProperties(ContentTypeID, PropertyDefinitionID, Scope, Level)
	AS
	(
		--Top level statement
		SELECT T1.pkID as ContentTypeID, tblPropertyDefinition.pkID as PropertyDefinitionID, 
			Cast('.' + CAST(tblPropertyDefinition.pkID as VARCHAR) + '.' as varchar) as Scope, 0 as Level
		FROM tblPropertyDefinition
		INNER JOIN tblContentType AS T1 ON T1.pkID=tblPropertyDefinition.fkContentTypeID
		INNER JOIN tblPropertyDefinitionType ON tblPropertyDefinitionType.pkID = tblPropertyDefinition.fkPropertyDefinitionTypeID
		INNER JOIN tblContentType ON tblPropertyDefinitionType.fkContentTypeGUID = tblContentType.ContentTypeGUID
		WHERE tblContentType.pkID = @ContentTypeID
		UNION ALL
		
		--Recursive statement
		SELECT T1.pkID as ContentTypeID, tblPropertyDefinition.pkID as PropertyDefinitionID, 
			Cast('.' + CAST(tblPropertyDefinition.pkID as VARCHAR) + Scope as varchar ) as Scope, ScopedProperties.Level+1 as Level
		FROM tblPropertyDefinition
		INNER JOIN tblContentType AS T1 ON T1.pkID=tblPropertyDefinition.fkContentTypeID
		INNER JOIN tblPropertyDefinitionType ON tblPropertyDefinitionType.pkID = tblPropertyDefinition.fkPropertyDefinitionTypeID
		INNER JOIN tblContentType ON tblPropertyDefinitionType.fkContentTypeGUID = tblContentType.ContentTypeGUID
		INNER JOIN ScopedProperties ON ScopedProperties.ContentTypeID = tblContentType.pkID
	)
	INSERT INTO @ScopedPropertiesTable(ScopeName) SELECT Scope from ScopedProperties
	
	RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[netDateTimeSubtract]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[netDateTimeSubtract]
(
	@DateTime1 DateTime,
	@DateTime2 DateTime
)
RETURNS BigInt
AS
BEGIN
declare @Return BigInt
Select @Return = (Convert(BigInt, 
	DATEDIFF(day, @DateTime1, @DateTime2)) * 86400000) + 
	(DATEDIFF(millisecond, 
		DATEADD(day, 
			DATEDIFF(day, @DateTime1, @DateTime2)
		, @DateTime1)
	, @DateTime2
	)
)
return @Return
END
GO
/****** Object:  Table [dbo].[tblSystemBigTable]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSystemBigTable](
	[pkId] [bigint] NOT NULL,
	[Row] [int] NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
	[ItemType] [nvarchar](2000) NOT NULL,
	[Boolean01] [bit] NULL,
	[Boolean02] [bit] NULL,
	[Boolean03] [bit] NULL,
	[Boolean04] [bit] NULL,
	[Boolean05] [bit] NULL,
	[Integer01] [int] NULL,
	[Integer02] [int] NULL,
	[Integer03] [int] NULL,
	[Integer04] [int] NULL,
	[Integer05] [int] NULL,
	[Integer06] [int] NULL,
	[Integer07] [int] NULL,
	[Integer08] [int] NULL,
	[Integer09] [int] NULL,
	[Integer10] [int] NULL,
	[Long01] [bigint] NULL,
	[Long02] [bigint] NULL,
	[Long03] [bigint] NULL,
	[Long04] [bigint] NULL,
	[Long05] [bigint] NULL,
	[DateTime01] [datetime] NULL,
	[DateTime02] [datetime] NULL,
	[DateTime03] [datetime] NULL,
	[DateTime04] [datetime] NULL,
	[DateTime05] [datetime] NULL,
	[Guid01] [uniqueidentifier] NULL,
	[Guid02] [uniqueidentifier] NULL,
	[Guid03] [uniqueidentifier] NULL,
	[Float01] [float] NULL,
	[Float02] [float] NULL,
	[Float03] [float] NULL,
	[Float04] [float] NULL,
	[Float05] [float] NULL,
	[Float06] [float] NULL,
	[Float07] [float] NULL,
	[String01] [nvarchar](max) NULL,
	[String02] [nvarchar](max) NULL,
	[String03] [nvarchar](max) NULL,
	[String04] [nvarchar](max) NULL,
	[String05] [nvarchar](max) NULL,
	[String06] [nvarchar](max) NULL,
	[String07] [nvarchar](max) NULL,
	[String08] [nvarchar](max) NULL,
	[String09] [nvarchar](max) NULL,
	[String10] [nvarchar](max) NULL,
	[Binary01] [varbinary](max) NULL,
	[Binary02] [varbinary](max) NULL,
	[Binary03] [varbinary](max) NULL,
	[Binary04] [varbinary](max) NULL,
	[Binary05] [varbinary](max) NULL,
	[Indexed_Boolean01] [bit] NULL,
	[Indexed_Integer01] [int] NULL,
	[Indexed_Integer02] [int] NULL,
	[Indexed_Integer03] [int] NULL,
	[Indexed_Long01] [bigint] NULL,
	[Indexed_Long02] [bigint] NULL,
	[Indexed_DateTime01] [datetime] NULL,
	[Indexed_Guid01] [uniqueidentifier] NULL,
	[Indexed_Float01] [float] NULL,
	[Indexed_Float02] [float] NULL,
	[Indexed_Float03] [float] NULL,
	[Indexed_String01] [nvarchar](450) NULL,
	[Indexed_String02] [nvarchar](450) NULL,
	[Indexed_String03] [nvarchar](450) NULL,
	[Indexed_Binary01] [varbinary](900) NULL,
	[Decimal01] [decimal](18, 3) NULL,
	[Decimal02] [decimal](18, 3) NULL,
	[Indexed_Decimal01] [decimal](18, 3) NULL,
 CONSTRAINT [PK_tblSystemBigTable] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC,
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBigTableIdentity]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBigTableIdentity](
	[pkId] [bigint] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
 CONSTRAINT [PK_tblBigTableIdentity] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_EPiServer.MirroringService.MirroringData]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.MirroringService.MirroringData] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.String01 as "AdminMailaddress",
R01.Integer01 as "ContentTypeChangingState",
R01.Boolean01 as "ContinueOnError",
R01.String02 as "DestinationRoot",
R01.String03 as "DestinationUri",
R01.Boolean02 as "Enabled",
R01.Guid01 as "FromPageGuid",
R01.String04 as "ImpersonateUserName",
R01.Boolean03 as "IncludeRoot",
R01.Boolean04 as "InitialMirroringDone",
R01.Long01 as "LastChangeLoqSequenceRead",
R01.DateTime01 as "LastExecutionUTC",
R01.DateTime02 as "LastMailMessageUTC",
R01.Integer02 as "LastState",
R01.String05 as "LastStatus",
R01.String06 as "Name",
R01.String07 as "Params",
R01.Boolean05 as "SendMailMessage",
R01.Integer03 as "TransferAction",
R02.Boolean01 as "UseDefaultMirroringAddress",
R01.Integer04 as "ValidationContext",
R01.Integer05 as "VisitorGroupChangingState"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
left outer join tblSystemBigTable as R02 on R01.pkId = R02.pkId and R02.Row=2
where R01.StoreName='EPiServer.MirroringService.MirroringData' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Licensing.StoredLicense]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Licensing.StoredLicense] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Indexed_Guid01 as "EntityId",
R01.String01 as "LicenseData"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Licensing.StoredLicense' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Packaging.Storage.StorageUpdateEntity]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Packaging.Storage.StorageUpdateEntity] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.String01 as "ServerId",
R01.DateTime01 as "UpdateDate"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Packaging.Storage.StorageUpdateEntity' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_VisitorGroup]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_VisitorGroup] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Integer01 as "CriteriaOperator",
R01.Boolean01 as "EnableStatistics",
R01.Boolean02 as "IsSecurityRole",
R01.String01 as "Name",
R01.String02 as "Notes",
R01.Integer02 as "PointsThreshold"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='VisitorGroup' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Shell.Profile.ProfileData]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Shell.Profile.ProfileData] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.String01 as "UserName"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Shell.Profile.ProfileData' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Shell.Storage.PersonalizedViewSettingsStorage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Shell.Storage.PersonalizedViewSettingsStorage] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Indexed_String01 as "UserName",
R01.Indexed_String02 as "ViewName"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Shell.Storage.PersonalizedViewSettingsStorage' and R01.Row=1
GO
/****** Object:  Table [dbo].[tblBigTable]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBigTable](
	[pkId] [bigint] NOT NULL,
	[Row] [int] NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
	[ItemType] [nvarchar](2000) NOT NULL,
	[Boolean01] [bit] NULL,
	[Boolean02] [bit] NULL,
	[Boolean03] [bit] NULL,
	[Boolean04] [bit] NULL,
	[Boolean05] [bit] NULL,
	[Integer01] [int] NULL,
	[Integer02] [int] NULL,
	[Integer03] [int] NULL,
	[Integer04] [int] NULL,
	[Integer05] [int] NULL,
	[Integer06] [int] NULL,
	[Integer07] [int] NULL,
	[Integer08] [int] NULL,
	[Integer09] [int] NULL,
	[Integer10] [int] NULL,
	[Long01] [bigint] NULL,
	[Long02] [bigint] NULL,
	[Long03] [bigint] NULL,
	[Long04] [bigint] NULL,
	[Long05] [bigint] NULL,
	[DateTime01] [datetime] NULL,
	[DateTime02] [datetime] NULL,
	[DateTime03] [datetime] NULL,
	[DateTime04] [datetime] NULL,
	[DateTime05] [datetime] NULL,
	[Guid01] [uniqueidentifier] NULL,
	[Guid02] [uniqueidentifier] NULL,
	[Guid03] [uniqueidentifier] NULL,
	[Float01] [float] NULL,
	[Float02] [float] NULL,
	[Float03] [float] NULL,
	[Float04] [float] NULL,
	[Float05] [float] NULL,
	[Float06] [float] NULL,
	[Float07] [float] NULL,
	[Decimal01] [decimal](18, 3) NULL,
	[Decimal02] [decimal](18, 3) NULL,
	[String01] [nvarchar](max) NULL,
	[String02] [nvarchar](max) NULL,
	[String03] [nvarchar](max) NULL,
	[String04] [nvarchar](max) NULL,
	[String05] [nvarchar](max) NULL,
	[String06] [nvarchar](max) NULL,
	[String07] [nvarchar](max) NULL,
	[String08] [nvarchar](max) NULL,
	[String09] [nvarchar](max) NULL,
	[String10] [nvarchar](max) NULL,
	[Binary01] [varbinary](max) NULL,
	[Binary02] [varbinary](max) NULL,
	[Binary03] [varbinary](max) NULL,
	[Binary04] [varbinary](max) NULL,
	[Binary05] [varbinary](max) NULL,
	[Indexed_Boolean01] [bit] NULL,
	[Indexed_Integer01] [int] NULL,
	[Indexed_Integer02] [int] NULL,
	[Indexed_Integer03] [int] NULL,
	[Indexed_Long01] [bigint] NULL,
	[Indexed_Long02] [bigint] NULL,
	[Indexed_DateTime01] [datetime] NULL,
	[Indexed_Guid01] [uniqueidentifier] NULL,
	[Indexed_Float01] [float] NULL,
	[Indexed_Float02] [float] NULL,
	[Indexed_Float03] [float] NULL,
	[Indexed_Decimal01] [decimal](18, 3) NULL,
	[Indexed_String01] [nvarchar](450) NULL,
	[Indexed_String02] [nvarchar](450) NULL,
	[Indexed_String03] [nvarchar](450) NULL,
	[Indexed_Binary01] [varbinary](900) NULL,
 CONSTRAINT [PK_tblBigTable] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC,
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_EPiServer.Shell.Search.SearchProviderSetting]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Shell.Search.SearchProviderSetting] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.String01 as "FullName",
R01.Boolean01 as "IsEnabled",
R01.Integer01 as "SortIndex"
from [tblBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Shell.Search.SearchProviderSetting' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Indexed_String01 as "DataTypeString",
R01.String01 as "Editor",
R01.Indexed_String02 as "UIHint"
from [tblBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_InUseNotifications]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_InUseNotifications] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Boolean01 as "AddedManually",
R01.Indexed_Guid01 as "ContentGuid",
R01.DateTime01 as "CreateTime",
R01.Indexed_String01 as "LanguageBranch",
R01.DateTime02 as "Modified",
R01.Indexed_String02 as "User"
from [tblBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='InUseNotifications' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.DateTime01 as "PublishDate"
from [tblBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Util.ContentAssetsCleanupJobState]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Util.ContentAssetsCleanupJobState] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Long01 as "LastSequenceNumber"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Util.ContentAssetsCleanupJobState' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiServer.Util.BlobCleanupJobState]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Util.BlobCleanupJobState] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Long01 as "LastSequenceNumber"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Util.BlobCleanupJobState' and R01.Row=1
GO
/****** Object:  Table [dbo].[tblTaskInformation]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskInformation](
	[pkId] [bigint] NOT NULL,
	[Row] [int] NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
	[ItemType] [nvarchar](2000) NOT NULL,
	[Boolean01] [bit] NULL,
	[Boolean02] [bit] NULL,
	[Integer01] [int] NULL,
	[Long01] [bigint] NULL,
	[DateTime01] [datetime] NULL,
	[Guid01] [uniqueidentifier] NULL,
	[Float01] [float] NULL,
	[String01] [nvarchar](max) NULL,
	[Indexed_Integer01] [int] NULL,
	[Indexed_DateTime01] [datetime] NULL,
	[Indexed_DateTime02] [datetime] NULL,
	[Indexed_Guid01] [uniqueidentifier] NULL,
	[Indexed_String01] [nvarchar](450) NULL,
	[Indexed_String02] [nvarchar](450) NULL,
 CONSTRAINT [PK_tblTaskInformation] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC,
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_EPiServer.Async.TaskInformation]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiServer.Async.TaskInformation] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.Indexed_DateTime01 as "Completed",
R01.Indexed_Integer01 as "CompletedStatus",
R01.Indexed_DateTime02 as "Created",
R01.String01 as "Exception",
R01.Boolean01 as "IsTrackable",
R01.Indexed_String01 as "ResultType",
R01.Indexed_String02 as "User"
from [tblTaskInformation] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiServer.Async.TaskInformation' and R01.Row=1
GO
/****** Object:  View [dbo].[VW_EPiParentRestoreStore]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_EPiParentRestoreStore] as select
CAST (R01.pkId as varchar(50)) + ':' + UPPER(CAST([Identity].Guid as varchar(50))) as [Id], R01.pkId as [StoreId], [Identity].Guid as [ExternalId], R01.ItemType as [ItemType],
R01.String01 as "ParentLink",
R01.String02 as "SourceLink"
from [tblSystemBigTable] as R01 
inner join tblBigTableIdentity as [Identity] on R01.pkId=[Identity].pkId 
where R01.StoreName='EPiParentRestoreStore' and R01.Row=1
GO
/****** Object:  Table [dbo].[tblActivityArchive]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivityArchive](
	[pkID] [bigint] NOT NULL,
	[LogData] [nvarchar](max) NULL,
	[ChangeDate] [datetime] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Action] [int] NOT NULL,
	[ChangedBy] [nvarchar](255) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblActivityArchive] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblActivityLog]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivityLog](
	[pkID] [bigint] IDENTITY(1,1) NOT NULL,
	[LogData] [nvarchar](max) NULL,
	[ChangeDate] [datetime] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Action] [int] NOT NULL,
	[ChangedBy] [nvarchar](255) NOT NULL,
	[RelatedItem] [nvarchar](255) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblActivityLog] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[completeActivityLog]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[completeActivityLog]
	AS 
SELECT [pkID], [LogData], [ChangeDate], [Type], [Action], [ChangedBy], [Deleted] FROM [tblActivityArchive]
UNION ALL
SELECT [pkID], [LogData], [ChangeDate], [Type], [Action], [ChangedBy], [Deleted] FROM [tblActivityLog]
GO
/****** Object:  Table [dbo].[tblWorkContentProperty]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkContentProperty](
	[pkID] [bigint] IDENTITY(1,1) NOT NULL,
	[fkPropertyDefinitionID] [int] NOT NULL,
	[fkWorkContentID] [int] NOT NULL,
	[ScopeName] [nvarchar](450) NULL,
	[guid] [uniqueidentifier] NOT NULL,
	[Boolean] [bit] NOT NULL,
	[Number] [int] NULL,
	[FloatNumber] [float] NULL,
	[ContentType] [int] NULL,
	[ContentLink] [int] NULL,
	[Date] [datetime] NULL,
	[String] [nvarchar](450) NULL,
	[LongString] [nvarchar](max) NULL,
	[LinkGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblWorkProperty] PRIMARY KEY NONCLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_tblWorkContentProperty_fkWorkContentID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IX_tblWorkContentProperty_fkWorkContentID] ON [dbo].[tblWorkContentProperty]
(
	[fkWorkContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblWorkProperty]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblWorkProperty]
AS
SELECT
	[pkID],
	[fkPropertyDefinitionID] AS fkPageDefinitionID,
	[fkWorkContentID] AS fkWorkPageID,
	[ScopeName],
	[Boolean],
	[Number],
	[FloatNumber],
	[ContentType] AS PageType,
	[ContentLink] AS PageLink,
	[Date],
	[String],
	[LongString],
	[LinkGuid]
FROM    dbo.tblWorkContentProperty
GO
/****** Object:  Table [dbo].[tblPropertyDefinitionDefault]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPropertyDefinitionDefault](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkPropertyDefinitionID] [int] NOT NULL,
	[Boolean] [bit] NOT NULL,
	[Number] [int] NULL,
	[FloatNumber] [float] NULL,
	[ContentType] [int] NULL,
	[ContentLink] [int] NULL,
	[Date] [datetime] NULL,
	[String] [nvarchar](450) NULL,
	[LongString] [nvarchar](max) NULL,
	[LinkGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblPropertyDefinitionDefault] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPropertyDefault]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPropertyDefault]
AS
SELECT
	[pkID],
	[fkPropertyDefinitionID] AS fkPageDefinitionID,
	[Boolean],
	[Number],
	[FloatNumber],
	[ContentType] AS PageType,
	[ContentLink] AS PageLink,
	[Date],
	[String],
	[LongString],
	[LinkGuid]
FROM    dbo.tblPropertyDefinitionDefault
GO
/****** Object:  Table [dbo].[tblWorkContentCategory]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkContentCategory](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkWorkContentID] [int] NOT NULL,
	[fkCategoryID] [int] NOT NULL,
	[CategoryType] [int] NOT NULL,
	[ScopeName] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_tblWorkContentCategory] PRIMARY KEY NONCLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContentCategory_fkWorkContentID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblWorkContentCategory_fkWorkContentID] ON [dbo].[tblWorkContentCategory]
(
	[fkWorkContentID] ASC,
	[CategoryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblWorkCategory]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblWorkCategory]
AS
SELECT
	[fkWorkContentID] AS fkWorkPageID,
	[fkCategoryID],
	[CategoryType]
FROM    dbo.tblWorkContentCategory
GO
/****** Object:  Table [dbo].[tblContentProperty]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentProperty](
	[pkID] [bigint] IDENTITY(1,1) NOT NULL,
	[fkPropertyDefinitionID] [int] NOT NULL,
	[fkContentID] [int] NOT NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[ScopeName] [nvarchar](450) NULL,
	[guid] [uniqueidentifier] NOT NULL,
	[Boolean] [bit] NOT NULL,
	[Number] [int] NULL,
	[FloatNumber] [float] NULL,
	[ContentType] [int] NULL,
	[ContentLink] [int] NULL,
	[Date] [datetime] NULL,
	[String] [nvarchar](450) NULL,
	[LongString] [nvarchar](max) NULL,
	[LongStringLength] [int] NULL,
	[LinkGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblContentProperty] PRIMARY KEY NONCLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentProperty_fkContentID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblContentProperty_fkContentID] ON [dbo].[tblContentProperty]
(
	[fkContentID] ASC,
	[fkLanguageBranchID] ASC,
	[fkPropertyDefinitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblProperty]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblProperty]
AS
SELECT
	[pkID],
	[fkPropertyDefinitionID] AS fkPageDefinitionID,
	[fkContentID] AS fkPageID,
	[fkLanguageBranchID],
	[ScopeName],
	[guid],
	[Boolean],
	[Number],
	[FloatNumber],
	[ContentType] AS PageType,
	[ContentLink] AS PageLink,
	[Date],
	[String],
	[LongString],
	[LongStringLength],
	[LinkGuid]
FROM    dbo.tblContentProperty
GO
/****** Object:  Table [dbo].[tblContentLanguageSetting]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentLanguageSetting](
	[fkContentID] [int] NOT NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[fkReplacementBranchID] [int] NULL,
	[LanguageBranchFallback] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tblContentLanguageSetting] PRIMARY KEY CLUSTERED 
(
	[fkContentID] ASC,
	[fkLanguageBranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageLanguageSetting]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageLanguageSetting]
AS
SELECT
		[fkContentID] AS fkPageID,
		[fkLanguageBranchID],
		[fkReplacementBranchID],
    	[LanguageBranchFallback],
    	[Active]
FROM    dbo.tblContentLanguageSetting
GO
/****** Object:  Table [dbo].[tblContentLanguage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentLanguage](
	[fkContentID] [int] NOT NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[ContentLinkGUID] [uniqueidentifier] NULL,
	[fkFrameID] [int] NULL,
	[CreatorName] [nvarchar](255) NULL,
	[ChangedByName] [nvarchar](255) NULL,
	[ContentGUID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[URLSegment] [nvarchar](255) NULL,
	[LinkURL] [nvarchar](255) NULL,
	[BlobUri] [nvarchar](255) NULL,
	[ThumbnailUri] [nvarchar](255) NULL,
	[ExternalURL] [nvarchar](255) NULL,
	[AutomaticLink] [bit] NOT NULL,
	[FetchData] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Changed] [datetime] NOT NULL,
	[Saved] [datetime] NOT NULL,
	[StartPublish] [datetime] NULL,
	[StopPublish] [datetime] NULL,
	[Version] [int] NULL,
	[Status] [int] NOT NULL,
	[DelayPublishUntil] [datetime] NULL,
 CONSTRAINT [PK_tblContentLanguage] PRIMARY KEY CLUSTERED 
(
	[fkContentID] ASC,
	[fkLanguageBranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageLanguage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageLanguage]
AS
SELECT
	[fkContentID] AS fkPageID,
	[fkLanguageBranchID],
	[ContentLinkGUID] AS PageLinkGUID,
	[fkFrameID],
	[CreatorName],
    [ChangedByName],
    [ContentGUID] AS PageGUID,
    [Name],
    [URLSegment],
    [LinkURL],
	[BlobUri],
	[ThumbnailUri],
    [ExternalURL],
    [AutomaticLink],
    [FetchData],
    CASE WHEN Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PendingPublish,
    [Created],
    [Changed],
    [Saved],
    [StartPublish],
    [StopPublish],
    [Version],
	[Status]
FROM    dbo.tblContentLanguage
GO
/****** Object:  Table [dbo].[tblWorkContent]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkContent](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkContentID] [int] NOT NULL,
	[fkMasterVersionID] [int] NULL,
	[ContentLinkGUID] [uniqueidentifier] NULL,
	[fkFrameID] [int] NULL,
	[ArchiveContentGUID] [uniqueidentifier] NULL,
	[ChangedByName] [nvarchar](255) NOT NULL,
	[NewStatusByName] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[URLSegment] [nvarchar](255) NULL,
	[LinkURL] [nvarchar](255) NULL,
	[BlobUri] [nvarchar](255) NULL,
	[ThumbnailUri] [nvarchar](255) NULL,
	[ExternalURL] [nvarchar](255) NULL,
	[VisibleInMenu] [bit] NOT NULL,
	[LinkType] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Saved] [datetime] NOT NULL,
	[StartPublish] [datetime] NULL,
	[StopPublish] [datetime] NULL,
	[ChildOrderRule] [int] NOT NULL,
	[PeerOrder] [int] NOT NULL,
	[ChangedOnPublish] [bit] NOT NULL,
	[RejectComment] [nvarchar](2000) NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[CommonDraft] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[DelayPublishUntil] [datetime] NULL,
 CONSTRAINT [PK_tblWorkContent] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblWorkPage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblWorkPage]
AS
SELECT
	[pkID],
    [fkContentID] AS fkPageID,
    [fkMasterVersionID],
    [ContentLinkGUID] AS PageLinkGUID,
    [fkFrameID],
    [ArchiveContentGUID] as ArchivePageGUID,
    [ChangedByName],
    [NewStatusByName],
    [Name],
    [URLSegment],
    [LinkURL],
	[BlobUri],
	[ThumbnailUri],
    [ExternalURL],
    [VisibleInMenu],
    [LinkType],
    [Created],
    [Saved],
    [StartPublish],
    [StopPublish],
    [ChildOrderRule],
    [PeerOrder],
    CASE WHEN Status = 3 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS ReadyToPublish,
    [ChangedOnPublish],
    CASE WHEN Status IN (4, 5) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS HasBeenPublished,
    CASE WHEN Status = 1 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS Rejected,
    CASE WHEN Status = 6 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS DelayedPublish,
    [RejectComment],
    [fkLanguageBranchID],
	[CommonDraft]
FROM    dbo.tblWorkContent
GO
/****** Object:  Table [dbo].[tblContentTypeToContentType]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentTypeToContentType](
	[fkContentTypeParentID] [int] NOT NULL,
	[fkContentTypeChildID] [int] NOT NULL,
	[Access] [int] NOT NULL,
	[Availability] [int] NOT NULL,
	[Allow] [bit] NULL,
 CONSTRAINT [PK_tblContentTypeToContentType] PRIMARY KEY CLUSTERED 
(
	[fkContentTypeParentID] ASC,
	[fkContentTypeChildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageTypeToPageType]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageTypeToPageType]
AS
SELECT
	[fkContentTypeParentID] AS fkPageTypeParentID,
	[fkContentTypeChildID] AS fkPageTypeChildID,
	[Access],
	[Availability],
	[Allow]
FROM    dbo.tblContentTypeToContentType
GO
/****** Object:  Table [dbo].[tblContentTypeDefault]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentTypeDefault](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkContentTypeID] [int] NOT NULL,
	[fkContentLinkID] [int] NULL,
	[fkFrameID] [int] NULL,
	[fkArchiveContentID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[VisibleInMenu] [bit] NOT NULL,
	[StartPublishOffsetValue] [int] NULL,
	[StartPublishOffsetType] [nchar](1) NULL,
	[StopPublishOffsetValue] [int] NULL,
	[StopPublishOffsetType] [nchar](1) NULL,
	[ChildOrderRule] [int] NOT NULL,
	[PeerOrder] [int] NOT NULL,
	[StartPublishOffset] [int] NULL,
	[StopPublishOffset] [int] NULL,
 CONSTRAINT [PK_tblContentTypeDefault] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageTypeDefault]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageTypeDefault]
AS
SELECT
	[pkID],
	[fkContentTypeID] AS fkPageTypeID,
	[fkContentLinkID] AS fkPageLinkID,
	[fkFrameID],
	[fkArchiveContentID] AS fkArchivePageID,
	[Name],
	[VisibleInMenu],
	[StartPublishOffsetValue],
	[StartPublishOffsetType],
	[StopPublishOffsetValue],
	[StopPublishOffsetType],
	[ChildOrderRule],
	[PeerOrder],
	[StartPublishOffset],
	[StopPublishOffset]
FROM    dbo.tblContentTypeDefault
GO
/****** Object:  Table [dbo].[tblContentType]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentType](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeGUID] [uniqueidentifier] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Saved] [datetime] NULL,
	[SavedBy] [nvarchar](255) NULL,
	[DefaultWebFormTemplate] [nvarchar](1024) NULL,
	[DefaultMvcController] [nvarchar](1024) NULL,
	[DefaultMvcPartialView] [nvarchar](255) NULL,
	[Filename] [nvarchar](255) NULL,
	[ModelType] [nvarchar](1024) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[IdString] [nvarchar](50) NULL,
	[Available] [bit] NULL,
	[SortOrder] [int] NULL,
	[MetaDataInherit] [int] NOT NULL,
	[MetaDataDefault] [int] NOT NULL,
	[WorkflowEditFields] [bit] NULL,
	[ACL] [nvarchar](max) NULL,
	[ContentType] [int] NOT NULL,
	[Base] [nvarchar](50) NULL,
	[Version] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblContentType] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageType]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageType]
AS
SELECT
  [pkID],
  [ContentTypeGUID] AS PageTypeGUID,
  [Created],
  [DefaultWebFormTemplate],
  [DefaultMvcController],
  [Filename],
  [ModelType],
  [Name],
  [DisplayName],
  [Description],
  [IdString],
  [Available],
  [SortOrder],
  [MetaDataInherit],
  [MetaDataDefault],
  [WorkflowEditFields],
  [ACL],
  [ContentType]
FROM    dbo.tblContentType
GO
/****** Object:  Table [dbo].[tblPropertyDefinitionType]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPropertyDefinitionType](
	[pkID] [int] NOT NULL,
	[Property] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[GUID] [uniqueidentifier] NULL,
	[TypeName] [nvarchar](255) NULL,
	[AssemblyName] [nvarchar](255) NULL,
	[fkContentTypeGUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblPropertyDefinitionType] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageDefinitionType]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageDefinitionType]
AS
SELECT
	[pkID],
	[Property],
	[Name],
	[TypeName],
	[AssemblyName],
	[fkContentTypeGUID] AS fkPageTypeGUID
FROM    dbo.tblPropertyDefinitionType
GO
/****** Object:  Table [dbo].[tblPropertyDefinitionGroup]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPropertyDefinitionGroup](
	[pkID] [int] IDENTITY(100,1) NOT NULL,
	[SystemGroup] [bit] NOT NULL,
	[Access] [int] NOT NULL,
	[GroupVisible] [bit] NOT NULL,
	[GroupOrder] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[DisplayName] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblPropertyDefinitionGroup] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageDefinitionGroup]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageDefinitionGroup]
AS
SELECT
	[pkID],
	[SystemGroup],
	[Access],
	[GroupVisible],
	[GroupOrder],
	[Name],
	[DisplayName]
FROM    dbo.tblPropertyDefinitionGroup
GO
/****** Object:  Table [dbo].[tblPropertyDefinition]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPropertyDefinition](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkContentTypeID] [int] NULL,
	[fkPropertyDefinitionTypeID] [int] NULL,
	[FieldOrder] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Property] [int] NOT NULL,
	[Required] [bit] NULL,
	[Advanced] [int] NULL,
	[Searchable] [bit] NULL,
	[EditCaption] [nvarchar](255) NULL,
	[HelpText] [nvarchar](2000) NULL,
	[ObjectProgID] [nvarchar](255) NULL,
	[DefaultValueType] [int] NOT NULL,
	[LongStringSettings] [int] NOT NULL,
	[SettingsID] [uniqueidentifier] NULL,
	[LanguageSpecific] [int] NOT NULL,
	[DisplayEditUI] [bit] NULL,
	[ExistsOnModel] [bit] NOT NULL,
	[EditorHint] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblPropertyDefinition] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPageDefinition]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPageDefinition]
AS
SELECT  [pkID],
		[fkContentTypeID] AS fkPageTypeID,
		[fkPropertyDefinitionTypeID] AS fkPageDefinitionTypeID,
		[FieldOrder],
		[Name],
		[Property],
		[Required],
		[Advanced],
		[Searchable],
		[EditCaption],
		[HelpText],
		[ObjectProgID],
		[DefaultValueType],
		[LongStringSettings],
		[SettingsID],
		[LanguageSpecific],
		[DisplayEditUI],
		[ExistsOnModel],
        [EditorHint]
FROM    dbo.tblPropertyDefinition
GO
/****** Object:  Table [dbo].[tblContent]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContent](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkContentTypeID] [int] NOT NULL,
	[fkParentID] [int] NULL,
	[ArchiveContentGUID] [uniqueidentifier] NULL,
	[CreatorName] [nvarchar](255) NULL,
	[ContentGUID] [uniqueidentifier] NOT NULL,
	[VisibleInMenu] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[ChildOrderRule] [int] NOT NULL,
	[PeerOrder] [int] NOT NULL,
	[ContentAssetsID] [uniqueidentifier] NULL,
	[ContentOwnerID] [uniqueidentifier] NULL,
	[DeletedBy] [nvarchar](255) NULL,
	[DeletedDate] [datetime] NULL,
	[fkMasterLanguageBranchID] [int] NOT NULL,
	[ContentPath] [varchar](900) NOT NULL,
	[ContentType] [int] NOT NULL,
	[IsLeafNode] [bit] NOT NULL,
 CONSTRAINT [PK_tblContent] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblPage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblPage]
AS
SELECT  [pkID],
		[fkContentTypeID] AS fkPageTypeID,
		[fkParentID],
		[ArchiveContentGUID] AS ArchivePageGUID,
		[CreatorName],
		[ContentGUID] AS PageGUID,
		[VisibleInMenu],
		[Deleted],
		CAST (0 AS BIT) AS PendingPublish,
		[ChildOrderRule],
		[PeerOrder],
		[ContentAssetsID],
		[ContentOwnerID],
		NULL as PublishedVersion,
		[fkMasterLanguageBranchID],
		[ContentPath] AS PagePath,
		[ContentType],
		[DeletedBy],
		[DeletedDate]
FROM    dbo.tblContent
GO
/****** Object:  Table [dbo].[tblContentCategory]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentCategory](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkContentID] [int] NOT NULL,
	[fkCategoryID] [int] NOT NULL,
	[CategoryType] [int] NOT NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[ScopeName] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_tblContentCategory] PRIMARY KEY NONCLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentCategory_fkContentID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblContentCategory_fkContentID] ON [dbo].[tblContentCategory]
(
	[fkContentID] ASC,
	[CategoryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblCategoryPage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblCategoryPage]
AS
SELECT  [fkContentID] AS fkPageID,
		[fkCategoryID],
		[CategoryType],
		[fkLanguageBranchID]
FROM    dbo.tblContentCategory
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ApplicationName] [nvarchar](235) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[LastLoginDate] [datetime2](7) NULL,
	[LastLockoutDate] [datetime2](7) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](max) NOT NULL,
	[PropertyValueStrings] [nvarchar](max) NOT NULL,
	[PropertyValueBinary] [varbinary](max) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblActivityLogAssociation]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivityLogAssociation](
	[From] [nvarchar](255) NOT NULL,
	[To] [bigint] NOT NULL,
 CONSTRAINT [PK_tblActivityLogAssociation] PRIMARY KEY NONCLUSTERED 
(
	[From] ASC,
	[To] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblActivityLogAssociation_From]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblActivityLogAssociation_From] ON [dbo].[tblActivityLogAssociation]
(
	[From] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblActivityLogComment]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActivityLogComment](
	[pkID] [bigint] IDENTITY(1,1) NOT NULL,
	[EntryId] [bigint] NOT NULL,
	[Author] [nvarchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblActivityLogComment] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApproval]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApproval](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkApprovalDefinitionVersionID] [int] NOT NULL,
	[ApprovalKey] [nvarchar](255) NOT NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[ActiveStepIndex] [int] NOT NULL,
	[ActiveStepStarted] [datetime2](7) NOT NULL,
	[StepCount] [int] NOT NULL,
	[StartedBy] [nvarchar](255) NOT NULL,
	[Started] [datetime2](7) NOT NULL,
	[Completed] [datetime2](7) NULL,
	[ApprovalStatus] [int] NOT NULL,
	[CompletedComment] [nvarchar](max) NULL,
	[CompletedBy] [nvarchar](255) NULL,
	[RequireCommentOnApprove] [bit] NOT NULL,
	[RequireCommentOnReject] [bit] NOT NULL,
	[RequireCommentOnStart] [bit] NOT NULL,
 CONSTRAINT [PK_tblApproval] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApprovalDefinition]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApprovalDefinition](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[ApprovalDefinitionKey] [nvarchar](255) NOT NULL,
	[fkCurrentApprovalDefinitionVersionID] [int] NULL,
 CONSTRAINT [PK_tblApprovalDefinition] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApprovalDefinitionReviewer]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApprovalDefinitionReviewer](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkApprovalDefinitionStepID] [int] NOT NULL,
	[fkApprovalDefinitionVersionID] [int] NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[fkLanguageBranchID] [int] NOT NULL,
	[ReviewerType] [int] NOT NULL,
 CONSTRAINT [PK_tblApprovalDefinitionReviewer] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApprovalDefinitionStep]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApprovalDefinitionStep](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkApprovalDefinitionVersionID] [int] NOT NULL,
	[StepIndex] [int] NOT NULL,
	[StepName] [nvarchar](255) NULL,
	[ApprovesNeeded] [int] NULL,
	[SelfApprove] [bit] NULL,
 CONSTRAINT [PK_tblApprovalDefinitionStep] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApprovalDefinitionVersion]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApprovalDefinitionVersion](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkApprovalDefinitionID] [int] NOT NULL,
	[SavedBy] [nvarchar](255) NOT NULL,
	[Saved] [datetime2](7) NOT NULL,
	[RequireCommentOnApprove] [bit] NOT NULL,
	[RequireCommentOnReject] [bit] NOT NULL,
	[RequireCommentOnStart] [bit] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[ApprovesNeeded] [int] NOT NULL,
	[SelfApprove] [bit] NOT NULL,
 CONSTRAINT [PK_tblApprovalDefinitionVersion] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblApprovalStepDecision]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblApprovalStepDecision](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkApprovalID] [int] NOT NULL,
	[StepIndex] [int] NOT NULL,
	[Approve] [bit] NOT NULL,
	[DecisionScope] [int] NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[DecisionTimeStamp] [datetime2](7) NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblApprovalStepDecision] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBigTableReference]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBigTableReference](
	[pkId] [bigint] NOT NULL,
	[Type] [int] NOT NULL,
	[PropertyName] [nvarchar](75) NOT NULL,
	[CollectionType] [nvarchar](2000) NULL,
	[ElementType] [nvarchar](2000) NULL,
	[ElementStoreName] [nvarchar](375) NULL,
	[IsKey] [bit] NOT NULL,
	[Index] [int] NOT NULL,
	[BooleanValue] [bit] NULL,
	[IntegerValue] [int] NULL,
	[LongValue] [bigint] NULL,
	[DateTimeValue] [datetime] NULL,
	[GuidValue] [uniqueidentifier] NULL,
	[FloatValue] [float] NULL,
	[StringValue] [nvarchar](max) NULL,
	[BinaryValue] [varbinary](max) NULL,
	[RefIdValue] [bigint] NULL,
	[ExternalIdValue] [bigint] NULL,
	[DecimalValue] [decimal](18, 3) NULL,
 CONSTRAINT [PK_tblBigTableReference] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC,
	[PropertyName] ASC,
	[IsKey] ASC,
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBigTableStoreConfig]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBigTableStoreConfig](
	[pkId] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
	[TableName] [nvarchar](128) NULL,
	[EntityTypeId] [int] NULL,
	[DateTimeKind] [int] NOT NULL,
 CONSTRAINT [PK_tblBigTableStoreConfig] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBigTableStoreInfo]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBigTableStoreInfo](
	[fkStoreId] [bigint] NOT NULL,
	[PropertyName] [nvarchar](75) NOT NULL,
	[PropertyMapType] [nvarchar](64) NOT NULL,
	[PropertyIndex] [int] NOT NULL,
	[PropertyType] [nvarchar](2000) NOT NULL,
	[Active] [bit] NOT NULL,
	[Version] [int] NOT NULL,
	[ColumnName] [nvarchar](128) NULL,
	[ColumnRowIndex] [int] NULL,
 CONSTRAINT [PK_tblBigTableStoreInfo] PRIMARY KEY CLUSTERED 
(
	[fkStoreId] ASC,
	[PropertyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlobPendingDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlobPendingDelete](
	[pkID] [bigint] IDENTITY(1,1) NOT NULL,
	[fkContentId] [int] NOT NULL,
	[BlobUri] [nvarchar](255) NOT NULL,
	[Provider] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblBlobPendingDelete] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkParentID] [int] NULL,
	[CategoryGUID] [uniqueidentifier] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Available] [bit] NOT NULL,
	[Selectable] [bit] NOT NULL,
	[SuperCategory] [bit] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryDescription] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChangeNotificationConnection]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChangeNotificationConnection](
	[ConnectionId] [uniqueidentifier] NOT NULL,
	[ProcessorId] [uniqueidentifier] NOT NULL,
	[IsOpen] [bit] NOT NULL,
	[LastActivityDbUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeNotificationConnection] PRIMARY KEY CLUSTERED 
(
	[ConnectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChangeNotificationProcessor]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChangeNotificationProcessor](
	[ProcessorId] [uniqueidentifier] NOT NULL,
	[ChangeNotificationDataType] [nvarchar](30) NOT NULL,
	[ProcessorName] [nvarchar](4000) NOT NULL,
	[ProcessorStatus] [nvarchar](30) NOT NULL,
	[NextQueueOrderValue] [int] NOT NULL,
	[LastConsistentDbUtc] [datetime] NULL,
 CONSTRAINT [PK_ChangeNotificationProcessor] PRIMARY KEY CLUSTERED 
(
	[ProcessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChangeNotificationQueuedGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChangeNotificationQueuedGuid](
	[ProcessorId] [uniqueidentifier] NOT NULL,
	[ConnectionId] [uniqueidentifier] NULL,
	[QueueOrder] [int] NOT NULL,
	[Value] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblChangeNotificationQueuedGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblChangeNotificationQueuedGuid] ON [dbo].[tblChangeNotificationQueuedGuid]
(
	[ProcessorId] ASC,
	[QueueOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChangeNotificationQueuedInt]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChangeNotificationQueuedInt](
	[ProcessorId] [uniqueidentifier] NOT NULL,
	[ConnectionId] [uniqueidentifier] NULL,
	[QueueOrder] [int] NOT NULL,
	[Value] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblChangeNotificationQueuedInt]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblChangeNotificationQueuedInt] ON [dbo].[tblChangeNotificationQueuedInt]
(
	[ProcessorId] ASC,
	[QueueOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChangeNotificationQueuedString]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChangeNotificationQueuedString](
	[ProcessorId] [uniqueidentifier] NOT NULL,
	[ConnectionId] [uniqueidentifier] NULL,
	[QueueOrder] [int] NOT NULL,
	[Value] [nvarchar](450) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblChangeNotificationQueuedString]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblChangeNotificationQueuedString] ON [dbo].[tblChangeNotificationQueuedString]
(
	[ProcessorId] ASC,
	[QueueOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContentAccess]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentAccess](
	[fkContentID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsRole] [int] NOT NULL,
	[AccessMask] [int] NOT NULL,
 CONSTRAINT [PK_tblContentAccess] PRIMARY KEY CLUSTERED 
(
	[fkContentID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblContentSoftlink]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContentSoftlink](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkOwnerContentID] [int] NOT NULL,
	[fkReferencedContentGUID] [uniqueidentifier] NULL,
	[OwnerLanguageID] [int] NULL,
	[ReferencedLanguageID] [int] NULL,
	[LinkURL] [nvarchar](2048) NOT NULL,
	[LinkType] [int] NOT NULL,
	[LinkProtocol] [nvarchar](10) NULL,
	[ContentLink] [nvarchar](255) NULL,
	[LastCheckedDate] [datetime] NULL,
	[FirstDateBroken] [datetime] NULL,
	[HttpStatusCode] [int] NULL,
	[LinkStatus] [int] NULL,
 CONSTRAINT [PK_tblContentSoftlink] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEntityGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntityGuid](
	[intObjectTypeID] [int] NOT NULL,
	[intObjectID] [int] NOT NULL,
	[unqID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tblEntityGuid] PRIMARY KEY CLUSTERED 
(
	[intObjectTypeID] ASC,
	[intObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEntityType]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEntityType](
	[intID] [int] IDENTITY(1,1) NOT NULL,
	[strName] [varchar](400) NOT NULL,
 CONSTRAINT [PK_tblEntityType] PRIMARY KEY CLUSTERED 
(
	[intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFrame]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFrame](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[FrameName] [nvarchar](100) NOT NULL,
	[FrameDescription] [nvarchar](255) NULL,
	[SystemFrame] [bit] NOT NULL,
 CONSTRAINT [PK_tblFrame] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHostDefinition]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHostDefinition](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkSiteID] [int] NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Type] [int] NOT NULL,
	[Language] [varchar](50) NULL,
	[Https] [bit] NULL,
 CONSTRAINT [PK_tblHostDefinition] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIndexRequestLog]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIndexRequestLog](
	[pkId] [bigint] NOT NULL,
	[Row] [int] NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
	[ItemType] [nvarchar](2000) NOT NULL,
	[Boolean01] [bit] NULL,
	[Boolean02] [bit] NULL,
	[Boolean03] [bit] NULL,
	[Boolean04] [bit] NULL,
	[Boolean05] [bit] NULL,
	[Integer01] [int] NULL,
	[Integer02] [int] NULL,
	[Integer03] [int] NULL,
	[Integer04] [int] NULL,
	[Integer05] [int] NULL,
	[Integer06] [int] NULL,
	[Integer07] [int] NULL,
	[Integer08] [int] NULL,
	[Integer09] [int] NULL,
	[Integer10] [int] NULL,
	[Long01] [bigint] NULL,
	[Long02] [bigint] NULL,
	[Long03] [bigint] NULL,
	[Long04] [bigint] NULL,
	[Long05] [bigint] NULL,
	[DateTime01] [datetime] NULL,
	[DateTime02] [datetime] NULL,
	[DateTime03] [datetime] NULL,
	[DateTime04] [datetime] NULL,
	[DateTime05] [datetime] NULL,
	[Guid01] [uniqueidentifier] NULL,
	[Guid02] [uniqueidentifier] NULL,
	[Guid03] [uniqueidentifier] NULL,
	[Float01] [float] NULL,
	[Float02] [float] NULL,
	[Float03] [float] NULL,
	[Float04] [float] NULL,
	[Float05] [float] NULL,
	[Float06] [float] NULL,
	[Float07] [float] NULL,
	[String01] [nvarchar](max) NULL,
	[String02] [nvarchar](max) NULL,
	[String03] [nvarchar](max) NULL,
	[String04] [nvarchar](max) NULL,
	[String05] [nvarchar](max) NULL,
	[String06] [nvarchar](max) NULL,
	[String07] [nvarchar](max) NULL,
	[String08] [nvarchar](max) NULL,
	[String09] [nvarchar](max) NULL,
	[String10] [nvarchar](max) NULL,
	[Binary01] [varbinary](max) NULL,
	[Binary02] [varbinary](max) NULL,
	[Binary03] [varbinary](max) NULL,
	[Binary04] [varbinary](max) NULL,
	[Binary05] [varbinary](max) NULL,
	[Indexed_Boolean01] [bit] NULL,
	[Indexed_Integer01] [int] NULL,
	[Indexed_Integer02] [int] NULL,
	[Indexed_Integer03] [int] NULL,
	[Indexed_Long01] [bigint] NULL,
	[Indexed_Long02] [bigint] NULL,
	[Indexed_DateTime01] [datetime] NULL,
	[Indexed_Guid01] [uniqueidentifier] NULL,
	[Indexed_Float01] [float] NULL,
	[Indexed_Float02] [float] NULL,
	[Indexed_Float03] [float] NULL,
	[Indexed_String01] [nvarchar](450) NULL,
	[Indexed_String02] [nvarchar](450) NULL,
	[Indexed_String03] [nvarchar](450) NULL,
	[Indexed_Binary01] [varbinary](900) NULL,
 CONSTRAINT [PK_tblIndexRequestLog] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC,
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLanguageBranch]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLanguageBranch](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [nchar](17) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SortIndex] [int] NOT NULL,
	[SystemIconPath] [nvarchar](255) NULL,
	[URLSegment] [nvarchar](255) NULL,
	[ACL] [nvarchar](max) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_tblLanguageBranch] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_tblLanguageBranch] UNIQUE NONCLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMappedIdentity]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMappedIdentity](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](255) NOT NULL,
	[ProviderUniqueId] [nvarchar](450) NOT NULL,
	[ContentGuid] [uniqueidentifier] NOT NULL,
	[ExistingContentId] [int] NULL,
	[ExistingCustomProvider] [bit] NULL,
 CONSTRAINT [PK_tblMappedIdentity] PRIMARY KEY NONCLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblMappedIdentity_ProviderUniqueId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IDX_tblMappedIdentity_ProviderUniqueId] ON [dbo].[tblMappedIdentity]
(
	[ProviderUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotificationMessage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotificationMessage](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](255) NULL,
	[Recipient] [nvarchar](255) NOT NULL,
	[Channel] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Subject] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[Sent] [datetime2](7) NULL,
	[SendAt] [datetime2](7) NULL,
	[Saved] [datetime2](7) NOT NULL,
	[Read] [datetime2](7) NULL,
	[Category] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblNotificationMessage] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotificationSubscription]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotificationSubscription](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[SubscriptionKey] [nvarchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tblNotificationSubscription] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPlugIn]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPlugIn](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[AssemblyName] [nvarchar](255) NOT NULL,
	[TypeName] [nvarchar](255) NOT NULL,
	[Settings] [nvarchar](max) NULL,
	[Saved] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_tblPlugIn] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[PublishingTrackingToken] [nvarchar](255) NULL,
	[DelayPublishUntil] [datetime] NULL,
 CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectItem]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectItem](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkProjectID] [int] NOT NULL,
	[ContentLinkID] [int] NOT NULL,
	[ContentLinkWorkID] [int] NOT NULL,
	[ContentLinkProvider] [nvarchar](255) NOT NULL,
	[Language] [varchar](17) NOT NULL,
	[Category] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tblProjectItem] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProjectMember]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProjectMember](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkProjectID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Type] [smallint] NOT NULL,
 CONSTRAINT [PK_tblProjectMember] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRemoteSite]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRemoteSite](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](255) NOT NULL,
	[IsTrusted] [bit] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Domain] [nvarchar](50) NULL,
	[AllowUrlLookup] [bit] NOT NULL,
 CONSTRAINT [PK_tblRemoteSite] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_tblRemoteSite] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScheduledItem]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblScheduledItem](
	[pkID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Enabled] [bit] NOT NULL,
	[LastExec] [datetime] NULL,
	[LastStatus] [int] NULL,
	[LastText] [nvarchar](max) NULL,
	[NextExec] [datetime] NULL,
	[DatePart] [nchar](2) NULL,
	[Interval] [int] NULL,
	[MethodName] [nvarchar](100) NOT NULL,
	[fStatic] [bit] NOT NULL,
	[TypeName] [nvarchar](1024) NOT NULL,
	[AssemblyName] [nvarchar](100) NOT NULL,
	[InstanceData] [varbinary](max) NULL,
	[IsRunning] [bit] NOT NULL,
	[CurrentStatusMessage] [nvarchar](2048) NULL,
	[LastPing] [datetime] NULL,
	[IsStoppable] [bit] NOT NULL,
	[LastExecutionAttempt] [int] NOT NULL,
	[Restartable] [bit] NOT NULL,
 CONSTRAINT [PK__tblScheduledItem__1940BAED] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblScheduledItemLog]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblScheduledItemLog](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[fkScheduledItemId] [uniqueidentifier] NOT NULL,
	[Exec] [datetime] NOT NULL,
	[Status] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Duration] [bigint] NULL,
	[Server] [nvarchar](255) NULL,
	[Trigger] [int] NULL,
 CONSTRAINT [PK_tblScheduledItemLog] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSiteConfig]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSiteConfig](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [varchar](250) NOT NULL,
	[PropertyName] [varchar](250) NOT NULL,
	[PropertyValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblSiteConfig] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSiteDefinition]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSiteDefinition](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[StartPage] [varchar](255) NULL,
	[SiteUrl] [varchar](max) NULL,
	[SiteAssetsRoot] [varchar](255) NULL,
	[SavedBy] [nvarchar](255) NULL,
	[Saved] [datetime] NULL,
 CONSTRAINT [PK_tblSiteDefinition] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSynchedUser]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSynchedUser](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[LoweredUserName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[GivenName] [nvarchar](255) NULL,
	[LoweredGivenName] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[LoweredSurname] [nvarchar](255) NULL,
	[Metadata] [nvarchar](max) NULL,
	[RolesHash] [int] NULL,
 CONSTRAINT [PK_tblWindowsUser] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSynchedUserRelations]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSynchedUserRelations](
	[fkSynchedUser] [int] NOT NULL,
	[fkSynchedRole] [int] NOT NULL,
 CONSTRAINT [PK_tblSynchedUserRelations] PRIMARY KEY CLUSTERED 
(
	[fkSynchedUser] ASC,
	[fkSynchedRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSynchedUserRole]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSynchedUserRole](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[LoweredRoleName] [nvarchar](255) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_tblSynchedUserRole] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTask]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTask](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[DueDate] [datetime] NULL,
	[OwnerName] [nvarchar](255) NOT NULL,
	[AssignedToName] [nvarchar](255) NOT NULL,
	[AssignedIsRole] [bit] NOT NULL,
	[fkPlugInID] [int] NULL,
	[Status] [int] NOT NULL,
	[Activity] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Changed] [datetime] NOT NULL,
	[WorkflowInstanceId] [nvarchar](36) NULL,
	[EventActivityName] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblTask] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTree]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTree](
	[fkParentID] [int] NOT NULL,
	[fkChildID] [int] NOT NULL,
	[NestingLevel] [smallint] NOT NULL,
 CONSTRAINT [PK_tblTree] PRIMARY KEY CLUSTERED 
(
	[fkParentID] ASC,
	[fkChildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUniqueSequence]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUniqueSequence](
	[Name] [nvarchar](255) NOT NULL,
	[LastValue] [int] NOT NULL,
 CONSTRAINT [PK_tblUniqueSequence] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserPermission]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserPermission](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[IsRole] [int] NOT NULL,
	[Permission] [nvarchar](150) NOT NULL,
	[GroupName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_tblUserPermission] PRIMARY KEY NONCLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblUserPermission_Permission_GroupName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE CLUSTERED INDEX [IX_tblUserPermission_Permission_GroupName] ON [dbo].[tblUserPermission]
(
	[Permission] ASC,
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVisitorGroupStatistic]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVisitorGroupStatistic](
	[pkId] [bigint] NOT NULL,
	[Row] [int] NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
	[ItemType] [nvarchar](2000) NOT NULL,
	[Boolean01] [bit] NULL,
	[Boolean02] [bit] NULL,
	[Boolean03] [bit] NULL,
	[Boolean04] [bit] NULL,
	[Boolean05] [bit] NULL,
	[Integer01] [int] NULL,
	[Integer02] [int] NULL,
	[Integer03] [int] NULL,
	[Integer04] [int] NULL,
	[Integer05] [int] NULL,
	[Integer06] [int] NULL,
	[Integer07] [int] NULL,
	[Integer08] [int] NULL,
	[Integer09] [int] NULL,
	[Integer10] [int] NULL,
	[Long01] [bigint] NULL,
	[Long02] [bigint] NULL,
	[Long03] [bigint] NULL,
	[Long04] [bigint] NULL,
	[Long05] [bigint] NULL,
	[DateTime01] [datetime] NULL,
	[DateTime02] [datetime] NULL,
	[DateTime03] [datetime] NULL,
	[DateTime04] [datetime] NULL,
	[DateTime05] [datetime] NULL,
	[Guid01] [uniqueidentifier] NULL,
	[Guid02] [uniqueidentifier] NULL,
	[Guid03] [uniqueidentifier] NULL,
	[Float01] [float] NULL,
	[Float02] [float] NULL,
	[Float03] [float] NULL,
	[Float04] [float] NULL,
	[Float05] [float] NULL,
	[Float06] [float] NULL,
	[Float07] [float] NULL,
	[String01] [nvarchar](max) NULL,
	[String02] [nvarchar](max) NULL,
	[String03] [nvarchar](max) NULL,
	[String04] [nvarchar](max) NULL,
	[String05] [nvarchar](max) NULL,
	[String06] [nvarchar](max) NULL,
	[String07] [nvarchar](max) NULL,
	[String08] [nvarchar](max) NULL,
	[String09] [nvarchar](max) NULL,
	[String10] [nvarchar](max) NULL,
	[Binary01] [varbinary](max) NULL,
	[Binary02] [varbinary](max) NULL,
	[Binary03] [varbinary](max) NULL,
	[Binary04] [varbinary](max) NULL,
	[Binary05] [varbinary](max) NULL,
	[Indexed_Boolean01] [bit] NULL,
	[Indexed_Integer01] [int] NULL,
	[Indexed_Integer02] [int] NULL,
	[Indexed_Integer03] [int] NULL,
	[Indexed_Long01] [bigint] NULL,
	[Indexed_Long02] [bigint] NULL,
	[Indexed_DateTime01] [datetime] NULL,
	[Indexed_Guid01] [uniqueidentifier] NULL,
	[Indexed_Float01] [float] NULL,
	[Indexed_Float02] [float] NULL,
	[Indexed_Float03] [float] NULL,
	[Indexed_String01] [nvarchar](450) NULL,
	[Indexed_String02] [nvarchar](450) NULL,
	[Indexed_String03] [nvarchar](450) NULL,
	[Indexed_Binary01] [varbinary](900) NULL,
 CONSTRAINT [PK_tblVisitorGroupStatistic] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC,
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXFormData]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXFormData](
	[pkId] [bigint] NOT NULL,
	[Row] [int] NOT NULL,
	[StoreName] [nvarchar](375) NOT NULL,
	[ItemType] [nvarchar](2000) NOT NULL,
	[ChannelOptions] [int] NULL,
	[DatePosted] [datetime] NULL,
	[FormId] [uniqueidentifier] NULL,
	[PageGuid] [uniqueidentifier] NULL,
	[UserName] [nvarchar](450) NULL,
	[String01] [nvarchar](max) NULL,
	[String02] [nvarchar](max) NULL,
	[String03] [nvarchar](max) NULL,
	[String04] [nvarchar](max) NULL,
	[String05] [nvarchar](max) NULL,
	[String06] [nvarchar](max) NULL,
	[String07] [nvarchar](max) NULL,
	[String08] [nvarchar](max) NULL,
	[String09] [nvarchar](max) NULL,
	[String10] [nvarchar](max) NULL,
	[String11] [nvarchar](max) NULL,
	[String12] [nvarchar](max) NULL,
	[String13] [nvarchar](max) NULL,
	[String14] [nvarchar](max) NULL,
	[String15] [nvarchar](max) NULL,
	[String16] [nvarchar](max) NULL,
	[String17] [nvarchar](max) NULL,
	[String18] [nvarchar](max) NULL,
	[String19] [nvarchar](max) NULL,
	[String20] [nvarchar](max) NULL,
	[Indexed_String01] [nvarchar](450) NULL,
	[Indexed_String02] [nvarchar](450) NULL,
	[Indexed_String03] [nvarchar](450) NULL,
 CONSTRAINT [PK_tblXFormData] PRIMARY KEY CLUSTERED 
(
	[pkId] ASC,
	[Row] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblActivityLog_ChangeDate]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblActivityLog_ChangeDate] ON [dbo].[tblActivityLog]
(
	[ChangeDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblActivityLog_Pkid_ChangeDate]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblActivityLog_Pkid_ChangeDate] ON [dbo].[tblActivityLog]
(
	[pkID] ASC,
	[ChangeDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblActivityLog_RelatedItem]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblActivityLog_RelatedItem] ON [dbo].[tblActivityLog]
(
	[RelatedItem] ASC
)
INCLUDE([Deleted]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblActivityLogAssociation_To]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblActivityLogAssociation_To] ON [dbo].[tblActivityLogAssociation]
(
	[To] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblActivityLogComment_EntryId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblActivityLogComment_EntryId] ON [dbo].[tblActivityLogComment]
(
	[EntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblApproval_ApprovalKeyAndStatus]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApproval_ApprovalKeyAndStatus] ON [dbo].[tblApproval]
(
	[ApprovalKey] ASC,
	[ApprovalStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblApproval_fkApprovalDefinitionVersionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApproval_fkApprovalDefinitionVersionID] ON [dbo].[tblApproval]
(
	[fkApprovalDefinitionVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblApprovalDefinition_ApprovalDefinitionKey]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApprovalDefinition_ApprovalDefinitionKey] ON [dbo].[tblApprovalDefinition]
(
	[ApprovalDefinitionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblApprovalDefinition_fkCurrentApprovalDefinitionVersionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApprovalDefinition_fkCurrentApprovalDefinitionVersionID] ON [dbo].[tblApprovalDefinition]
(
	[fkCurrentApprovalDefinitionVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblApprovalDefinitionReviewer_fkApprovalDefinitionVersionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApprovalDefinitionReviewer_fkApprovalDefinitionVersionID] ON [dbo].[tblApprovalDefinitionReviewer]
(
	[fkApprovalDefinitionVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblApprovalDefinitionReviewer_Username]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApprovalDefinitionReviewer_Username] ON [dbo].[tblApprovalDefinitionReviewer]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblApprovalDefinitionStep_fkApprovalDefinitionVersionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApprovalDefinitionStep_fkApprovalDefinitionVersionID] ON [dbo].[tblApprovalDefinitionStep]
(
	[fkApprovalDefinitionVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblApprovalDefinitionVersion_fkApprovalDefinitionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApprovalDefinitionVersion_fkApprovalDefinitionID] ON [dbo].[tblApprovalDefinitionVersion]
(
	[fkApprovalDefinitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblApprovalStepDecision_fkApprovalID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblApprovalStepDecision_fkApprovalID] ON [dbo].[tblApprovalStepDecision]
(
	[fkApprovalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Binary01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Binary01] ON [dbo].[tblBigTable]
(
	[Indexed_Binary01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Boolean01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Boolean01] ON [dbo].[tblBigTable]
(
	[Indexed_Boolean01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_DateTime01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_DateTime01] ON [dbo].[tblBigTable]
(
	[Indexed_DateTime01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Decimal01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Decimal01] ON [dbo].[tblBigTable]
(
	[Indexed_Decimal01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Float01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Float01] ON [dbo].[tblBigTable]
(
	[Indexed_Float01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Float02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Float02] ON [dbo].[tblBigTable]
(
	[Indexed_Float02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Float03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Float03] ON [dbo].[tblBigTable]
(
	[Indexed_Float03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Guid01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Guid01] ON [dbo].[tblBigTable]
(
	[Indexed_Guid01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Integer01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Integer01] ON [dbo].[tblBigTable]
(
	[Indexed_Integer01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Integer02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Integer02] ON [dbo].[tblBigTable]
(
	[Indexed_Integer02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Integer03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Integer03] ON [dbo].[tblBigTable]
(
	[Indexed_Integer03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Long01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Long01] ON [dbo].[tblBigTable]
(
	[Indexed_Long01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_Long02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_Long02] ON [dbo].[tblBigTable]
(
	[Indexed_Long02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_String01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_String01] ON [dbo].[tblBigTable]
(
	[Indexed_String01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_String02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_String02] ON [dbo].[tblBigTable]
(
	[Indexed_String02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblBigTable_Indexed_String03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_Indexed_String03] ON [dbo].[tblBigTable]
(
	[Indexed_String03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblBigTable_StoreName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTable_StoreName] ON [dbo].[tblBigTable]
(
	[StoreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTableIdentity_Guid]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTableIdentity_Guid] ON [dbo].[tblBigTableIdentity]
(
	[Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblBigTableReference_RefIdValue]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTableReference_RefIdValue] ON [dbo].[tblBigTableReference]
(
	[RefIdValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblBigTableStoreConfig_StoreName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblBigTableStoreConfig_StoreName] ON [dbo].[tblBigTableStoreConfig]
(
	[StoreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblCategory_Unique]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_tblCategory_Unique] ON [dbo].[tblCategory]
(
	[fkParentID] ASC,
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContent_ArchiveContentGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContent_ArchiveContentGUID] ON [dbo].[tblContent]
(
	[ArchiveContentGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContent_ContentGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_tblContent_ContentGUID] ON [dbo].[tblContent]
(
	[ContentGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblContent_ContentPath]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContent_ContentPath] ON [dbo].[tblContent]
(
	[ContentPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContent_ContentType]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContent_ContentType] ON [dbo].[tblContent]
(
	[ContentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContent_fkContentTypeID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContent_fkContentTypeID] ON [dbo].[tblContent]
(
	[fkContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContent_fkParentID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContent_fkParentID] ON [dbo].[tblContent]
(
	[fkParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentCategory_fkCategoryID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentCategory_fkCategoryID] ON [dbo].[tblContentCategory]
(
	[fkCategoryID] ASC
)
INCLUDE([fkContentID],[CategoryType],[fkLanguageBranchID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentLanguage_ContentGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_tblContentLanguage_ContentGUID] ON [dbo].[tblContentLanguage]
(
	[ContentGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentLanguage_ContentLinkGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentLanguage_ContentLinkGUID] ON [dbo].[tblContentLanguage]
(
	[ContentLinkGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblContentLanguage_ExternalURL]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentLanguage_ExternalURL] ON [dbo].[tblContentLanguage]
(
	[ExternalURL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblContentLanguage_Name]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentLanguage_Name] ON [dbo].[tblContentLanguage]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblContentLanguage_URLSegment]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentLanguage_URLSegment] ON [dbo].[tblContentLanguage]
(
	[URLSegment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentLanguage_Version]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentLanguage_Version] ON [dbo].[tblContentLanguage]
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentProperty_ContentLink]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentProperty_ContentLink] ON [dbo].[tblContentProperty]
(
	[ContentLink] ASC,
	[LinkGuid] ASC
)
INCLUDE([fkPropertyDefinitionID],[fkContentID],[fkLanguageBranchID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentProperty_ContentTypeID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentProperty_ContentTypeID] ON [dbo].[tblContentProperty]
(
	[ContentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentProperty_fkPropertyDefinitionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentProperty_fkPropertyDefinitionID] ON [dbo].[tblContentProperty]
(
	[fkPropertyDefinitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblContentProperty_ScopeName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentProperty_ScopeName] ON [dbo].[tblContentProperty]
(
	[ScopeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblContentProperty_guid]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblContentProperty_guid] ON [dbo].[tblContentProperty]
(
	[guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblContentSoftlink_ContentLink]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentSoftlink_ContentLink] ON [dbo].[tblContentSoftlink]
(
	[ContentLink] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentSoftlink_fkContentID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentSoftlink_fkContentID] ON [dbo].[tblContentSoftlink]
(
	[fkOwnerContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentSoftlink_fkReferencedContentGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblContentSoftlink_fkReferencedContentGUID] ON [dbo].[tblContentSoftlink]
(
	[fkReferencedContentGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblContentType_ContentTypeGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_tblContentType_ContentTypeGUID] ON [dbo].[tblContentType]
(
	[ContentTypeGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblContentType_Name]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_tblContentType_Name] ON [dbo].[tblContentType]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblHostDefinition_fkID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblHostDefinition_fkID] ON [dbo].[tblHostDefinition]
(
	[fkSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblIndexRequestLog_Indexed_DateTime01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblIndexRequestLog_Indexed_DateTime01] ON [dbo].[tblIndexRequestLog]
(
	[Indexed_DateTime01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblIndexRequestLog_Indexed_String01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblIndexRequestLog_Indexed_String01] ON [dbo].[tblIndexRequestLog]
(
	[Indexed_String01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblIndexRequestLog_StoreName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblIndexRequestLog_StoreName] ON [dbo].[tblIndexRequestLog]
(
	[StoreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblMappedIdentity_ContentGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_tblMappedIdentity_ContentGuid] ON [dbo].[tblMappedIdentity]
(
	[ContentGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblMappedIdentity_ExternalId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblMappedIdentity_ExternalId] ON [dbo].[tblMappedIdentity]
(
	[ExistingContentId] ASC,
	[ExistingCustomProvider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblMappedIdentity_Provider]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblMappedIdentity_Provider] ON [dbo].[tblMappedIdentity]
(
	[Provider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblNotificationMessage_Read]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblNotificationMessage_Read] ON [dbo].[tblNotificationMessage]
(
	[Read] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblNotificationMessage_SendAt]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblNotificationMessage_SendAt] ON [dbo].[tblNotificationMessage]
(
	[SendAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblNotificationMessage_Sent]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblNotificationMessage_Sent] ON [dbo].[tblNotificationMessage]
(
	[Sent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblNotificationSubscription_SubscriptionKey]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblNotificationSubscription_SubscriptionKey] ON [dbo].[tblNotificationSubscription]
(
	[SubscriptionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblNotificationSubscription_UserName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblNotificationSubscription_UserName] ON [dbo].[tblNotificationSubscription]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblProject_StatusName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblProject_StatusName] ON [dbo].[tblProject]
(
	[Status] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblProjectItem_ContentLink]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblProjectItem_ContentLink] ON [dbo].[tblProjectItem]
(
	[ContentLinkID] ASC,
	[ContentLinkProvider] ASC,
	[ContentLinkWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblProjectItem_fkProjectID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblProjectItem_fkProjectID] ON [dbo].[tblProjectItem]
(
	[fkProjectID] ASC,
	[Category] ASC,
	[Language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblProjectMember_fkProjectID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblProjectMember_fkProjectID] ON [dbo].[tblProjectMember]
(
	[fkProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblPropertyDefinition_ContentTypeAndName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_tblPropertyDefinition_ContentTypeAndName] ON [dbo].[tblPropertyDefinition]
(
	[fkContentTypeID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblPropertyDefinition_fkContentTypeID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblPropertyDefinition_fkContentTypeID] ON [dbo].[tblPropertyDefinition]
(
	[fkContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblPropertyDefinition_fkPropertyDefinitionTypeID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblPropertyDefinition_fkPropertyDefinitionTypeID] ON [dbo].[tblPropertyDefinition]
(
	[fkPropertyDefinitionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblPropertyDefinition_Name]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblPropertyDefinition_Name] ON [dbo].[tblPropertyDefinition]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblScheduledItemLog_fkScheduledItemId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblScheduledItemLog_fkScheduledItemId] ON [dbo].[tblScheduledItemLog]
(
	[fkScheduledItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblSiteConfig]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblSiteConfig] ON [dbo].[tblSiteConfig]
(
	[SiteID] ASC,
	[PropertyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblSiteDefinition_UniqueId]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblSiteDefinition_UniqueId] ON [dbo].[tblSiteDefinition]
(
	[UniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblWindowsUser_Email]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblWindowsUser_Email] ON [dbo].[tblSynchedUser]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblWindowsUser_LoweredGivenName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblWindowsUser_LoweredGivenName] ON [dbo].[tblSynchedUser]
(
	[LoweredGivenName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblWindowsUser_LoweredSurname]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblWindowsUser_LoweredSurname] ON [dbo].[tblSynchedUser]
(
	[LoweredSurname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblWindowsUser_Unique]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblWindowsUser_Unique] ON [dbo].[tblSynchedUser]
(
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tblSynchedUserRole_Unique]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblSynchedUserRole_Unique] ON [dbo].[tblSynchedUserRole]
(
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Binary01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Binary01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Binary01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Boolean01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Boolean01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Boolean01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_DateTime01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_DateTime01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_DateTime01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Decimal01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Decimal01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Decimal01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Float01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Float01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Float01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Float02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Float02] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Float02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Float03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Float03] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Float03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Guid01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Guid01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Guid01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Integer01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Integer01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Integer01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Integer02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Integer02] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Integer02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Integer03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Integer03] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Integer03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Long01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Long01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Long01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_Long02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_Long02] ON [dbo].[tblSystemBigTable]
(
	[Indexed_Long02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_String01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_String01] ON [dbo].[tblSystemBigTable]
(
	[Indexed_String01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_String02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_String02] ON [dbo].[tblSystemBigTable]
(
	[Indexed_String02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblSystemBigTable_Indexed_String03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_Indexed_String03] ON [dbo].[tblSystemBigTable]
(
	[Indexed_String03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblSystemBigTable_StoreName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblSystemBigTable_StoreName] ON [dbo].[tblSystemBigTable]
(
	[StoreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblTaskInformation_Indexed_DateTime01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTaskInformation_Indexed_DateTime01] ON [dbo].[tblTaskInformation]
(
	[Indexed_DateTime01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblTaskInformation_Indexed_DateTime02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTaskInformation_Indexed_DateTime02] ON [dbo].[tblTaskInformation]
(
	[Indexed_DateTime02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblTaskInformation_Indexed_Guid01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTaskInformation_Indexed_Guid01] ON [dbo].[tblTaskInformation]
(
	[Indexed_Guid01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblTaskInformation_Indexed_Integer01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTaskInformation_Indexed_Integer01] ON [dbo].[tblTaskInformation]
(
	[Indexed_Integer01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblTaskInformation_Indexed_String01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTaskInformation_Indexed_String01] ON [dbo].[tblTaskInformation]
(
	[Indexed_String01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblTaskInformation_Indexed_String02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTaskInformation_Indexed_String02] ON [dbo].[tblTaskInformation]
(
	[Indexed_String02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblTaskInformation_StoreName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTaskInformation_StoreName] ON [dbo].[tblTaskInformation]
(
	[StoreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblTree_fkChildID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblTree_fkChildID] ON [dbo].[tblTree]
(
	[fkChildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Binary01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Binary01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Binary01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Boolean01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Boolean01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Boolean01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_DateTime01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_DateTime01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_DateTime01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Float01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Float01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Float01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Float02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Float02] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Float02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Float03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Float03] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Float03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Guid01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Guid01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Guid01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Integer01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Integer01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Integer01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Integer02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Integer02] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Integer02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Integer03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Integer03] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Integer03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Long01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Long01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Long01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_Long02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_Long02] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_Long02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_String01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_String01] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_String01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_String02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_String02] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_String02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_Indexed_String03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_Indexed_String03] ON [dbo].[tblVisitorGroupStatistic]
(
	[Indexed_String03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblVisitorGroupStatistic_StoreName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblVisitorGroupStatistic_StoreName] ON [dbo].[tblVisitorGroupStatistic]
(
	[StoreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContent_ArchiveContentGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_ArchiveContentGUID] ON [dbo].[tblWorkContent]
(
	[ArchiveContentGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblWorkContent_BlobUri]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_BlobUri] ON [dbo].[tblWorkContent]
(
	[BlobUri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblWorkContent_ChangedByName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_ChangedByName] ON [dbo].[tblWorkContent]
(
	[ChangedByName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContent_ContentLinkGUID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_ContentLinkGUID] ON [dbo].[tblWorkContent]
(
	[ContentLinkGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContent_fkContentID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_fkContentID] ON [dbo].[tblWorkContent]
(
	[fkContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContent_fkLanguageBranchID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_fkLanguageBranchID] ON [dbo].[tblWorkContent]
(
	[fkLanguageBranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContent_fkMasterVersionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_fkMasterVersionID] ON [dbo].[tblWorkContent]
(
	[fkMasterVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContent_StatusFields]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContent_StatusFields] ON [dbo].[tblWorkContent]
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContentProperty_ContentLink]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContentProperty_ContentLink] ON [dbo].[tblWorkContentProperty]
(
	[ContentLink] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContentProperty_ContentTypeID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContentProperty_ContentTypeID] ON [dbo].[tblWorkContentProperty]
(
	[ContentType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_tblWorkContentProperty_fkPropertyDefinitionID]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContentProperty_fkPropertyDefinitionID] ON [dbo].[tblWorkContentProperty]
(
	[fkPropertyDefinitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblWorkContentProperty_ScopeName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblWorkContentProperty_ScopeName] ON [dbo].[tblWorkContentProperty]
(
	[ScopeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_tblWorkContentProperty_guid]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblWorkContentProperty_guid] ON [dbo].[tblWorkContentProperty]
(
	[guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblXFormData_String01]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblXFormData_String01] ON [dbo].[tblXFormData]
(
	[Indexed_String01] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblXFormData_String02]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblXFormData_String02] ON [dbo].[tblXFormData]
(
	[Indexed_String02] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_tblXFormData_String03]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_tblXFormData_String03] ON [dbo].[tblXFormData]
(
	[Indexed_String03] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_UserName]    Script Date: 12/3/2020 3:17:40 PM ******/
CREATE NONCLUSTERED INDEX [IDX_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblActivityArchive] ADD  CONSTRAINT [DF_tblActivityArchive_Action]  DEFAULT ((0)) FOR [Action]
GO
ALTER TABLE [dbo].[tblActivityArchive] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblActivityLog] ADD  CONSTRAINT [DF_tblActivityLog_Action]  DEFAULT ((0)) FOR [Action]
GO
ALTER TABLE [dbo].[tblActivityLog] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionReviewer] ADD  DEFAULT ((0)) FOR [ReviewerType]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionStep] ADD  DEFAULT (NULL) FOR [ApprovesNeeded]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionStep] ADD  DEFAULT (NULL) FOR [SelfApprove]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion] ADD  DEFAULT ((0)) FOR [RequireCommentOnApprove]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion] ADD  DEFAULT ((0)) FOR [RequireCommentOnReject]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion] ADD  DEFAULT ((0)) FOR [RequireCommentOnStart]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion] ADD  DEFAULT ((1)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion] ADD  DEFAULT ((1)) FOR [ApprovesNeeded]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion] ADD  DEFAULT ((1)) FOR [SelfApprove]
GO
ALTER TABLE [dbo].[tblBigTable] ADD  CONSTRAINT [DF_tblBigTable_Row]  DEFAULT ((1)) FOR [Row]
GO
ALTER TABLE [dbo].[tblBigTableIdentity] ADD  CONSTRAINT [DF_tblBigTableIdentity_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[tblBigTableReference] ADD  CONSTRAINT [tblBigTableReference_Index]  DEFAULT ((1)) FOR [Index]
GO
ALTER TABLE [dbo].[tblBigTableStoreConfig] ADD  DEFAULT ((0)) FOR [DateTimeKind]
GO
ALTER TABLE [dbo].[tblCategory] ADD  CONSTRAINT [DF_tblCategory_CategoryGUID]  DEFAULT (newid()) FOR [CategoryGUID]
GO
ALTER TABLE [dbo].[tblCategory] ADD  CONSTRAINT [DF_tblCategory_PeerOrder]  DEFAULT ((100)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[tblCategory] ADD  CONSTRAINT [DF_tblCategory_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[tblCategory] ADD  CONSTRAINT [DF_tblCategory_Selectable]  DEFAULT ((1)) FOR [Selectable]
GO
ALTER TABLE [dbo].[tblCategory] ADD  CONSTRAINT [DF_tblCategory_SuperCategory]  DEFAULT ((0)) FOR [SuperCategory]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF__tblContent__ContentGUID]  DEFAULT (newid()) FOR [ContentGUID]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF__tblContent__Visible__2E06CDA9]  DEFAULT ((1)) FOR [VisibleInMenu]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF__tblContent__Deleted__2EFAF1E2]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF__tblContent__ChildOr__35A7EF71]  DEFAULT ((1)) FOR [ChildOrderRule]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF__tblContent__PeerOrd__369C13AA]  DEFAULT ((100)) FOR [PeerOrder]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF__tblContent__fkMasterLangaugeBranchID]  DEFAULT ((1)) FOR [fkMasterLanguageBranchID]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF_tblContent_ContentType]  DEFAULT ((0)) FOR [ContentType]
GO
ALTER TABLE [dbo].[tblContent] ADD  CONSTRAINT [DF_tblContent_IsLeafNode]  DEFAULT ((1)) FOR [IsLeafNode]
GO
ALTER TABLE [dbo].[tblContentAccess] ADD  CONSTRAINT [DF_tblAccess_IsRole]  DEFAULT ((1)) FOR [IsRole]
GO
ALTER TABLE [dbo].[tblContentCategory] ADD  CONSTRAINT [DF_tblContentCategory_CategoryType]  DEFAULT ((0)) FOR [CategoryType]
GO
ALTER TABLE [dbo].[tblContentCategory] ADD  CONSTRAINT [DF_tblContentCategory_LanguageBranchID]  DEFAULT ((1)) FOR [fkLanguageBranchID]
GO
ALTER TABLE [dbo].[tblContentLanguage] ADD  CONSTRAINT [DF__tblContentLanguage__ContentGUID]  DEFAULT (newid()) FOR [ContentGUID]
GO
ALTER TABLE [dbo].[tblContentLanguage] ADD  CONSTRAINT [DF__tblContentLanguage__Automatic]  DEFAULT ((1)) FOR [AutomaticLink]
GO
ALTER TABLE [dbo].[tblContentLanguage] ADD  CONSTRAINT [DF__tblContentLanguage__FetchData]  DEFAULT ((0)) FOR [FetchData]
GO
ALTER TABLE [dbo].[tblContentLanguage] ADD  DEFAULT ((2)) FOR [Status]
GO
ALTER TABLE [dbo].[tblContentLanguageSetting] ADD  CONSTRAINT [DF__tblConten__Activ__51300E55]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[tblContentProperty] ADD  CONSTRAINT [DF__tblProper__fkLan__29B609E9]  DEFAULT ((1)) FOR [fkLanguageBranchID]
GO
ALTER TABLE [dbo].[tblContentProperty] ADD  CONSTRAINT [DF__tblPropert__guid__43F60EC8]  DEFAULT (newid()) FOR [guid]
GO
ALTER TABLE [dbo].[tblContentProperty] ADD  CONSTRAINT [DF__tblProper__Boole__44EA3301]  DEFAULT ((0)) FOR [Boolean]
GO
ALTER TABLE [dbo].[tblContentType] ADD  CONSTRAINT [DF_tblContentType_ContentTypeGUID]  DEFAULT (newid()) FOR [ContentTypeGUID]
GO
ALTER TABLE [dbo].[tblContentType] ADD  CONSTRAINT [DF_tblContentType_MetaDataInherit]  DEFAULT ((0)) FOR [MetaDataInherit]
GO
ALTER TABLE [dbo].[tblContentType] ADD  CONSTRAINT [DF_tblContentType_MetaDataDefault]  DEFAULT ((0)) FOR [MetaDataDefault]
GO
ALTER TABLE [dbo].[tblContentType] ADD  CONSTRAINT [DF_tblContentType_ContentType]  DEFAULT ((0)) FOR [ContentType]
GO
ALTER TABLE [dbo].[tblContentTypeDefault] ADD  CONSTRAINT [DF_tblContentTypeDefault_VisibleInMenu]  DEFAULT ((1)) FOR [VisibleInMenu]
GO
ALTER TABLE [dbo].[tblContentTypeDefault] ADD  CONSTRAINT [DF_tblContentTypeDefault_ChildOrderRule]  DEFAULT ((1)) FOR [ChildOrderRule]
GO
ALTER TABLE [dbo].[tblContentTypeDefault] ADD  CONSTRAINT [DF_tblContentTypeDefault_PeerOrder]  DEFAULT ((100)) FOR [PeerOrder]
GO
ALTER TABLE [dbo].[tblContentTypeToContentType] ADD  CONSTRAINT [DF_tblContentTypeToContentType_Access]  DEFAULT ((20)) FOR [Access]
GO
ALTER TABLE [dbo].[tblContentTypeToContentType] ADD  CONSTRAINT [DF_tblContentTypeToContentType_Availability]  DEFAULT ((0)) FOR [Availability]
GO
ALTER TABLE [dbo].[tblFrame] ADD  CONSTRAINT [DF_tblFrame_SystemFrame]  DEFAULT ((0)) FOR [SystemFrame]
GO
ALTER TABLE [dbo].[tblHostDefinition] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[tblIndexRequestLog] ADD  CONSTRAINT [[tblIndexRequestLog_Row]  DEFAULT ((1)) FOR [Row]
GO
ALTER TABLE [dbo].[tblLanguageBranch] ADD  CONSTRAINT [DF__tblLanguageBranch__Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[tblMappedIdentity] ADD  CONSTRAINT [DF_tblMappedIdentity_ContentGuid]  DEFAULT (newid()) FOR [ContentGuid]
GO
ALTER TABLE [dbo].[tblNotificationSubscription] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[tblPlugIn] ADD  CONSTRAINT [DF_tblPlugIn_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[tblPropertyDefinition] ADD  CONSTRAINT [DF_tblPropertyDefinition_DefaultValueType]  DEFAULT ((0)) FOR [DefaultValueType]
GO
ALTER TABLE [dbo].[tblPropertyDefinition] ADD  CONSTRAINT [DF_tblPropertyDefinition_LongStringSettings]  DEFAULT ((-1)) FOR [LongStringSettings]
GO
ALTER TABLE [dbo].[tblPropertyDefinition] ADD  CONSTRAINT [DF_tblPropertyDefinition_CommonLang]  DEFAULT ((0)) FOR [LanguageSpecific]
GO
ALTER TABLE [dbo].[tblPropertyDefinition] ADD  CONSTRAINT [DF_tblPropertyDefinition_ExistsOnModel]  DEFAULT ((0)) FOR [ExistsOnModel]
GO
ALTER TABLE [dbo].[tblPropertyDefinitionDefault] ADD  CONSTRAINT [DF_tblPropertyDefault_Boolean]  DEFAULT ((0)) FOR [Boolean]
GO
ALTER TABLE [dbo].[tblPropertyDefinitionGroup] ADD  CONSTRAINT [DF_tblPropertyDefinitionGroup_SystemGroup]  DEFAULT ((0)) FOR [SystemGroup]
GO
ALTER TABLE [dbo].[tblPropertyDefinitionGroup] ADD  CONSTRAINT [DF_tblPropertyDefinitionGroup_Access]  DEFAULT ((10)) FOR [Access]
GO
ALTER TABLE [dbo].[tblPropertyDefinitionGroup] ADD  CONSTRAINT [DF_tblPropertyDefinitionGroup_DefaultVisible]  DEFAULT ((1)) FOR [GroupVisible]
GO
ALTER TABLE [dbo].[tblPropertyDefinitionGroup] ADD  CONSTRAINT [DF_tblPropertyDefinitionGroup_GroupOrder]  DEFAULT ((1)) FOR [GroupOrder]
GO
ALTER TABLE [dbo].[tblRemoteSite] ADD  CONSTRAINT [DF_tblRemoteSite_IsTrusted]  DEFAULT ((0)) FOR [IsTrusted]
GO
ALTER TABLE [dbo].[tblRemoteSite] ADD  CONSTRAINT [DF_tblRemoteSite_AllowUrlLookup]  DEFAULT ((0)) FOR [AllowUrlLookup]
GO
ALTER TABLE [dbo].[tblScheduledItem] ADD  CONSTRAINT [DF__tblSchedul__pkID__1A34DF26]  DEFAULT (newid()) FOR [pkID]
GO
ALTER TABLE [dbo].[tblScheduledItem] ADD  CONSTRAINT [DF_tblScheduledItem_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[tblScheduledItem] ADD  CONSTRAINT [DF__tblScheduledItem__IsRunnning]  DEFAULT ((0)) FOR [IsRunning]
GO
ALTER TABLE [dbo].[tblScheduledItem] ADD  CONSTRAINT [DF__tblScheduledItem__IsStoppable]  DEFAULT ((0)) FOR [IsStoppable]
GO
ALTER TABLE [dbo].[tblScheduledItem] ADD  DEFAULT ((0)) FOR [LastExecutionAttempt]
GO
ALTER TABLE [dbo].[tblScheduledItem] ADD  DEFAULT ((0)) FOR [Restartable]
GO
ALTER TABLE [dbo].[tblSynchedUserRole] ADD  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[tblSystemBigTable] ADD  CONSTRAINT [tblSystemBigTable_Row]  DEFAULT ((1)) FOR [Row]
GO
ALTER TABLE [dbo].[tblTask] ADD  CONSTRAINT [DF_tblTask_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tblTaskInformation] ADD  CONSTRAINT [tblTaskInformation_Row]  DEFAULT ((1)) FOR [Row]
GO
ALTER TABLE [dbo].[tblUniqueSequence] ADD  CONSTRAINT [DF__tblUniqueSequence__LastValue]  DEFAULT ((0)) FOR [LastValue]
GO
ALTER TABLE [dbo].[tblUserPermission] ADD  CONSTRAINT [DF_tblUserPermission_IsRole]  DEFAULT ((1)) FOR [IsRole]
GO
ALTER TABLE [dbo].[tblVisitorGroupStatistic] ADD  CONSTRAINT [tblVisitorGroupStatistic_Row]  DEFAULT ((1)) FOR [Row]
GO
ALTER TABLE [dbo].[tblWorkContent] ADD  CONSTRAINT [DF__tblWorkPa__LinkT__48BAC3E5]  DEFAULT ((0)) FOR [LinkType]
GO
ALTER TABLE [dbo].[tblWorkContent] ADD  CONSTRAINT [DF__tblWorkPa__Child__4B973090]  DEFAULT ((1)) FOR [ChildOrderRule]
GO
ALTER TABLE [dbo].[tblWorkContent] ADD  CONSTRAINT [DF__tblWorkPa__PeerO__4C8B54C9]  DEFAULT ((100)) FOR [PeerOrder]
GO
ALTER TABLE [dbo].[tblWorkContent] ADD  CONSTRAINT [DF__tblWorkPa__Chang__4E739D3B]  DEFAULT ((0)) FOR [ChangedOnPublish]
GO
ALTER TABLE [dbo].[tblWorkContent] ADD  CONSTRAINT [DF__tblWorkPa__fkLan__4258C320]  DEFAULT ((1)) FOR [fkLanguageBranchID]
GO
ALTER TABLE [dbo].[tblWorkContent] ADD  CONSTRAINT [DF_tblWorkContent_CommonDraft]  DEFAULT ((0)) FOR [CommonDraft]
GO
ALTER TABLE [dbo].[tblWorkContent] ADD  DEFAULT ((2)) FOR [Status]
GO
ALTER TABLE [dbo].[tblWorkContentCategory] ADD  CONSTRAINT [DF_tblWorkContentCategory_CategoryType]  DEFAULT ((0)) FOR [CategoryType]
GO
ALTER TABLE [dbo].[tblWorkContentProperty] ADD  CONSTRAINT [DF__tblWorkContentProperty_guid]  DEFAULT (newid()) FOR [guid]
GO
ALTER TABLE [dbo].[tblWorkContentProperty] ADD  CONSTRAINT [DF__tblWorkPr__Boole__55209ACA]  DEFAULT ((0)) FOR [Boolean]
GO
ALTER TABLE [dbo].[tblXFormData] ADD  CONSTRAINT [DF_tblXFormData_Row]  DEFAULT ((1)) FOR [Row]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_Application]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipEntity_User]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [ProfileEntity_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [ProfileEntity_User]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleEntity_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleEntity_Application]
GO
ALTER TABLE [dbo].[tblActivityLogAssociation]  WITH CHECK ADD  CONSTRAINT [FK_tblActivityLogAssociation_tblActivityLog] FOREIGN KEY([To])
REFERENCES [dbo].[tblActivityLog] ([pkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblActivityLogAssociation] CHECK CONSTRAINT [FK_tblActivityLogAssociation_tblActivityLog]
GO
ALTER TABLE [dbo].[tblActivityLogComment]  WITH CHECK ADD  CONSTRAINT [FK_tblActivityLogComment_tblActivityLog] FOREIGN KEY([EntryId])
REFERENCES [dbo].[tblActivityLog] ([pkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblActivityLogComment] CHECK CONSTRAINT [FK_tblActivityLogComment_tblActivityLog]
GO
ALTER TABLE [dbo].[tblApproval]  WITH CHECK ADD  CONSTRAINT [FK_tblApproval_tblApprovalDefinitionVersion] FOREIGN KEY([fkApprovalDefinitionVersionID])
REFERENCES [dbo].[tblApprovalDefinitionVersion] ([pkID])
GO
ALTER TABLE [dbo].[tblApproval] CHECK CONSTRAINT [FK_tblApproval_tblApprovalDefinitionVersion]
GO
ALTER TABLE [dbo].[tblApproval]  WITH CHECK ADD  CONSTRAINT [FK_tblApproval_tblLanguageBranch] FOREIGN KEY([fkLanguageBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblApproval] CHECK CONSTRAINT [FK_tblApproval_tblLanguageBranch]
GO
ALTER TABLE [dbo].[tblApprovalDefinition]  WITH CHECK ADD  CONSTRAINT [FK_tblApprovalDefinition_tblApprovalDefinitionVersion] FOREIGN KEY([fkCurrentApprovalDefinitionVersionID])
REFERENCES [dbo].[tblApprovalDefinitionVersion] ([pkID])
GO
ALTER TABLE [dbo].[tblApprovalDefinition] CHECK CONSTRAINT [FK_tblApprovalDefinition_tblApprovalDefinitionVersion]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionReviewer]  WITH CHECK ADD  CONSTRAINT [FK_tblApprovalDefinitionReviewer_tblApprovalDefinitionStep] FOREIGN KEY([fkApprovalDefinitionStepID])
REFERENCES [dbo].[tblApprovalDefinitionStep] ([pkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblApprovalDefinitionReviewer] CHECK CONSTRAINT [FK_tblApprovalDefinitionReviewer_tblApprovalDefinitionStep]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionReviewer]  WITH CHECK ADD  CONSTRAINT [FK_tblApprovalDefinitionReviewer_tblApprovalDefinitionVersion] FOREIGN KEY([fkApprovalDefinitionVersionID])
REFERENCES [dbo].[tblApprovalDefinitionVersion] ([pkID])
GO
ALTER TABLE [dbo].[tblApprovalDefinitionReviewer] CHECK CONSTRAINT [FK_tblApprovalDefinitionReviewer_tblApprovalDefinitionVersion]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionReviewer]  WITH CHECK ADD  CONSTRAINT [FK_tblApprovalDefinitionReviewer_tblLanguageBranch] FOREIGN KEY([fkLanguageBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblApprovalDefinitionReviewer] CHECK CONSTRAINT [FK_tblApprovalDefinitionReviewer_tblLanguageBranch]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionStep]  WITH CHECK ADD  CONSTRAINT [FK_tblApprovalDefinitionStep_tblApprovalDefinitionVersion] FOREIGN KEY([fkApprovalDefinitionVersionID])
REFERENCES [dbo].[tblApprovalDefinitionVersion] ([pkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblApprovalDefinitionStep] CHECK CONSTRAINT [FK_tblApprovalDefinitionStep_tblApprovalDefinitionVersion]
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion]  WITH CHECK ADD  CONSTRAINT [FK_tblApprovalDefinitionVersion_tblApprovalDefinition] FOREIGN KEY([fkApprovalDefinitionID])
REFERENCES [dbo].[tblApprovalDefinition] ([pkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblApprovalDefinitionVersion] CHECK CONSTRAINT [FK_tblApprovalDefinitionVersion_tblApprovalDefinition]
GO
ALTER TABLE [dbo].[tblApprovalStepDecision]  WITH CHECK ADD  CONSTRAINT [FK_tblApprovalStepDecision_tblApproval] FOREIGN KEY([fkApprovalID])
REFERENCES [dbo].[tblApproval] ([pkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblApprovalStepDecision] CHECK CONSTRAINT [FK_tblApprovalStepDecision_tblApproval]
GO
ALTER TABLE [dbo].[tblBigTable]  WITH CHECK ADD  CONSTRAINT [FK_tblBigTable_tblBigTableIdentity] FOREIGN KEY([pkId])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblBigTable] CHECK CONSTRAINT [FK_tblBigTable_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[tblBigTableReference]  WITH CHECK ADD  CONSTRAINT [FK_tblBigTableReference_RefId_tblBigTableIdentity] FOREIGN KEY([RefIdValue])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblBigTableReference] CHECK CONSTRAINT [FK_tblBigTableReference_RefId_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[tblBigTableReference]  WITH CHECK ADD  CONSTRAINT [FK_tblBigTableReference_tblBigTableIdentity] FOREIGN KEY([pkId])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblBigTableReference] CHECK CONSTRAINT [FK_tblBigTableReference_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[tblBigTableStoreInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblBigTableStoreInfo_tblBigTableStoreConfig] FOREIGN KEY([fkStoreId])
REFERENCES [dbo].[tblBigTableStoreConfig] ([pkId])
GO
ALTER TABLE [dbo].[tblBigTableStoreInfo] CHECK CONSTRAINT [FK_tblBigTableStoreInfo_tblBigTableStoreConfig]
GO
ALTER TABLE [dbo].[tblCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblCategory_tblCategory] FOREIGN KEY([fkParentID])
REFERENCES [dbo].[tblCategory] ([pkID])
GO
ALTER TABLE [dbo].[tblCategory] CHECK CONSTRAINT [FK_tblCategory_tblCategory]
GO
ALTER TABLE [dbo].[tblChangeNotificationConnection]  WITH CHECK ADD  CONSTRAINT [FK_ChangeNotificationConnection_ChangeNotificationProcessor] FOREIGN KEY([ProcessorId])
REFERENCES [dbo].[tblChangeNotificationProcessor] ([ProcessorId])
GO
ALTER TABLE [dbo].[tblChangeNotificationConnection] CHECK CONSTRAINT [FK_ChangeNotificationConnection_ChangeNotificationProcessor]
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedGuid]  WITH CHECK ADD  CONSTRAINT [FK_ChangeNotification_ChangeNotificationGuid_ChangeNotificationConnection] FOREIGN KEY([ConnectionId])
REFERENCES [dbo].[tblChangeNotificationConnection] ([ConnectionId])
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedGuid] CHECK CONSTRAINT [FK_ChangeNotification_ChangeNotificationGuid_ChangeNotificationConnection]
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedGuid]  WITH CHECK ADD  CONSTRAINT [FK_ChangeNotification_ChangeNotificationGuid_ChangeNotificationProcessor] FOREIGN KEY([ProcessorId])
REFERENCES [dbo].[tblChangeNotificationProcessor] ([ProcessorId])
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedGuid] CHECK CONSTRAINT [FK_ChangeNotification_ChangeNotificationGuid_ChangeNotificationProcessor]
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedInt]  WITH CHECK ADD  CONSTRAINT [FK_ChangeNotification_ChangeNotificationInt_ChangeNotificationConnection] FOREIGN KEY([ConnectionId])
REFERENCES [dbo].[tblChangeNotificationConnection] ([ConnectionId])
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedInt] CHECK CONSTRAINT [FK_ChangeNotification_ChangeNotificationInt_ChangeNotificationConnection]
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedInt]  WITH CHECK ADD  CONSTRAINT [FK_ChangeNotification_ChangeNotificationInt_ChangeNotificationProcessor] FOREIGN KEY([ProcessorId])
REFERENCES [dbo].[tblChangeNotificationProcessor] ([ProcessorId])
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedInt] CHECK CONSTRAINT [FK_ChangeNotification_ChangeNotificationInt_ChangeNotificationProcessor]
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedString]  WITH CHECK ADD  CONSTRAINT [FK_ChangeNotification_ChangeNotificationString_ChangeNotificationConnection] FOREIGN KEY([ConnectionId])
REFERENCES [dbo].[tblChangeNotificationConnection] ([ConnectionId])
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedString] CHECK CONSTRAINT [FK_ChangeNotification_ChangeNotificationString_ChangeNotificationConnection]
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedString]  WITH CHECK ADD  CONSTRAINT [FK_ChangeNotification_ChangeNotificationString_ChangeNotificationProcessor] FOREIGN KEY([ProcessorId])
REFERENCES [dbo].[tblChangeNotificationProcessor] ([ProcessorId])
GO
ALTER TABLE [dbo].[tblChangeNotificationQueuedString] CHECK CONSTRAINT [FK_ChangeNotification_ChangeNotificationString_ChangeNotificationProcessor]
GO
ALTER TABLE [dbo].[tblContent]  WITH CHECK ADD  CONSTRAINT [FK_tblContent_tblContent] FOREIGN KEY([fkParentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContent] CHECK CONSTRAINT [FK_tblContent_tblContent]
GO
ALTER TABLE [dbo].[tblContent]  WITH CHECK ADD  CONSTRAINT [FK_tblContent_tblContentType] FOREIGN KEY([fkContentTypeID])
REFERENCES [dbo].[tblContentType] ([pkID])
GO
ALTER TABLE [dbo].[tblContent] CHECK CONSTRAINT [FK_tblContent_tblContentType]
GO
ALTER TABLE [dbo].[tblContent]  WITH CHECK ADD  CONSTRAINT [FK_tblContent_tblLanguageBranch] FOREIGN KEY([fkMasterLanguageBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblContent] CHECK CONSTRAINT [FK_tblContent_tblLanguageBranch]
GO
ALTER TABLE [dbo].[tblContentAccess]  WITH CHECK ADD  CONSTRAINT [FK_tblContentAccess_tblContent] FOREIGN KEY([fkContentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentAccess] CHECK CONSTRAINT [FK_tblContentAccess_tblContent]
GO
ALTER TABLE [dbo].[tblContentCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblContentCategory_tblCategory] FOREIGN KEY([fkCategoryID])
REFERENCES [dbo].[tblCategory] ([pkID])
GO
ALTER TABLE [dbo].[tblContentCategory] CHECK CONSTRAINT [FK_tblContentCategory_tblCategory]
GO
ALTER TABLE [dbo].[tblContentCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblContentCategory_tblContent] FOREIGN KEY([fkContentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentCategory] CHECK CONSTRAINT [FK_tblContentCategory_tblContent]
GO
ALTER TABLE [dbo].[tblContentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_tblContentLanguage_tblContent2] FOREIGN KEY([fkContentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentLanguage] CHECK CONSTRAINT [FK_tblContentLanguage_tblContent2]
GO
ALTER TABLE [dbo].[tblContentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_tblContentLanguage_tblFrame] FOREIGN KEY([fkFrameID])
REFERENCES [dbo].[tblFrame] ([pkID])
GO
ALTER TABLE [dbo].[tblContentLanguage] CHECK CONSTRAINT [FK_tblContentLanguage_tblFrame]
GO
ALTER TABLE [dbo].[tblContentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_tblContentLanguage_tblLanguageBranch] FOREIGN KEY([fkLanguageBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblContentLanguage] CHECK CONSTRAINT [FK_tblContentLanguage_tblLanguageBranch]
GO
ALTER TABLE [dbo].[tblContentLanguage]  WITH CHECK ADD  CONSTRAINT [FK_tblContentLanguage_tblWorkContent] FOREIGN KEY([Version])
REFERENCES [dbo].[tblWorkContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentLanguage] CHECK CONSTRAINT [FK_tblContentLanguage_tblWorkContent]
GO
ALTER TABLE [dbo].[tblContentLanguageSetting]  WITH CHECK ADD  CONSTRAINT [FK_tblContentLanguageSetting_tblContent] FOREIGN KEY([fkContentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentLanguageSetting] CHECK CONSTRAINT [FK_tblContentLanguageSetting_tblContent]
GO
ALTER TABLE [dbo].[tblContentLanguageSetting]  WITH CHECK ADD  CONSTRAINT [FK_tblContentLanguageSetting_tblLanguageBranch1] FOREIGN KEY([fkLanguageBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblContentLanguageSetting] CHECK CONSTRAINT [FK_tblContentLanguageSetting_tblLanguageBranch1]
GO
ALTER TABLE [dbo].[tblContentLanguageSetting]  WITH CHECK ADD  CONSTRAINT [FK_tblContentLanguageSetting_tblLanguageBranch2] FOREIGN KEY([fkReplacementBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblContentLanguageSetting] CHECK CONSTRAINT [FK_tblContentLanguageSetting_tblLanguageBranch2]
GO
ALTER TABLE [dbo].[tblContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblContentProperty_tblContent] FOREIGN KEY([fkContentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentProperty] CHECK CONSTRAINT [FK_tblContentProperty_tblContent]
GO
ALTER TABLE [dbo].[tblContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblContentProperty_tblContent2] FOREIGN KEY([ContentLink])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentProperty] CHECK CONSTRAINT [FK_tblContentProperty_tblContent2]
GO
ALTER TABLE [dbo].[tblContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblContentProperty_tblLanguageBranch] FOREIGN KEY([fkLanguageBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblContentProperty] CHECK CONSTRAINT [FK_tblContentProperty_tblLanguageBranch]
GO
ALTER TABLE [dbo].[tblContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblContentProperty_tblPropertyDefinition] FOREIGN KEY([fkPropertyDefinitionID])
REFERENCES [dbo].[tblPropertyDefinition] ([pkID])
GO
ALTER TABLE [dbo].[tblContentProperty] CHECK CONSTRAINT [FK_tblContentProperty_tblPropertyDefinition]
GO
ALTER TABLE [dbo].[tblContentSoftlink]  WITH CHECK ADD  CONSTRAINT [FK_tblContentSoftlink_tblContent] FOREIGN KEY([fkOwnerContentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblContentSoftlink] CHECK CONSTRAINT [FK_tblContentSoftlink_tblContent]
GO
ALTER TABLE [dbo].[tblContentTypeDefault]  WITH CHECK ADD  CONSTRAINT [FK_tblContentTypeDefault_tblContentType] FOREIGN KEY([fkContentTypeID])
REFERENCES [dbo].[tblContentType] ([pkID])
GO
ALTER TABLE [dbo].[tblContentTypeDefault] CHECK CONSTRAINT [FK_tblContentTypeDefault_tblContentType]
GO
ALTER TABLE [dbo].[tblContentTypeToContentType]  WITH CHECK ADD  CONSTRAINT [FK_tblContentTypeToContentType_tblContentType] FOREIGN KEY([fkContentTypeParentID])
REFERENCES [dbo].[tblContentType] ([pkID])
GO
ALTER TABLE [dbo].[tblContentTypeToContentType] CHECK CONSTRAINT [FK_tblContentTypeToContentType_tblContentType]
GO
ALTER TABLE [dbo].[tblContentTypeToContentType]  WITH CHECK ADD  CONSTRAINT [FK_tblContentTypeToContentType_tblContentType1] FOREIGN KEY([fkContentTypeChildID])
REFERENCES [dbo].[tblContentType] ([pkID])
GO
ALTER TABLE [dbo].[tblContentTypeToContentType] CHECK CONSTRAINT [FK_tblContentTypeToContentType_tblContentType1]
GO
ALTER TABLE [dbo].[tblHostDefinition]  WITH CHECK ADD  CONSTRAINT [FK_tblHostDefinition_tblSiteDefinition] FOREIGN KEY([fkSiteID])
REFERENCES [dbo].[tblSiteDefinition] ([pkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHostDefinition] CHECK CONSTRAINT [FK_tblHostDefinition_tblSiteDefinition]
GO
ALTER TABLE [dbo].[tblIndexRequestLog]  WITH CHECK ADD  CONSTRAINT [FK_tblIndexRequestLog_tblBigTableIdentity] FOREIGN KEY([pkId])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblIndexRequestLog] CHECK CONSTRAINT [FK_tblIndexRequestLog_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[tblProjectItem]  WITH CHECK ADD  CONSTRAINT [FK_tblProjectItem_tblProject] FOREIGN KEY([fkProjectID])
REFERENCES [dbo].[tblProject] ([pkID])
GO
ALTER TABLE [dbo].[tblProjectItem] CHECK CONSTRAINT [FK_tblProjectItem_tblProject]
GO
ALTER TABLE [dbo].[tblProjectMember]  WITH CHECK ADD  CONSTRAINT [FK_tblProjectMember_tblProject] FOREIGN KEY([fkProjectID])
REFERENCES [dbo].[tblProject] ([pkID])
GO
ALTER TABLE [dbo].[tblProjectMember] CHECK CONSTRAINT [FK_tblProjectMember_tblProject]
GO
ALTER TABLE [dbo].[tblPropertyDefinition]  WITH CHECK ADD  CONSTRAINT [FK_tblPropertyDefinition_tblContentType] FOREIGN KEY([fkContentTypeID])
REFERENCES [dbo].[tblContentType] ([pkID])
GO
ALTER TABLE [dbo].[tblPropertyDefinition] CHECK CONSTRAINT [FK_tblPropertyDefinition_tblContentType]
GO
ALTER TABLE [dbo].[tblScheduledItemLog]  WITH CHECK ADD  CONSTRAINT [fk_tblScheduledItemLog_tblScheduledItem] FOREIGN KEY([fkScheduledItemId])
REFERENCES [dbo].[tblScheduledItem] ([pkID])
GO
ALTER TABLE [dbo].[tblScheduledItemLog] CHECK CONSTRAINT [fk_tblScheduledItemLog_tblScheduledItem]
GO
ALTER TABLE [dbo].[tblSynchedUserRelations]  WITH CHECK ADD  CONSTRAINT [FK_tblSynchedUserRelations_Group] FOREIGN KEY([fkSynchedRole])
REFERENCES [dbo].[tblSynchedUserRole] ([pkID])
GO
ALTER TABLE [dbo].[tblSynchedUserRelations] CHECK CONSTRAINT [FK_tblSynchedUserRelations_Group]
GO
ALTER TABLE [dbo].[tblSynchedUserRelations]  WITH CHECK ADD  CONSTRAINT [FK_tblSyncheduserRelations_User] FOREIGN KEY([fkSynchedUser])
REFERENCES [dbo].[tblSynchedUser] ([pkID])
GO
ALTER TABLE [dbo].[tblSynchedUserRelations] CHECK CONSTRAINT [FK_tblSyncheduserRelations_User]
GO
ALTER TABLE [dbo].[tblSystemBigTable]  WITH CHECK ADD  CONSTRAINT [FK_tblSystemBigTable_tblBigTableIdentity] FOREIGN KEY([pkId])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblSystemBigTable] CHECK CONSTRAINT [FK_tblSystemBigTable_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[tblTask]  WITH CHECK ADD  CONSTRAINT [FK_tblTask_tblPlugIn] FOREIGN KEY([fkPlugInID])
REFERENCES [dbo].[tblPlugIn] ([pkID])
GO
ALTER TABLE [dbo].[tblTask] CHECK CONSTRAINT [FK_tblTask_tblPlugIn]
GO
ALTER TABLE [dbo].[tblTaskInformation]  WITH CHECK ADD  CONSTRAINT [FK_tblTaskInformation_tblBigTableIdentity] FOREIGN KEY([pkId])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblTaskInformation] CHECK CONSTRAINT [FK_tblTaskInformation_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[tblVisitorGroupStatistic]  WITH CHECK ADD  CONSTRAINT [FK_tblVisitorGroupStatistic_tblBigTableIdentity] FOREIGN KEY([pkId])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblVisitorGroupStatistic] CHECK CONSTRAINT [FK_tblVisitorGroupStatistic_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[tblWorkContent]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContent_tblContent] FOREIGN KEY([fkContentID])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContent] CHECK CONSTRAINT [FK_tblWorkContent_tblContent]
GO
ALTER TABLE [dbo].[tblWorkContent]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContent_tblFrame] FOREIGN KEY([fkFrameID])
REFERENCES [dbo].[tblFrame] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContent] CHECK CONSTRAINT [FK_tblWorkContent_tblFrame]
GO
ALTER TABLE [dbo].[tblWorkContent]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContent_tblLanguageBranch] FOREIGN KEY([fkLanguageBranchID])
REFERENCES [dbo].[tblLanguageBranch] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContent] CHECK CONSTRAINT [FK_tblWorkContent_tblLanguageBranch]
GO
ALTER TABLE [dbo].[tblWorkContent]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContent_tblWorkContent2] FOREIGN KEY([fkMasterVersionID])
REFERENCES [dbo].[tblWorkContent] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContent] CHECK CONSTRAINT [FK_tblWorkContent_tblWorkContent2]
GO
ALTER TABLE [dbo].[tblWorkContentCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContentCategory_tblCategory] FOREIGN KEY([fkCategoryID])
REFERENCES [dbo].[tblCategory] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContentCategory] CHECK CONSTRAINT [FK_tblWorkContentCategory_tblCategory]
GO
ALTER TABLE [dbo].[tblWorkContentCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContentCategory_tblWorkContent] FOREIGN KEY([fkWorkContentID])
REFERENCES [dbo].[tblWorkContent] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContentCategory] CHECK CONSTRAINT [FK_tblWorkContentCategory_tblWorkContent]
GO
ALTER TABLE [dbo].[tblWorkContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContentProperty_tblContent] FOREIGN KEY([ContentLink])
REFERENCES [dbo].[tblContent] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContentProperty] CHECK CONSTRAINT [FK_tblWorkContentProperty_tblContent]
GO
ALTER TABLE [dbo].[tblWorkContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContentProperty_tblContentType] FOREIGN KEY([ContentType])
REFERENCES [dbo].[tblContentType] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContentProperty] CHECK CONSTRAINT [FK_tblWorkContentProperty_tblContentType]
GO
ALTER TABLE [dbo].[tblWorkContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContentProperty_tblPropertyDefinition] FOREIGN KEY([fkPropertyDefinitionID])
REFERENCES [dbo].[tblPropertyDefinition] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContentProperty] CHECK CONSTRAINT [FK_tblWorkContentProperty_tblPropertyDefinition]
GO
ALTER TABLE [dbo].[tblWorkContentProperty]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkContentProperty_tblWorkContent] FOREIGN KEY([fkWorkContentID])
REFERENCES [dbo].[tblWorkContent] ([pkID])
GO
ALTER TABLE [dbo].[tblWorkContentProperty] CHECK CONSTRAINT [FK_tblWorkContentProperty_tblWorkContent]
GO
ALTER TABLE [dbo].[tblXFormData]  WITH CHECK ADD  CONSTRAINT [FK_tblXFormData_tblBigTableIdentity] FOREIGN KEY([pkId])
REFERENCES [dbo].[tblBigTableIdentity] ([pkId])
GO
ALTER TABLE [dbo].[tblXFormData] CHECK CONSTRAINT [FK_tblXFormData_tblBigTableIdentity]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [User_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [User_Application]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_Role]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRole_User]
GO
ALTER TABLE [dbo].[tblBigTable]  WITH CHECK ADD  CONSTRAINT [CH_tblBigTable] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[tblBigTable] CHECK CONSTRAINT [CH_tblBigTable]
GO
ALTER TABLE [dbo].[tblBigTableReference]  WITH CHECK ADD  CONSTRAINT [CH_tblBigTableReference_Index] CHECK  (([Index]>=(-1)))
GO
ALTER TABLE [dbo].[tblBigTableReference] CHECK CONSTRAINT [CH_tblBigTableReference_Index]
GO
ALTER TABLE [dbo].[tblChangeNotificationProcessor]  WITH CHECK ADD  CONSTRAINT [CK_ChangeNotificationProcessor_ChangeNotificationDataType] CHECK  (([ChangeNotificationDataType]='Guid' OR [ChangeNotificationDataType]='String' OR [ChangeNotificationDataType]='Int'))
GO
ALTER TABLE [dbo].[tblChangeNotificationProcessor] CHECK CONSTRAINT [CK_ChangeNotificationProcessor_ChangeNotificationDataType]
GO
ALTER TABLE [dbo].[tblChangeNotificationProcessor]  WITH CHECK ADD  CONSTRAINT [CK_ChangeNotificationProcessor_ProcessorStatus] CHECK  (([ProcessorStatus]='valid' OR [ProcessorStatus]='recovering' OR [ProcessorStatus]='invalid'))
GO
ALTER TABLE [dbo].[tblChangeNotificationProcessor] CHECK CONSTRAINT [CK_ChangeNotificationProcessor_ProcessorStatus]
GO
ALTER TABLE [dbo].[tblIndexRequestLog]  WITH CHECK ADD  CONSTRAINT [CH_tblIndexRequestLog] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[tblIndexRequestLog] CHECK CONSTRAINT [CH_tblIndexRequestLog]
GO
ALTER TABLE [dbo].[tblScheduledItem]  WITH CHECK ADD  CONSTRAINT [CK_tblScheduledItem] CHECK  (([DatePart]='yy' OR ([DatePart]='mm' OR ([DatePart]='wk' OR ([DatePart]='dd' OR ([DatePart]='hh' OR ([DatePart]='mi' OR ([DatePart]='ss' OR [DatePart]='ms'))))))))
GO
ALTER TABLE [dbo].[tblScheduledItem] CHECK CONSTRAINT [CK_tblScheduledItem]
GO
ALTER TABLE [dbo].[tblSystemBigTable]  WITH CHECK ADD  CONSTRAINT [CH_tblSystemBigTable] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[tblSystemBigTable] CHECK CONSTRAINT [CH_tblSystemBigTable]
GO
ALTER TABLE [dbo].[tblTaskInformation]  WITH CHECK ADD  CONSTRAINT [CH_tblTaskInformation] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[tblTaskInformation] CHECK CONSTRAINT [CH_tblTaskInformation]
GO
ALTER TABLE [dbo].[tblVisitorGroupStatistic]  WITH CHECK ADD  CONSTRAINT [CH_tblVisitorGroupStatistic] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[tblVisitorGroupStatistic] CHECK CONSTRAINT [CH_tblVisitorGroupStatistic]
GO
ALTER TABLE [dbo].[tblXFormData]  WITH CHECK ADD  CONSTRAINT [CH_tblXFormData] CHECK  (([Row]>=(1)))
GO
ALTER TABLE [dbo].[tblXFormData] CHECK CONSTRAINT [CH_tblXFormData]
GO
/****** Object:  StoredProcedure [dbo].[admDatabaseStatistics]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[admDatabaseStatistics]
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		(SELECT Count(*) FROM tblPage) AS PageCount
END
GO
/****** Object:  StoredProcedure [dbo].[BigTableDeleteAll]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BigTableDeleteAll]
@ViewName nvarchar(4000)
AS
BEGIN
	DECLARE @deletes AS BigTableDeleteItemInternalTable;
	INSERT INTO @deletes(Id, NestLevel, ObjectPath)
	EXEC ('SELECT [StoreId], 1, ''/'' + CAST([StoreId] AS VARCHAR) + ''/'' FROM ' + @ViewName)
	EXEC sp_executesql N'BigTableDeleteItemInternal @deletes, 1', N'@deletes BigTableDeleteItemInternalTable READONLY',@deletes 
END
GO
/****** Object:  StoredProcedure [dbo].[BigTableDeleteExcessReferences]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BigTableDeleteExcessReferences]
	@Id bigint,
	@PropertyName nvarchar(75),
	@StartIndex int
AS
BEGIN
BEGIN TRAN
	IF @StartIndex > -1
	BEGIN
		-- Creates temporary store with id's of references that has no other reference
		DECLARE @deletes AS BigTableDeleteItemInternalTable;
		
		INSERT INTO @deletes(Id, NestLevel, ObjectPath)
        SELECT DISTINCT R1.RefIdValue, 1, '/' + CAST(R1.RefIdValue AS VARCHAR) + '/' FROM tblBigTableReference AS R1
        LEFT OUTER JOIN tblBigTableReference AS R2 ON R1.RefIdValue = R2.pkId
        WHERE R1.pkId = @Id AND R1.PropertyName = @PropertyName AND R1.[Index] >= @StartIndex AND R2.RefIdValue IS NULL
		DELETE FROM @deletes WHERE Id IS NULL --Avoid filtering on NULL above to minimize deadlock risk
		-- Remove reference on main store
		DELETE FROM tblBigTableReference WHERE pkId = @Id and PropertyName = @PropertyName and [Index] >= @StartIndex
		
		IF((select count(*) from @deletes) > 0)
		BEGIN
			EXEC sp_executesql N'BigTableDeleteItemInternal @deletes', N'@deletes BigTableDeleteItemInternalTable READONLY',@deletes 
		END
	END
	ELSE
		-- Remove reference on main store
		DELETE FROM tblBigTableReference WHERE pkId = @Id and PropertyName = @PropertyName and [Index] >= @StartIndex
COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[BigTableDeleteItem]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BigTableDeleteItem]
@StoreId BIGINT = NULL,
@ExternalId uniqueidentifier = NULL
AS
BEGIN
	IF @StoreId IS NULL
	BEGIN
		SELECT @StoreId = pkId FROM tblBigTableIdentity WHERE [Guid] = @ExternalId
	END
	IF @StoreId IS NULL RAISERROR(N'No object exists for the unique identifier passed', 1, 1)
	DECLARE @deletes AS BigTableDeleteItemInternalTable;
	INSERT INTO @deletes(Id, NestLevel, ObjectPath) VALUES(@StoreId, 1, '/' + CAST(@StoreId AS varchar) + '/')
	EXEC sp_executesql N'BigTableDeleteItemInternal @deletes', N'@deletes BigTableDeleteItemInternalTable READONLY',@deletes 
END
GO
/****** Object:  StoredProcedure [dbo].[BigTableDeleteItemInternal]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BigTableDeleteItemInternal]
@TVP BigTableDeleteItemInternalTable READONLY,
@forceDelete bit = 0
AS
BEGIN
	DECLARE @deletes AS BigTableDeleteItemInternalTable
	INSERT INTO @deletes SELECT * FROM @TVP
	DECLARE @nestLevel int
	SET @nestLevel = 1
	WHILE @@ROWCOUNT > 0
	BEGIN
		SET @nestLevel = @nestLevel + 1
		-- insert all items contained in the ones matching the _previous_ nestlevel and give them _this_ nestLevel
		-- exclude those items that are also referred by some other item not already in @deletes
		-- IMPORTANT: Make sure that this insert is the last statement that can affect @@ROWCOUNT in the while-loop
		INSERT INTO @deletes(Id, NestLevel, ObjectPath)
		SELECT DISTINCT RefIdValue, @nestLevel, deletes.ObjectPath + '/' + CAST(RefIdValue AS VARCHAR) + '/'
		FROM tblBigTableReference R1
		INNER JOIN @deletes deletes ON deletes.Id=R1.pkId
		WHERE deletes.NestLevel=@nestLevel-1
		AND RefIdValue NOT IN(SELECT Id FROM @deletes)
	END 
	DELETE @deletes FROM @deletes deletes
	INNER JOIN 
	(
		SELECT innerDelete.Id
		FROM @deletes as innerDelete
		INNER JOIN tblBigTableReference ON tblBigTableReference.RefIdValue=innerDelete.Id
		WHERE NOT EXISTS(SELECT * FROM @deletes deletes WHERE deletes.Id=tblBigTableReference.pkId)
	) ReferencedObjects ON deletes.ObjectPath LIKE '%/' + CAST(ReferencedObjects.Id AS VARCHAR) + '/%'
	WHERE @forceDelete = 0 OR deletes.NestLevel > 1
	-- Go through each big table and create sql to delete any rows associated with the item being deleted
	DECLARE @sql NVARCHAR(MAX) = ''
	DECLARE @tableName NVARCHAR(128)
	DECLARE tableNameCursor CURSOR READ_ONLY 
	
	FOR SELECT DISTINCT TableName FROM tblBigTableStoreConfig WHERE TableName IS NOT NULL				
	OPEN tableNameCursor
	FETCH NEXT FROM tableNameCursor INTO @tableName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sql = @sql + 'DELETE t1 FROM ' + @tableName  +  ' t1 JOIN @deletes t2 ON t1.pkId = t2.Id;' + CHAR(13)
		FETCH NEXT FROM tableNameCursor INTO @tableName
	END
	CLOSE tableNameCursor
	DEALLOCATE tableNameCursor 			
	BEGIN TRAN
    DELETE t1 FROM tblBigTableReference t1 JOIN @deletes t2 ON t1.RefIdValue = t2.Id
    DELETE t1 FROM tblBigTableReference t1 JOIN @deletes t2 ON t1.pkId = t2.Id
    EXEC sp_executesql @sql, N'@deletes BigTableDeleteItemInternalTable READONLY',@deletes 
    DELETE t1 FROM tblBigTableIdentity t1 JOIN @deletes t2 ON t1.pkId = t2.Id	 
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[BigTableSaveReference]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BigTableSaveReference]
	@Id bigint,
	@Type int,
	@PropertyName nvarchar(75),
	@CollectionType nvarchar(2000) = NULL,
	@ElementType nvarchar(2000) = NULL,
	@ElementStoreName nvarchar(375) = null,
	@IsKey bit,
	@Index int,
	@BooleanValue bit = NULL,
	@IntegerValue int = NULL,
	@LongValue bigint = NULL,
	@DateTimeValue datetime = NULL,
	@GuidValue uniqueidentifier = NULL,
	@FloatValue float = NULL,	
	@StringValue nvarchar(max) = NULL,
	@BinaryValue varbinary(max) = NULL,
	@RefIdValue bigint = NULL,
	@ExternalIdValue bigint = NULL,
	@DecimalValue decimal(18, 3) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if not exists(select * from tblBigTableReference where pkId = @Id and PropertyName = @PropertyName and IsKey = @IsKey and [Index] = @Index)
	begin
		-- insert
		insert into tblBigTableReference
		values
		(
			@Id,
			@Type,
			@PropertyName,
			@CollectionType,
			@ElementType,
			@ElementStoreName,
			@IsKey,
			@Index,
			@BooleanValue,
			@IntegerValue,
			@LongValue,
			@DateTimeValue,
			@GuidValue,
			@FloatValue,
			@StringValue,
			@BinaryValue,
			@RefIdValue,
			@ExternalIdValue,
			@DecimalValue
		)
	end
	else
	begin
		-- update
		update tblBigTableReference
		set
		CollectionType = @CollectionType,
		ElementType = @ElementType,
		ElementStoreName  = @ElementStoreName,
		BooleanValue = @BooleanValue,
		IntegerValue = @IntegerValue,
		LongValue = @LongValue,
		DateTimeValue = @DateTimeValue,
		GuidValue = @GuidValue,
		FloatValue = @FloatValue,
		StringValue = @StringValue,
		BinaryValue = @BinaryValue,
		RefIdValue = @RefIdValue,
		ExternalIdValue = @ExternalIdValue,
		DecimalValue = @DecimalValue
		where
		pkId = @Id and PropertyName = @PropertyName and IsKey = @IsKey and [Index] = @Index
	end   
END
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationAccessConnectionWorker]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationAccessConnectionWorker]
    @connectionId uniqueidentifier,
    @expectedChangeNotificationDataType nvarchar(30) = null
as
begin
    declare @processorId uniqueidentifier
    declare @queuedDataType nvarchar(30)
    declare @processorStatus nvarchar(30)
    declare @nextQueueOrderValue int
    declare @lastConsistentDbUtc datetime
    declare @isOpen bit
    select @processorId = p.ProcessorId, @queuedDataType = p.ChangeNotificationDataType, @processorStatus = p.ProcessorStatus, @nextQueueOrderValue = p.NextQueueOrderValue, @lastConsistentDbUtc = p.LastConsistentDbUtc, @isOpen = c.IsOpen
    from tblChangeNotificationProcessor p
    join tblChangeNotificationConnection c on p.ProcessorId = c.ProcessorId
    where c.ConnectionId = @connectionId
    if (@processorId is null)
    begin
        set @processorStatus = 'closed'
    end
    else if (@expectedChangeNotificationDataType is not null and @expectedChangeNotificationDataType != @queuedDataType)
    begin
        set @processorStatus = 'type_mismatch'
    end
    else if (@processorStatus = 'invalid' or @isOpen = 1)
    begin
        -- the queue is invalid, or the current connection is valid.
        -- all pending connection requests may be considered open.
        update tblChangeNotificationConnection
        set IsOpen = 1
        where ProcessorId = @processorId and IsOpen = 0
        if (@processorStatus = 'valid' and @nextQueueOrderValue = 0)
        begin
            set @lastConsistentDbUtc = GETUTCDATE()
        end
    end
    else if (@isOpen = 0 and @processorStatus != 'invalid')
    begin
        set @processorStatus = 'opening'
    end
    update tblChangeNotificationConnection
    set LastActivityDbUtc = GETUTCDATE()
    where ConnectionId = @connectionId
    select @processorId as ProcessorId,  @processorStatus as ProcessorStatus, @lastConsistentDbUtc
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationCloseConnection]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationCloseConnection]
    @connectionId uniqueidentifier
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        select @processorId = p.ProcessorId, @processorStatus = p.ProcessorStatus
        from tblChangeNotificationConnection c
        join tblChangeNotificationProcessor p on c.ProcessorId = p.ProcessorId
        where c.ConnectionId = @connectionId
        update tblChangeNotificationQueuedInt set ConnectionId = null where ConnectionId = @connectionId
        update tblChangeNotificationQueuedGuid set ConnectionId = null where ConnectionId = @connectionId
        update tblChangeNotificationQueuedString set ConnectionId = null where ConnectionId = @connectionId
        delete from tblChangeNotificationConnection where ConnectionId = @connectionId
        if (@processorStatus != 'valid' and not exists (select 1 from tblChangeNotificationConnection where ProcessorId = @processorId))
        begin
            -- if there are no connections to the queue and it is not in a valid state, remove it from persistent storage.
            delete from tblChangeNotificationQueuedInt where ProcessorId = @processorId
            delete from tblChangeNotificationQueuedGuid where ProcessorId = @processorId
            delete from tblChangeNotificationQueuedString where ProcessorId = @processorId
            delete from tblChangeNotificationProcessor where ProcessorId = @processorId
        end
        commit transaction
        select @connectionId as ConnectionId
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationCompleteBatchGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationCompleteBatchGuid]
    @connectionId uniqueidentifier,
    @success bit
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId, 'Guid'
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        if (@processorStatus != 'invalid' and @processorStatus != 'closed')
        begin
            if (@success = 1)
            begin
                delete from tblChangeNotificationQueuedGuid
                where ConnectionId = @connectionId
                if not exists (select 1 from tblChangeNotificationQueuedGuid where ProcessorId = @processorId)
                begin
                    update tblChangeNotificationProcessor
                    set NextQueueOrderValue = 0, LastConsistentDbUtc = GETUTCDATE()
                    where ProcessorId = @processorId
                end
            end
            else
            begin
                declare @queueOrder int
                update tblChangeNotificationProcessor
                set @queueOrder = NextQueueOrderValue = NextQueueOrderValue + 1
                where ProcessorId = @processorId
                update tblChangeNotificationQueuedGuid
                set QueueOrder = @queueOrder, ConnectionId = null
                where ConnectionId = @connectionId
            end
        end
        commit transaction
    end try
    begin catch
    declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationCompleteBatchInt]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationCompleteBatchInt]
    @connectionId uniqueidentifier,
    @success bit
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId, 'Int'
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        if (@processorStatus != 'invalid' and @processorStatus != 'closed')
        begin
            if (@success = 1)
            begin
                delete from tblChangeNotificationQueuedInt
                where ConnectionId = @connectionId
                if not exists (select 1 from tblChangeNotificationQueuedInt where ProcessorId = @processorId)
                begin
                    update tblChangeNotificationProcessor
                    set NextQueueOrderValue = 0, LastConsistentDbUtc = GETUTCDATE()
                    where ProcessorId = @processorId
                end
            end
            else
            begin
                declare @queueOrder int
                update tblChangeNotificationProcessor
                set @queueOrder = NextQueueOrderValue = NextQueueOrderValue + 1
                where ProcessorId = @processorId
                update tblChangeNotificationQueuedInt
                set QueueOrder = @queueOrder, ConnectionId = null
                where ConnectionId = @connectionId
            end
        end
        commit transaction
    end try
    begin catch
    declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationCompleteBatchString]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationCompleteBatchString]
    @connectionId uniqueidentifier,
    @success bit
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId, 'String'
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        if (@processorStatus != 'invalid' and @processorStatus != 'closed')
        begin
            if (@success = 1)
            begin
                delete from tblChangeNotificationQueuedString
                where ConnectionId = @connectionId
                if not exists (select 1 from tblChangeNotificationQueuedString where ProcessorId = @processorId)
                begin
                    update tblChangeNotificationProcessor
                    set NextQueueOrderValue = 0, LastConsistentDbUtc = GETUTCDATE()
                    where ProcessorId = @processorId
                end
            end
            else
            begin
                declare @queueOrder int
                update tblChangeNotificationProcessor
                set @queueOrder = NextQueueOrderValue = NextQueueOrderValue + 1
                where ProcessorId = @processorId
                update tblChangeNotificationQueuedString
                set QueueOrder = @queueOrder, ConnectionId = null
                where ConnectionId = @connectionId
            end
        end
        commit transaction
    end try
    begin catch
    declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationDequeueGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationDequeueGuid]
    @connectionId uniqueidentifier,
    @maxItems int
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId, 'Guid'
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        if (@processorStatus = 'valid')
        begin
            if exists (select 1 from tblChangeNotificationQueuedGuid where ConnectionId = @connectionId)
            begin
                raiserror('A batch is already pending for the specified queue connection.', 16, 1)
            end
            declare @result table (Value uniqueidentifier)
            insert into @result (Value)
            select top (@maxItems) Value
            from tblChangeNotificationQueuedGuid
            where ProcessorId = @processorId
			  and ConnectionId is null
            order by QueueOrder
            update tblChangeNotificationQueuedGuid
            set ConnectionId = @connectionId
            where ProcessorId = @processorId
              and Value in (select Value from @result)
            select Value from @result
        end
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationDequeueInt]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationDequeueInt]
    @connectionId uniqueidentifier,
    @maxItems int
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId, 'Int'
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        if (@processorStatus = 'valid')
        begin
            if exists (select 1 from tblChangeNotificationQueuedInt where ConnectionId = @connectionId)
            begin
                raiserror('A batch is already pending for the specified queue connection.', 16, 1)
            end
            declare @result table (Value int)
            insert into @result (Value)
            select top (@maxItems) Value
            from tblChangeNotificationQueuedInt
            where ProcessorId = @processorId
			  and ConnectionId is null
			order by QueueOrder
            update tblChangeNotificationQueuedInt
            set ConnectionId = @connectionId
            where ProcessorId = @processorId
              and Value in (select Value from @result)
            select Value from @result
        end
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationDequeueString]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationDequeueString]
    @connectionId uniqueidentifier,
    @maxItems int
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId, 'String'
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        if (@processorStatus = 'valid')
        begin
            if exists (select 1 from tblChangeNotificationQueuedString where ConnectionId = @connectionId)
            begin
                raiserror('A batch is already pending for the specified queue connection.', 16, 1)
            end
            declare @result table (Value nvarchar(450) collate Latin1_General_BIN2)
            insert into @result (Value)
            select top (@maxItems) Value
            from tblChangeNotificationQueuedString
			where ProcessorId = @processorId
			  and ConnectionId is null
			order by QueueOrder
            update tblChangeNotificationQueuedString
            set ConnectionId = @connectionId
            where ProcessorId = @processorId
              and Value in (select Value from @result)
            select Value from @result
        end
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationEnqueueGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationEnqueueGuid]
    @processorId uniqueidentifier,
    @items ChangeNotificationGuidTable readonly
as
begin
    begin try
        begin transaction
        declare @processorStatus nvarchar(30)
        select @processorStatus = ProcessorStatus
        from tblChangeNotificationProcessor
        where ProcessorId = @processorId
        if (@processorStatus != 'invalid' and @processorStatus != 'closed')
        begin
            declare @queueOrder int
            update tblChangeNotificationProcessor
            set @queueOrder = NextQueueOrderValue = NextQueueOrderValue + 1, LastConsistentDbUtc = case when @processorStatus = 'valid' and NextQueueOrderValue = 0 then GETUTCDATE() else LastConsistentDbUtc end
            where ProcessorId = @processorId
            -- insert values from @items, avoiding any values which are already in the queue and not in an outstanding batch.
            insert into tblChangeNotificationQueuedGuid (ProcessorId, QueueOrder, ConnectionId, Value)
            select @processorId, @queueOrder, null, i.Value
            from @items i
            left outer join tblChangeNotificationQueuedGuid q
                on q.ProcessorId = @processorId
                and q.ConnectionId is null
                and i.Value = q.Value
            where q.ProcessorId is null
        end
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationEnqueueInt]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationEnqueueInt]
    @processorId uniqueidentifier,
    @items ChangeNotificationIntTable readonly
as
begin
    begin try
        begin transaction
        declare @processorStatus nvarchar(30)
        select @processorStatus = ProcessorStatus
        from tblChangeNotificationProcessor
        where ProcessorId = @processorId
        if (@processorStatus != 'invalid' and @processorStatus != 'closed')
        begin
            declare @queueOrder int
            update tblChangeNotificationProcessor
            set @queueOrder = NextQueueOrderValue = NextQueueOrderValue + 1, LastConsistentDbUtc = case when @processorStatus = 'valid' and NextQueueOrderValue = 0 then GETUTCDATE() else LastConsistentDbUtc end
            where ProcessorId = @processorId
            -- insert values from @items, avoiding any values which are already in the queue and not in an outstanding batch.
            insert into tblChangeNotificationQueuedInt (ProcessorId, QueueOrder, ConnectionId, Value)
            select @processorId, @queueOrder, null, i.Value
            from @items i
            left outer join tblChangeNotificationQueuedInt q
                on q.ProcessorId = @processorId
                and q.ConnectionId is null
                and i.Value = q.Value
            where q.ProcessorId is null
        end
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationEnqueueString]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationEnqueueString]
    @processorId uniqueidentifier,
    @items ChangeNotificationStringTable readonly
as
begin
    begin try
        begin transaction
        declare @processorStatus nvarchar(30)
        select @processorStatus = ProcessorStatus
        from tblChangeNotificationProcessor
        where ProcessorId = @processorId
        if (@processorStatus != 'invalid' and @processorStatus != 'closed')
        begin
            declare @queueOrder int
            update tblChangeNotificationProcessor
            set @queueOrder = NextQueueOrderValue = NextQueueOrderValue + 1, LastConsistentDbUtc = case when @processorStatus = 'valid' and NextQueueOrderValue = 0 then GETUTCDATE() else LastConsistentDbUtc end
            where ProcessorId = @processorId
            -- insert values from @items, avoiding any values which are already in the queue and not in an outstanding batch.
            insert into tblChangeNotificationQueuedString (ProcessorId, QueueOrder, ConnectionId, Value)
            select @processorId, @queueOrder, null, i.Value
            from @items i
            left outer join tblChangeNotificationQueuedString q
                on q.ProcessorId = @processorId
                and q.ConnectionId is null
                and i.Value = q.Value
            where q.ProcessorId is null
        end
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationGetStatus]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationGetStatus]
    @connectionId uniqueidentifier
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @lastConsistentDbUtc datetime
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus, @lastConsistentDbUtc = LastConsistentDbUtc
        from @processorStatusTable
        declare @queuedDataType nvarchar(30)
        select @queuedDataType = ChangeNotificationDataType
        from tblChangeNotificationProcessor
        where ProcessorId = @processorId
        declare @queuedItemCount int
        if (@processorStatus = 'closed')
        begin
            set @queuedItemCount = 0
        end
        else if (@queuedDataType = 'Int')
        begin
            select @queuedItemCount = COUNT(*)
            from tblChangeNotificationQueuedInt
            where ProcessorId = @processorId and ConnectionId is null
        end
        else if (@queuedDataType = 'Guid')
        begin
            select @queuedItemCount = COUNT(*)
            from tblChangeNotificationQueuedGuid
            where ProcessorId = @processorId and ConnectionId is null
        end
        else if (@queuedDataType = 'String')
        begin
            select @queuedItemCount = COUNT(*)
            from tblChangeNotificationQueuedString
            where ProcessorId = @processorId and ConnectionId is null
        end
        select
            @processorStatus as ProcessorStatus,
            @queuedItemCount as QueuedItemCount,
            case when @processorStatus = 'valid' and @queuedItemCount = 0 then GETUTCDATE() else @lastConsistentDbUtc end as LastConsistentDbUtc
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationHeartBeat]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationHeartBeat]
    @connectionId uniqueidentifier
as
begin
    begin try
        begin transaction
        exec dbo.ChangeNotificationAccessConnectionWorker @connectionId
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationOpenConnection]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationOpenConnection]
    @processorId uniqueidentifier,
    @queuedDataType nvarchar(30),
    @processorName nvarchar(4000),
    @inactiveConnectionTimeoutSeconds int
as
begin
    declare @connectionId uniqueidentifier
    declare @processorStatus nvarchar(30)
    declare @configuredChangeNotificationDataType nvarchar(30)
    begin try
        begin transaction
        declare @utcnow datetime = GETUTCDATE()
        select @processorStatus = ProcessorStatus, @configuredChangeNotificationDataType = ChangeNotificationDataType
        from tblChangeNotificationProcessor
        where ProcessorId = @processorId
        if (@processorStatus is null)
        begin
            -- the queue does not exist on the database yet. create and open with state invalid.
            set @processorStatus = 'invalid'
            insert into tblChangeNotificationProcessor (ProcessorId, ChangeNotificationDataType, ProcessorName, ProcessorStatus, NextQueueOrderValue)
            values (@processorId, @queuedDataType, @processorName, @processorStatus, 0)
            set @connectionId = NEWID()
            insert into tblChangeNotificationConnection (ProcessorId, ConnectionId, IsOpen, LastActivityDbUtc)
            values (@processorId, @connectionId, 1, @utcnow)
        end
        else if (@processorStatus = 'invalid' or exists (select 1
            from tblChangeNotificationConnection
            where ProcessorId = @processorId and LastActivityDbUtc < DATEADD(second, -@inactiveConnectionTimeoutSeconds, @utcnow)))
        begin
            -- the queue exists.  we can skip waiting for another running processor to confirm the state, since it is invalid anyways.
            exec ChangeNotificationSetInvalidWorker @processorId, @inactiveConnectionTimeoutSeconds
            set @connectionId = NEWID()
            insert into tblChangeNotificationConnection (ProcessorId, ConnectionId, IsOpen, LastActivityDbUtc)
            values (@processorId, @connectionId, 1, @utcnow)
        end
        else if (@queuedDataType = @configuredChangeNotificationDataType)
        begin
            set @connectionId = NEWID()
            declare @isOpen bit
            if exists (select 1 from tblChangeNotificationConnection where ProcessorId = @processorId)
            begin
                -- there are connections open, which may or may not still be running.
                -- leave the isOpen flag set to 0 as a request for a running process to confirm the queue status.
                set @isOpen = 0
            end
            else
            begin
                -- there are no connections to the queue. open with the current status intact.
                set @isOpen = 1
            end
            insert into tblChangeNotificationConnection (ProcessorId, ConnectionId, IsOpen, LastActivityDbUtc)
            values (@processorId, @connectionId, @isOpen, GETUTCDATE())
        end
        else
        begin
            -- the processor exists with a different queued type. throw an exception.
            raiserror('The specified processor ID already exists with a different queued type.', 16, 1)
        end
        select c.ConnectionId, case when c.IsOpen = 0 then 'opening' else p.ProcessorStatus end as ProcessorStatus
        from tblChangeNotificationConnection c
        join tblChangeNotificationProcessor p on c.ProcessorId = p.ProcessorId
        where c.ConnectionId = @connectionId
        commit transaction
    end try
    begin catch
        declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationSetInvalid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationSetInvalid]
    @processorId uniqueidentifier,
    @inactiveConnectionTimeoutSeconds int
as
begin
    begin try
        begin transaction
        exec ChangeNotificationSetInvalidWorker @processorId, @inactiveConnectionTimeoutSeconds
        commit transaction
    end try
    begin catch
    declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationSetInvalidWorker]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationSetInvalidWorker]
    @processorId uniqueidentifier,
    @inactiveConnectionTimeoutSeconds int
as
begin
    delete from tblChangeNotificationQueuedInt where ProcessorId = @processorId
    delete from tblChangeNotificationQueuedGuid where ProcessorId = @processorId
    delete from tblChangeNotificationQueuedString where ProcessorId = @processorId
    update tblChangeNotificationProcessor
    set ProcessorStatus = 'invalid', NextQueueOrderValue = 0, LastConsistentDbUtc = null
    where ProcessorId = @processorId
    delete from tblChangeNotificationConnection
    where ProcessorId = @processorId and LastActivityDbUtc < DATEADD(second, -@inactiveConnectionTimeoutSeconds, GETUTCDATE())
    update tblChangeNotificationConnection
    set IsOpen = 1
    where ProcessorId = @processorId and IsOpen = 0
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationTrySetRecovering]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationTrySetRecovering]
    @connectionId uniqueidentifier,
    @inactiveConnectionTimeoutSeconds int
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        declare @result bit
        if (@processorStatus = 'invalid')
        begin
            delete from tblChangeNotificationConnection
            where ProcessorId = @processorId
              and LastActivityDbUtc < DATEADD(second, -@inactiveConnectionTimeoutSeconds, GETUTCDATE())
            update tblChangeNotificationProcessor
            set ProcessorStatus = 'recovering'
            where ProcessorId = @processorId
            set @result = 1
        end
        else
        begin
            set @result = 0
        end
        commit transaction
        select @result as StateChanged
    end try
    begin catch
    declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ChangeNotificationTrySetValid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeNotificationTrySetValid]
    @connectionId uniqueidentifier
as
begin
    begin try
        begin transaction
        declare @processorId uniqueidentifier
        declare @processorStatus nvarchar(30)
        declare @processorStatusTable table (ProcessorId uniqueidentifier, ProcessorStatus nvarchar(30), LastConsistentDbUtc datetime)
        insert into @processorStatusTable (ProcessorId, ProcessorStatus, LastConsistentDbUtc)
        exec ChangeNotificationAccessConnectionWorker @connectionId
        select @processorId = ProcessorId, @processorStatus = ProcessorStatus
        from @processorStatusTable
        declare @result bit
        if (@processorStatus = 'recovering')
        begin
            update tblChangeNotificationProcessor
            set ProcessorStatus = 'valid'
            where ProcessorId = @processorId
            set @result = 1
        end
        else
        begin
            set @result = 0
        end
        commit transaction
        select @result as StateChanged
    end try
    begin catch
    declare @msg nvarchar(4000), @sev int, @stt int
        select @msg = ERROR_MESSAGE(), @sev = ERROR_SEVERITY(), @stt = ERROR_STATE()
        rollback transaction
        raiserror(@msg, @sev, @stt)
    end catch
end
GO
/****** Object:  StoredProcedure [dbo].[DateTimeConversion_Finalize]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateTimeConversion_Finalize]
(@Print INT = NULL)
AS
BEGIN
	IF @Print IS NOT NULL PRINT 'UPDATE DateTimeKind'
	UPDATE tbl 
	SET DateTimeKind = 2
	FROM tblBigTableStoreConfig tbl
	JOIN tblDateTimeConversion_FieldName f ON tbl.StoreName = f.StoreName AND tbl.TableName = f.TableName 
	DECLARE @GetDateTimeKindSql NVARCHAR(MAX) = '
ALTER PROCEDURE [dbo].[sp_GetDateTimeKind]
AS
	-- 0 === Unspecified  
	-- 1 === Local time 
	-- 2 === UTC time 
	RETURN 2
'
	EXEC (@GetDateTimeKindSql)
	IF @Print IS NOT NULL PRINT 'FINISHED'
END
GO
/****** Object:  StoredProcedure [dbo].[DateTimeConversion_GetFieldNames]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateTimeConversion_GetFieldNames]
AS 
BEGIN 
	SELECT '** TABLENAME **','** DATETIME COLUMNNAME (OPTIONAL) **', '** STORENAME (OPTIONAL) **'
	-- TABLES
	UNION SELECT 'tblContent', NULL, NULL
	UNION SELECT 'tblContentLanguage', NULL, NULL
	UNION SELECT 'tblContentProperty', NULL, NULL
	UNION SELECT 'tblContentSoftlink', NULL, NULL
	UNION SELECT 'tblContentType', NULL, NULL
	UNION SELECT 'tblPlugIn', NULL, NULL
	UNION SELECT 'tblProject', NULL, NULL
	UNION SELECT 'tblPropertyDefinitionDefault', 'Date', NULL
	UNION SELECT 'tblTask', NULL, NULL
	UNION SELECT 'tblWorkContent', NULL, NULL
	UNION SELECT 'tblWorkContentProperty', NULL, NULL
	UNION SELECT 'tblXFormData', 'DatePosted', NULL
	-- STORES
	UNION SELECT 'tblBigTable', NULL, 'EPiServer.Personalization.VisitorGroups.Criteria.ViewedCategoriesModel'
	UNION SELECT 'tblIndexRequestLog', NULL, 'EPiServer.Search.Data.IndexRequestQueueItem'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiContentRestoreStore'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.ApplicationModules.Security.SiteSecret'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Core.PropertySettings.PropertySettingsContainer'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Core.PropertySettings.PropertySettingsGlobals'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Core.PropertySettings.PropertySettingsWrapper'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Editor.TinyMCE.TinyMCESettings'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Editor.TinyMCE.ToolbarRow'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Licensing.StoredLicense'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.MirroringService.MirroringData'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Shell.Profile.ProfileData'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Shell.Storage.PersonalizedViewSettingsStorage'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Util.BlobCleanupJobState'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Util.ContentAssetsCleanupJobState'
	UNION SELECT 'tblSystemBigTable', NULL, 'GadgetStore'
	UNION SELECT 'tblSystemBigTable', NULL, 'VisitorGroup'
	UNION SELECT 'tblSystemBigTable', NULL, 'VisitorGroupCriterion'
	UNION SELECT 'tblSystemBigTable', NULL, 'XFormFolders'
	-- OBSOLETE STORES
	UNION SELECT 'tblBigTable', NULL, 'EPiServer.Web.HostDefinition'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Web.SiteDefinition'
	UNION SELECT 'tblSystemBigTable', NULL, 'DashboardContainerStore'
	UNION SELECT 'tblSystemBigTable', NULL, 'DashboardLayoutPartStore'
	UNION SELECT 'tblSystemBigTable', NULL, 'DashboardStore'
	UNION SELECT 'tblSystemBigTable', NULL, 'DashboardTabLayoutStore'
	UNION SELECT 'tblSystemBigTable', NULL, 'DashboardTabStore'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Events.Remote.EventSecret'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.Licensing.SiteLicenseData'
	UNION SELECT 'tblSystemBigTable', NULL, 'EPiServer.TaskManager.TaskManagerDynamicData'
	UNION SELECT 'tblBigTable', NULL, 'EPiServer.Core.IndexingInformation'
	UNION SELECT 'tblBigTable', NULL, 'EPiServer.Shell.Search.SearchProviderSetting'
END
GO
/****** Object:  StoredProcedure [dbo].[DateTimeConversion_InitBlocks]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateTimeConversion_InitBlocks]
(@BlockSize INT, @Print INT = NULL)
AS
BEGIN
	IF OBJECT_ID('[dbo].[tblDateTimeConversion_Block]', 'U') IS NOT NULL
	BEGIN
		IF (SELECT COUNT(*) FROM [dbo].[tblDateTimeConversion_Block] WHERE Converted > 0 AND [Sql] IS NOT NULL) > 0 
			RETURN 
		ELSE 
			DROP TABLE [dbo].[tblDateTimeConversion_Block]
	END
	CREATE TABLE [dbo].[tblDateTimeConversion_Block](
		[pkID] [int] IDENTITY(1,1) NOT NULL,		
		[TableName] nvarchar(128) NOT NULL,
		[ColName] nvarchar(128) NOT NULL,
		[StoreName] NVARCHAR(375) NULL,
		[BlockRank] INT NOT NULL,
		[BlockCount] INT NOT NULL,
		[Sql] nvarchar(MAX) NULL,
		[Priority] INT NOT NULL DEFAULT 0,
		[Converted] BIT NOT NULL DEFAULT 0,
		[StartTime] DATETIME NULL,
		[EndTime] DATETIME NULL,
		[UpdateTime] INT NULL,
		[CallTime] AS (DATEDIFF(MS, StartTime,EndTime)),
		CONSTRAINT [PK_tblDateTimeConversion_Block] PRIMARY KEY  CLUSTERED
		(
			[pkID]
		)
	)
	DECLARE @tblName NVARCHAR(128)
	DECLARE @colName NVARCHAR(128)
	DECLARE @storeName NVARCHAR(375)
	DECLARE cur CURSOR LOCAL FOR SELECT TableName, ColName, StoreName FROM [dbo].[tblDateTimeConversion_FieldName]                                  
	DECLARE @TotalCount INT
	DECLARE @loops INT = 0
	SELECT @TotalCount = COUNT(*) FROM [dbo].[tblDateTimeConversion_FieldName]                                                           
	OPEN cur
	FETCH NEXT FROM cur INTO @tblName, @colName, @storeName
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		SET @loops = @loops + 1
		DECLARE @store NVARCHAR(500) = CASE WHEN @storeName IS NULL THEN '' ELSE ', STORENAME: ' + @storeName END 	 
		IF @Print IS NOT NULL PRINT CAST(@loops AS NVARCHAR(8)) + ' / ' + CAST(@TotalCount AS NVARCHAR(8)) + ' - TABLE: '+@tblName+', COLUMN: '+@colName + @store +', TIMESTAMP: ' + CONVERT( VARCHAR(24), GETDATE(), 121)
		EXEC [dbo].[DateTimeConversion_MakeTableBlocks] @tblName, @colName, @storeName, @BlockSize, @Print		 
		FETCH NEXT FROM cur INTO @tblName, @colName, @storeName
	END	
	CLOSE cur
	DEALLOCATE cur
END
GO
/****** Object:  StoredProcedure [dbo].[DateTimeConversion_InitDateTimeOffsets]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateTimeConversion_InitDateTimeOffsets]
(@DateTimeOffsets [dbo].[DateTimeConversion_DateTimeOffset] READONLY)
AS
BEGIN
	IF OBJECT_ID('[dbo].[tblDateTimeConversion_Offset]', 'U') IS NOT NULL
		DROP TABLE [dbo].[tblDateTimeConversion_Offset]
	CREATE TABLE [dbo].[tblDateTimeConversion_Offset](
		[pkID] [INT] IDENTITY(1,1) NOT NULL,
		[IntervalStart] [DATETIME] NOT NULL, 
		[IntervalEnd] [DATETIME] NOT NULL,
		[Offset] DECIMAL(24,20) NOT NULL,
		CONSTRAINT [PK_tblDateTimeConversion_Offset] PRIMARY KEY  CLUSTERED
		(
			[pkID]
		)
	)
	INSERT INTO [dbo].[tblDateTimeConversion_Offset](IntervalStart, IntervalEnd, Offset)
	SELECT  tbl.IntervalStart,tbl.IntervalEnd,-CAST(tbl.Offset AS DECIMAL(24,20))/24/60 FROM @DateTimeOffsets tbl
	CREATE UNIQUE INDEX IDX_DateTimeConversion_Interval1 ON [dbo].[tblDateTimeConversion_Offset](IntervalStart ASC, IntervalEnd ASC) 
	CREATE UNIQUE INDEX IDX_DateTimeConversion_Interval2 ON [dbo].[tblDateTimeConversion_Offset](IntervalStart DESC, IntervalEnd DESC) 
END
GO
/****** Object:  StoredProcedure [dbo].[DateTimeConversion_InitFieldNames]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateTimeConversion_InitFieldNames]
AS
BEGIN
	IF OBJECT_ID('[dbo].[tblDateTimeConversion_FieldName]', 'U') IS NOT NULL
		DROP TABLE [dbo].[tblDateTimeConversion_FieldName]
	CREATE TABLE [dbo].[tblDateTimeConversion_FieldName](
		[pkID] [int] IDENTITY(1,1) NOT NULL,		
		[TableName] nvarchar(128) NOT NULL,
		[ColName] nvarchar(128) NOT NULL,
		[StoreName] NVARCHAR(375) NULL,
		CONSTRAINT [PK_DateTimeConversion_InitFieldNames] PRIMARY KEY  CLUSTERED
		(
			[pkID]
		)
	)
	DECLARE @FieldNames AS TABLE 
	(
		TableName NVARCHAR(128) NOT NULL,
		ColName NVARCHAR(128) NULL,
		StoreName NVARCHAR(375) NULL
	)
	INSERT INTO @FieldNames
	EXEC DateTimeConversion_GetFieldNames
	INSERT INTO @FieldNames
	SELECT TableName = c.name, ColName = a.name, f.StoreName  from 
		sys.columns a 
		INNER JOIN sys.types t ON a.user_type_id = t.user_type_id AND (t.name = 'datetime' OR t.name = 'datetime2')
		INNER JOIN sys.tables c ON a.object_id = c.object_id 
		INNER JOIN @FieldNames f ON c.object_id = OBJECT_ID(f.TableName)
	WHERE f.ColName IS NULL
	
	DELETE @FieldNames WHERE ColName IS NULL
	DECLARE @DateTimeKind INT
	EXEC @DateTimeKind = sp_GetDateTimeKind
	INSERT INTO [dbo].[tblDateTimeConversion_FieldName](TableName, ColName, StoreName)
	SELECT DISTINCT REPLACE(REPLACE(REPLACE(X.TableName,'[',''),']',''),'dbo.',''), ColName = REPLACE(REPLACE(X.ColName,']',''),'[',''), X.StoreName FROM (
		SELECT f.TableName, f.ColName, StoreName = NULL FROM @FieldNames f WHERE @DateTimeKind = 0 AND f.StoreName IS NULL
		UNION
		SELECT DISTINCT f.TableName, f.ColName, f.StoreName
		FROM sys.columns a 
		INNER JOIN sys.types t ON a.user_type_id = t.user_type_id AND (t.name = 'datetime' OR t.name = 'datetime2')
		INNER JOIN sys.tables c ON a.object_id = c.object_id 
		INNER JOIN tblBigTableStoreConfig i ON c.object_id = OBJECT_ID(i.TableName) AND i.DateTimeKind = 0
		INNER JOIN @FieldNames f ON c.object_id = OBJECT_ID(f.TableName) AND (a.name COLLATE database_default = f.ColName OR '['+a.name COLLATE database_default+']' = f.ColName) AND f.StoreName = i.StoreName
	) X
	INNER JOIN (
		SELECT TableId = c.object_id, ColName = a.name FROM sys.columns a 
		INNER JOIN sys.types t ON a.user_type_id = t.user_type_id AND (t.name = 'datetime' OR t.name = 'datetime2')
		INNER JOIN sys.tables c ON a.object_id = c.object_id
	) Y 
	ON Y.TableId = OBJECT_ID(X.TableName) AND (Y.ColName = X.ColName COLLATE database_default OR '['+Y.ColName +']' = X.ColName COLLATE database_default)
END
GO
/****** Object:  StoredProcedure [dbo].[DateTimeConversion_MakeTableBlocks]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateTimeConversion_MakeTableBlocks]
(
	@TableName NVARCHAR(MAX), 
	@DateTimeColumn NVARCHAR(MAX),
	@StoreName NVARCHAR(MAX), 
	@BlockSize INT, 
	@Print INT)
AS
BEGIN	
	-- Format
	SET @TableName = REPLACE(REPLACE(REPLACE(@TableName,'[',''),']',''),'dbo.','')
	SET @DateTimeColumn = REPLACE(REPLACE(@DateTimeColumn,']',''),'[','')
	-- CHECK tblBigTableReference
	IF (@StoreName IS NOT NULL)
	BEGIN
		DECLARE @BigTableReferenceCount INT
		SELECT @BigTableReferenceCount = COUNT(*) FROM tblBigTableReference r
		JOIN tblBigTableIdentity i ON r.pkId = i.pkId WHERE i.StoreName = @StoreName AND DateTimeValue IS NOT NULL
		IF(@BigTableReferenceCount > 0)
		BEGIN
			DECLARE @BigTableReferenceSql NVARCHAR(MAX) = 
				'UPDATE tbl SET tbl.[DateTimeValue] = CAST([DateTimeValue] AS DATETIME) + dtc.OffSet FROM tblBigTableReference tbl ' +
				'INNER JOIN [dbo].[tblDateTimeConversion_Offset] dtc ON tbl.[DateTimeValue] >= dtc.IntervalStart AND tbl.[DateTimeValue] < dtc.IntervalEnd ' +
				'INNER JOIN [dbo].[tblBigTableIdentity] bti ON bti.StoreName = ''' + @StoreName + ''' AND tbl.pkId = bti.pkId ' +
				'WHERE tbl.[DateTimeValue] IS NOT NULL '
			INSERT INTO [dbo].[tblDateTimeConversion_Block](TableName, ColName, StoreName, [Sql], BlockRank,BlockCount) 
			SELECT TableName = 'tblBigTableReference', ColName = 'DateTimeValue', @StoreName, [Sql] = @BigTableReferenceSql , BlockRank = 0, BlockCount = @BigTableReferenceCount
		END
	END
	-- Get primary keys
	DECLARE @Keys TABLE(Data NVARCHAR(100)) 
	INSERT INTO @Keys
	SELECT i.COLUMN_NAME
	FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE i
	WHERE OBJECTPROPERTY(OBJECT_ID(i.CONSTRAINT_NAME), 'IsPrimaryKey') = 1
	AND i.TABLE_NAME = @TableName
	IF ((SELECT COUNT(*) FROM @Keys) = 0 )
	BEGIN
		INSERT INTO [dbo].[tblDateTimeConversion_Block](TableName, ColName, StoreName, [Sql],Converted,BlockRank,BlockCount) 
		SELECT TableName = @TableName, ColName = @DateTimeColumn, @StoreName, [Sql] = NULL, Converted = 1, BlockRank = -1, BlockCount = 0 
		RETURN		
	END
	-- Get total number of primary keys
	DECLARE @TotalPrimaryKeys INT  
	SELECT @TotalPrimaryKeys = COUNT(*) FROM @Keys
	-- Get number of integer primary keys
	DECLARE @IntegerPrimaryKeys INT  
	SELECT @IntegerPrimaryKeys = COUNT(*)
	FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE i
	JOIN INFORMATION_SCHEMA.COLUMNS c on i.COLUMN_NAME = c.COLUMN_NAME AND i.TABLE_NAME = c.TABLE_NAME
	WHERE OBJECTPROPERTY(OBJECT_ID(i.CONSTRAINT_NAME), 'IsPrimaryKey') = 1 AND c.DATA_TYPE IN ('bigint','int')
	AND i.TABLE_NAME = @TableName
	-- Non integer primary keys handling
	IF (@TotalPrimaryKeys > @IntegerPrimaryKeys)
	BEGIN
		DECLARE @NonIntegerSql NVARCHAR(MAX) = 'UPDATE tbl SET tbl.[' + @DateTimeColumn + '] = CAST('+ @DateTimeColumn +' AS DATETIME) + dtc.OffSet FROM ' + @TableName + ' tbl INNER JOIN [dbo].[tblDateTimeConversion_Offset] dtc ON tbl.[' + @DateTimeColumn + '] >= dtc.IntervalStart AND tbl.[' + @DateTimeColumn + '] < dtc.IntervalEnd WHERE tbl.[' + @DateTimeColumn + '] IS NOT NULL '
		INSERT INTO [dbo].[tblDateTimeConversion_Block](TableName, ColName, StoreName, Sql, BlockRank,BlockCount) 
		SELECT TableName = @TableName, ColName = @DateTimeColumn, @StoreName, Sql = @NonIntegerSql , BlockRank = -2, BlockCount = 0
		RETURN 
	END
	DECLARE @storeCondition NVARCHAR(MAX) = CASE WHEN @StoreName IS NULL THEN ' ' ELSE ' AND storeName = ''' + @StoreName + ''' ' END 	 
	-- Zero count handling
	DECLARE @sSQL nvarchar(500) = N'SELECT @retvalOUT = COUNT(*) FROM (SELECT TOP ' + CAST((@BlockSize + 1) AS NVARCHAR(10)) + ' * FROM ' + @TableName + ' WHERE [' + @DateTimeColumn + '] IS NOT NULL ' + @storeCondition + ') X'  
	DECLARE @ParmDefinition nvarchar(500) = N'@retvalOUT int OUTPUT'
	DECLARE @retval int   
	EXEC sp_executesql @sSQL, @ParmDefinition, @retvalOUT=@retval OUTPUT
	IF (@retval = 0)
	BEGIN
		INSERT INTO [dbo].[tblDateTimeConversion_Block](TableName, ColName, StoreName, Sql,Converted,BlockRank,BlockCount) 
		SELECT TableName = @TableName, ColName = @DateTimeColumn, @StoreName, Sql = NULL, Converted = 1, BlockRank = 0, BlockCount = 0 
		RETURN
	END
	-- Create formatted list of keys for use in queries
	DECLARE @Values_List NVARCHAR(MAX) = ''
	SELECT @Values_List = @Values_List + '[' + Data + '], ' FROM @Keys
	SET @Values_List = Substring(@Values_List, 1, len(@Values_List) - 1)
	DECLARE @Values_List2 NVARCHAR(MAX) = ''
	SELECT @Values_List2 = @Values_List2 + 'tbl.[' + Data + '], ' FROM @Keys
	SET @Values_List2 = Substring(@Values_List2, 1, len(@Values_List2) - 1)
	DECLARE @Values_RowId NVARCHAR(MAX) = ''
	SELECT @Values_RowId = @Values_RowId + ' REPLACE(STR([' + Data + '], 16), '' '' , ''0'') +' FROM @Keys
	SET @Values_RowId = Substring(@Values_RowId, 1, len(@Values_RowId) - 1)
	DECLARE @Values_RowId2 NVARCHAR(MAX) = ''
	SELECT @Values_RowId2 = @Values_RowId2 + ' REPLACE(STR(tbl.[' + Data + '], 16), '''' '''' , ''''0'''') +' FROM @Keys
	SET @Values_RowId2 = Substring(@Values_RowId2, 1, len(@Values_RowId2) - 1)
	
	DECLARE @Values_MinMaxList NVARCHAR(MAX) = ''
	SELECT @Values_MinMaxList = @Values_MinMaxList + ' [Min' + Data + '], [Max' + Data + '], ' FROM @Keys
	SET @Values_MinMaxList = Substring(@Values_MinMaxList, 1, len(@Values_MinMaxList) - 1)
	
	DECLARE @Values_MinMaxSet NVARCHAR(MAX) = ''
	SELECT @Values_MinMaxSet = @Values_MinMaxSet + ' [Min' + Data + '] = MIN(' + Data + '), [Max' + Data + '] = MAX(' + Data + '),' FROM @Keys
	SET @Values_MinMaxSet = Substring(@Values_MinMaxSet, 1, len(@Values_MinMaxSet) - 1)
	
	DECLARE @Values_Declare NVARCHAR(MAX) = ''
	SELECT @Values_Declare = @Values_Declare + ' [Min' + Data + '] INT NOT NULL, ' + ' [Max' + Data + '] INT NOT NULL, ' FROM @Keys
	
	DECLARE @Values_Condition NVARCHAR(MAX) = ''
	SELECT @Values_Condition = ' [Min' + @Values_Condition + Data + ',' FROM @Keys
	SET @Values_Condition = Substring(@Values_Condition, 1, len(@Values_Condition) - 1)
	DECLARE @Values_Declare2 NVARCHAR(MAX) = ''
	SELECT @Values_Declare2 = @Values_Declare2 + ' [' + Data + '] INT NOT NULL, ' FROM @Keys
	DECLARE @Values_Condition2 NVARCHAR(MAX) = ''
	SELECT @Values_Condition2 = @Values_Condition2 + ' tbl.['+Data+'] = t.['+Data+'] AND' FROM @Keys
	SET @Values_Condition2 = Substring(@Values_Condition2, 1, len(@Values_Condition2) - 3)
	
	DECLARE @SQL NVARCHAR(MAX) = ''
		+ 'DECLARE @DATA AS TABLE( '
		+ '	[MIN] DATETIME NULL, '
		+ '	[MAX] DATETIME NULL, '
		+ '	BlockRank INT NOT NULL, ' 
		+ '	BlockCount INT NOT NULL, '
		+ @Values_Declare
		+ '	IntervalStart VARCHAR(50) NULL, '
		+ '	IntervalEnd	VARCHAR(50) NULL, '
		+ '	ConditionSql NVARCHAR(MAX) NULL, '
		+ '	UpdateSql NVARCHAR(MAX) NULL, '
		+ '	Converted BIT NOT NULL DEFAULT 0 '
		+ ') '
		+ ' '
		+ 'DECLARE @BLOCK AS TABLE([MIN] DATETIME NULL, [MAX] DATETIME NULL, BlockRank INT NOT NULL, ' + @Values_Declare + 'BlockCount INT NOT NULL) '
		+ 'DECLARE @BLOCKROW1000 AS TABLE(BlockRank INT NOT NULL, RowId NVARCHAR(' + CAST(@IntegerPrimaryKeys * 16 AS NVARCHAR(10)) + ') NOT NULL) '
		+ ' '
		+ 'INSERT INTO @BLOCK '
		+ 'SELECT [MIN] = MIN(DT), [MAX] = MAX(DT), BlockRank = ([RANK] - 1) / ' + CAST((@BlockSize) AS NVARCHAR(10)) + ', ' + @Values_MinMaxSet + ', BlockCount = COUNT(*) '
		+ 'FROM ( '
		+ '    SELECT DT = [' + @DateTimeColumn + '], [Rank] = DENSE_RANK() OVER (ORDER BY ' + @Values_List + '), ' + @Values_List + ' '
		+ '    FROM ' + @TableName + ' WITH(NOLOCK) '
		+ '    WHERE [' + @DateTimeColumn + '] IS NOT NULL ' + @storeCondition
		+ '    ) AS RowNr '
		+ 'GROUP BY ((([Rank]) - 1) / ' + CAST((@BlockSize) AS NVARCHAR(10)) + ') '
		+ ' '
		+ 'INSERT INTO @BLOCKROW1000 '
		+ 'SELECT BlockRank = (DENSE_RANK() OVER (ORDER BY [RowID]) - 1), RowID FROM ( '
		+ '    SELECT RowID = ' + @Values_RowId + ' '
		+ '    FROM ( '
		+ '        SELECT ' + @Values_List + ', DENSE_RANK() OVER (ORDER BY ' + @Values_List + ') AS rownum '
		+ '	       FROM ' + @TableName + ' WITH(NOLOCK) '
		+ '        WHERE [' + @DateTimeColumn + '] IS NOT NULL ' + @storeCondition
		+ '        ) AS RowNr '
		+ '    WHERE RowNr.rownum % ' + CAST((@BlockSize) AS NVARCHAR(10)) + ' = 0   '  
		+ '    ) AS Row1000 '
		+ ' '
		+ 'INSERT INTO @DATA '
		+ 'SELECT [MIN], [MAX], Block.BlockRank, BlockCount, ' + @Values_MinMaxList + ', IntervalStart = NULL, IntervalEnd = RowID, ConditionSql = NULL, UpdateSql = NULL, Converted = 0 '
		+ 'FROM @BLOCK Block '
		+ 'LEFT JOIN @BLOCKROW1000	BlockRow1000 '
		+ 'ON Block.BlockRank = BlockRow1000.BlockRank '
		+ 'ORDER BY Block.BlockRank   '
		+ ' '
		+ 'UPDATE d1 SET d1.IntervalStart = d2.IntervalEnd FROM @DATA d1 JOIN @DATA d2 ON d1.BlockRank = d2.BlockRank + 1 '
		+ 'UPDATE @DATA SET IntervalStart = ''' + REPLICATE('0', 16 * @IntegerPrimaryKeys) + ''' WHERE BlockRank = (SELECT MIN(BlockRank) from @DATA) '
		+ 'UPDATE @DATA SET IntervalEnd = ''' + REPLICATE('9', 16 * @IntegerPrimaryKeys) + ''' WHERE BlockRank = (SELECT MAX(BlockRank) from @DATA) '
		+ 'UPDATE @Data SET ConditionSql = '' [' + @DateTimeColumn + '] IS NOT NULL ' + REPLACE(@storeCondition,'''','''''') + ' '' '
	SELECT @SQL = @SQL + ' + '' AND tbl.['+Data+'] >= ''+CAST([Min'+Data+'] AS NVARCHAR(20))+'' AND tbl.['+Data+'] <= ''+CAST([Max'+Data+'] AS NVARCHAR(20))+'' '' ' FROM @Keys v
	IF (@TotalPrimaryKeys>1)
		SET @SQL = @SQL +' + '' AND '+ @Values_RowId2 + ' > '''''' + IntervalStart + '''''' AND ' + @Values_RowId2 + ' <= '''''' + IntervalEnd + '''''' '' '
	DECLARE @UPDATESQL NVARCHAR(MAX) ='
		DECLARE @OffsetTEMP AS TABLE( [IntervalStart] DATETIME NOT NULL,[IntervalEnd] DATETIME NOT NULL, [Offset] FLOAT NOT NULL) 
		DECLARE @MIN DATETIME = ''''[[MIN]]'''', @MAX DATETIME = ''''[[MAX]]'''' 
		INSERT INTO @OffsetTEMP 
		SELECT c.IntervalStart, c.IntervalEnd, c.Offset 
		FROM tblDateTimeConversion_Offset c WITH (NOLOCK)  
		WHERE c.IntervalStart-1 >= @MIN AND c.IntervalEnd+1 <= @MAX OR @MIN between c.IntervalStart-1 and c.IntervalEnd+1 OR @MAX between c.IntervalStart-1 and c.IntervalEnd+1
	
		DECLARE @'+@TableName+'TEMP AS TABLE('+@Values_Declare2+' [' + @DateTimeColumn + '] DATETIME NOT NULL,PRIMARY KEY('+@Values_List+')) 
		INSERT INTO @'+@TableName+'TEMP 
		SELECT '+@Values_List2+', [' + @DateTimeColumn + '] = tbl.[' + @DateTimeColumn + '] + CAST(c.OffSet AS DATETIME)  
		FROM  @OffsetTEMP c
		JOIN ['+@TableName+'] tbl WITH(NOLOCK) ON tbl.[' + @DateTimeColumn + ']>=c.IntervalStart AND tbl.[' + @DateTimeColumn + ']<c.IntervalEnd 
		WHERE [[CONDITION]] 
		OPTION (LOOP JOIN) 
	
		DECLARE @StartTimeStamp DATETIME = SYSDATETIME() 
	
		UPDATE tbl 
		SET tbl.[' + @DateTimeColumn + '] = t.[' + @DateTimeColumn + '] 
		FROM @'+@TableName+'TEMP t 
		JOIN ['+@TableName+'] tbl WITH(ROWLOCK) ON '+@Values_Condition2 + '
		OPTION (LOOP JOIN) 
	
		DECLARE @EndTimeStamp DATETIME = SYSDATETIME() 
		SET @UpdateTimeRETURN = DATEDIFF(MS,@StartTimeStamp,@EndTimeStamp) '
	SET @SQL = @SQL 
		+ 'DECLARE @UpdateSql NVARCHAR(MAX) '
		+ 'SET @UpdateSql = ''' + @UPDATESQL + ' '' '
		+ 'UPDATE @Data SET UpdateSql = @UpdateSql '
		+ 'INSERT INTO [dbo].[tblDateTimeConversion_Block](TableName, ColName, StoreName, Sql,Priority,BlockRank,BlockCount) SELECT TableName = ''' + @TableName + ''', ColName = ''' + @DateTimeColumn + ''', StoreName= ' + COALESCE('''' + @StoreName + '''', 'NULL') + ', Sql = REPLACE(REPLACE(REPLACE(UpdateSql,''[[CONDITION]]'',ConditionSql),''[[MIN]]'',[MIN]),''[[MAX]]'',[MAX]), Priority = BlockRank, BlockRank = d.BlockRank,BlockCount=d.BlockCount FROM @DATA d '
	EXEC (@SQL)
	UPDATE tbl 
	SET [Priority] = f.MaxRank-tbl.BlockRank + 1
	FROM tblDateTimeConversion_Block tbl 
	JOIN (SELECT * FROM (
		SELECT TableName, MaxRank = MAX(BlockRank) 
		FROM tblDateTimeConversion_Block 
		WHERE Converted = 0 and [Sql] IS NOT NULL 
		GROUP BY TableName) x 
	WHERE MaxRank >= 0) f ON f.TableName = tbl.TableName 
	WHERE tbl.TableName = @TableName AND tbl.ColName = @DateTimeColumn 
END
GO
/****** Object:  StoredProcedure [dbo].[DateTimeConversion_RunBlocks]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateTimeConversion_RunBlocks]
(@Print INT = NULL)
AS
BEGIN
	DECLARE @pkId INT
	DECLARE @tblName nvarchar(128)
	DECLARE @colName nvarchar(128)
	DECLARE @storeName NVARCHAR(375)
	DECLARE @sql nvarchar(MAX)
	DECLARE cur CURSOR LOCAL FOR SELECT pkId, TableName,ColName,[Sql], StoreName FROM [tblDateTimeConversion_Block] WHERE Converted = 0 AND [Sql] IS NOT NULL ORDER BY [Priority]	
	DECLARE @StartTime DATETIME
	DECLARE @EndTime DATETIME
	DECLARE @TotalCount INT
	SELECT @TotalCount = COUNT(*) FROM [tblDateTimeConversion_Block] WHERE Converted = 0 AND [Sql] IS NOT NULL 
	IF (@TotalCount = 0)
		RETURN
	OPEN cur
	FETCH NEXT FROM cur INTO @pkId, @tblName, @colName, @sql, @storeName
	DECLARE @loops INT = 0
	DECLARE @UpdateTime INT
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		SET @loops = @loops + 1
		DECLARE @store NVARCHAR(500) = CASE WHEN @storeName IS NULL THEN '' ELSE ', STORENAME: ' + @storeName END 	 
		IF @Print IS NOT NULL PRINT CAST(@loops AS NVARCHAR(8)) + ' / ' + CAST(@TotalCount AS NVARCHAR(8)) + ' - PKID: ' + CAST(@pkId AS NVARCHAR(10)) +', TABLE: '+@tblName+', COLUMN: '+@colName + @store + ', TIMESTAMP: ' + CONVERT( VARCHAR(24), GETDATE(), 121)
		IF @Print IS NOT NULL PRINT '			SQL: ' + @sql
		BEGIN TRANSACTION [Transaction]
		BEGIN TRY
			SET @StartTime = GETDATE()
			EXEC sp_executesql @sql, N'@UpdateTimeRETURN int OUTPUT', @UpdateTimeRETURN = @UpdateTime OUTPUT				
			SET @EndTime = GETDATE()
			UPDATE [tblDateTimeConversion_Block] SET Converted = 1, StartTime = @StartTime, EndTime = @EndTime, UpdateTime = @UpdateTime WHERE pkID = @pkId
			IF @Print IS NOT NULL PRINT 'COMMIT'
			COMMIT TRANSACTION [Transaction]
		END TRY
		BEGIN CATCH
			IF @Print IS NOT NULL PRINT 'ROLLBACK: ' + ERROR_MESSAGE() 
			ROLLBACK TRANSACTION [Transaction]
		END CATCH  
		FETCH NEXT FROM cur INTO @pkId, @tblName, @colName, @sql, @storeName
	END	
	CLOSE cur
	DEALLOCATE cur
END
GO
/****** Object:  StoredProcedure [dbo].[editCreateContentVersion]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editCreateContentVersion]
(
	@ContentID			INT,
	@WorkContentID		INT,
	@UserName		NVARCHAR(255),
	@MaxVersions	INT = NULL,
	@SavedDate		DATETIME,
	@LanguageBranch	NCHAR(17)
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @NewWorkContentID		INT
	DECLARE @DeleteWorkContentID	INT
	DECLARE @ObsoleteVersions	INT
	DECLARE @retval				INT
	DECLARE @IsMasterLang		BIT
	DECLARE @LangBranchID		INT
	
	SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL
	BEGIN
		RAISERROR (N'editCreateContentVersion: LanguageBranchID is null, possibly empty table tblLanguageBranch', 16, 1, @WorkContentID)
		RETURN 0
	END
	IF (@WorkContentID IS NULL OR @WorkContentID=0 )
	BEGIN
		/* If we have a published version use it, else the latest saved version */
		IF EXISTS(SELECT * FROM tblContentLanguage WHERE Status = 4 AND fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID)
			SELECT @WorkContentID=[Version] FROM tblContentLanguage WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID
		ELSE
			SELECT TOP 1 @WorkContentID=pkID FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID ORDER BY Saved DESC
	END
	IF EXISTS( SELECT * FROM tblContent WHERE pkID=@ContentID AND fkMasterLanguageBranchID IS NULL )
		UPDATE tblContent SET fkMasterLanguageBranchID=@LangBranchID WHERE pkID=@ContentID
	
	SELECT @IsMasterLang = CASE WHEN @LangBranchID=fkMasterLanguageBranchID THEN 1 ELSE 0 END FROM tblContent WHERE pkID=@ContentID
		
		/* Create a new version of this content */
		INSERT INTO tblWorkContent
			(fkContentID,
			fkMasterVersionID,
			ChangedByName,
			ContentLinkGUID,
			fkFrameID,
			ArchiveContentGUID,
			Name,
			LinkURL,
			ExternalURL,
			VisibleInMenu,
			LinkType,
			Created,
			Saved,
			StartPublish,
			StopPublish,
			ChildOrderRule,
			PeerOrder,
			fkLanguageBranchID,
			URLSegment,
			ThumbnailUri,
			BlobUri)
		SELECT 
			fkContentID,
			@WorkContentID,
			@UserName,
			ContentLinkGUID,
			fkFrameID,
			ArchiveContentGUID,
			Name,
			LinkURL,
			ExternalURL,
			VisibleInMenu,
			LinkType,
			Created,
			@SavedDate,
			StartPublish,
			StopPublish,
			ChildOrderRule,
			PeerOrder,
			@LangBranchID,
			URLSegment,
			ThumbnailUri,
			BlobUri
		FROM 
			tblWorkContent 
		WHERE 
			pkID=@WorkContentID
	
		IF (@@ROWCOUNT = 1)
		BEGIN
			/* Remember version number */
			SET @NewWorkContentID= SCOPE_IDENTITY() 
			/* Copy all properties as well */
			INSERT INTO tblWorkContentProperty
				(fkPropertyDefinitionID,
				fkWorkContentID,
				ScopeName,
				Boolean,
				Number,
				FloatNumber,
				ContentType,
				ContentLink,
				Date,
				String,
				LongString,
                LinkGuid)          
			SELECT
				fkPropertyDefinitionID,
				@NewWorkContentID,
				ScopeName,
				Boolean,
				Number,
				FloatNumber,
				ContentType,
				ContentLink,
				Date,
				String,
				LongString,
                LinkGuid
			FROM
				tblWorkContentProperty
			INNER JOIN tblPropertyDefinition ON tblPropertyDefinition.pkID=tblWorkContentProperty.fkPropertyDefinitionID
			WHERE
				fkWorkContentID=@WorkContentID
				AND (tblPropertyDefinition.LanguageSpecific>2 OR @IsMasterLang=1)--Only lang specific on non-master 
				
			/* Finally take care of categories */
			INSERT INTO tblWorkContentCategory
				(fkWorkContentID,
				fkCategoryID,
				CategoryType,
				ScopeName)
			SELECT
				@NewWorkContentID,
				fkCategoryID,
				CategoryType,
				ScopeName
			FROM
				tblWorkContentCategory
			WHERE
				fkWorkContentID=@WorkContentID
				AND (CategoryType<>0 OR @IsMasterLang=1)--No content category on languages
		END
		ELSE
		BEGIN
			/* We did not have anything corresponding to the WorkContentID, create new work content from tblContent */
			INSERT INTO tblWorkContent
				(fkContentID,
				ChangedByName,
				ContentLinkGUID,
				fkFrameID,
				ArchiveContentGUID,
				Name,
				LinkURL,
				ExternalURL,
				VisibleInMenu,
				LinkType,
				Created,
				Saved,
				StartPublish,
				StopPublish,
				ChildOrderRule,
				PeerOrder,
				fkLanguageBranchID,
				URLSegment,
				ThumbnailUri,
				BlobUri)
			SELECT 
				@ContentID,
				COALESCE(@UserName, tblContentLanguage.CreatorName),
				tblContentLanguage.ContentLinkGUID,
				tblContentLanguage.fkFrameID,
				tblContent.ArchiveContentGUID,
				tblContentLanguage.Name,
				tblContentLanguage.LinkURL,
				tblContentLanguage.ExternalURL,
				tblContent.VisibleInMenu,
				CASE tblContentLanguage.AutomaticLink 
					WHEN 1 THEN 
						(CASE
							WHEN tblContentLanguage.ContentLinkGUID IS NULL THEN 0	/* EPnLinkNormal */
							WHEN tblContentLanguage.FetchData=1 THEN 4				/* EPnLinkFetchdata */
							ELSE 1								/* EPnLinkShortcut */
						END)
					ELSE
						(CASE 
							WHEN tblContentLanguage.LinkURL=N'#' THEN 3				/* EPnLinkInactive */
							ELSE 2								/* EPnLinkExternal */
						END)
				END AS LinkType ,
				tblContentLanguage.Created,
				@SavedDate,
				tblContentLanguage.StartPublish,
				tblContentLanguage.StopPublish,
				tblContent.ChildOrderRule,
				tblContent.PeerOrder,
				@LangBranchID,
				tblContentLanguage.URLSegment,
				ThumbnailUri,
				BlobUri
			FROM tblContentLanguage
			INNER JOIN tblContent ON tblContent.pkID=tblContentLanguage.fkContentID
			WHERE 
				tblContentLanguage.fkContentID=@ContentID AND tblContentLanguage.fkLanguageBranchID=@LangBranchID
			IF (@@ROWCOUNT = 1)
			BEGIN
				/* Remember version number */
				SET @NewWorkContentID= SCOPE_IDENTITY() 
				/* Copy all non-dynamic properties as well */
				INSERT INTO tblWorkContentProperty
					(fkPropertyDefinitionID,
					fkWorkContentID,
					ScopeName,
					Boolean,
					Number,
					FloatNumber,
					ContentType,
					ContentLink,
					Date,
					String,
					LongString,
                    LinkGuid)
				SELECT
					P.fkPropertyDefinitionID,
					@NewWorkContentID,
					P.ScopeName,
					P.Boolean,
					P.Number,
					P.FloatNumber,
					P.ContentType,
					P.ContentLink,
					P.Date,
					P.String,
					P.LongString,
                    P.LinkGuid
				FROM
					tblContentProperty AS P
				INNER JOIN
					tblPropertyDefinition AS PD ON P.fkPropertyDefinitionID=PD.pkID
				WHERE
					P.fkContentID=@ContentID AND (PD.fkContentTypeID IS NOT NULL)
					AND P.fkLanguageBranchID = @LangBranchID
					AND (PD.LanguageSpecific>2 OR @IsMasterLang=1)--Only lang specific on non-master 
					
				/* Finally take care of categories */
				INSERT INTO tblWorkContentCategory
					(fkWorkContentID,
					fkCategoryID,
					CategoryType)
				SELECT DISTINCT
					@NewWorkContentID,
					fkCategoryID,
					CategoryType
				FROM
					tblContentCategory
				LEFT JOIN
					tblPropertyDefinition AS PD ON tblContentCategory.CategoryType = PD.pkID
				WHERE
					tblContentCategory.fkContentID=@ContentID 
					AND (PD.fkContentTypeID IS NOT NULL OR tblContentCategory.CategoryType = 0) --Not dynamic properties
					AND (PD.LanguageSpecific=1 OR @IsMasterLang=1) --No content category on languages
			END
			ELSE
			BEGIN
				RAISERROR (N'Failed to create new version for content %d', 16, 1, @ContentID)
				RETURN 0
			END
		END
	/*If there is no version set for tblContentLanguage set it to this version*/
	UPDATE tblContentLanguage SET Version = @NewWorkContentID
	WHERE fkContentID = @ContentID AND fkLanguageBranchID = @LangBranchID AND Version IS NULL
		
	RETURN @NewWorkContentID
END
GO
/****** Object:  StoredProcedure [dbo].[editDeleteChilds]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeleteChilds]
(
    @PageID			INT,
    @ForceDelete	INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON
    SET XACT_ABORT ON
    DECLARE @retval INT
	DECLARE @pages AS editDeletePageInternalTable
	
	INSERT INTO @pages (pkID) 
	SELECT TOP 5000
		fkChildID 
	FROM 
		tblTree 
	WHERE fkParentID=@PageID
    ORDER BY NestingLevel DESC
	UPDATE @pages 
		SET PageGUID = tblPage.PageGUID
	FROM tblPage INNER JOIN @pages pages ON pages.pkID=tblPage.pkID
	DECLARE @sql NVARCHAR(200) = N'EXEC @retval=editDeletePageInternal @pages, @PageID=@PageID, @ForceDelete=@ForceDelete'
	DECLARE @params NVARCHAR(200) = N'@pages editDeletePageInternalTable READONLY, @PageID INT, @ForceDelete INT, @retval int OUTPUT'
	EXEC sp_executesql @sql, @params, @pages, @PageID, @ForceDelete, @retval=@retval OUTPUT
	DECLARE @deleteCount INT = (SELECT COUNT(*) FROM @pages)
	IF @deleteCount = 5000
	BEGIN
		SELECT finished = 0
	END ELSE BEGIN
		UPDATE tblContent SET IsLeafNode = 1 WHERE pkID=@PageID
		SELECT finished = 1
	END
        
	RETURN @retval
END
GO
/****** Object:  StoredProcedure [dbo].[editDeleteChildsCheck]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeleteChildsCheck]
(
	@PageID			INT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	/* Get all pages to delete (all childs of PageID) */
	DECLARE @pages AS editDeletePageInternalTable
	INSERT INTO @pages (pkID) 
	SELECT 
		fkChildID 
	FROM 
		tblTree 
	WHERE fkParentID=@PageID
	
	UPDATE @pages 
		SET PageGUID = tblPage.PageGUID
	FROM tblPage INNER JOIN @pages pages ON pages.pkID=tblPage.pkID
	
	EXEC sp_executesql N'EXEC editDeletePageCheckInternal @pages', N'@pages editDeletePageInternalTable READONLY', @pages
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[editDeleteContentVersion]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeleteContentVersion]
(
	@WorkContentID		INT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @ContentID			INT
	DECLARE @PublishedWorkID	INT
	DECLARE @LangBranchID		INT
	
	/* Verify that we can delete this version (i e do not allow removal of current version) */
	SELECT 
		@ContentID=tblContentLanguage.fkContentID, 
		@LangBranchID=tblContentLanguage.fkLanguageBranchID,
		@PublishedWorkID=tblContentLanguage.[Version] 
	FROM 
		tblWorkContent 
	INNER JOIN 
		tblContentLanguage ON tblContentLanguage.fkContentID=tblWorkContent.fkContentID AND tblContentLanguage.fkLanguageBranchID = tblWorkContent.fkLanguageBranchID
	WHERE 
		tblWorkContent.pkID=@WorkContentID
		
	IF (@@ROWCOUNT <> 1 OR @PublishedWorkID=@WorkContentID)
		RETURN -1
	IF ( (SELECT COUNT(pkID) FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID ) < 2 )
		RETURN -1
		
	EXEC editDeleteContentVersionInternal @WorkContentID=@WorkContentID
	
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[editDeleteContentVersionInternal]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeleteContentVersionInternal]
(
	@WorkContentID		INT
)
AS
BEGIN
	UPDATE tblWorkContent SET fkMasterVersionID=NULL WHERE fkMasterVersionID=@WorkContentID
	DELETE FROM tblWorkContentProperty WHERE fkWorkContentID=@WorkContentID
	DELETE FROM tblWorkContentCategory WHERE fkWorkContentID=@WorkContentID
	DELETE FROM tblWorkContent WHERE pkID=@WorkContentID
	
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[editDeletePage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeletePage]
(
	@PageID			INT,
	@ForceDelete	INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @retval INT
	DECLARE @ParentID INT
	/* Get all pages to delete (= PageID and all its childs) */
	DECLARE @pages AS editDeletePageInternalTable
	INSERT INTO @pages (pkID) 
	SELECT 
		fkChildID 
	FROM 
		tblTree 
	WHERE fkParentID=@PageID
	UNION
	SELECT @PageID
	
	UPDATE @pages 
		SET PageGUID = tblPage.PageGUID
	FROM tblPage INNER JOIN @pages pages ON pages.pkID=tblPage.pkID
	
	SELECT @ParentID=fkParentID FROM tblPage WHERE pkID=@PageID
				
	DECLARE @sql NVARCHAR(200) = N'EXEC @retval=editDeletePageInternal @pages, @PageID=@PageID, @ForceDelete=@ForceDelete'
	DECLARE @params NVARCHAR(200) = N'@pages editDeletePageInternalTable READONLY, @PageID INT, @ForceDelete INT, @retval int OUTPUT'
	EXEC sp_executesql @sql, @params, @pages, @PageID, @ForceDelete, @retval=@retval OUTPUT
	IF NOT EXISTS(SELECT * FROM tblContent WHERE fkParentID=@ParentID)
		UPDATE tblContent SET IsLeafNode = 1 WHERE pkID=@ParentID
	
	RETURN @retval
END
GO
/****** Object:  StoredProcedure [dbo].[editDeletePageCheck]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeletePageCheck]
(
	@PageID			INT,
	@IncludeDecendents BIT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	/* Get all pages to delete (= PageID and all its childs) */
	DECLARE @pages AS editDeletePageInternalTable
	INSERT INTO @pages (pkID) 
	SELECT @PageID
	IF @IncludeDecendents = 1
	BEGIN
		INSERT INTO @pages (pkID) 
		SELECT 
			fkChildID 
		FROM 
			tblTree 
		WHERE fkParentID=@PageID
	END
	
	UPDATE @pages 
		SET PageGUID = tblPage.PageGUID
	FROM tblPage INNER JOIN @pages pages ON pages.pkID=tblPage.pkID
	
	EXEC sp_executesql N'EXEC editDeletePageCheckInternal @pages', N'@pages editDeletePageInternalTable READONLY', @pages
END
GO
/****** Object:  StoredProcedure [dbo].[editDeletePageCheckInternal]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeletePageCheckInternal]
(@pages editDeletePageInternalTable READONLY) 
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Result AS TABLE	(
		OwnerLanguageID INT NULL,
		ReferencedLanguageID INT,
		OwnerID INT NOT NULL, 
		OwnerName NVARCHAR(255),
		ReferencedID INT,
		ReferencedName NVARCHAR(255),
		ReferenceType INT NOT NULL
	)
	INSERT INTO @Result
	SELECT
		tblContentLanguage.fkLanguageBranchID AS OwnerLanguageID,
		NULL AS ReferencedLanguageID,
		tblContentLanguage.fkContentID AS OwnerID,
		tblContentLanguage.Name As OwnerName,
		ContentLink As ReferencedID,
		tpl.Name AS ReferencedName,
		0 AS ReferenceType
	FROM 
		tblContentProperty 
	INNER JOIN 
		tblContent ON tblContentProperty.fkContentID=tblContent.pkID
	INNER JOIN 
		tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
	INNER JOIN
		tblContent AS tp ON ContentLink=tp.pkID
	INNER JOIN
		tblContentLanguage AS tpl ON tpl.fkContentID=tp.pkID
	WHERE 
		(ContentLink IN (SELECT pkID FROM @pages)) AND
		tblContentLanguage.fkLanguageBranchID=tblContentProperty.fkLanguageBranchID AND
		tpl.fkLanguageBranchID=tp.fkMasterLanguageBranchID
	INSERT INTO @Result
	SELECT
		tblContentLanguage.fkLanguageBranchID AS OwnerLanguageID,
		NULL AS ReferencedLanguageID,    
		tblContentLanguage.fkContentID AS OwnerID,
		tblContentLanguage.Name As OwnerName,
		tp.pkID AS ReferencedID,
		tpl.Name AS ReferencedName,
		1 AS ReferenceType
	FROM
		tblContentLanguage
	INNER JOIN
		tblContent ON tblContent.pkID=tblContentLanguage.fkContentID
	INNER JOIN
		tblContent AS tp ON tblContentLanguage.ContentLinkGUID = tp.ContentGUID
	INNER JOIN
		tblContentLanguage AS tpl ON tpl.fkContentID=tp.pkID
	WHERE
		(tblContentLanguage.ContentLinkGUID IN (SELECT PageGUID FROM @pages)) AND
		tpl.fkLanguageBranchID=tp.fkMasterLanguageBranchID
	
	INSERT INTO @Result
	SELECT
		tblContentSoftlink.OwnerLanguageID AS OwnerLanguageID,
		tblContentSoftlink.ReferencedLanguageID AS ReferencedLanguageID,
		PLinkFrom.pkID AS OwnerID,
		PLinkFromLang.Name  As OwnerName,
		PLinkTo.pkID AS ReferencedID,
		PLinkToLang.Name AS ReferencedName,
		1 AS ReferenceType
	FROM
		tblContentSoftlink
	INNER JOIN
		tblContent AS PLinkFrom ON PLinkFrom.pkID=tblContentSoftlink.fkOwnerContentID
	INNER JOIN
		tblContentLanguage AS PLinkFromLang ON PLinkFromLang.fkContentID=PLinkFrom.pkID
	INNER JOIN
		tblContent AS PLinkTo ON PLinkTo.ContentGUID=tblContentSoftlink.fkReferencedContentGUID
	INNER JOIN
		tblContentLanguage AS PLinkToLang ON PLinkToLang.fkContentID=PLinkTo.pkID
	WHERE
		(PLinkTo.pkID IN (SELECT pkID FROM @pages)) AND
		PLinkFromLang.fkLanguageBranchID=PLinkFrom.fkMasterLanguageBranchID AND
		PLinkToLang.fkLanguageBranchID=PLinkTo.fkMasterLanguageBranchID
	INSERT INTO @Result
	SELECT
		tblContentLanguage.fkLanguageBranchID AS OwnerLanguageID,
		NULL AS ReferencedLanguageID,
		tblContent.pkID AS OwnerID,
		tblContentLanguage.Name  As OwnerName,
		tp.pkID AS ReferencedID,
		tpl.Name AS ReferencedName,
		2 AS ReferenceType
	FROM
		tblContent
	INNER JOIN 
		tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
	INNER JOIN
		tblContent AS tp ON tblContent.ArchiveContentGUID=tp.ContentGUID
	INNER JOIN
		tblContentLanguage AS tpl ON tpl.fkContentID=tp.pkID
	WHERE
		(tblContent.ArchiveContentGUID IN (SELECT PageGUID FROM @pages)) AND
		tpl.fkLanguageBranchID=tp.fkMasterLanguageBranchID AND
		tblContentLanguage.fkLanguageBranchID=tblContent.fkMasterLanguageBranchID
	SELECT 
		OwnerLanguageID,
		ReferencedLanguageID ,
		OwnerID, 
		OwnerName,
		ReferencedID,
		ReferencedName,
		ReferenceType
	FROM 
		@Result result
	JOIN
		tblContent ON result.OwnerID=tblContent.pkID	
	WHERE 
		Deleted = 0 AND OwnerID NOT IN (SELECT pkID FROM @pages)
	UNION
	SELECT 
		tblContentLanguage.fkLanguageBranchID AS OwnerLanguageID,
		NULL AS ReferencedLanguageID,
		tblContent.pkID AS OwnerID, 
		tblContentLanguage.Name  As OwnerName,
		tblContentTypeDefault.fkArchiveContentID AS ReferencedID,
		tblContentType.Name AS ReferencedName,
		3 AS ReferenceType
	FROM 
		tblContentTypeDefault
	INNER JOIN
	   tblContentType ON tblContentTypeDefault.fkContentTypeID=tblContentType.pkID
	INNER JOIN
		tblContent ON tblContentTypeDefault.fkArchiveContentID=tblContent.pkID
	INNER JOIN 
		tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
	WHERE 
		tblContentTypeDefault.fkArchiveContentID IN (SELECT pkID FROM @pages) AND
		tblContentLanguage.fkLanguageBranchID=tblContent.fkMasterLanguageBranchID
	ORDER BY
	   ReferenceType
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[editDeletePageInternal]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeletePageInternal]
(
    @pages editDeletePageInternalTable READONLY,
    @PageID INT,
    @ForceDelete INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
-- STRUCTURE
	
	-- Make sure we dump structure and features like fetch data before we start off repairing links for pages that should not get deleted
	UPDATE 
	    tblPage 
	SET 
	    fkParentID = NULL,
	    ArchivePageGUID=NULL 
	WHERE 
	    pkID IN ( SELECT pkID FROM @pages )
	UPDATE 
	    tblContentLanguage
	SET 
	    Version = NULL 
	WHERE 
	    fkContentID IN ( SELECT pkID FROM @pages )
	    
	UPDATE 
	    tblWorkPage 
	SET 
	    fkMasterVersionID=NULL,
	    PageLinkGUID=NULL,
	    ArchivePageGUID=NULL 
	WHERE 
	    fkPageID IN ( SELECT pkID FROM @pages )
-- VERSION DATA
	-- Delete page links, archiving and fetch data pointing to us from external pages
	DELETE FROM 
	    tblWorkProperty 
	WHERE 
	    PageLink IN ( SELECT pkID FROM @pages )
	    
	UPDATE 
	    tblWorkPage 
	SET 
	    ArchivePageGUID = NULL 
	WHERE 
	    ArchivePageGUID IN ( SELECT PageGUID FROM @pages )
	    
	UPDATE 
	    tblWorkPage 
	SET 
	    PageLinkGUID = NULL, 
	    LinkType=0,
	    LinkURL=
		(
			SELECT TOP 1 
			      '~/link/' + CONVERT(NVARCHAR(32),REPLACE((select top 1 PageGUID FROM tblPage where tblPage.pkID = tblWorkPage.fkPageID),'-','')) + '.aspx'
			FROM 
			    tblPageType
			WHERE 
			    tblPageType.pkID=(SELECT fkPageTypeID FROM tblPage WHERE tblPage.pkID=tblWorkPage.fkPageID)
		)
	 WHERE 
	    PageLinkGUID IN ( SELECT PageGUID FROM @pages )
	
	-- Remove workproperties,workcategories and finally the work versions themselves
	DELETE FROM 
	    tblWorkProperty 
	WHERE 
	    fkWorkPageID IN ( SELECT pkID FROM tblWorkPage WHERE fkPageID IN ( SELECT pkID FROM @pages ) )
	    
	DELETE FROM 
	    tblWorkCategory 
	WHERE 
	    fkWorkPageID IN ( SELECT pkID FROM tblWorkPage WHERE fkPageID IN ( SELECT pkID FROM @pages ) )
	    
	DELETE FROM 
	    tblWorkPage 
	WHERE 
	    fkPageID IN ( SELECT pkID FROM @pages )
-- PUBLISHED PAGE DATA
	IF (@ForceDelete IS NOT NULL)
	BEGIN
		DELETE FROM 
		    tblProperty 
		WHERE 
		    PageLink IN (SELECT pkID FROM @pages)
	END
	ELSE
	BEGIN
		/* Default action: Only delete references from pages in wastebasket */
		DELETE FROM 
			tblProperty
		FROM 
		    tblProperty AS P
		INNER JOIN 
		    tblPage ON P.fkPageID=tblPage.pkID
		WHERE
			tblPage.Deleted=1 AND
			P.PageLink IN (SELECT pkID FROM @pages)
	END
	DELETE FROM 
	    tblPropertyDefault 
	WHERE 
	    PageLink IN ( SELECT pkID FROM @pages )
	    
	UPDATE 
	    tblPage 
	SET 
	    ArchivePageGUID = NULL 
	WHERE 
	    ArchivePageGUID IN ( SELECT PageGUID FROM @pages )
	-- Remove fetch data from any external pages pointing to us
	UPDATE 
	    tblPageLanguage 
	SET     
	    PageLinkGUID = NULL, 
	    FetchData=0,
	    LinkURL=
		(
			SELECT TOP 1 
		      '~/link/' + CONVERT(NVARCHAR(32),REPLACE((select top 1 PageGUID FROM tblPage where tblPage.pkID = tblPageLanguage.fkPageID),'-','')) + '.aspx'
			FROM 
			    tblPageType
			WHERE 
			    tblPageType.pkID=(SELECT tblPage.fkPageTypeID FROM tblPage WHERE tblPage.pkID=tblPageLanguage.fkPageID)
		)
	 WHERE 
	    PageLinkGUID IN ( SELECT PageGUID FROM @pages )
	-- Remove ALC, categories and the properties
	DELETE FROM 
	    tblCategoryPage 
	WHERE 
	    fkPageID IN ( SELECT pkID FROM @pages )
	    
	DELETE FROM 
	    tblProperty 
	WHERE 
	    fkPageID IN ( SELECT pkID FROM @pages )
	    
	DELETE FROM 
	    tblContentAccess 
	WHERE 
	    fkContentID IN ( SELECT pkID FROM @pages )
-- KEYWORDS AND INDEXING
	
	DELETE FROM 
	    tblContentSoftlink
	WHERE 
	    fkOwnerContentID IN ( SELECT pkID FROM @pages )
-- PAGETYPES
	    
	UPDATE 
	    tblPageTypeDefault 
	SET 
	    fkArchivePageID=NULL 
	WHERE fkArchivePageID IN (SELECT pkID FROM @pages)
-- PAGE/TREE
	DELETE FROM 
	    tblTree 
	WHERE 
	    fkChildID IN ( SELECT pkID FROM @pages )
	    
	DELETE FROM 
	    tblTree 
	WHERE 
	    fkParentID IN ( SELECT pkID FROM @pages )
	    
	DELETE FROM 
	    tblPageLanguage 
	WHERE 
	    fkPageID IN ( SELECT pkID FROM @pages )
	    
	DELETE FROM 
	    tblPageLanguageSetting 
	WHERE 
	    fkPageID IN ( SELECT pkID FROM @pages )
   
	DELETE FROM
	    tblPage 
	WHERE 
	    pkID IN ( SELECT pkID FROM @pages )
END
GO
/****** Object:  StoredProcedure [dbo].[editDeleteProperty]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editDeleteProperty]
(
	@ContentID			INT,
	@WorkContentID		INT,
	@PropertyDefinitionID	INT,
	@Override		BIT = 0,
	@LanguageBranch		NCHAR(17) = NULL,
	@ScopeName	NVARCHAR(450) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID NCHAR(17);
	SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID = @LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
	DECLARE @IsLanguagePublished BIT;
	IF EXISTS(SELECT fkContentID FROM tblContentLanguage 
		WHERE fkContentID = @ContentID AND fkLanguageBranchID = CAST(@LangBranchID AS INT) AND [Status] = 4)
		SET @IsLanguagePublished = 1
	ELSE
		SET @IsLanguagePublished = 0
	
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @retval INT
	SET @retval = 0
	
		IF (@WorkContentID IS NOT NULL)
		BEGIN
			/* This only applies to categories, but since PageDefinitionID is unique
				between all properties it is safe to blindly delete like this */
			DELETE FROM
				tblWorkContentCategory
			WHERE
				fkWorkContentID = @WorkContentID
			AND
				CategoryType = @PropertyDefinitionID
			AND
				(@ScopeName IS NULL OR ScopeName = @ScopeName)
			DELETE FROM
				tblWorkContentProperty
			WHERE
				fkWorkContentID = @WorkContentID
			AND
				fkPropertyDefinitionID = @PropertyDefinitionID
			AND 
				((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
		END
		ELSE
		BEGIN
			/* Might be dynamic properties */
			DELETE FROM
				tblContentCategory
			WHERE
				fkContentID = @ContentID
			AND
				CategoryType = @PropertyDefinitionID
			AND
				(@ScopeName IS NULL OR ScopeName = @ScopeName)
			AND
			(
				@LanguageBranch IS NULL
			OR
				@LangBranchID = fkLanguageBranchID
			)
			IF (@Override = 1)
			BEGIN
				DELETE FROM
					tblContentProperty
				WHERE
					fkPropertyDefinitionID = @PropertyDefinitionID
				AND
					fkContentID IN (SELECT fkChildID FROM tblTree WHERE fkParentID = @ContentID)
				AND
				(
					@LanguageBranch IS NULL
				OR
					@LangBranchID = tblContentProperty.fkLanguageBranchID
				)
				AND 
					((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
				SET @retval = 1
			END
		END
		
		/* When no version is published we save value in tblContentProperty as well, so the property also need to be removed from tblContentProperty*/
		IF (@WorkContentID IS NULL OR @IsLanguagePublished = 0)
		BEGIN
			DELETE FROM
				tblContentProperty
			WHERE
				fkContentID = @ContentID
			AND 
				fkPropertyDefinitionID = @PropertyDefinitionID  
			AND
			(
				@LanguageBranch IS NULL
			OR
				@LangBranchID = tblContentProperty.fkLanguageBranchID
			)
			AND
				((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
		END
			
	RETURN @retval
END
GO
/****** Object:  StoredProcedure [dbo].[editPublishContentVersion]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editPublishContentVersion]
(
	@WorkContentID	INT,
	@UserName NVARCHAR(255),
	@TrimVersions BIT = 0,
	@ResetCommonDraft BIT = 1,
	@PublishedDate DATETIME = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @ContentID INT
	DECLARE @retval INT
	DECLARE @FirstPublish BIT
	DECLARE @ParentID INT
	DECLARE @LangBranchID INT
	DECLARE @IsMasterLang BIT
	
	/* Verify that we have a Content to publish */
	SELECT	@ContentID=fkContentID,
			@LangBranchID=fkLanguageBranchID,
			@IsMasterLang = CASE WHEN tblWorkContent.fkLanguageBranchID=tblContent.fkMasterLanguageBranchID THEN 1 ELSE 0 END
	FROM tblWorkContent WITH (ROWLOCK,XLOCK)
	INNER JOIN tblContent WITH (ROWLOCK,XLOCK) ON tblContent.pkID=tblWorkContent.fkContentID
	WHERE tblWorkContent.pkID=@WorkContentID
	
	IF (@@ROWCOUNT <> 1)
		RETURN 0
	IF @PublishedDate IS NULL
		SET @PublishedDate = GetDate()
					
	/* Move Content information from worktable to published table */
	IF @IsMasterLang=1
	BEGIN
		UPDATE 
			tblContent
		SET
			ArchiveContentGUID	= W.ArchiveContentGUID,
			VisibleInMenu	= W.VisibleInMenu,
			ChildOrderRule	= W.ChildOrderRule,
			PeerOrder		= W.PeerOrder
		FROM 
			tblWorkContent AS W
		WHERE 
			tblContent.pkID=W.fkContentID AND 
			W.pkID=@WorkContentID
	END
	
	UPDATE 
			tblContentLanguage WITH (ROWLOCK,XLOCK)
		SET
			ChangedByName	= W.ChangedByName,
			ContentLinkGUID	= W.ContentLinkGUID,
			fkFrameID		= W.fkFrameID,
			Name			= W.Name,
			URLSegment		= W.URLSegment,
			LinkURL			= W.LinkURL,
			BlobUri			= W.BlobUri,
			ThumbnailUri	= W.ThumbnailUri,
			ExternalURL		= Lower(W.ExternalURL),
			AutomaticLink	= CASE WHEN W.LinkType = 2 OR W.LinkType = 3 THEN 0 ELSE 1 END,
			FetchData		= CASE WHEN W.LinkType = 4 THEN 1 ELSE 0 END,
			Created			= W.Created,
			Changed			= CASE WHEN W.ChangedOnPublish=0 AND tblContentLanguage.Status = 4 THEN Changed ELSE @PublishedDate END,
			Saved			= @PublishedDate,
			StartPublish	= COALESCE(W.StartPublish, @PublishedDate),
			StopPublish		= W.StopPublish,
			Status			= 4,
			Version			= @WorkContentID,
			DelayPublishUntil = NULL
		FROM 
			tblWorkContent AS W
		WHERE 
			tblContentLanguage.fkContentID=W.fkContentID AND
			W.fkLanguageBranchID=tblContentLanguage.fkLanguageBranchID AND
			W.pkID=@WorkContentID
	IF @@ROWCOUNT!=1
		RAISERROR (N'editPublishContentVersion: Cannot find correct version in tblContentLanguage for version %d', 16, 1, @WorkContentID)
	/*Set current published version on this language to HasBeenPublished*/
	UPDATE
		tblWorkContent
	SET
		Status = 5
	WHERE
		fkContentID = @ContentID AND
		fkLanguageBranchID = @LangBranchID AND 
		Status = 4 AND
		pkID<>@WorkContentID
	/* Remember that this version has been published, and clear the delay publish date if used */
	UPDATE
		tblWorkContent
	SET
		Status = 4,
		ChangedOnPublish = 0,
		Saved=@PublishedDate,
        ChangedByName=@UserName,
		NewStatusByName=@UserName,
		fkMasterVersionID = NULL,
		DelayPublishUntil = NULL,
		StartPublish = COALESCE(StartPublish, @PublishedDate)
	WHERE
		pkID=@WorkContentID
		
	/* Remove all properties defined for this Content except dynamic properties */
	DELETE FROM 
		tblContentProperty
	FROM 
		tblContentProperty
	INNER JOIN
		tblPropertyDefinition ON fkPropertyDefinitionID=tblPropertyDefinition.pkID
	WHERE 
		fkContentID=@ContentID AND
		fkContentTypeID IS NOT NULL AND
		fkLanguageBranchID=@LangBranchID
		
	/* Move properties from worktable to published table */
	INSERT INTO tblContentProperty 
		(fkPropertyDefinitionID,
		fkContentID,
		fkLanguageBranchID,
		ScopeName,
		[guid],
		Boolean,
		Number,
		FloatNumber,
		ContentType,
		ContentLink,
		Date,
		String,
		LongString,
		LongStringLength,
        LinkGuid)
	SELECT
		fkPropertyDefinitionID,
		@ContentID,
		@LangBranchID,
		ScopeName,
		[guid],
		Boolean,
		Number,
		FloatNumber,
		ContentType,
		ContentLink,
		Date,
		String,
		LongString,
		/* LongString is utf-16 - Datalength gives bytes, i e div by 2 gives characters */
		/* Include length to handle delayed loading of LongString with threshold */
		COALESCE(DATALENGTH(LongString), 0) / 2,
        LinkGuid
	FROM
		tblWorkContentProperty
	WHERE
		fkWorkContentID=@WorkContentID
	
	/* Move categories to published tables */
	DELETE 	tblContentCategory
	FROM tblContentCategory
	LEFT JOIN tblPropertyDefinition ON tblPropertyDefinition.pkID=tblContentCategory.CategoryType 
	WHERE 	tblContentCategory.fkContentID=@ContentID
			AND (NOT fkContentTypeID IS NULL OR CategoryType=0)
			AND (tblPropertyDefinition.LanguageSpecific>2 OR @IsMasterLang=1)--Only lang specific on non-master
			AND tblContentCategory.fkLanguageBranchID=@LangBranchID
			
	INSERT INTO tblContentCategory
		(fkContentID,
		fkCategoryID,
		CategoryType,
		fkLanguageBranchID,
		ScopeName)
	SELECT
		@ContentID,
		fkCategoryID,
		CategoryType,
		@LangBranchID,
		ScopeName
	FROM
		tblWorkContentCategory
	WHERE
		fkWorkContentID=@WorkContentID
	
	IF @ResetCommonDraft = 1
		EXEC editSetCommonDraftVersion @WorkContentID = @WorkContentID, @Force = 1				
	IF (@TrimVersions = 1)
        DELETE FROM tblWorkContent WHERE fkContentID = @ContentID AND fkLanguageBranchID = @LangBranchID AND Status = 5
END
GO
/****** Object:  StoredProcedure [dbo].[editSaveContentVersionData]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editSaveContentVersionData]
(
	@WorkContentID		INT,
	@UserName			NVARCHAR(255),
	@Saved				DATETIME,
	@Name				NVARCHAR(255)		= NULL,
	@ExternalURL		NVARCHAR(255)		= NULL,
	@Created			DATETIME			= NULL,
	@Changed			BIT					= 0,
	@StartPublish		DATETIME			= NULL,
	@StopPublish		DATETIME			= NULL,
	@ChildOrder			INT					= 3,
	@PeerOrder			INT					= 100,
	@ContentLinkGUID	UNIQUEIDENTIFIER	= NULL,
	@LinkURL			NVARCHAR(255)		= NULL,
	@BlobUri			NVARCHAR(255)		= NULL,
	@ThumbnailUri		NVARCHAR(255)		= NULL,
	@LinkType			INT					= 0,
	@FrameID			INT					= NULL,
	@VisibleInMenu		BIT					= NULL,
	@ArchiveContentGUID	UNIQUEIDENTIFIER	= NULL,
	@ContentAssetsID	UNIQUEIDENTIFIER	= NULL,
	@ContentOwnerID		UNIQUEIDENTIFIER	= NULL,
	@URLSegment			NVARCHAR(255)		= NULL,
	@SetStartPublish    BIT					= 1
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @ChangedDate			DATETIME
	DECLARE @ContentID				INT
	DECLARE @ContentTypeID			INT
	DECLARE @ParentID				INT
	DECLARE @AssetsID				UNIQUEIDENTIFIER
	DECLARE @OwnerID				UNIQUEIDENTIFIER
	DECLARE @CurrentLangBranchID	INT
	DECLARE @IsMasterLang			BIT
	
	/* Pull some useful information from the published Content */
	SELECT
		@ContentID				= fkContentID,
		@ParentID				= fkParentID,
		@ContentTypeID			= fkContentTypeID,
		@AssetsID				= ContentAssetsID,
		@OwnerID				= ContentOwnerID,
		@IsMasterLang			= CASE WHEN tblContent.fkMasterLanguageBranchID=tblWorkContent.fkLanguageBranchID THEN 1 ELSE 0 END,
		@CurrentLangBranchID	= fkLanguageBranchID
	FROM
		tblWorkContent
	INNER JOIN tblContent ON tblContent.pkID=tblWorkContent.fkContentID
	INNER JOIN tblContentType ON tblContentType.pkID=tblContent.fkContentTypeID
	WHERE
		tblWorkContent.pkID=@WorkContentID
	
	if (@ContentID IS NULL)
	BEGIN
		RAISERROR (N'editSaveContentVersionData: The WorkContentId dosen´t exist (WorkContentID=%d)', 16, 1, @WorkContentID)
		RETURN -1
	END			
		IF ((@AssetsID IS NULL) AND (@ContentAssetsID IS NOT NULL))
		BEGIN
			UPDATE
				tblContent
			SET
				ContentAssetsID = @ContentAssetsID
			WHERE
				pkID=@ContentID
		END
		IF ((@OwnerID IS NULL) AND (@ContentOwnerID IS NOT NULL))
		BEGIN
			UPDATE
				tblContent
			SET
				ContentOwnerID = @ContentOwnerID
			WHERE
				pkID=@ContentID
		END
		/* Set new values for work Content */
		UPDATE
			tblWorkContent
		SET
			ChangedByName		= @UserName,
			ContentLinkGUID		= @ContentLinkGUID,
			ArchiveContentGUID	= @ArchiveContentGUID,
			fkFrameID			= @FrameID,
			Name				= @Name,
			LinkURL				= @LinkURL,
			BlobUri				= @BlobUri,
			ThumbnailUri		= @ThumbnailUri,
			ExternalURL			= @ExternalURL,
			URLSegment			= @URLSegment,
			VisibleInMenu		= @VisibleInMenu,
			LinkType			= @LinkType,
			Created				= COALESCE(@Created, Created),
			Saved				= @Saved,
			StartPublish		= CASE WHEN @SetStartPublish = 1 THEN @StartPublish ELSE StartPublish END,
			StopPublish			= @StopPublish,
			ChildOrderRule		= @ChildOrder,
			PeerOrder			= COALESCE(@PeerOrder, PeerOrder),
			ChangedOnPublish	= @Changed
		WHERE
			pkID=@WorkContentID
		
		IF EXISTS(SELECT * FROM tblContentLanguage WHERE fkContentID=@ContentID AND fkLanguageBranchID=@CurrentLangBranchID AND Status <> 4)
		BEGIN
			UPDATE
				tblContentLanguage
			SET
				Name			= @Name,
				Created			= @Created,
				Saved			= @Saved,
				URLSegment		= @URLSegment,
				LinkURL			= @LinkURL,
				BlobUri			= @BlobUri,
				ThumbnailUri	= @ThumbnailUri,
				StartPublish	= CASE WHEN @SetStartPublish = 1 THEN @StartPublish ELSE StartPublish END,
				StopPublish		= @StopPublish,
				ExternalURL		= Lower(@ExternalURL),
				fkFrameID		= @FrameID,
				AutomaticLink	= CASE WHEN @LinkType = 2 OR @LinkType = 3 THEN 0 ELSE 1 END,
				FetchData		= CASE WHEN @LinkType = 4 THEN 1 ELSE 0 END
			WHERE
				fkContentID=@ContentID AND fkLanguageBranchID=@CurrentLangBranchID
			/* Set some values needed for proper display in edit tree even though we have not yet published the Content */
			IF @IsMasterLang = 1
			BEGIN
				UPDATE
					tblContent
				SET
					ArchiveContentGUID	= @ArchiveContentGUID,
					ChildOrderRule		= @ChildOrder,
					PeerOrder			= @PeerOrder,
					VisibleInMenu		= @VisibleInMenu
				WHERE
					pkID=@ContentID 
			END
		END
END
GO
/****** Object:  StoredProcedure [dbo].[editSavePropertyCategory]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editSavePropertyCategory]
(
	@ContentID				INT,
	@WorkContentID			INT,
	@PropertyDefinitionID	INT,
	@Override			BIT,
	@CategoryString		NVARCHAR(2000),
	@LanguageBranch		NCHAR(17) = NULL,
	@ScopeName			nvarchar(450) = NULL
)
AS
BEGIN
	SET NOCOUNT	ON
	SET XACT_ABORT ON
	DECLARE	@ContentIDString			NVARCHAR(20)
	DECLARE	@PropertyDefinitionIDString	NVARCHAR(20)
	DECLARE @DynProp INT
	DECLARE @retval	INT
	SET @retval = 0
	DECLARE @LangBranchID NCHAR(17);
	IF (@WorkContentID <> 0)
		SELECT @LangBranchID = fkLanguageBranchID FROM tblWorkContent WHERE pkID = @WorkContentID
	ELSE
		SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID = @LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = 1
	END
	DECLARE @IsLanguagePublished BIT;
	IF EXISTS(SELECT fkContentID FROM tblContentLanguage 
		WHERE fkContentID = @ContentID AND fkLanguageBranchID = CAST(@LangBranchID AS INT) AND Status = 4)
		SET @IsLanguagePublished = 1
	ELSE
		SET @IsLanguagePublished = 0
	SELECT @DynProp=pkID FROM tblPropertyDefinition WHERE pkID=@PropertyDefinitionID AND fkContentTypeID IS NULL
	IF (@WorkContentID IS NOT NULL)
	BEGIN
		/* Never store dynamic properties in work table */
		IF (@DynProp IS NOT NULL)
			GOTO cleanup
				
		/* Remove all categories */
		SET @ContentIDString = CONVERT(NVARCHAR(20), @WorkContentID)
		SET @PropertyDefinitionIDString = CONVERT(NVARCHAR(20), @PropertyDefinitionID)
		DELETE FROM tblWorkContentCategory WHERE fkWorkContentID=@WorkContentID AND ScopeName=@ScopeName
		/* Insert new categories */
		IF (LEN(@CategoryString) > 0)
		BEGIN
			EXEC (N'INSERT INTO tblWorkContentCategory (fkWorkContentID, fkCategoryID, CategoryType, ScopeName) SELECT ' + @ContentIDString + N',pkID,' + @PropertyDefinitionIDString + N', ''' + @ScopeName + N''' FROM tblCategory WHERE pkID IN (' + @CategoryString +N')' )
		END
		
		/* Finally update the property table */
		IF (@PropertyDefinitionID <> 0)
		BEGIN
			IF EXISTS(SELECT fkWorkContentID FROM tblWorkContentProperty WHERE fkWorkContentID=@WorkContentID AND fkPropertyDefinitionID=@PropertyDefinitionID AND ScopeName=@ScopeName)
				UPDATE tblWorkContentProperty SET Number=@PropertyDefinitionID WHERE fkWorkContentID=@WorkContentID 
					AND fkPropertyDefinitionID=@PropertyDefinitionID
					AND ((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
			ELSE
				INSERT INTO tblWorkContentProperty (fkWorkContentID, fkPropertyDefinitionID, Number, ScopeName) VALUES (@WorkContentID, @PropertyDefinitionID, @PropertyDefinitionID, @ScopeName)
		END
	END
	
	IF (@WorkContentID IS NULL OR @IsLanguagePublished = 0)
	BEGIN
		/* Insert or update property */
		/* Remove all categories */
		SET @ContentIDString = CONVERT(NVARCHAR(20), @ContentID)
		SET @PropertyDefinitionIDString = CONVERT(NVARCHAR(20), @PropertyDefinitionID)
		DELETE FROM tblContentCategory WHERE fkContentID=@ContentID AND ScopeName=@ScopeName
		AND fkLanguageBranchID=@LangBranchID
		
		/* Insert new categories */
		IF (LEN(@CategoryString) > 0)
		BEGIN
			EXEC (N'INSERT INTO tblContentCategory (fkContentID, fkCategoryID, CategoryType, fkLanguageBranchID, ScopeName) SELECT ' + @ContentIDString + N',pkID,' + @PropertyDefinitionIDString + N', ' + @LangBranchID + N', ''' + @ScopeName + N''' FROM tblCategory WHERE pkID IN (' + @CategoryString +N')' )
		END
		
		/* Finally update the property table */
		IF (@PropertyDefinitionID <> 0)
		BEGIN
			IF EXISTS(SELECT fkContentID FROM tblContentProperty WHERE fkContentID=@ContentID AND fkPropertyDefinitionID=@PropertyDefinitionID 
						AND fkLanguageBranchID=@LangBranchID AND ScopeName=@ScopeName)
				UPDATE tblContentProperty SET Number=@PropertyDefinitionID WHERE fkContentID=@ContentID AND fkPropertyDefinitionID=@PropertyDefinitionID
						AND fkLanguageBranchID=@LangBranchID
						AND ((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
			ELSE
				INSERT INTO tblContentProperty (fkContentID, fkPropertyDefinitionID, Number, fkLanguageBranchID, ScopeName) VALUES (@ContentID, @PropertyDefinitionID, @PropertyDefinitionID, @LangBranchID, @ScopeName)
		END
				
		/* Override dynamic property definitions below the current level */
		IF (@DynProp IS NOT NULL)
		BEGIN
			IF (@Override = 1)
				DELETE FROM tblContentProperty WHERE fkPropertyDefinitionID=@PropertyDefinitionID AND fkContentID IN (SELECT fkChildID FROM tblTree WHERE fkParentID=@ContentID)
			SET @retval = 1
		END
	END
cleanup:		
	
	RETURN @retval
END
GO
/****** Object:  StoredProcedure [dbo].[editSetCommonDraftVersion]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editSetCommonDraftVersion]
(
	@WorkContentID INT,
	@Force BIT
)
AS
BEGIN
   SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE  @ContentLink INT
	DECLARE  @LangID INT
	DECLARE  @CommonDraft INT
	
	-- Find the ConntentLink and Language for the Page Work ID 
	SELECT   @ContentLink = fkContentID, @LangID = fkLanguageBranchID, @CommonDraft = CommonDraft from tblWorkContent where pkID = @WorkContentID
	
	
	-- If the force flag or there is a common draft which is published we will reset the common draft
	if (@Force = 1 OR EXISTS(SELECT * FROM tblWorkContent WITH(NOLOCK) WHERE fkContentID = @ContentLink AND Status=4 AND fkLanguageBranchID = @LangID AND CommonDraft = 1))
	BEGIN 	
		-- We should remove the old common draft from other content version repect to language
		UPDATE 
			tblWorkContent
		SET
			CommonDraft = 0
		FROM  tblWorkContent WITH(INDEX(IDX_tblWorkContent_fkContentID))
		WHERE
			fkContentID = @ContentLink and fkLanguageBranchID  = @LangID  
	END
	-- If the forct flag or there is no common draft for the page wirh respect to language
	IF (@Force = 1 OR NOT EXISTS(SELECT * from tblWorkContent WITH(NOLOCK)  where fkContentID = @ContentLink AND fkLanguageBranchID = @LangID AND CommonDraft = 1))
	BEGIN
		UPDATE 
			tblWorkContent
		SET
			CommonDraft = 1
		WHERE
			pkID = @WorkContentID
	END	
		
	IF (@@ROWCOUNT = 0)
		RETURN 1
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[editSetVersionStatus]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[editSetVersionStatus]
(
	@WorkContentID INT,
	@Status INT,
	@UserName NVARCHAR(255),
	@Saved DATETIME = NULL,
	@RejectComment NVARCHAR(2000) = NULL,
	@DelayPublishUntil DateTime = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	UPDATE 
		tblWorkContent
	SET
		Status = @Status,
        ChangedByName=@UserName,
		NewStatusByName=@UserName,
		RejectComment= COALESCE(@RejectComment, RejectComment),
        Saved = COALESCE(@Saved, Saved),
		DelayPublishUntil = @DelayPublishUntil
	WHERE
		pkID=@WorkContentID 
	IF (@@ROWCOUNT = 0)
		RETURN 1
	-- If there is no published version for this language update published table as well
	DECLARE @ContentID INT;
	DECLARE @LanguageBranchID INT;
	SELECT @LanguageBranchID = lang.fkLanguageBranchID, @ContentID = lang.fkContentID FROM tblContentLanguage AS lang INNER JOIN tblWorkContent AS work 
		ON lang.fkContentID = work.fkContentID WHERE 
		work.pkID = @WorkContentID AND work.fkLanguageBranchID = lang.fkLanguageBranchID AND lang.Status <> 4
	IF @ContentID IS NOT NULL
		BEGIN
			UPDATE
				tblContentLanguage
			SET
				Status = @Status,
				DelayPublishUntil = @DelayPublishUntil
			WHERE
				fkContentID=@ContentID AND fkLanguageBranchID=@LanguageBranchID
		END
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[EntityGetGuidByID]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntityGetGuidByID]
@intObjectTypeID int,
@intObjectID int
AS
BEGIN
	SELECT unqID FROM tblEntityGuid WHERE intObjectTypeID = @intObjectTypeID AND intObjectID = @intObjectID
END
GO
/****** Object:  StoredProcedure [dbo].[EntityGetGuidByIdFromIdentity]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntityGetGuidByIdFromIdentity]
@intObjectTypeID int,
@intObjectID int
AS
BEGIN
	SELECT Guid FROM tblBigTableIdentity INNER JOIN tblBigTableStoreConfig 
		ON tblBigTableIdentity.StoreName = tblBigTableStoreConfig.StoreName
		WHERE tblBigTableIdentity.pkId = @intObjectID AND
			tblBigTableStoreConfig.EntityTypeId = @intObjectTypeID
END
GO
/****** Object:  StoredProcedure [dbo].[EntityGetIDByGuid]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntityGetIDByGuid]
@unqID uniqueidentifier
AS
BEGIN
	SELECT 
		intObjectTypeID, intObjectID
	FROM tblEntityGuid
	WHERE unqID = @unqID
END
GO
/****** Object:  StoredProcedure [dbo].[EntityGetIdByGuidFromIdentity]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntityGetIdByGuidFromIdentity]
@uniqueID uniqueidentifier
AS
BEGIN
	SELECT tblBigTableStoreConfig.EntityTypeId as EntityTypeId, tblBigTableIdentity.pkId as ObjectId  
		FROM tblBigTableIdentity INNER JOIN tblBigTableStoreConfig 
		ON tblBigTableIdentity.StoreName = tblBigTableStoreConfig.StoreName
		WHERE tblBigTableIdentity.Guid = @uniqueID
END
GO
/****** Object:  StoredProcedure [dbo].[EntitySetEntry]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntitySetEntry]
@intObjectTypeID int,
@intObjectID int,
@uniqueID uniqueidentifier
AS
BEGIN
	INSERT INTO tblEntityGuid
			(intObjectTypeID, intObjectID, unqID)
	VALUES
			(@intObjectTypeID, @intObjectID, @uniqueID)
END
GO
/****** Object:  StoredProcedure [dbo].[EntityTypeGetIDByName]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntityTypeGetIDByName]
@strObjectType varchar(400)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @intID int
	SELECT @intID = intID FROM dbo.tblEntityType WHERE strName = @strObjectType
	IF @intID IS NULL
	BEGIN
		INSERT INTO dbo.tblEntityType (strName) VALUES(@strObjectType)
		SET @intID = SCOPE_IDENTITY()
	END
	SELECT @intID
END
GO
/****** Object:  StoredProcedure [dbo].[EntityTypeGetNameByID]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EntityTypeGetNameByID]
@intObjectTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT strName FROM dbo.tblEntityType WHERE intID = @intObjectTypeID
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogAssociatedAllList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogAssociatedAllList]
(
	@Associations	dbo.StringParameterTable READONLY,
	@StartIndex			BIGINT = NULL,
	@MaxCount			INT = NULL
)
AS            
BEGIN
	DECLARE @Compare AS TABLE(String NVARCHAR(256), CompareString NVARCHAR(257), StringLen INT)
	INSERT INTO @Compare SELECT String, String + '%', LEN(String) FROM (SELECT String = CASE RIGHT(String, 1) WHEN '/' THEN LEFT(String,LEN(String) - 1) ELSE String END FROM @Associations WHERE String IS NOT NULL) X
	DECLARE @MatchAllCount INT = (SELECT COUNT(*) FROM @Compare)
	DECLARE @Ids AS TABLE([ID] [bigint] NOT NULL)
	
	INSERT INTO @Ids
	SELECT pkID FROM (
		SELECT pkID, [From] AS Value, StringLen
			FROM [tblActivityLog]
			JOIN tblActivityLogAssociation ON pkID = [To]
			JOIN @Compare ON [From] LIKE CompareString
			WHERE Deleted = 0
		UNION 
		SELECT pkID, RelatedItem AS Value, StringLen
			FROM [tblActivityLog]
			JOIN @Compare ON RelatedItem LIKE CompareString
			WHERE Deleted = 0
	) Matched WHERE LEN(Value) = StringLen OR SUBSTRING(Value, StringLen + 1, 1) = '/'
	GROUP BY pkID
	HAVING COUNT(pkID) = @MatchAllCount
	DECLARE @TotalCount INT = (SELECT COUNT(*) FROM @Ids)
	SELECT TOP(@MaxCount) [pkID], [Action], [Type], [ChangeDate], [ChangedBy], [LogData], [RelatedItem], [Deleted], @TotalCount AS 'TotalCount'
	FROM [tblActivityLog] al
	JOIN @Ids ids ON al.[pkID] = ids.[ID]
	WHERE [pkID] <= @StartIndex
	ORDER BY [pkID] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogAssociatedAnyList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogAssociatedAnyList]
(
	@Associations	 dbo.StringParameterTable READONLY,
	@StartIndex			BIGINT = NULL,
	@MaxCount			INT = NULL
)
AS            
BEGIN
	DECLARE @Compare AS TABLE(String NVARCHAR(256), CompareString NVARCHAR(257), StringLen INT)
	INSERT INTO @Compare SELECT String, String + '%', LEN(String) FROM (SELECT String = CASE RIGHT(String, 1) WHEN '/' THEN LEFT(String,LEN(String) - 1) ELSE String END FROM @Associations WHERE String IS NOT NULL) X
	DECLARE @Ids AS TABLE([ID] [bigint] NOT NULL)
	INSERT INTO @Ids
		SELECT pkID FROM (
			SELECT pkID, [From] AS Value, StringLen 
			FROM [tblActivityLog]
			JOIN tblActivityLogAssociation ON pkID = [To] 
			JOIN @Compare ON [From] LIKE CompareString
			WHERE Deleted = 0
		) Matched WHERE LEN(Value) = StringLen OR SUBSTRING(Value, StringLen + 1, 1) = '/'
	UNION
		SELECT pkID FROM (
			SELECT pkID, RelatedItem AS Value, StringLen
			FROM [tblActivityLog]
			JOIN @Compare ON RelatedItem LIKE CompareString
			WHERE Deleted = 0
		) Matched WHERE LEN(Value) = StringLen OR SUBSTRING(Value, StringLen + 1, 1) = '/'
	DECLARE @TotalCount INT = (SELECT COUNT(*) FROM @Ids)
	SELECT TOP(@MaxCount) [pkID], [Action], [Type], [ChangeDate], [ChangedBy], [LogData], [RelatedItem], [Deleted], @TotalCount AS 'TotalCount'
	FROM [tblActivityLog] al
	JOIN @Ids ids ON al.[pkID] = ids.[ID]
	WHERE [pkID] <= @StartIndex
	ORDER BY [pkID] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogAssociatedGetLowest]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogAssociatedGetLowest]
(
	@AssociatedItem		[nvarchar](255)
)
AS            
BEGIN
	SELECT MIN(pkID)
		FROM
		(SELECT pkID
			FROM [tblActivityLog]
			WHERE 
				RelatedItem = @AssociatedItem
				AND
				Deleted = 0
		UNION
			SELECT pkID
			FROM [tblActivityLog] 
			INNER JOIN [tblActivityLogAssociation] TAR ON pkID = TAR.[To]
			WHERE 
				TAR.[From] = @AssociatedItem 
				AND
				Deleted = 0) AS RESULT
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogAssociatedList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogAssociatedList]
(
	@MatchAll			dbo.StringParameterTable READONLY,
	@MatchAny			dbo.StringParameterTable READONLY,
	@StartIndex			BIGINT = NULL,
	@MaxCount			INT = NULL
)
AS            
BEGIN
	DECLARE @CompareMatchAll AS TABLE(String NVARCHAR(256), CompareString NVARCHAR(257), StringLen INT)
	INSERT INTO @CompareMatchAll SELECT String, String + '%', LEN(String) FROM (SELECT String = CASE RIGHT(String, 1) WHEN '/' THEN LEFT(String,LEN(String) - 1) ELSE String END FROM @MatchAll WHERE String IS NOT NULL) X
	DECLARE @CompareMatchAny AS TABLE(String NVARCHAR(256), CompareString NVARCHAR(257), StringLen INT)
	INSERT INTO @CompareMatchAny SELECT String, String + '%', LEN(String) FROM (SELECT String = CASE RIGHT(String, 1) WHEN '/' THEN LEFT(String,LEN(String) - 1) ELSE String END FROM @MatchAny WHERE String IS NOT NULL) X
	DECLARE @MatchAllCount INT = (SELECT COUNT(*) FROM @CompareMatchAll)
	DECLARE @IdsAll AS TABLE([ID] [bigint] NOT NULL)
	INSERT INTO @IdsAll
	SELECT pkID	FROM (
		SELECT pkID, [From] AS Value, StringLen
			FROM [tblActivityLog]
			JOIN tblActivityLogAssociation ON pkID = [To]
			JOIN @CompareMatchAll ON [From] LIKE CompareString
			WHERE Deleted = 0
		UNION 
		SELECT pkID, RelatedItem AS Value, StringLen
			FROM [tblActivityLog]
			JOIN @CompareMatchAll ON RelatedItem LIKE CompareString
			WHERE Deleted = 0
	) Matched WHERE LEN(Value) = StringLen OR SUBSTRING(Value, StringLen + 1, 1) = '/'
	GROUP BY pkID
	HAVING COUNT(pkID) = @MatchAllCount
	DECLARE @Ids AS TABLE([ID] [bigint] NOT NULL)
	INSERT INTO @Ids
		SELECT pkID FROM (
			SELECT pkID, [From] AS Value, StringLen
			FROM @IdsAll ids
			JOIN [tblActivityLog] ON pkID = ids.ID
			JOIN tblActivityLogAssociation ON pkID = [To]
			JOIN @CompareMatchAny ON [From] LIKE CompareString
			WHERE Deleted = 0
		) Matched WHERE LEN(Value) = StringLen OR SUBSTRING(Value, StringLen + 1, 1) = '/'
	UNION
		SELECT pkID FROM (
			SELECT pkID, RelatedItem AS Value, StringLen
			FROM @IdsAll ids
			JOIN [tblActivityLog] ON pkID = ids.ID
			JOIN @CompareMatchAny ON RelatedItem LIKE CompareString
			WHERE Deleted = 0
		) Matched WHERE LEN(Value) = StringLen OR SUBSTRING(Value, StringLen + 1, 1) = '/'
	DECLARE @TotalCount INT = (SELECT COUNT(*) FROM @Ids)
	SELECT TOP(@MaxCount) [pkID], [Action], [Type], [ChangeDate], [ChangedBy], [LogData], [RelatedItem], [Deleted], @TotalCount AS 'TotalCount'
	FROM [tblActivityLog] al
	JOIN @Ids ids ON al.[pkID] = ids.[ID]
	WHERE [pkID] <= @StartIndex
	ORDER BY [pkID] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogAssociationDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogAssociationDelete]
(
	@AssociatedItem	[nvarchar](255),
	@ChangeLogID  BIGINT = 0
)
AS            
BEGIN
	DELETE FROM [tblActivityLogAssociation] WHERE [From] = @AssociatedItem AND (@ChangeLogID = 0 OR @ChangeLogID = [To])
	DECLARE @RowCount INT = (SELECT @@ROWCOUNT)
	UPDATE [tblActivityLog] SET RelatedItem = NULL WHERE @ChangeLogID = 0 AND RelatedItem = @AssociatedItem
	SELECT @@ROWCOUNT + @RowCount
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogAssociationDeleteRelated]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogAssociationDeleteRelated]
(
	@AssociatedItem	[nvarchar](255),
	@RelatedItem	[nvarchar](255)
)
AS            
BEGIN
	DECLARE @RelatedItemCompare NVARCHAR(256) = CASE RIGHT(@RelatedItem, 1) WHEN '/' THEN LEFT(@RelatedItem, LEN(@RelatedItem) - 1) ELSE @RelatedItem END
	DECLARE @RelatedItemLike NVARCHAR(256) = @RelatedItemCompare + '%'
	DECLARE @RelatedItemLength INT = LEN(@RelatedItemLike)
	DELETE FROM [tblActivityLogAssociation] 
	FROM [tblActivityLogAssociation] AS TCLA INNER JOIN [tblActivityLog] AS TCL ON TCLA.[To] = TCL.pkID
	WHERE (TCLA.[From] = @AssociatedItem AND TCL.[RelatedItem] LIKE @RelatedItemLike AND (TCL.[RelatedItem] = @RelatedItemCompare OR SUBSTRING(TCL.[RelatedItem], @RelatedItemLength, 1) = '/'))
	OR (TCLA.[From] LIKE @RelatedItemLike AND TCL.[RelatedItem] = @AssociatedItem AND (TCLA.[From] = @RelatedItemCompare OR SUBSTRING(TCLA.[From], @RelatedItemLength, 1) = '/'))
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogAssociationSave]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogAssociationSave]
(
	@AssociatedItem	[nvarchar](255),
	@ChangeLogID  BIGINT
)
AS            
BEGIN
	INSERT INTO [tblActivityLogAssociation] VALUES(@AssociatedItem, @ChangeLogID)
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogCommentDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogCommentDelete]
(
	@Id  BIGINT
)
AS            
BEGIN
	DELETE FROM [tblActivityLogComment] WHERE [pkID] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogCommentList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogCommentList]
(
	@EntryId	[bigint]
)
AS            
BEGIN
	SELECT * FROM [tblActivityLogComment]
		WHERE [EntryId] = @EntryId
	ORDER BY pkID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogCommentListMany]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogCommentListMany]
(
	@EntryIds AS LongParameterTable READONLY
)
AS            
BEGIN
	SELECT alc.* FROM [tblActivityLogComment] alc
	JOIN @EntryIds ids ON alc.EntryId = ids.Id
	ORDER BY alc.pkID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogCommentLoad]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogCommentLoad]
(
	@Id	[bigint]
)
AS            
BEGIN
	SELECT * FROM [tblActivityLogComment]
		WHERE pkID = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogCommentSave]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogCommentSave]
(
	@Id			BIGINT = 0 OUTPUT,
	@EntryId	BIGINT, 
    @Author		NVARCHAR(255) = NULL, 
    @Created	DATETIME, 
    @LastUpdated DATETIME, 
    @Message	NVARCHAR(max)
)
AS            
BEGIN
	IF (@Id = 0)
	BEGIN
		INSERT INTO [tblActivityLogComment] VALUES(@EntryId, @Author, @Created, @Created, @Message)
		SET @Id = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE [tblActivityLogComment] SET
			[EntryId] = @EntryId,
			[Author] = @Author,
			[LastUpdated] = @LastUpdated,
			[Message] = @Message
		WHERE pkID = @Id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogEntryDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogEntryDelete]
(
   @Id	BIGINT
)
AS            
BEGIN
		UPDATE 
			[tblActivityLog]
		SET 
			[Deleted] = 1 
		WHERE 
			[pkID] = @Id  AND [Deleted] = 0
		EXEC netActivityLogGetAssociations @Id
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogEntryLoad]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogEntryLoad]
(
   @Id				BIGINT
)
AS            
BEGIN
	SELECT * FROM [tblActivityLog]
	WHERE pkID = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogEntrySave]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogEntrySave]
  (@LogData          [nvarchar](max) = NULL,
   @Type			 [nvarchar](255),
   @Action			 INTEGER = 0,
   @ChangedBy        [nvarchar](255),
   @RelatedItem		 [nvarchar](255),
   @Deleted			 [BIT] =  0,	
   @Id				 BIGINT = 0 OUTPUT,
   @ChangeDate       DATETIME,
   @Associations	 dbo.StringParameterTable READONLY
)
AS            
BEGIN
	IF (@Id = 0)
	BEGIN
       INSERT INTO [tblActivityLog] VALUES(@LogData,
                                       @ChangeDate,
                                       @Type,
                                       @Action,
                                       @ChangedBy,
									   @RelatedItem, 
									   @Deleted)
		SET @Id = SCOPE_IDENTITY()
		INSERT INTO tblActivityLogAssociation([To], [From])
		SELECT @Id, Source.String
		FROM @Associations AS Source
	END
	ELSE
	BEGIN
		UPDATE [tblActivityLog] SET
			[LogData] = @LogData,
			[ChangeDate] = @ChangeDate,
			[Type] = @Type,
			[Action] = @Action,
			[ChangedBy] = @ChangedBy,
			[RelatedItem] = @RelatedItem,
			[Deleted] = @Deleted
		WHERE pkID = @Id
		MERGE tblActivityLogAssociation AS Target
		USING @Associations AS Source
		ON (Target.[To] = @Id AND Target.[From] = Source.String)
		WHEN NOT MATCHED BY Target THEN
			INSERT ([To], [From])
			VALUES (@Id, Source.String);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogGetAssociations]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogGetAssociations]
(
	@Id	BIGINT
)
AS            
BEGIN
		SELECT RelatedItem AS Uri
			FROM [tblActivityLog] 
			WHERE 
				@Id = pkID AND
				RelatedItem IS NOT NULL 
		UNION
		SELECT [From] AS Uri
			FROM [tblActivityLogAssociation] 
			WHERE 
				[To] = @Id AND
				[From] IS NOT NULL 
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogTruncate]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogTruncate]
(
	@Archive BIT,
	@MaxRows BIGINT,
	@BeforeEntry BIGINT = NULL,
	@CreatedBefore DATETIME = NULL,
	@PreservedRelation NVARCHAR(255) = NULL
)
AS
BEGIN
	DECLARE @paramList NVARCHAR(4000)
	DECLARE @sql NVARCHAR(MAX) 
	DECLARE @PreservedRelationLike NVARCHAR(256) = @PreservedRelation
	SET @sql = 'DELETE TOP(@MaxRows) L'
	IF (@Archive != 0)
		SET @sql += ' OUTPUT DELETED.[pkID], DELETED.[LogData], DELETED.[ChangeDate], DELETED.[Type], DELETED.[Action], DELETED.[ChangedBy], DELETED.Deleted
				INTO [dbo].[tblActivityArchive]([pkID], [LogData], [ChangeDate], [Type], [Action], [ChangedBy], [Deleted])'
	SET @sql += ' FROM [dbo].[tblActivityLog] AS L'
	IF (@PreservedRelation IS NOT NULL)
		SET @sql += ' LEFT OUTER JOIN [dbo].[tblActivityLogAssociation] AS A ON L.pkID = A.[To]'
	SET @sql += ' WHERE 1=1'
	IF (@BeforeEntry IS NOT NULL)
		SET @sql += ' AND L.[pkID] < @BeforeEntry'
	IF (@CreatedBefore IS NOT NULL)
		SET @sql += ' AND L.[ChangeDate] < @CreatedBefore'
	IF (@PreservedRelation IS NOT NULL)
	BEGIN
		SET @PreservedRelationLike += '%'
		SET @sql += ' AND ((A.[From] IS NULL OR A.[From] NOT LIKE @PreservedRelationLike) AND (L.RelatedItem IS NULL OR L.RelatedItem NOT LIKE @PreservedRelationLike))'
	END
	SET @paramList = '@MaxRows BIGINT,
                      @BeforeEntry BIGINT,
	                  @CreatedBefore DATETIME,
                      @PreservedRelationLike NVARCHAR(255)'
	EXEC sp_executesql @sql, @paramList, @MaxRows, @BeforeEntry, @CreatedBefore, @PreservedRelationLike
	RETURN @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[netActivityLogTruncateArchive]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActivityLogTruncateArchive]
(
	@MaxRows BIGINT,
	@CreatedBefore DATETIME
)
AS
BEGIN	
	DELETE TOP(@MaxRows) 
	FROM [tblActivityArchive] 
	WHERE ChangeDate < @CreatedBefore
	RETURN @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[netActvitiyLogList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netActvitiyLogList]
(
	@from 	                 DATETIME = NULL,
	@to	                     DATETIME = NULL,
	@type 					 [nvarchar](255) = NULL,
	@action 				 INT = NULL,
	@changedBy				 [nvarchar](255) = NULL,
	@startSequence			 BIGINT = NULL,
	@maxRows				 BIGINT,
	@archived				 BIT = 0,
	@deleted				 BIT = 0,
	@order					 INT = 0
)
AS
BEGIN
	DECLARE @paramList NVARCHAR(4000)
	DECLARE @sql NVARCHAR(MAX) 
	SET @sql = 'SELECT TOP(@maxRows) [pkID], [LogData], [ChangeDate], [Type], [Action], [ChangedBy], [Deleted]'
	IF @archived = 0
		SET @sql += ', [RelatedItem] FROM dbo.[tblActivityLog]' + CHAR(13);
	ELSE
		SET @sql += ', '''' AS [RelatedItem] FROM [completeActivityLog]' + CHAR(13);
	-- WHERE
	SET @sql += 'WHERE 1=1';
	IF @startSequence IS NOT NULL
		SET @sql += ' AND pkID ' + CASE @order WHEN 0 THEN '<=' ELSE '>=' END + ' @startSequence'
	IF @from IS NOT NULL
		SET @sql += ' AND [ChangeDate] >= @from'
	IF @to IS NOT NULL
		SET @sql += ' AND [ChangeDate] <= @to'
	IF @type IS NOT NULL
		SET @sql += ' AND [Type] = @type'
	IF @action IS NOT NULL
		SET @sql += ' AND [Action] = @action'
	IF @changedBy IS NOT NULL
		SET @sql += ' AND [ChangedBy] = @changedBy'
	IF @deleted = 0
		SET @sql += ' AND [Deleted] = 0'
	-- ORDER BY
	SET @sql += CHAR(13) + 'ORDER BY pkID ' + CASE @order WHEN 0 THEN 'DESC' ELSE 'ASC' END
	SET @paramList = '@from 	        DATETIME,
					  @to				DATETIME,
					  @type 			NVARCHAR(255),
					  @action 			INT,
					  @changedBy		NVARCHAR(255),
					  @startSequence	BIGINT,
					  @maxRows			BIGINT,
					  @deleted			BIT'
	EXEC sp_executesql @sql, @paramList, @from, @to, @type, @action, @changedBy, @startSequence, @maxRows, @deleted
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalAdd]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalAdd](
	@StartedBy NVARCHAR(255),
	@Started DATETIME2,
	@Approvals [dbo].[AddApprovalTable] READONLY)
AS
BEGIN
	DELETE t FROM [dbo].[tblApproval] t
	JOIN @Approvals a ON t.ApprovalKey = a.ApprovalKey
	DECLARE @StepCounts AS TABLE(VersionID INT, StepCount INT, RequireCommentOnApprove BIT, RequireCommentOnReject BIT, RequireCommentOnStart BIT)
	INSERT INTO @StepCounts
	SELECT VersionID, COUNT(*) AS StepCount, RequireCommentOnApprove, RequireCommentOnReject, RequireCommentOnStart FROM (
		SELECT DISTINCT adv.pkID AS VersionID, ads.pkID AS StepID, adv.RequireCommentOnApprove, adv.RequireCommentOnReject, adv.RequireCommentOnStart FROM [dbo].[tblApprovalDefinitionVersion] adv
		JOIN [dbo].[tblApprovalDefinitionStep] ads ON adv.pkID = ads.fkApprovalDefinitionVersionID
		JOIN @Approvals approvals ON approvals.ApprovalDefinitionVersionID = adv.pkID
	) X	GROUP BY VersionID, RequireCommentOnApprove, RequireCommentOnReject, RequireCommentOnStart
	INSERT INTO [dbo].[tblApproval]([fkApprovalDefinitionVersionID], [ApprovalKey], [fkLanguageBranchID], [ActiveStepIndex], [ActiveStepStarted], [StepCount], [StartedBy], [Started], [Completed], [ApprovalStatus], [RequireCommentOnApprove], [RequireCommentOnReject], [RequireCommentOnStart])
	SELECT a.ApprovalDefinitionVersionID, a.ApprovalKey, a.LanguageBranchID, 0, @Started, sc.StepCount, @StartedBy, @Started, NULL, 0, sc.RequireCommentOnApprove, sc.RequireCommentOnReject, sc.RequireCommentOnStart FROM @Approvals a
	JOIN @StepCounts sc ON a.ApprovalDefinitionVersionID = sc.VersionID
	SELECT t.ApprovalKey, t.pkID AS ApprovalID, t.StepCount, t.RequireCommentOnApprove, t.RequireCommentOnReject, t.RequireCommentOnStart FROM [dbo].[tblApproval] t
	JOIN @Approvals a ON t.ApprovalKey = a.ApprovalKey
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalDefinitionAddVersion]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalDefinitionAddVersion](
	@ApprovalDefinitionKey NVARCHAR (255),
	@SavedBy NVARCHAR (255),
	@Saved DATETIME2,
	@RequireCommentOnApprove BIT,
	@RequireCommentOnReject BIT,
	@RequireCommentOnStart BIT,
	@ApprovesNeeded INT,
	@SelfApprove BIT,
	@IsEnabled BIT,
	@Steps [dbo].[AddApprovalDefinitionStepTable] READONLY,
	@Reviewers [dbo].[AddApprovalDefinitionReviewerTable] READONLY,
	@ApprovalDefinitionID INT OUT,
	@ApprovalDefinitionVersionID INT OUT)
AS
BEGIN
	SELECT @ApprovalDefinitionID = NULL, @ApprovalDefinitionVersionID = NULL
	-- Get or create an ApprovalDefinition for the ApprovalDefinitionKey
	SELECT @ApprovalDefinitionID = pkID FROM [dbo].[tblApprovalDefinition] WHERE ApprovalDefinitionKey = @ApprovalDefinitionKey
	IF (@ApprovalDefinitionID IS NULL)
	BEGIN
		DECLARE @DefinitionIDTable [dbo].[IDTable]
		INSERT INTO [dbo].[tblApprovalDefinition]([ApprovalDefinitionKey]) OUTPUT inserted.pkID INTO @DefinitionIDTable VALUES (@ApprovalDefinitionKey)
		SELECT @ApprovalDefinitionID = ID FROM @DefinitionIDTable
	END
	-- Add a new ApprovalDefinitionVersion to the definition
	DECLARE @VersionIDTable [dbo].[IDTable]
	INSERT INTO [dbo].[tblApprovalDefinitionVersion]([fkApprovalDefinitionID], [SavedBy], [Saved], [RequireCommentOnApprove], [RequireCommentOnReject], [RequireCommentOnStart], [ApprovesNeeded], [SelfApprove], [IsEnabled]) 
	OUTPUT inserted.pkID 
	INTO @VersionIDTable 
	VALUES (@ApprovalDefinitionID, @SavedBy, @Saved, @RequireCommentOnApprove, @RequireCommentOnReject, @RequireCommentOnStart, @ApprovesNeeded, @SelfApprove, @IsEnabled)
	SELECT @ApprovalDefinitionVersionID = ID FROM @VersionIDTable
	-- Update the current version in the definition
	UPDATE [dbo].[tblApprovalDefinition]
	SET [fkCurrentApprovalDefinitionVersionID] = @ApprovalDefinitionVersionID
	WHERE pkID = @ApprovalDefinitionID
	-- Add steps
	DECLARE @StepTable TABLE (ID INT, StepIndex INT)
	INSERT INTO [dbo].[tblApprovalDefinitionStep]([fkApprovalDefinitionVersionID], [StepIndex], [StepName], [ApprovesNeeded], [SelfApprove])
	OUTPUT inserted.pkID, inserted.StepIndex INTO @StepTable
	SELECT @ApprovalDefinitionVersionID, StepIndex, StepName, ApprovesNeeded, SelfApprove FROM @Steps
	
	-- Add reviewers
	INSERT INTO [dbo].[tblApprovalDefinitionReviewer]([fkApprovalDefinitionStepID], [fkApprovalDefinitionVersionID], [Username], [fkLanguageBranchID], [ReviewerType])
	SELECT step.ID, @ApprovalDefinitionVersionID, reviewer.Username, reviewer.fkLanguageBranchID, reviewer.ReviewerType FROM @Reviewers reviewer
	JOIN @StepTable step ON reviewer.StepIndex = step.StepIndex
	-- Cleanup unused versions
	DELETE adv FROM [dbo].[tblApprovalDefinition] ad
	JOIN [dbo].[tblApprovalDefinitionVersion] adv ON ad.pkID = adv.fkApprovalDefinitionID
	LEFT JOIN [dbo].[tblApproval] a ON a.fkApprovalDefinitionVersionID = adv.pkID
	WHERE ad.pkID = @ApprovalDefinitionID AND ad.fkCurrentApprovalDefinitionVersionID != adv.pkID AND a.pkID IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalDefinitionDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalDefinitionDelete](
	@ApprovalDefinitionIDs [dbo].[IDTable] READONLY)
AS
BEGIN
	DECLARE @IDStatus TABLE (ID INT, [Status] INT)
	INSERT INTO @IDStatus
	SELECT a.pkID,a.ApprovalStatus FROM [dbo].[tblApproval] a 
	JOIN [dbo].[tblApprovalDefinitionVersion] v ON a.fkApprovalDefinitionVersionID = v.pkID 
	JOIN @ApprovalDefinitionIDs ids ON v.fkApprovalDefinitionID = ids.ID
	IF NOT EXISTS(SELECT 1 FROM @IDStatus i WHERE i.[Status] = 0)  
	BEGIN 
		DELETE a FROM [dbo].[tblApproval] a 
		JOIN @IDStatus i ON a.pkID = i.ID
		WHERE i.[Status] != 0  
		DELETE [definition] FROM [dbo].[tblApprovalDefinition] [definition]
		JOIN @ApprovalDefinitionIDs ids ON [definition].pkID = ids.ID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalDefinitionGetCurrentVersion]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalDefinitionGetCurrentVersion](
	@ApprovalDefinitionIDs [dbo].[IDTable] READONLY,
	@ApprovalDefinitionKeys [dbo].[StringParameterTable] READONLY)
AS
BEGIN
	DECLARE @ApprovalDefinitionVersionIDs [dbo].[IDTable]
	IF EXISTS(select 1 from @ApprovalDefinitionIDs)  
		INSERT INTO @ApprovalDefinitionVersionIDs
		SELECT fkCurrentApprovalDefinitionVersionID 
		FROM [dbo].[tblApprovalDefinition] 
		JOIN @ApprovalDefinitionIDs ids ON ids.ID = pkID
	ELSE
		INSERT INTO @ApprovalDefinitionVersionIDs
		SELECT fkCurrentApprovalDefinitionVersionID 
		FROM [dbo].[tblApprovalDefinition] 
		JOIN @ApprovalDefinitionKeys keys ON keys.String = ApprovalDefinitionKey
	
	SELECT DISTINCT [definition].* FROM [dbo].[tblApprovalDefinition] [definition] 
	JOIN @ApprovalDefinitionVersionIDs [versionid] ON [definition].fkCurrentApprovalDefinitionVersionID = versionid.ID 
	
	SELECT [version].* FROM [dbo].[tblApprovalDefinitionVersion] [version]
	JOIN @ApprovalDefinitionVersionIDs [versionid] ON [version].pkID = versionid.ID 
	SELECT step.* FROM [dbo].[tblApprovalDefinitionStep] step
	JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON step.fkApprovalDefinitionVersionID = [version].pkID
	JOIN @ApprovalDefinitionVersionIDs [versionid] ON [version].pkID = versionid.ID 
	
	SELECT reviewer.* FROM [dbo].[tblApprovalDefinitionReviewer] reviewer 
	JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON reviewer.fkApprovalDefinitionVersionID = [version].pkID
	JOIN @ApprovalDefinitionVersionIDs [versionid] ON [version].pkID = versionid.ID 
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalDefinitionVersionDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalDefinitionVersionDelete](
	@ApprovalDefinitionVersionID INT)
AS
BEGIN
	DECLARE @ApprovalDefinitionID INT 
	DECLARE @CurrentApprovalDefinitionVersionID INT 
	SELECT @CurrentApprovalDefinitionVersionID = [definition].fkCurrentApprovalDefinitionVersionID, @ApprovalDefinitionID = [definition].pkID
	FROM [dbo].[tblApprovalDefinition] [definition]
	JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON [definition].pkID = [version].fkApprovalDefinitionID
	WHERE [version].pkID = @ApprovalDefinitionVersionID
	IF NOT EXISTS(SELECT 1 FROM [dbo].[tblApproval] WHERE fkApprovalDefinitionVersionID = @ApprovalDefinitionVersionID AND ApprovalStatus = 0)
	BEGIN
		DELETE FROM [dbo].[tblApproval] WHERE fkApprovalDefinitionVersionID = @ApprovalDefinitionVersionID AND ApprovalStatus != 0 
		IF @ApprovalDefinitionVersionID = @CurrentApprovalDefinitionVersionID  
		BEGIN
			IF EXISTS(SELECT pkID FROM [dbo].[tblApprovalDefinitionVersion] WHERE fkApprovalDefinitionID = @ApprovalDefinitionID AND pkID != @ApprovalDefinitionVersionID)
			BEGIN
				UPDATE [dbo].[tblApprovalDefinition] SET fkCurrentApprovalDefinitionVersionID = NULL WHERE pkID = @ApprovalDefinitionID
				DELETE FROM [dbo].[tblApprovalDefinitionVersion] WHERE pkID = @ApprovalDefinitionVersionID
			END ELSE BEGIN 
				DELETE FROM [dbo].[tblApprovalDefinition] WHERE pkID = @ApprovalDefinitionID		
			END
		END ELSE BEGIN
			DELETE FROM [dbo].[tblApprovalDefinitionVersion] WHERE pkID = @ApprovalDefinitionVersionID
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalDefinitionVersionGet]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalDefinitionVersionGet](
	@ApprovalDefinitionVersionID INT)
AS
BEGIN
	SELECT [definition].* FROM [dbo].[tblApprovalDefinition] [definition] 
	JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON [definition].pkID = [version].fkApprovalDefinitionID
	WHERE [version].pkID = @ApprovalDefinitionVersionID
	
	SELECT * FROM [dbo].[tblApprovalDefinitionVersion] WHERE pkID = @ApprovalDefinitionVersionID
	SELECT * FROM [dbo].[tblApprovalDefinitionStep] WHERE fkApprovalDefinitionVersionID = @ApprovalDefinitionVersionID ORDER BY StepIndex ASC
	SELECT * FROM [dbo].[tblApprovalDefinitionReviewer] WHERE fkApprovalDefinitionVersionID = @ApprovalDefinitionVersionID
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalDefinitionVersionList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalDefinitionVersionList](
	@ApprovalDefinitionID INT)
AS
BEGIN
	SELECT DISTINCT [definition].* FROM [dbo].[tblApprovalDefinition] [definition] 
	JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON [definition].pkID = [version].fkApprovalDefinitionID
	WHERE [definition].pkID = @ApprovalDefinitionID
	
	SELECT * FROM [dbo].[tblApprovalDefinitionVersion] WHERE fkApprovalDefinitionID = @ApprovalDefinitionID
	SELECT step.* FROM [dbo].[tblApprovalDefinitionStep] step
	JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON step.fkApprovalDefinitionVersionID = [version].pkID
	WHERE [version].fkApprovalDefinitionID = @ApprovalDefinitionID
	
	SELECT reviewer.* FROM [dbo].[tblApprovalDefinitionReviewer] reviewer
	JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON reviewer.fkApprovalDefinitionVersionID = [version].pkID
	WHERE [version].fkApprovalDefinitionID = @ApprovalDefinitionID
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalDelete](
	@ApprovalIDs [dbo].[IDTable] READONLY)
AS
BEGIN
	DELETE approval FROM [dbo].[tblApproval] approval 
	JOIN @ApprovalIDs ids ON approval.pkID = ids.ID
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalList](
	@ApprovalIDs [dbo].[IDTable] READONLY)
AS
BEGIN
	SELECT approval.* FROM [dbo].[tblApproval] approval 
	JOIN @ApprovalIDs ids ON approval.pkID = ids.ID
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalListByKeys]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalListByKeys](
	@ApprovalKeys [dbo].[StringParameterTable] READONLY)
AS
BEGIN
	DECLARE @Count INT = (SELECT COUNT(*) FROM @ApprovalKeys)
	IF (@Count = 1)
	BEGIN
		DECLARE @ApprovalKey NVARCHAR(255) = (SELECT TOP 1 String + '%' FROM @ApprovalKeys) 
		SELECT approval.* FROM [dbo].[tblApproval] approval 
		WHERE approval.ApprovalKey LIKE @ApprovalKey
	END ELSE BEGIN
		SELECT approval.* FROM [dbo].[tblApproval] approval 
		JOIN @ApprovalKeys keys ON approval.ApprovalKey LIKE keys.String + '%'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalListByQuery]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalListByQuery](
	@StartIndex INT,
	@MaxCount INT,
	@Username NVARCHAR(255) = NULL,
	@Roles dbo.StringParameterTable READONLY,
	@StartedBy NVARCHAR(255) = NULL,
	@LanguageBranchID INT = NULL,
	@ApprovalKey NVARCHAR(255) = NULL,
	@DefinitionID INT = NULL,
	@DefinitionVersionID INT = NULL,
	@Status INT = NULL,
	@OnlyActiveSteps BIT = 0,
	@UserDecision BIT = NULL,
	@UserDecisionApproved BIT = NULL,
	@PrintQuery BIT = 0)
AS
BEGIN
	DECLARE @JoinApprovalDefinitionVersion BIT = 0
	DECLARE @JoinApprovalDefinitionReviewer BIT = 0
	DECLARE @JoinApprovalStepDecision BIT = 0
	DECLARE @InvariantLanguageBranchID INT = NULL
	DECLARE @Wheres AS TABLE([String] NVARCHAR(MAX))
	IF @LanguageBranchID IS NOT NULL 
	BEGIN
		SELECT @InvariantLanguageBranchID = [pkID] FROM [dbo].[tblLanguageBranch] WHERE LanguageID = ''
		IF @LanguageBranchID = @InvariantLanguageBranchID
			SET @LanguageBranchID = NULL
		ELSE 
			INSERT INTO @Wheres SELECT '[approval].fkLanguageBranchID IN (@LanguageBranchID, @InvariantLanguageBranchID)'	
	END
	IF @Status IS NOT NULL 
		INSERT INTO @Wheres SELECT '[approval].ApprovalStatus = @Status'
	IF @StartedBy IS NOT NULL 
		INSERT INTO @Wheres SELECT '[approval].StartedBy = @StartedBy'
	IF @DefinitionVersionID IS NOT NULL 
		INSERT INTO @Wheres SELECT '[approval].fkApprovalDefinitionVersionID = @DefinitionVersionID'
	IF @ApprovalKey IS NOT NULL 
		INSERT INTO @Wheres SELECT '[approval].ApprovalKey LIKE @ApprovalKey + ''%''' 
	IF @DefinitionID IS NOT NULL 
	BEGIN
		SET @JoinApprovalDefinitionVersion = 1
		INSERT INTO @Wheres SELECT '[version].fkApprovalDefinitionID = @DefinitionID'
	END
	DECLARE @DecisionComparison NVARCHAR(MAX) = ''
	IF @UserDecision IS NULL OR @UserDecision = 1 
	BEGIN
		SET @DecisionComparison
			= CASE WHEN @Username IS NOT NULL THEN 'AND [decision].Username = @Username ' ELSE '' END   
			+ CASE WHEN @OnlyActiveSteps = 1 THEN 'AND [approval].ActiveStepIndex = [decision].StepIndex ' ELSE '' END   
			+ CASE WHEN @UserDecisionApproved IS NOT NULL THEN 'AND [decision].Approve = @UserDecisionApproved ' ELSE '' END   
		IF @DecisionComparison != '' OR @UserDecision = 1 
		BEGIN
			SET @JoinApprovalStepDecision = 1
			SET @DecisionComparison = '[decision].pkID IS NOT NULL AND [decision].DecisionScope != 4 ' + @DecisionComparison 
		END
	END
	DECLARE @DeclarationComparison NVARCHAR(MAX) = ''
	DECLARE @RoleCount INT = (SELECT COUNT(*) FROM @Roles)
	IF (@Username IS NOT NULL OR @RoleCount > 0) AND (@UserDecision IS NULL OR @UserDecision = 0) 
	BEGIN
		SET @JoinApprovalDefinitionVersion = 1
		SET @JoinApprovalDefinitionReviewer = 1
		
		DECLARE @ReviewerConditionUser NVARCHAR(100) = '[reviewer].[ReviewerType] = 0 AND [reviewer].Username = @Username'
		DECLARE @ReviewerConditionRoles NVARCHAR(100) = CASE @RoleCount WHEN 0 THEN '' WHEN 1 THEN '[reviewer].[ReviewerType] = 1 AND [reviewer].Username = @Role' ELSE '[reviewer].[ReviewerType] = 1 AND [reviewer].Username IN (SELECT [String] FROM @Roles)' END
			
		IF @Username IS NULL
			SET @DeclarationComparison = @ReviewerConditionRoles
		ELSE IF @RoleCount = 0 
			SET @DeclarationComparison = @ReviewerConditionUser
		ELSE
			SET @DeclarationComparison = '((' + @ReviewerConditionUser + ') OR (' + @ReviewerConditionRoles + '))'
	
		SET @DeclarationComparison = @DeclarationComparison
			+ CASE WHEN @OnlyActiveSteps = 1 THEN ' AND [approval].ActiveStepIndex = [step].StepIndex' ELSE '' END   
			+ CASE WHEN @LanguageBranchID IS NOT NULL THEN ' AND (([approval].fkLanguageBranchID = @InvariantLanguageBranchID) OR ([reviewer].fkLanguageBranchID IN (@LanguageBranchID, @InvariantLanguageBranchID )))' ELSE '' END   
	END
	IF @DecisionComparison != '' AND @DeclarationComparison != ''
		INSERT INTO @Wheres SELECT '((' + @DecisionComparison + ') OR (' + @DeclarationComparison + '))'
	ELSE IF @DecisionComparison != ''
		INSERT INTO @Wheres SELECT @DecisionComparison
	ELSE IF @DeclarationComparison != ''
		INSERT INTO @Wheres SELECT @DeclarationComparison
	
	DECLARE @WhereSql NVARCHAR(MAX) 
	SELECT @WhereSql = COALESCE(@WhereSql + CHAR(13) + 'AND ', '') + [String] FROM @Wheres
	DECLARE @SelectSql NVARCHAR(MAX) = 'SELECT DISTINCT [approval].pkID, [approval].[Started] FROM [dbo].[tblApproval] [approval]' + CHAR(13)
		+ CASE WHEN @JoinApprovalDefinitionVersion = 1 THEN 'JOIN [dbo].[tblApprovalDefinitionVersion] [version] ON [approval].fkApprovalDefinitionVersionID = [version].pkID' + CHAR(13) ELSE '' END   
		+ CASE WHEN @JoinApprovalDefinitionReviewer = 1 THEN 'JOIN [dbo].[tblApprovalDefinitionStep] [step] ON [step].fkApprovalDefinitionVersionID = [version].pkID' + CHAR(13) ELSE '' END   
		+ CASE WHEN @JoinApprovalDefinitionReviewer = 1 THEN 'JOIN [dbo].[tblApprovalDefinitionReviewer] [reviewer] ON [reviewer].fkApprovalDefinitionStepID = [step].pkID' + CHAR(13) ELSE '' END   
		+ CASE WHEN @JoinApprovalStepDecision = 1 THEN 'LEFT JOIN [dbo].[tblApprovalStepDecision] [decision] ON [approval].pkID = [decision].fkApprovalID' + CHAR(13) ELSE '' END   
	DECLARE @Sql NVARCHAR(MAX) = @SelectSql 
	IF @WhereSql IS NOT NULL
		SET @Sql += 'WHERE ' + @WhereSql + CHAR(13)
	SET @Sql += 'ORDER BY [Started] DESC'
	SET @Sql = '
DECLARE @Ids AS TABLE([RowNr] [INT] IDENTITY(0,1), [ID] [INT] NOT NULL, [Started] DATETIME)
INSERT INTO @Ids
' + @Sql + '
DECLARE @TotalCount INT = (SELECT COUNT(*) FROM @Ids)
SELECT TOP(@MaxCount) [approval].*, @TotalCount AS ''TotalCount''
FROM [dbo].[tblApproval] [approval]
JOIN @Ids ids ON [approval].[pkID] = ids.[ID]
WHERE ids.RowNr >= @StartIndex
ORDER BY [approval].[Started] DESC'
	IF @RoleCount = 1
		SET @Sql = CHAR(13) + 'DECLARE @Role NVARCHAR(255) = (SELECT [String] FROM @Roles)' + @Sql
	IF @PrintQuery = 1 
	BEGIN
		PRINT @Sql
	END ELSE BEGIN
		EXEC sp_executesql @Sql, 
			N'@Username NVARCHAR(255),@Roles dbo.StringParameterTable READONLY, @StartIndex INT, @MaxCount INT, @StartedBy NVARCHAR(255), @ApprovalKey NVARCHAR(255), @LanguageBranchID INT, @InvariantLanguageBranchID INT, @Status INT, @DefinitionVersionID INT, @DefinitionID INT, @UserDecisionApproved INT', 
			@Username = @Username, @Roles = @Roles, @StartIndex = @StartIndex, @MaxCount = @MaxCount, @StartedBy = @StartedBy, @ApprovalKey = @ApprovalKey, @LanguageBranchID = @LanguageBranchID, @InvariantLanguageBranchID = @InvariantLanguageBranchID, @Status = @Status, @DefinitionVersionID = @DefinitionVersionID, @DefinitionID = @DefinitionID, @UserDecisionApproved = @UserDecisionApproved
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalStepDecisionAdd]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalStepDecisionAdd](
	@ApprovalID INT,
	@StepIndex INT,
	@Approve BIT,
	@DecisionScope INT,
	@Username NVARCHAR(255),
	@DecisionTimeStamp DATETIME2,
	@Comment NVARCHAR(MAX) = NULL
)
AS
BEGIN
	INSERT INTO [dbo].[tblApprovalStepDecision] ([fkApprovalID], [StepIndex], [Approve], [DecisionScope], [Username], [DecisionTimeStamp], [Comment]) 
	VALUES (@ApprovalID, @StepIndex, @Approve, @DecisionScope, @Username, @DecisionTimeStamp, @Comment)
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalStepDecisionList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalStepDecisionList](
	@ApprovalID INT,
	@StepIndex INT = NULL)
AS
BEGIN
	IF @StepIndex IS NULL
	BEGIN
		SELECT * FROM [dbo].[tblApprovalStepDecision] decision
		WHERE decision.fkApprovalID = @ApprovalID
		ORDER BY decision.StepIndex ASC
	END ELSE BEGIN
		SELECT * FROM [dbo].[tblApprovalStepDecision] decision
		WHERE decision.fkApprovalID = @ApprovalID AND decision.StepIndex = @StepIndex
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netApprovalUpdate]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netApprovalUpdate](
	@ApprovalID INT,
	@ActiveStepIndex INT,
	@ActiveStepStarted DATETIME2,
	@Completed DATETIME2 = NULL,
	@ApprovalStatus INT,
	@CompletedComment NVARCHAR(MAX) = NULL,
	@CompletedBy NVARCHAR(255) = NULL)
AS
BEGIN
	UPDATE [dbo].[tblApproval] SET 
		[ActiveStepIndex] = @ActiveStepIndex,
		[ActiveStepStarted] = @ActiveStepStarted,
		[Completed] = @Completed,
		[ApprovalStatus] = @ApprovalStatus,
		[CompletedComment] = @CompletedComment,
		[CompletedBy] = @CompletedBy
	WHERE pkID = @ApprovalID
END
GO
/****** Object:  StoredProcedure [dbo].[netBlobListVersionsForUri]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netBlobListVersionsForUri]
	@BlobUris dbo.StringParameterTable READONLY
AS
BEGIN
    SELECT pkID, fkContentID, BlobUri FROM tblWorkContent INNER JOIN  @BlobUris AS Uris ON tblWorkContent.BlobUri = Uris.String
    ORDER BY(BlobUri)
END
GO
/****** Object:  StoredProcedure [dbo].[netBlobPendingDeleteInsert]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netBlobPendingDeleteInsert]
    @BlobUri NVARCHAR(255),
    @ContentId INT,
    @Provider NVARCHAR(255)
AS
BEGIN
	INSERT INTO tblBlobPendingDelete(BlobUri, fkContentId, Provider) VALUES(@BlobUri, @ContentId, @Provider)
END
GO
/****** Object:  StoredProcedure [dbo].[netBlobPendingDeleteList]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netBlobPendingDeleteList]
    @MaxCount INT = 500
AS
BEGIN
	SELECT TOP(@MaxCount) pkID, BlobUri, fkContentId AS ContentId, Provider FROM tblBlobPendingDelete
END
GO
/****** Object:  StoredProcedure [dbo].[netBlobPendingDeleteRemove]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netBlobPendingDeleteRemove]
    @ProcessedIds dbo.LongParameterTable READONLY
AS
BEGIN
	DELETE tblBlobPendingDelete FROM tblBlobPendingDelete AS Uris INNER JOIN @ProcessedIds AS Ids ON Uris.pkID = Ids.Id
END
GO
/****** Object:  StoredProcedure [dbo].[netBlockTypeCheckUsage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netBlockTypeCheckUsage]
(
	@BlockTypeID		INT,
	@OnlyPublished	BIT = 0
)
AS
BEGIN
	SET NOCOUNT ON
	
	IF (@OnlyPublished = 1)
	BEGIN
		SELECT TOP 1
			Property.fkContentID as ContentID, 
			0 AS WorkID
		FROM tblContentProperty as Property WITH(INDEX(IDX_tblContentProperty_ScopeName))
		INNER JOIN dbo.GetScopedBlockProperties(@BlockTypeID) as ScopedProperties ON 
			Property.ScopeName LIKE (ScopedProperties.ScopeName + '%')
	END
	ELSE
	BEGIN
		SELECT TOP 1
			WorkContent.fkContentID as ContentID, 
			WorkContent.pkID as WorkID
		FROM tblWorkContentProperty as Property WITH(INDEX(IDX_tblWorkContentProperty_ScopeName))
		INNER JOIN dbo.GetScopedBlockProperties(@BlockTypeID) as ScopedProperties ON 
			Property.ScopeName LIKE (ScopedProperties.ScopeName + '%')
		INNER JOIN
			tblWorkContent as WorkContent ON Property.fkWorkContentID=WorkContent.pkID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netBlockTypeGetUsage]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netBlockTypeGetUsage]
(
	@BlockTypeID		INT,
	@OnlyPublished	BIT = 0
)
AS
BEGIN
	SET NOCOUNT ON
	
	IF (@OnlyPublished = 1)
	BEGIN
		SELECT DISTINCT
			Property.fkContentID as ContentID, 
			0 AS WorkID,
			ContentLanguage.Name,
			LanguageBranch.LanguageID AS LanguageBranch
		FROM tblContentProperty as Property WITH(INDEX(IDX_tblContentProperty_ScopeName))
		INNER JOIN dbo.GetScopedBlockProperties(@BlockTypeID) as ScopedProperties ON 
			Property.ScopeName LIKE (ScopedProperties.ScopeName + '%')
		INNER JOIN tblContentLanguage as ContentLanguage ON Property.fkContentID=ContentLanguage.fkContentID
		INNER JOIN tblLanguageBranch as LanguageBranch ON LanguageBranch.pkID=ContentLanguage.fkLanguageBranchID
	END
	ELSE
	BEGIN
		SELECT DISTINCT
			WorkContent.fkContentID as ContentID, 
			WorkContent.pkID as WorkID,
			WorkContent.Name,
			LanguageBranch.LanguageID AS LanguageBranch
		FROM tblWorkContentProperty as Property WITH(INDEX(IDX_tblWorkContentProperty_ScopeName))
		INNER JOIN dbo.GetScopedBlockProperties(@BlockTypeID) as ScopedProperties ON 
			Property.ScopeName LIKE (ScopedProperties.ScopeName + '%')
		INNER JOIN tblWorkContent as WorkContent ON WorkContent.pkID = Property.fkWorkContentID
		INNER JOIN tblLanguageBranch as LanguageBranch ON LanguageBranch.pkID=WorkContent.fkLanguageBranchID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netCategoryContentLoad]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netCategoryContentLoad]
(
	@ContentID			INT,
	@VersionID		INT,
	@CategoryType	INT,
	@LanguageBranch	NCHAR(17) = NULL,
	@ScopeName NVARCHAR(450)
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @LangBranchID NCHAR(17);
	DECLARE @LanguageSpecific INT;
	IF(@VersionID = 0)
			SET @VersionID = NULL;
	IF @VersionID IS NOT NULL AND @LanguageBranch IS NOT NULL
	BEGIN
		IF NOT EXISTS(	SELECT
							LanguageID
						FROM
							tblWorkContent 
						INNER JOIN
							tblLanguageBranch
						ON
							tblWorkContent.fkLanguageBranchID = tblLanguageBranch.pkID
						WHERE
							LanguageID = @LanguageBranch
						AND
							tblWorkContent.pkID = @VersionID)
			RAISERROR('@LanguageBranch %s is not the same as Language Branch for page version %d' ,16,1, @LanguageBranch,@VersionID)
	END
	
	IF(@LanguageBranch IS NOT NULL)
		SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID = @LanguageBranch;
	ELSE
		SELECT @LangBranchID = fkLanguageBranchID FROM tblWorkContent WHERE pkID = @VersionID;
	
	IF(@CategoryType <> 0)
		SELECT @LanguageSpecific = LanguageSpecific FROM tblPageDefinition WHERE pkID = @CategoryType;
	ELSE
		SET @LanguageSpecific = 0;
	IF @LangBranchID IS NULL AND @LanguageSpecific > 2
		RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
	IF @LanguageSpecific < 3 AND @VersionID IS NOT NULL
	BEGIN
		IF EXISTS(SELECT pkID FROM tblContent WHERE pkID=@ContentID AND fkMasterLanguageBranchID<>@LangBranchID)
		BEGIN
			SELECT @VersionID = tblContentLanguage.Version 
				FROM tblContentLanguage 
				INNER JOIN tblContent ON tblContent.pkID=tblContentLanguage.fkContentID
				WHERE tblContent.pkID=@ContentID AND tblContentLanguage.fkLanguageBranchID=tblContent.fkMasterLanguageBranchID			
		END
	END
	IF (@VersionID IS NOT NULL)
	BEGIN
		/* Get info from tblWorkContentCategory */
		SELECT
			fkCategoryID AS CategoryID
		FROM
			tblWorkContentCategory
		WHERE
			ScopeName=@ScopeName AND
			fkWorkContentID=@VersionID
	END
	ELSE
	BEGIN
		/* Get info from tblContentcategory */
		SELECT
			fkCategoryID AS CategoryID
		FROM
			tblContentCategory
		WHERE
			ScopeName=@ScopeName AND
			fkContentID=@ContentID AND
			(fkLanguageBranchID=@LangBranchID OR @LanguageSpecific < 3)
	END
	
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netCategoryDelete]    Script Date: 12/3/2020 3:17:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netCategoryDelete]
(
	@CategoryID			INT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
		CREATE TABLE #Reversed (pkID INT PRIMARY KEY)
		/* Find category and descendants */
		;WITH Categories AS (
		  SELECT pkID, 0 as [Level]
		  FROM tblCategory
		  WHERE pkID = @CategoryID
		  UNION ALL
		  SELECT c1.pkID, [Level] + 1
		  FROM tblCategory c1 
			INNER JOIN Categories c2 ON c1.fkParentID = c2.pkID
		 ) 
		/* Reverse order to avoid reference constraint errors */
		INSERT INTO #Reversed (pkID) 
		SELECT pkID FROM Categories ORDER BY [Level] DESC
		/* Delete any references from content tables */
		DELETE FROM tblCategoryPage WHERE fkCategoryID IN (SELECT pkID FROM #Reversed)
		DELETE FROM tblWorkCategory WHERE fkCategoryID IN (SELECT pkID FROM #Reversed)
		
		/* Delete the categories */
		DELETE FROM tblCategory WHERE pkID IN (SELECT pkID FROM #Reversed)
		DROP TABLE #Reversed
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netCategoryListAll]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netCategoryListAll]
AS
BEGIN
	SET NOCOUNT ON
	;WITH 
	  cte_anchor AS (
		SELECT *,
			   0 AS Indent, 
			   CAST(RIGHT('00000' + CAST(SortOrder as VarChar(6)), 6) AS varchar(MAX)) AS [path]
		   FROM tblCategory
		   WHERE fkParentID IS NULL), 
	  cte_recursive AS (
		 SELECT *
		   FROM cte_anchor
		   UNION ALL
			 SELECT c.*, 
					r.Indent + 1 AS Indent, 
					r.[path] + '.' + CAST(RIGHT('00000' + CAST(c.SortOrder as VarChar(6)), 6) AS varchar(MAX)) AS [path]
			 FROM tblCategory c
			 JOIN cte_recursive r ON c.fkParentID = r.pkID)
	SELECT pkID,
		   fkParentID,
		   CategoryGUID,
		   CategoryName,
		   CategoryDescription,
		   Available,
		   Selectable,
		   SortOrder,
		   Indent
	  FROM cte_recursive 
	  WHERE fkParentID IS NOT NULL
	  ORDER BY [path]
	
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netCategorySave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netCategorySave]
(
	@CategoryID		INT OUTPUT,
	@CategoryName	NVARCHAR(50),
	@Description	NVARCHAR(255),
	@Available		BIT,
	@Selectable		BIT,
	@SortOrder		INT,
	@ParentID		INT = NULL,
	@Guid			UNIQUEIDENTIFIER = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	IF (@CategoryID IS NULL)
	BEGIN
			IF (@SortOrder < 0)
			BEGIN
				SELECT @SortOrder = MAX(SortOrder) + 10 FROM tblCategory 
				IF (@SortOrder IS NULL)
					SET @SortOrder=100
			END
			INSERT INTO tblCategory 
				(CategoryName, 
				CategoryDescription, 
				fkParentID, 
				Available, 
				Selectable,
				SortOrder,
				CategoryGUID) 
			VALUES 
				(@CategoryName,
				@Description,
				@ParentID,
				@Available,
				@Selectable,
				@SortOrder,
				COALESCE(@Guid,NewId()))
		SET @CategoryID =  SCOPE_IDENTITY() 
	END
	ELSE
	BEGIN
		UPDATE 
			tblCategory 
		SET 
			CategoryName		= @CategoryName,
			CategoryDescription	= @Description,
			fkParentID			= @ParentID,
			SortOrder			= @SortOrder,
			Available			= @Available,
			Selectable			= @Selectable,
			CategoryGUID		= COALESCE(@Guid,CategoryGUID)
		WHERE 
			pkID=@CategoryID
	END
	
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netCategoryStringToTable]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netCategoryStringToTable]
(
	@CategoryList	NVARCHAR(2000)
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE		@DotPos INT
	DECLARE		@Category NVARCHAR(255)
	DECLARE @CategoryResult TABLE(fkCategoryID INT)
	
	WHILE (DATALENGTH(@CategoryList) > 0)
	BEGIN
		SET @DotPos = CHARINDEX(N',', @CategoryList)
		IF @DotPos > 0
			SET @Category = LEFT(@CategoryList,@DotPos-1)
		ELSE
		BEGIN
			SET @Category = @CategoryList
			SET @CategoryList = NULL
		END
		IF LEN(@Category) > 0 AND @Category NOT LIKE '%[^0-9]%'
		    INSERT INTO @CategoryResult SELECT pkID FROM tblCategory WHERE pkID = CAST(@Category AS INT)
		ELSE
			INSERT INTO @CategoryResult SELECT pkID FROM tblCategory WHERE CategoryName = @Category
			
		IF (DATALENGTH(@CategoryList) > 0)
			SET @CategoryList = SUBSTRING(@CategoryList,@DotPos+1,255)
	END
	SELECT * FROM @CategoryResult
END
GO
/****** Object:  StoredProcedure [dbo].[netChangeLogGetCount]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netChangeLogGetCount]
(
	@from 	                DATETIME = NULL,
	@to	                    DATETIME = NULL,
	@type 					[nvarchar](255) = NULL,
	@action 				INT = 0,
	@changedBy				[nvarchar](255) = NULL,
	@startSequence			BIGINT = 0,
	@deleted				BIT = 0,
	@count                  BIGINT = 0 OUTPUT)
AS
BEGIN    
        SELECT @count = count(*)
        FROM [tblActivityLog] TCL
        WHERE 
        ((@startSequence = 0) OR (TCL.pkID >= @startSequence)) AND
		((@from IS NULL) OR (TCL.ChangeDate >= @from)) AND
		((@to IS NULL) OR (TCL.ChangeDate <= @to)) AND  
        ((@type IS NULL) OR (@type = TCL.Type)) AND
        ((@action = 0) OR (@action = TCL.Action)) AND
        ((@changedBy IS NULL) OR (@changedBy = TCL.ChangedBy)) AND
		((@deleted = 1) OR (TCL.Deleted = 0))
END
GO
/****** Object:  StoredProcedure [dbo].[netChangeLogGetCountBackwards]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netChangeLogGetCountBackwards]
(
	@from 	                 DATETIME = NULL,
	@to	                     DATETIME = NULL,
	@type 					 [nvarchar](255) = NULL,
	@action 				 INT = 0,
	@changedBy				 [nvarchar](255) = NULL,
	@startSequence			 BIGINT = 0,
	@deleted				 BIT =  0,	
	@count                   BIGINT = 0 OUTPUT)
AS
BEGIN    
        SELECT @count = count(*)
        FROM [tblActivityLog] TCL
        WHERE 
        (TCL.pkID <= @startSequence) AND
		((@from IS NULL) OR (TCL.ChangeDate >= @from)) AND
		((@to IS NULL) OR (TCL.ChangeDate <= @to)) AND  
        ((@type IS NULL) OR (@type = TCL.Type)) AND
        ((@action = 0) OR (@action = TCL.Action)) AND
        ((@changedBy IS NULL) OR (@changedBy = TCL.ChangedBy)) AND
		((@deleted = 1) OR (TCL.Deleted = 0))
		
END
GO
/****** Object:  StoredProcedure [dbo].[netChangeLogGetHighestSeqNum]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netChangeLogGetHighestSeqNum]
(
	@count BIGINT = 0 OUTPUT
)
AS
BEGIN
	select @count = MAX(pkID) from [tblActivityLog]
END
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[netChangeLogTruncByRowsNDate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netChangeLogTruncByRowsNDate]
(
	@RowsToTruncate BIGINT = NULL,
	@OlderThan DATETIME = NULL
)
AS
BEGIN	
	IF (@RowsToTruncate IS NOT NULL)
	BEGIN
		DELETE TOP(@RowsToTruncate) FROM [tblActivityLog] WHERE
		((@OlderThan IS NULL) OR (ChangeDate < @OlderThan))
		RETURN		
	END
	
	DELETE FROM [tblActivityLog] WHERE
	((@OlderThan IS NULL) OR (ChangeDate < @OlderThan))
	
END
GO
/****** Object:  StoredProcedure [dbo].[netChangeLogTruncBySeqNDate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netChangeLogTruncBySeqNDate]
(
	@LowestSequenceNumber BIGINT = NULL,
	@OlderThan DATETIME = NULL
)
AS
BEGIN	
	DELETE FROM [tblActivityLog] WHERE
	((@LowestSequenceNumber IS NULL) OR (pkID < @LowestSequenceNumber)) AND
	((@OlderThan IS NULL) OR (ChangeDate < @OlderThan))
END
GO
/****** Object:  StoredProcedure [dbo].[netContentAclAdd]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentAclAdd]
(
	@Name NVARCHAR(255),
	@IsRole INT,
	@ContentID INT,
	@AccessMask INT
)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE 
	    tblContentAccess 
	SET 
	    AccessMask=@AccessMask
	WHERE 
	    fkContentID=@ContentID AND 
	    Name=@Name AND 
	    IsRole=@IsRole
	    
	IF (@@ROWCOUNT = 0)
	BEGIN
		-- Does not exist, create it
		INSERT INTO tblContentAccess 
		    (fkContentID, Name, IsRole, AccessMask) 
		VALUES 
		    (@ContentID, @Name, @IsRole, @AccessMask)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netContentAclChildAdd]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentAclChildAdd]
(
	@Name NVARCHAR(255),
	@IsRole INT,
	@ContentID	INT,
	@AccessMask INT,
	@Merge BIT = 0
)
AS
BEGIN
    SET NOCOUNT ON
	CREATE TABLE #ignorecontents(IgnoreContentID INT PRIMARY KEY)
	IF @Merge = 1
	BEGIN
		INSERT INTO #ignorecontents(IgnoreContentID)
		SELECT fkChildID
		FROM tblTree
		WHERE fkParentID=@ContentID AND NOT EXISTS(SELECT * FROM tblContentAccess WHERE fkContentID=tblTree.fkChildID)
		EXEC netContentAclChildDelete @Name=@Name, @IsRole=@IsRole, @ContentID=@ContentID
	END
        
    /* Create new ACEs for all childs to @ContentID */
	INSERT INTO tblContentAccess 
		(fkContentID, 
		Name,
		IsRole, 
		AccessMask) 
	SELECT 
		fkChildID, 
		@Name,
		@IsRole, 
		@AccessMask
	FROM 
		tblTree
	WHERE 
		fkParentID=@ContentID AND NOT EXISTS(SELECT * FROM #ignorecontents WHERE IgnoreContentID=tblTree.fkChildID)
        
END
GO
/****** Object:  StoredProcedure [dbo].[netContentAclChildDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentAclChildDelete]
(
	@Name NVARCHAR(255),
	@IsRole INT,
	@ContentID	INT
)
AS
BEGIN
    SET NOCOUNT ON
 
    IF (@Name IS NULL)
    BEGIN
        DELETE FROM 
           tblContentAccess
        WHERE EXISTS(SELECT * FROM tblTree WHERE fkParentID=@ContentID AND fkChildID=tblContentAccess.fkContentID)
            
        RETURN
    END
    DELETE FROM 
       tblContentAccess
    WHERE Name=@Name
		AND IsRole=@IsRole
		AND EXISTS(SELECT * FROM tblTree WHERE fkParentID=@ContentID AND fkChildID=tblContentAccess.fkContentID)
END
GO
/****** Object:  StoredProcedure [dbo].[netContentAclDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentAclDelete]
(
	@Name NVARCHAR(255),
	@IsRole INT,
	@ContentID INT
)
AS
BEGIN
	SET NOCOUNT ON
	
	DELETE FROM tblContentAccess WHERE fkContentID=@ContentID AND Name=@Name AND IsRole=@IsRole
END
GO
/****** Object:  StoredProcedure [dbo].[netContentAclDeleteEntity]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentAclDeleteEntity]
(
	@Name NVARCHAR(255),
	@IsRole INT
)
AS
BEGIN
	SET NOCOUNT ON
	
	DELETE FROM tblContentAccess WHERE Name=@Name AND IsRole=@IsRole
END
GO
/****** Object:  StoredProcedure [dbo].[netContentAclList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentAclList]
(
	@ContentID INT
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		Name,
		IsRole, 
		AccessMask
	FROM 
		tblContentAccess
	WHERE 
		fkContentID=@ContentID
	ORDER BY
		IsRole DESC,
		Name
END
GO
/****** Object:  StoredProcedure [dbo].[netContentAclSetInherited]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentAclSetInherited]
(
	@ContentID INT,
	@Recursive INT
)
AS
BEGIN
	SET NOCOUNT ON
	
	IF (@Recursive = 1)
    BEGIN
        /* Remove all old ACEs for @ContentID and below */
        DELETE FROM 
           tblContentAccess
        WHERE 
            fkContentID IN (SELECT fkChildID FROM tblTree WHERE fkParentID=@ContentID) OR 
            fkContentID=@ContentID
        RETURN
    END
	ELSE
	BEGIN
		DELETE FROM tblContentAccess
		WHERE fkContentID = @ContentID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netContentChildrenReferences]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentChildrenReferences]
(
	@ParentID INT,
	@LanguageID NCHAR(17),
	@ChildOrderRule INT OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON
/*	
		/// <summary>
		/// Most recently created page will be first in list
		/// </summary>
		CreatedDescending		= 1,
		/// <summary>
		/// Oldest created page will be first in list
		/// </summary>
		CreatedAscending		= 2,
		/// <summary>
		/// Sorted alphabetical on name
		/// </summary>
		Alphabetical			= 3,
		/// <summary>
		/// Sorted on page index
		/// </summary>
		Index					= 4,
		/// <summary>
		/// Most recently changed page will be first in list
		/// </summary>
		ChangedDescending		= 5,
		/// <summary>
		/// Sort on ranking, only supported by special controls
		/// </summary>
		Rank					= 6,
		/// <summary>
		/// Oldest published page will be first in list
		/// </summary>
		PublishedAscending		= 7,
		/// <summary>
		/// Most recently published page will be first in list
		/// </summary>
		PublishedDescending		= 8
*/
	SELECT @ChildOrderRule = ChildOrderRule FROM tblContent WHERE pkID=@ParentID
		
	IF (@ChildOrderRule = 1)
	BEGIN
		SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
		FROM 
			tblContent
		INNER JOIN
			tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
		WHERE 
			fkParentID=@ParentID AND tblContent.fkMasterLanguageBranchID=tblContentLanguage.fkLanguageBranchID
		ORDER BY 
			Created DESC,ContentLinkID DESC
		RETURN @@ROWCOUNT
	END
	IF (@ChildOrderRule = 2)
	BEGIN
		SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
		FROM 
			tblContent
		INNER JOIN
			tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
		WHERE 
			fkParentID=@ParentID AND tblContent.fkMasterLanguageBranchID=tblContentLanguage.fkLanguageBranchID
		ORDER BY 
			Created ASC,ContentLinkID ASC
		RETURN @@ROWCOUNT
	END
	IF (@ChildOrderRule = 3)
	BEGIN
		-- Get language branch for listing since we want to sort on name
		DECLARE @LanguageBranchID INT
		SELECT 
			@LanguageBranchID = pkID 
		FROM 
			tblLanguageBranch 
		WHERE 
			LOWER(LanguageID)=LOWER(@LanguageID)
		-- If we did not find a valid language branch, go with master language branch from tblContent
		IF (@@ROWCOUNT < 1)
		BEGIN
			SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
			FROM 
				tblContent
			INNER JOIN
				tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
			WHERE 
				fkParentID=@ParentID AND tblContent.fkMasterLanguageBranchID=tblContentLanguage.fkLanguageBranchID
			ORDER BY 
				Name ASC
		    RETURN @@ROWCOUNT
		END
		SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
		FROM 
			tblContent AS P
		LEFT JOIN
			tblContentLanguage AS PL ON PL.fkContentID=P.pkID AND 
			PL.fkLanguageBranchID=@LanguageBranchID
		WHERE 
			P.fkParentID=@ParentID
		ORDER BY 
			PL.Name ASC
		RETURN @@ROWCOUNT
	END
	IF (@ChildOrderRule = 4)
	BEGIN
		SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
		FROM 
			tblContent
		WHERE 
			fkParentID=@ParentID
		ORDER BY 
			PeerOrder ASC
		RETURN @@ROWCOUNT
	END
	IF (@ChildOrderRule = 5)
	BEGIN
		SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
		FROM 
			tblContent
		INNER JOIN
			tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
		WHERE 
			fkParentID=@ParentID AND tblContent.fkMasterLanguageBranchID=tblContentLanguage.fkLanguageBranchID
		ORDER BY 
			Changed DESC
		RETURN @@ROWCOUNT
	END
	IF (@ChildOrderRule = 7)
	BEGIN
		SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
		FROM 
			tblContent
		INNER JOIN
			tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
		WHERE 
			fkParentID=@ParentID AND tblContent.fkMasterLanguageBranchID=tblContentLanguage.fkLanguageBranchID
		ORDER BY 
			StartPublish ASC
		RETURN @@ROWCOUNT
	END
	IF (@ChildOrderRule = 8)
	BEGIN
		SELECT
			pkID AS ContentLinkID, ContentType, fkContentTypeID as ContentTypeID, IsLeafNode
		FROM 
			tblContent
		INNER JOIN
			tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
		WHERE 
			fkParentID=@ParentID AND tblContent.fkMasterLanguageBranchID=tblContentLanguage.fkLanguageBranchID
		ORDER BY 
			StartPublish DESC
		RETURN @@ROWCOUNT
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netContentCreate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentCreate]
(
	@UserName NVARCHAR(255),
	@ParentID			INT,
	@ContentTypeID		INT,
	@ContentGUID		UNIQUEIDENTIFIER,
	@ContentType		INT,
	@WastebasketID		INT, 
	@ContentAssetsID	UNIQUEIDENTIFIER = NULL,
	@ContentOwnerID		UNIQUEIDENTIFIER = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @ContentID INT
	DECLARE @Delete		BIT
	
	/* Create materialized path to content */
	DECLARE @Path VARCHAR(7000)
	DECLARE @IsParentLeafNode BIT
	SELECT @Path = ContentPath + CONVERT(VARCHAR, @ParentID) + '.', @IsParentLeafNode = IsLeafNode FROM tblContent WHERE pkID=@ParentID
	IF @IsParentLeafNode = 1
		UPDATE tblContent SET IsLeafNode = 0 WHERE pkID=@ParentID
    
    SET @Delete = 0
    IF(@WastebasketID = @ParentID)
		SET @Delete=1
    ELSE IF (EXISTS (SELECT NestingLevel FROM tblTree WHERE fkParentID=@WastebasketID AND fkChildID=@ParentID))
        SET @Delete=1
    
	/* Create new content */
	INSERT INTO tblContent 
		(fkContentTypeID, CreatorName, fkParentID, ContentAssetsID, ContentOwnerID, ContentGUID, ContentPath, ContentType, Deleted)
	VALUES
		(@ContentTypeID, @UserName, @ParentID, @ContentAssetsID, @ContentOwnerID, @ContentGUID, @Path, @ContentType, @Delete)
	/* Remember pkID of content */
	SET @ContentID= SCOPE_IDENTITY() 
	 
	/* Update content tree with info about this content */
	INSERT INTO tblTree
		(fkParentID, fkChildID, NestingLevel)
	SELECT 
		fkParentID,
		@ContentID,
		NestingLevel+1
	FROM tblTree
	WHERE fkChildID=@ParentID
	UNION ALL
	SELECT
		@ParentID,
		@ContentID,
		1
	  
	RETURN @ContentID
END
GO
/****** Object:  StoredProcedure [dbo].[netContentCreateLanguage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentCreateLanguage]
(
	@ContentID			INT,
	@WorkContentID		INT,
	@UserName NVARCHAR(255),
	@MaxVersions	INT = NULL,
	@SavedDate		DATETIME,
	@LanguageBranch	NCHAR(17)
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @LangBranchID		INT
	DECLARE @NewVersionID		INT
	
	SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL
	BEGIN
		RAISERROR (N'netContentCreateLanguage: LanguageBranchID is null, possibly empty table tblLanguageBranch', 16, 1, @WorkContentID)
		RETURN 0
	END
	IF NOT EXISTS( SELECT * FROM tblContentLanguage WHERE fkContentID=@ContentID )
		UPDATE tblContent SET fkMasterLanguageBranchID=@LangBranchID WHERE pkID=@ContentID
	
	INSERT INTO tblContentLanguage(fkContentID, CreatorName, ChangedByName, Status, fkLanguageBranchID, Created, Changed, Saved)
	SELECT @ContentID, @UserName, @UserName, 2, @LangBranchID, @SavedDate, @SavedDate, @SavedDate 
	FROM tblContent
	INNER JOIN tblContentType ON tblContentType.pkID=tblContent.fkContentTypeID
	WHERE tblContent.pkID=@ContentID
			
	INSERT INTO tblWorkContent
		(fkContentID,
		ChangedByName,
		ContentLinkGUID,
		fkFrameID,
		ArchiveContentGUID,
		Name,
		LinkURL,
		ExternalURL,
		VisibleInMenu,
		LinkType,
		Created,
		Saved,
		StartPublish,
		StopPublish,
		ChildOrderRule,
		PeerOrder,
		fkLanguageBranchID,
		CommonDraft)
	SELECT 
		@ContentID,
		COALESCE(@UserName, tblContentLanguage.CreatorName),
		tblContentLanguage.ContentLinkGUID,
		tblContentLanguage.fkFrameID,
		tblContent.ArchiveContentGUID,
		tblContentLanguage.Name,
		tblContentLanguage.LinkURL,
		tblContentLanguage.ExternalURL,
		tblContent.VisibleInMenu,
		CASE tblContentLanguage.AutomaticLink 
			WHEN 1 THEN 
				(CASE
					WHEN tblContentLanguage.ContentLinkGUID IS NULL THEN 0	/* EPnLinkNormal */
					WHEN tblContentLanguage.FetchData=1 THEN 4				/* EPnLinkFetchdata */
					ELSE 1												/* EPnLinkShortcut */
				END)
			ELSE
				(CASE 
					WHEN tblContentLanguage.LinkURL=N'#' THEN 3			/* EPnLinkInactive */
					ELSE 2												/* EPnLinkExternal */
				END)
		END AS LinkType ,
		tblContentLanguage.Created,
		@SavedDate,
		tblContentLanguage.StartPublish,
		tblContentLanguage.StopPublish,
		tblContent.ChildOrderRule,
		tblContent.PeerOrder,
		@LangBranchID,
		0
	FROM tblContentLanguage
	INNER JOIN tblContent ON tblContent.pkID=tblContentLanguage.fkContentID
	WHERE 
		tblContentLanguage.fkContentID=@ContentID AND tblContentLanguage.fkLanguageBranchID=@LangBranchID
		
	SET @NewVersionID = SCOPE_IDENTITY()	
	
	UPDATE tblContentLanguage SET Version = @NewVersionID
	WHERE fkContentID = @ContentID AND fkLanguageBranchID = @LangBranchID
		
	RETURN  @NewVersionID 
END
GO
/****** Object:  StoredProcedure [dbo].[netContentDataLoad]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentDataLoad]
(
	@ContentID	INT, 
	@LanguageBranchID INT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ContentTypeID INT
	DECLARE @MasterLanguageID INT
	SELECT @ContentTypeID = tblContent.fkContentTypeID FROM tblContent
		WHERE tblContent.pkID=@ContentID
	/*This procedure should always return a page (if exist), preferable in requested language else in master language*/
	IF (@LanguageBranchID = -1 OR NOT EXISTS (SELECT Name FROM tblContentLanguage WHERE fkContentID=@ContentID AND fkLanguageBranchID = @LanguageBranchID))
		SELECT @LanguageBranchID = fkMasterLanguageBranchID  FROM tblContent
			WHERE tblContent.pkID=@ContentID
	SELECT @MasterLanguageID = fkMasterLanguageBranchID FROM tblContent WHERE tblContent.pkID=@ContentID
	/* Get data for page */
	SELECT
		tblContent.pkID AS PageLinkID,
		NULL AS PageLinkWorkID,
		fkParentID  AS PageParentLinkID,
		fkContentTypeID AS PageTypeID,
		NULL AS PageTypeName,
		CONVERT(INT,VisibleInMenu) AS PageVisibleInMenu,
		ChildOrderRule AS PageChildOrderRule,
		PeerOrder AS PagePeerOrder,
		CONVERT(NVARCHAR(38),tblContent.ContentGUID) AS PageGUID,
		ArchiveContentGUID AS PageArchiveLinkID,
		ContentAssetsID,
		ContentOwnerID,
		CONVERT(INT,Deleted) AS PageDeleted,
		DeletedBy AS PageDeletedBy,
		DeletedDate AS PageDeletedDate,
		(SELECT ChildOrderRule FROM tblContent AS ParentPage WHERE ParentPage.pkID=tblContent.fkParentID) AS PagePeerOrderRule,
		fkMasterLanguageBranchID AS PageMasterLanguageBranchID,
		CreatorName
	FROM tblContent
	WHERE tblContent.pkID=@ContentID
	IF (@@ROWCOUNT = 0)
		RETURN 0
		
	/* Get data for page languages */
	SELECT
		L.fkContentID AS PageID,
		CASE L.AutomaticLink
			WHEN 1 THEN
				(CASE
					WHEN L.ContentLinkGUID IS NULL THEN 0	/* EPnLinkNormal */
					WHEN L.FetchData=1 THEN 4				/* EPnLinkFetchdata */
					ELSE 1								/* EPnLinkShortcut */
				END)
			ELSE
				(CASE
					WHEN L.LinkURL=N'#' THEN 3				/* EPnLinkInactive */
					ELSE 2								/* EPnLinkExternal */
				END)
		END AS PageShortcutType,
		L.ExternalURL AS PageExternalURL,
		L.ContentLinkGUID AS PageShortcutLinkID,
		L.Name AS PageName,
		L.URLSegment AS PageURLSegment,
		L.LinkURL AS PageLinkURL,
		L.BlobUri,
		L.ThumbnailUri,
		L.Created AS PageCreated,
		L.Changed AS PageChanged,
		L.Saved AS PageSaved,
		L.StartPublish AS PageStartPublish,
		L.StopPublish AS PageStopPublish,
		CASE WHEN L.Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PagePendingPublish,
		L.CreatorName AS PageCreatedBy,
		L.ChangedByName AS PageChangedBy,
		-- RTRIM(tblContentLanguage.fkLanguageID) AS PageLanguageID,
		L.fkFrameID AS PageTargetFrame,
		0 AS PageChangedOnPublish,
		0 AS PageDelayedPublish,
		L.fkLanguageBranchID AS PageLanguageBranchID,
		L.Status as PageWorkStatus,
		L.DelayPublishUntil AS PageDelayPublishUntil
	FROM tblContentLanguage AS L
	WHERE L.fkContentID=@ContentID
		AND L.fkLanguageBranchID=@LanguageBranchID
	
	/* Get the property data for the requested language */
	SELECT
		tblPageDefinition.Name AS PropertyName,
		tblPageDefinition.pkID as PropertyDefinitionID,
		ScopeName,
		CONVERT(INT, Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		PageType,
		PageLink AS ContentLink,
		LinkGuid,
		Date AS DateValue,
		String,
		LongString,
		tblProperty.fkLanguageBranchID AS LanguageBranchID
	FROM tblProperty
	INNER JOIN tblPageDefinition ON tblPageDefinition.pkID = tblProperty.fkPageDefinitionID
	WHERE tblProperty.fkPageID=@ContentID AND NOT tblPageDefinition.fkPageTypeID IS NULL
		AND (tblProperty.fkLanguageBranchID = @LanguageBranchID 
		OR (tblProperty.fkLanguageBranchID = @MasterLanguageID AND tblPageDefinition.LanguageSpecific < 3))
	/*Get category information*/
	SELECT fkPageID AS PageID,fkCategoryID,CategoryType
	FROM tblCategoryPage
	WHERE fkPageID=@ContentID AND CategoryType=0
	ORDER BY fkCategoryID
	/* Get access information */
	SELECT
		fkContentID AS PageID,
		Name,
		IsRole,
		AccessMask
	FROM
		tblContentAccess
	WHERE 
	    fkContentID=@ContentID
	ORDER BY
	    IsRole DESC,
		Name
	/* Get all languages for the page */
	SELECT fkLanguageBranchID as PageLanguageBranchID FROM tblContentLanguage
		WHERE tblContentLanguage.fkContentID=@ContentID
		
RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netContentDeleteLanguage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentDeleteLanguage]
(
	@ContentID		INT,
	@LanguageBranch	NCHAR(17)
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @LangBranchID		INT
		
	SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL
	BEGIN
		--Unknown language
		RETURN -1
	END
	IF EXISTS( SELECT * FROM tblPage WHERE pkID=@ContentID AND fkMasterLanguageBranchID=@LangBranchID )
	BEGIN
		--Cannot delete master language branch
		RETURN -2
	END
	IF NOT EXISTS( SELECT * FROM tblPageLanguage WHERE fkPageID=@ContentID AND fkLanguageBranchID=@LangBranchID )
	BEGIN
		--Language does not exist on content instance
		RETURN -3
	END
	UPDATE tblWorkContent SET fkMasterVersionID=NULL WHERE pkID IN (SELECT pkID FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID)
    
	DELETE FROM tblWorkContentProperty WHERE fkWorkContentID IN (SELECT pkID FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID)
	DELETE FROM tblWorkContentCategory WHERE fkWorkContentID IN (SELECT pkID FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID)
	DELETE FROM tblContentLanguage WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID
	DELETE FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID
	DELETE FROM tblContentSoftlink WHERE fkOwnerContentID =  @ContentID AND OwnerLanguageID = @LangBranchID
	DELETE FROM tblContentProperty FROM tblContentProperty
	INNER JOIN tblPropertyDefinition ON tblPropertyDefinition.pkID=tblContentProperty.fkPropertyDefinitionID
	WHERE fkContentID=@ContentID 
	AND fkLanguageBranchID=@LangBranchID
	AND fkContentTypeID IS NOT NULL
	
	DELETE FROM tblContentCategory WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID
		
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[netContentEnsureVersions]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentEnsureVersions]
(
	@ContentID			INT
)
AS
BEGIN
	DECLARE @LangBranchID INT
	DECLARE @LanguageBranch NCHAR(17)
	DECLARE @NewWorkContentID INT
	DECLARE @UserName NVARCHAR(255)
	CREATE TABLE #ContentLangsWithoutVersion
		(fkLanguageBranchID INT)
	/* Get a list of page languages that do not have an entry in tblWorkContent for the given page */
	INSERT INTO #ContentLangsWithoutVersion
		(fkLanguageBranchID)
	SELECT 
		tblContentLanguage.fkLanguageBranchID
	FROM 
		tblContentLanguage
	WHERE	
		fkContentID=@ContentID AND
		NOT EXISTS(
			SELECT * 
			FROM 
				tblWorkContent 
			WHERE 
				tblWorkContent.fkContentID=tblContentLanguage.fkContentID AND 
				tblWorkContent.fkLanguageBranchID=tblContentLanguage.fkLanguageBranchID)
	/* Get the first language to create a page version for */
	SELECT 
		@LangBranchID=Min(fkLanguageBranchID) 
	FROM 
		#ContentLangsWithoutVersion
	WHILE NOT @LangBranchID IS NULL
	BEGIN
		/* Get language name and user name to set for page version that we are about to create */
		SELECT 
			@LanguageBranch=LanguageID 
		FROM 
			tblLanguageBranch 
		WHERE 
			pkID=@LangBranchID
		SELECT 
			@UserName=ChangedByName 
		FROM 
			tblContentLanguage 
		WHERE 
			fkContentID=@ContentID AND 
			fkLanguageBranchID=@LangBranchID
		/* Create a new page version for the given page and language */
		EXEC @NewWorkContentID = editCreateContentVersion 
			@ContentID=@ContentID, 
			@WorkContentID=NULL, 
			@UserName=@UserName,
			@LanguageBranch=@LanguageBranch
		/* TODO - check if we should mark page version as published... */
		UPDATE 
			tblWorkContent 
		SET 
			Status = 5
		WHERE 
			pkID=@NewWorkContentID
		UPDATE 
			tblContentLanguage 
		SET 
			[Version]=@NewWorkContentID 
		WHERE 
			fkContentID=@ContentID AND 
			fkLanguageBranchID=@LangBranchID
		/* Get next language for the loop */
		SELECT 
			@LangBranchID=Min(fkLanguageBranchID) 
		FROM 
			#ContentLangsWithoutVersion 
		WHERE 
			fkLanguageBranchID > @LangBranchID
	END
	DROP TABLE #ContentLangsWithoutVersion
END
GO
/****** Object:  StoredProcedure [dbo].[netContentListBlobUri]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentListBlobUri] 
@ContentID INT
AS
BEGIN
	SET NOCOUNT ON
	SELECT tblContentLanguage.BlobUri
	FROM tblContentLanguage
	WHERE fkContentID=@ContentID AND NOT BlobUri IS NULL
		
	SELECT tblContentLanguage.BlobUri
	FROM tblContentLanguage
	INNER JOIN tblTree ON tblTree.fkChildID=tblContentLanguage.fkContentID
	WHERE tblTree.fkParentID=@ContentID AND NOT BlobUri IS NULL		
END
GO
/****** Object:  StoredProcedure [dbo].[netContentListOwnedAssetFolders]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentListOwnedAssetFolders] 
	@ContentIDs AS GuidParameterTable READONLY
AS
BEGIN
	SET NOCOUNT ON
	SELECT tblContent.pkID as ContentId
	FROM tblContent INNER JOIN @ContentIDs as ParamIds on tblContent.ContentOwnerID = ParamIds.Id		
END
GO
/****** Object:  StoredProcedure [dbo].[netContentListPaged]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentListPaged]
(
	@Binary VARBINARY(8000),
	@Threshold INT = 0,
	@LanguageBranchID INT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ContentItems TABLE (LocalPageID INT, LocalLanguageID INT)
	DECLARE	@Length SMALLINT
	DECLARE @Index SMALLINT
	SET @Index = 1
	SET @Length = DATALENGTH(@Binary)
	WHILE (@Index <= @Length)
	BEGIN
		INSERT INTO @ContentItems(LocalPageID) VALUES(SUBSTRING(@Binary, @Index, 4))
		SET @Index = @Index + 4
	END
	/* We need to know which languages exist */
	UPDATE @ContentItems SET 
		LocalLanguageID = CASE WHEN fkLanguageBranchID IS NULL THEN fkMasterLanguageBranchID ELSE fkLanguageBranchID END
	FROM @ContentItems AS P
	INNER JOIN tblContent ON tblContent.pkID = P.LocalPageID
	LEFT JOIN tblContentLanguage ON P.LocalPageID = tblContentLanguage.fkContentID AND tblContentLanguage.fkLanguageBranchID = @LanguageBranchID
	/* Get all languages for all items*/
	SELECT tblContentLanguage.fkContentID as PageLinkID, tblContent.fkContentTypeID as PageTypeID, tblContentLanguage.fkLanguageBranchID as PageLanguageBranchID 
	FROM tblContentLanguage
	INNER JOIN @ContentItems on LocalPageID=tblContentLanguage.fkContentID
	INNER JOIN tblContent ON tblContent.pkID = tblContentLanguage.fkContentID
	ORDER BY tblContentLanguage.fkContentID
	/* Get all language versions that is requested (including master) */
	SELECT
		L.Status AS PageWorkStatus,
		L.fkContentID AS PageLinkID,
		NULL AS PageLinkWorkID,
		CASE AutomaticLink
			WHEN 1 THEN
				(CASE
					WHEN L.ContentLinkGUID IS NULL THEN 0	/* EPnLinkNormal */
					WHEN L.FetchData=1 THEN 4				/* EPnLinkFetchdata */
					ELSE 1								/* EPnLinkShortcut */
				END)
			ELSE
				(CASE
					WHEN L.LinkURL=N'#' THEN 3				/* EPnLinkInactive */
					ELSE 2								/* EPnLinkExternal */
				END)
		END AS PageShortcutType,
		L.ExternalURL AS PageExternalURL,
		L.ContentLinkGUID AS PageShortcutLinkID,
		L.Name AS PageName,
		L.URLSegment AS PageURLSegment,
		L.LinkURL AS PageLinkURL,
		L.BlobUri,
		L.ThumbnailUri,
		L.Created AS PageCreated,
		L.Changed AS PageChanged,
		L.Saved AS PageSaved,
		L.StartPublish AS PageStartPublish,
		L.StopPublish AS PageStopPublish,
		CASE WHEN L.Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PagePendingPublish,
		L.CreatorName AS PageCreatedBy,
		L.ChangedByName AS PageChangedBy,
		L.fkFrameID AS PageTargetFrame,
		0 AS PageChangedOnPublish,
		0 AS PageDelayedPublish,
		L.fkLanguageBranchID AS PageLanguageBranchID,
		L.DelayPublishUntil AS PageDelayPublishUntil
	FROM @ContentItems AS P
	INNER JOIN tblContentLanguage AS L ON LocalPageID=L.fkContentID
	WHERE L.fkLanguageBranchID = P.LocalLanguageID
	ORDER BY L.fkContentID
	IF (@@ROWCOUNT = 0)
	BEGIN
		RETURN
	END
		
/* Get data for page */
	SELECT
		LocalPageID AS PageLinkID,
		NULL AS PageLinkWorkID,
		fkParentID  AS PageParentLinkID,
		fkContentTypeID AS PageTypeID,
		NULL AS PageTypeName,
		CONVERT(INT,VisibleInMenu) AS PageVisibleInMenu,
		ChildOrderRule AS PageChildOrderRule,
		0 AS PagePeerOrderRule,	-- No longer used
		PeerOrder AS PagePeerOrder,
		CONVERT(NVARCHAR(38),tblContent.ContentGUID) AS PageGUID,
		ArchiveContentGUID AS PageArchiveLinkID,
		ContentAssetsID,
		ContentOwnerID,
		CONVERT(INT,Deleted) AS PageDeleted,
		DeletedBy AS PageDeletedBy,
		DeletedDate AS PageDeletedDate,
		fkMasterLanguageBranchID AS PageMasterLanguageBranchID,
		CreatorName
	FROM @ContentItems
	INNER JOIN tblContent ON LocalPageID=tblContent.pkID
	ORDER BY tblContent.pkID
	IF (@@ROWCOUNT = 0)
	BEGIN
		RETURN
	END
	
	/* Get the properties */
	/* NOTE! The CASE:s for LongString and Guid uses the precomputed LongStringLength to avoid 
	referencing LongString which may slow down the query */
	SELECT
		tblContentProperty.fkContentID AS PageLinkID,
		NULL AS PageLinkWorkID,
		tblPropertyDefinition.Name AS PropertyName,
		tblPropertyDefinition.pkID as PropertyDefinitionID,
		ScopeName,
		CONVERT(INT, Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		tblContentProperty.ContentType AS PageType,
		ContentLink,
		LinkGuid,	
		Date AS DateValue,
		String,
		(CASE 
			WHEN (@Threshold = 0) OR (COALESCE(LongStringLength, 2147483647) < @Threshold) THEN
				LongString
			ELSE
				NULL
		END) AS LongString,
		tblContentProperty.fkLanguageBranchID AS PageLanguageBranchID,
		(CASE 
			WHEN (@Threshold = 0) OR (COALESCE(LongStringLength, 2147483647) < @Threshold) THEN
				NULL
			ELSE
				guid
		END) AS Guid
	FROM @ContentItems AS P
	INNER JOIN tblContent ON tblContent.pkID=P.LocalPageID
	INNER JOIN tblContentProperty WITH (NOLOCK) ON tblContent.pkID=tblContentProperty.fkContentID --The join with tblContent ensures data integrity
	INNER JOIN tblPropertyDefinition ON tblPropertyDefinition.pkID=tblContentProperty.fkPropertyDefinitionID
	WHERE NOT tblPropertyDefinition.fkContentTypeID IS NULL AND
		(tblContentProperty.fkLanguageBranchID = P.LocalLanguageID
	OR
		tblPropertyDefinition.LanguageSpecific<3)
	ORDER BY tblContent.pkID
	/*Get category information*/
	SELECT 
		fkContentID AS PageLinkID,
		NULL AS PageLinkWorkID,
		fkCategoryID,
		CategoryType
	FROM tblContentCategory
	INNER JOIN @ContentItems ON LocalPageID=tblContentCategory.fkContentID
	WHERE CategoryType=0
	ORDER BY fkContentID,fkCategoryID
	/* Get access information */
	SELECT
		fkContentID AS PageLinkID,
		NULL AS PageLinkWorkID,
		tblContentAccess.Name,
		IsRole,
		AccessMask
	FROM
		@ContentItems
	INNER JOIN 
	    tblContentAccess ON LocalPageID=tblContentAccess.fkContentID
	ORDER BY
		fkContentID
END
GO
/****** Object:  StoredProcedure [dbo].[netContentListVersionsPaged]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentListVersionsPaged]
(
	@Binary VARBINARY(8000),
	@Threshold INT = 0
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ContentVersions TABLE (VersionID INT, ContentID INT, MasterVersionID INT, LanguageBranchID INT, ContentTypeID INT)
	DECLARE @WorkId INT;
	DECLARE	@Length SMALLINT
	DECLARE @Index SMALLINT
	SET @Index = 1
	SET @Length = DATALENGTH(@Binary)
	WHILE (@Index <= @Length)
	BEGIN
		SET @WorkId = SUBSTRING(@Binary, @Index, 4)
		INSERT INTO @ContentVersions VALUES(@WorkId, NULL, NULL, NULL, NULL)
		SET @Index = @Index + 4
	END
	/* Add some meta data to temp table*/
	UPDATE @ContentVersions SET ContentID = tblContent.pkID, MasterVersionID = tblContentLanguage.Version, LanguageBranchID = tblWorkContent.fkLanguageBranchID, ContentTypeID = tblContent.fkContentTypeID
	FROM tblWorkContent INNER JOIN tblContent on tblWorkContent.fkContentID = tblContent.pkID
	INNER JOIN tblContentLanguage ON tblContentLanguage.fkContentID = tblContent.pkID
	WHERE tblWorkContent.pkID = VersionID AND tblWorkContent.fkLanguageBranchID = tblContentLanguage.fkLanguageBranchID
	/*Add master language version to support loading non localized props*/
	INSERT INTO @ContentVersions (ContentID, MasterVersionID, LanguageBranchID, ContentTypeID)
	SELECT DISTINCT tblContent.pkID, tblContentLanguage.Version, tblContentLanguage.fkLanguageBranchID, tblContent.fkContentTypeID 
	FROM @ContentVersions AS CV INNER JOIN tblContent ON CV.ContentID = tblContent.pkID
	INNER JOIN tblContentLanguage ON tblContent.pkID = tblContentLanguage.fkContentID
	WHERE tblContent.fkMasterLanguageBranchID = tblContentLanguage.fkLanguageBranchID
	/* Get all languages for all items*/
	SELECT DISTINCT ContentID AS PageLinkID, ContentTypeID as PageTypeID, tblContentLanguage.fkLanguageBranchID as PageLanguageBranchID 
	FROM @ContentVersions AS CV INNER JOIN tblContentLanguage ON CV.ContentID = tblContentLanguage.fkContentID
	WHERE CV.VersionID IS NOT NULL
	ORDER BY ContentID
	/* Get data for languages */
	SELECT
		W.Status AS PageWorkStatus,
		W.fkContentID AS PageLinkID,
		W.pkID AS PageLinkWorkID,
		W.LinkType AS PageShortcutType,
		W.ExternalURL AS PageExternalURL,
		W.ContentLinkGUID AS PageShortcutLinkID,
		W.Name AS PageName,
		W.URLSegment AS PageURLSegment,
		W.LinkURL AS PageLinkURL,
		W.BlobUri,
		W.ThumbnailUri,
		W.Created AS PageCreated,
		L.Changed AS PageChanged,
		W.Saved AS PageSaved,
		W.StartPublish AS PageStartPublish,
		W.StopPublish AS PageStopPublish,
		CASE WHEN L.Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PagePendingPublish,
		L.CreatorName AS PageCreatedBy,
		W.ChangedByName AS PageChangedBy,
		W.fkFrameID AS PageTargetFrame,
		W.ChangedOnPublish AS PageChangedOnPublish,
		CASE WHEN W.Status = 6 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END AS  PageDelayedPublish,
		W.fkLanguageBranchID AS PageLanguageBranchID,
		W.DelayPublishUntil AS PageDelayPublishUntil
	FROM @ContentVersions AS CV
	INNER JOIN tblWorkContent AS W ON CV.VersionID = W.pkID 
	INNER JOIN tblContentLanguage AS L ON CV.ContentID = L.fkContentID
	WHERE 
		L.fkLanguageBranchID = W.fkLanguageBranchID
	ORDER BY L.fkContentID
	IF (@@ROWCOUNT = 0)
	BEGIN
		RETURN
	END
	/* Get common data for all versions of a content */
	SELECT
		CV.ContentID AS PageLinkID,
		CV.VersionID AS PageLinkWorkID,
		fkParentID  AS PageParentLinkID,
		fkContentTypeID AS PageTypeID,
		NULL AS PageTypeName,
		CONVERT(INT,VisibleInMenu) AS PageVisibleInMenu,
		ChildOrderRule AS PageChildOrderRule,
		0 AS PagePeerOrderRule,	-- No longer used
		PeerOrder AS PagePeerOrder,
		CONVERT(NVARCHAR(38),tblContent.ContentGUID) AS PageGUID,
		ArchiveContentGUID AS PageArchiveLinkID,
		ContentAssetsID,
		ContentOwnerID,
		CONVERT(INT,Deleted) AS PageDeleted,
		DeletedBy AS PageDeletedBy,
		DeletedDate AS PageDeletedDate,
		fkMasterLanguageBranchID AS PageMasterLanguageBranchID,
		CreatorName
	FROM @ContentVersions AS CV
	INNER JOIN tblContent ON CV.ContentID = tblContent.pkID
	WHERE CV.VersionID IS NOT NULL
	ORDER BY CV.ContentID
	IF (@@ROWCOUNT = 0)
	BEGIN
		RETURN
	END
		
	
	/* Get the properties for the specific versions*/
	SELECT
		CV.ContentID AS PageLinkID,
		CV.VersionID AS PageLinkWorkID,
		tblPropertyDefinition.Name AS PropertyName,
		tblPropertyDefinition.pkID as PropertyDefinitionID,
		ScopeName,
		CONVERT(INT, Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		P.ContentType AS PageType,
		ContentLink,
		LinkGuid,	
		Date AS DateValue,
		String,
		LongString,
		CV.LanguageBranchID AS PageLanguageBranchID
	FROM tblWorkContentProperty AS P 
	INNER JOIN @ContentVersions AS CV ON P.fkWorkContentID = CV.VersionID 
	INNER JOIN tblPropertyDefinition ON tblPropertyDefinition.pkID = P.fkPropertyDefinitionID
	WHERE NOT tblPropertyDefinition.fkContentTypeID IS NULL
	ORDER BY CV.ContentID
	/* Get the non language specific properties from master language*/
	SELECT
		CV.ContentID AS PageLinkID,
		CV.VersionID AS PageLinkWorkID,
		tblPropertyDefinition.Name AS PropertyName,
		tblPropertyDefinition.pkID as PropertyDefinitionID,
		ScopeName,
		CONVERT(INT, Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		P.ContentType AS PageType,
		ContentLink,
		LinkGuid,	
		Date AS DateValue,
		String,
		LongString,
		CV.LanguageBranchID AS PageLanguageBranchID
	FROM tblWorkContentProperty AS P
	INNER JOIN tblWorkContent AS W ON P.fkWorkContentID = W.pkID
	INNER JOIN @ContentVersions AS CV ON W.fkContentID = CV.ContentID
	INNER JOIN tblPropertyDefinition ON tblPropertyDefinition.pkID = P.fkPropertyDefinitionID
	WHERE NOT tblPropertyDefinition.fkContentTypeID IS NULL AND
		P.fkWorkContentID = CV.MasterVersionID AND tblPropertyDefinition.LanguageSpecific<3
	ORDER BY CV.ContentID
	/*Get category information*/
	SELECT DISTINCT
		CV.ContentID AS PageLinkID,
		CV.VersionID AS PageLinkWorkID,
		fkCategoryID,
		CategoryType
	FROM tblWorkContentCategory
	INNER JOIN tblWorkContent ON tblWorkContentCategory.fkWorkContentID = tblWorkContent.pkID
	INNER JOIN @ContentVersions AS CV ON CV.ContentID = tblWorkContent.fkContentID 
	INNER JOIN @ContentVersions AS MasterVersion ON CV.ContentID = MasterVersion.ContentID
	WHERE CategoryType=0 AND (CV.VersionID = tblWorkContent.pkID OR
	(MasterVersion.VersionID IS NULL AND tblWorkContentCategory.fkWorkContentID = MasterVersion.MasterVersionID 
		AND MasterVersion.LanguageBranchID <> CV.LanguageBranchID))
	ORDER BY CV.ContentID,fkCategoryID
	/* Get access information */
	SELECT
		CV.ContentID AS PageLinkID,
		CV.VersionID AS PageLinkWorkID,
		tblContentAccess.Name,
		IsRole,
		AccessMask
	FROM
		@ContentVersions as CV
	INNER JOIN 
	    tblContentAccess ON ContentID=tblContentAccess.fkContentID
	ORDER BY
		fkContentID
END
GO
/****** Object:  StoredProcedure [dbo].[netContentLoadLongString]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentLoadLongString]
(
	@LongStringGuid	UNIQUEIDENTIFIER
)
AS
BEGIN
	SELECT LongString FROM tblContentProperty WHERE [guid]=@LongStringGuid
	IF @@ROWCOUNT = 0
	BEGIN
		SELECT LongString FROM tblWorkContentProperty WHERE [guid]=@LongStringGuid
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netContentLoadVersion]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentLoadVersion]
(
	@ContentID	INT,
	@WorkID INT,
	@LangBranchID INT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @CommonPropsWorkID INT
	DECLARE @IsMasterLanguage BIT
    DECLARE @ContentTypeID INT
	IF @WorkID IS NULL
	BEGIN
		IF @LangBranchID IS NULL OR NOT EXISTS(SELECT * FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID)
			SELECT @LangBranchID=COALESCE(fkMasterLanguageBranchID,1) FROM tblContent WHERE pkID=@ContentID
		SELECT @WorkID=[Version] FROM tblContentLanguage WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID AND Status = 4
		IF (@WorkID IS NULL OR @WorkID=0)
		BEGIN
			SELECT TOP 1 @WorkID=pkID FROM tblWorkContent WHERE fkContentID=@ContentID AND fkLanguageBranchID=@LangBranchID ORDER BY Saved, pkID DESC
		END
		
		IF (@WorkID IS NULL OR @WorkID=0)
		BEGIN
			EXEC netContentDataLoad @ContentID=@ContentID, @LanguageBranchID=@LangBranchID
			RETURN 0
		END		
	END
	
	/*Get the page type for the requested page*/
	SELECT @ContentTypeID = tblContent.fkContentTypeID FROM tblContent
		WHERE tblContent.pkID=@ContentID
	/* Get Language branch from page version*/
	SELECT @LangBranchID=fkLanguageBranchID FROM tblWorkContent WHERE pkID=@WorkID
	SELECT @IsMasterLanguage = CASE WHEN EXISTS(SELECT * FROM tblContent WHERE pkID=@ContentID AND fkMasterLanguageBranchID=@LangBranchID) THEN  1 ELSE 0 END
	IF (@IsMasterLanguage = 0)
	BEGIN
		SELECT @CommonPropsWorkID=tblContentLanguage.[Version] 
			FROM tblContentLanguage 
			INNER JOIN tblContent ON tblContent.pkID=tblContentLanguage.fkContentID
			WHERE tblContent.pkID=@ContentID AND tblContentLanguage.fkLanguageBranchID=tblContent.fkMasterLanguageBranchID
			
		/* Get data for page for non-master language*/
		SELECT
			tblContent.pkID AS PageLinkID,
			tblWorkContent.pkID AS PageLinkWorkID,
			fkParentID  AS PageParentLinkID,
			fkContentTypeID AS PageTypeID,
			NULL AS PageTypeName,
			CONVERT(INT,tblContent.VisibleInMenu) AS PageVisibleInMenu,
			tblContent.ChildOrderRule AS PageChildOrderRule,
			tblContent.PeerOrder AS PagePeerOrder,
			CONVERT(NVARCHAR(38),tblContent.ContentGUID) AS PageGUID,
			tblContent.ArchiveContentGUID AS PageArchiveLinkID,
			ContentAssetsID,
			ContentOwnerID,
			CONVERT(INT,Deleted) AS PageDeleted,
			DeletedBy AS PageDeletedBy,
			DeletedDate AS PageDeletedDate,
			(SELECT ChildOrderRule FROM tblContent AS ParentPage WHERE ParentPage.pkID=tblContent.fkParentID) AS PagePeerOrderRule,
			fkMasterLanguageBranchID AS PageMasterLanguageBranchID,
			CreatorName
		FROM
			tblWorkContent
		INNER JOIN
			tblContent
		ON
			tblContent.pkID = tblWorkContent.fkContentID
		WHERE
			tblContent.pkID = @ContentID
		AND
			tblWorkContent.pkID = @WorkID	
	END
	ELSE
	BEGIN
		/* Get data for page for master language*/
		SELECT
			tblContent.pkID AS PageLinkID,
			tblWorkContent.pkID AS PageLinkWorkID,
			fkParentID  AS PageParentLinkID,
			fkContentTypeID AS PageTypeID,
			NULL AS PageTypeName,
			CONVERT(INT,tblWorkContent.VisibleInMenu) AS PageVisibleInMenu,
			tblWorkContent.ChildOrderRule AS PageChildOrderRule,
			tblWorkContent.PeerOrder AS PagePeerOrder,
			CONVERT(NVARCHAR(38),tblContent.ContentGUID) AS PageGUID,
			tblWorkContent.ArchiveContentGUID AS PageArchiveLinkID,
			ContentAssetsID,
			ContentOwnerID,
			CONVERT(INT,Deleted) AS PageDeleted,
			DeletedBy AS PageDeletedBy,
			DeletedDate AS PageDeletedDate,
			(SELECT ChildOrderRule FROM tblContent AS ParentPage WHERE ParentPage.pkID=tblContent.fkParentID) AS PagePeerOrderRule,
			fkMasterLanguageBranchID AS PageMasterLanguageBranchID,
			tblContent.CreatorName
		FROM tblWorkContent
		INNER JOIN tblContent ON tblContent.pkID=tblWorkContent.fkContentID
		WHERE tblContent.pkID=@ContentID AND tblWorkContent.pkID=@WorkID
	END
	IF (@@ROWCOUNT = 0)
		RETURN 0
		
	/* Get data for page languages */
	SELECT
		W.Status as PageWorkStatus,
		W.fkContentID AS PageID,
		W.LinkType AS PageShortcutType,
		W.ExternalURL AS PageExternalURL,
		W.ContentLinkGUID AS PageShortcutLinkID,
		W.Name AS PageName,
		W.URLSegment AS PageURLSegment,
		W.LinkURL AS PageLinkURL,
		W.BlobUri,
		W.ThumbnailUri,
		W.Created AS PageCreated,
		tblContentLanguage.Changed AS PageChanged,
		W.Saved AS PageSaved,
		W.StartPublish AS PageStartPublish,
		W.StopPublish AS PageStopPublish,
		CASE WHEN tblContentLanguage.Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PagePendingPublish,
		tblContentLanguage.CreatorName AS PageCreatedBy,
		W.ChangedByName AS PageChangedBy,
		-- RTRIM(W.fkLanguageID) AS PageLanguageID,
		W.fkFrameID AS PageTargetFrame,
		W.ChangedOnPublish AS PageChangedOnPublish,
		CASE WHEN W.Status = 6 THEN 1 ELSE 0 END AS PageDelayedPublish,
		W.fkLanguageBranchID AS PageLanguageBranchID,
		W.DelayPublishUntil AS PageDelayPublishUntil
	FROM tblWorkContent AS W
	INNER JOIN tblContentLanguage ON tblContentLanguage.fkContentID=W.fkContentID
	WHERE tblContentLanguage.fkLanguageBranchID=W.fkLanguageBranchID
		AND W.pkID=@WorkID
	
	/* Get the property data */
	SELECT
		tblPageDefinition.Name AS PropertyName,
		tblPageDefinition.pkID as PropertyDefinitionID,
		ScopeName,
		CONVERT(INT, Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		PageType,
		PageLink AS ContentLink,
		LinkGuid,
		Date AS DateValue,
		String,
		LongString,
		tblWorkContent.fkLanguageBranchID AS LanguageBranchID
	FROM tblWorkProperty
	INNER JOIN tblWorkContent ON tblWorkContent.pkID=tblWorkProperty.fkWorkPageID
	INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblWorkProperty.fkPageDefinitionID
	WHERE (tblWorkProperty.fkWorkPageID=@WorkID OR (tblWorkProperty.fkWorkPageID=@CommonPropsWorkID AND tblPageDefinition.LanguageSpecific<3 AND @IsMasterLanguage=0))
		   AND NOT tblPageDefinition.fkPageTypeID IS NULL
	/*Get built in category information*/
	SELECT
		fkContentID
	AS
		PageID,
		fkCategoryID,
		CategoryType,
		NULL
	FROM
		tblWorkCategory
	INNER JOIN
		tblWorkContent
	ON
		tblWorkContent.pkID = tblWorkCategory.fkWorkPageID
	WHERE
	(
		(@IsMasterLanguage = 0 AND fkWorkPageID = @CommonPropsWorkID)
		OR
		(@IsMasterLanguage = 1 AND fkWorkPageID = @WorkID)
	)
	AND
		CategoryType = 0
	ORDER BY
		fkCategoryID
	/* Get access information */
	SELECT
		fkContentID AS PageID,
		Name,
		IsRole,
		AccessMask
	FROM
		tblContentAccess
	WHERE 
	    fkContentID=@ContentID
	ORDER BY
	    IsRole DESC,
		Name
	/* Get all languages for the page */
	SELECT fkLanguageBranchID as PageLanguageBranchID FROM tblContentLanguage
		WHERE tblContentLanguage.fkContentID=@ContentID
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netContentMatchSegment]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentMatchSegment]
(
	@ContentID INT,
	@Segment NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		tblContent.pkID as ContentID, 
		tblContentLanguage.fkLanguageBranchID as LanguageBranchID,
		tblContent.ContentType as ContentType
	FROM tblContentLanguage INNER JOIN tblContent
		ON tblContentLanguage.fkContentID = tblContent.pkID
	WHERE tblContent.fkParentID = @ContentID AND tblContentLanguage.URLSegment = @Segment
	
END
GO
/****** Object:  StoredProcedure [dbo].[netContentMove]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentMove]
(
	@ContentID				INT,
	@DestinationContentID	INT,
	@WastebasketID		INT,
	@Archive			INT,
	@DeletedBy			NVARCHAR(255) = NULL,
	@DeletedDate		DATETIME = NULL, 
	@Saved				DATETIME
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @TmpParentID		INT
	DECLARE @SourceParentID		INT
	DECLARE @TmpNestingLevel	INT
	DECLARE @Delete				BIT
	DECLARE @IsDestinationLeafNode BIT
	DECLARE @SourcePath VARCHAR(7000)
	DECLARE @TargetPath VARCHAR(7000)
 
	/* Protect from moving Content under itself */
	IF (EXISTS (SELECT NestingLevel FROM tblTree WHERE fkParentID=@ContentID AND fkChildID=@DestinationContentID) OR @DestinationContentID=@ContentID)
		RETURN -1
    
    SELECT @SourcePath=ContentPath + CONVERT(VARCHAR, @ContentID) + '.' FROM tblContent WHERE pkID=@ContentID
    SELECT @TargetPath=ContentPath + CONVERT(VARCHAR, @DestinationContentID) + '.', @IsDestinationLeafNode=IsLeafNode FROM tblContent WHERE pkID=@DestinationContentID
    
	/* Switch parent to archive Content, disable stop publish and update Saved */
	UPDATE tblContent SET
		@SourceParentID		= fkParentID,
		fkParentID			= @DestinationContentID,
		ContentPath            = @TargetPath
	WHERE pkID=@ContentID
	IF @IsDestinationLeafNode = 1
		UPDATE tblContent SET IsLeafNode = 0 WHERE pkID=@DestinationContentID
	IF NOT EXISTS(SELECT * FROM tblContent WHERE fkParentID=@SourceParentID)
		UPDATE tblContent SET IsLeafNode = 1 WHERE pkID=@SourceParentID
    IF (@Archive = 1)
	BEGIN
		UPDATE tblContentLanguage SET
			StopPublish			= NULL,
			Saved				= @Saved
		WHERE fkContentID=@ContentID
		UPDATE tblWorkContent SET
			StopPublish			= NULL
		WHERE fkContentID = @ContentID
	END
	 
	/* Remove all references to this Content and its childs, but preserve the 
		information below itself */
	DELETE FROM 
		tblTree 
	WHERE 
		fkChildID IN (SELECT fkChildID FROM tblTree WHERE fkParentID=@ContentID UNION SELECT @ContentID) AND
		fkParentID NOT IN (SELECT fkChildID FROM tblTree WHERE fkParentID=@ContentID UNION SELECT @ContentID)
 
	/* Insert information about new Contents for all Contents where the destination is a child */
	DECLARE cur CURSOR LOCAL FAST_FORWARD FOR SELECT fkParentID, NestingLevel FROM tblTree WHERE fkChildID=@DestinationContentID
	OPEN cur
	FETCH NEXT FROM cur INTO @TmpParentID, @TmpNestingLevel
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		INSERT INTO tblTree
			(fkParentID,
			fkChildID,
			NestingLevel)
		SELECT
			@TmpParentID,
			fkChildID,
			@TmpNestingLevel + NestingLevel + 1
		FROM
			tblTree
		WHERE
			fkParentID=@ContentID
		UNION ALL
		SELECT
			@TmpParentID,
			@ContentID,
			@TmpNestingLevel + 1
	 
		FETCH NEXT FROM cur INTO @TmpParentID, @TmpNestingLevel
	END
	CLOSE cur
	DEALLOCATE cur
	/* Insert information about new Contents for destination */
	INSERT INTO tblTree
		(fkParentID,
		fkChildID,
		NestingLevel)
	SELECT
		@DestinationContentID,
		fkChildID,
		NestingLevel+1
	FROM
		tblTree
	WHERE
		fkParentID=@ContentID
	UNION
	SELECT
		@DestinationContentID,
		@ContentID,
		1
  
    /* Determine if destination is somewhere under wastebasket */
    SET @Delete=0
    IF (EXISTS (SELECT NestingLevel FROM tblTree WHERE fkParentID=@WastebasketID AND fkChildID=@ContentID))
        SET @Delete=1
    
    /* Update deleted bit of Contents */
    UPDATE tblContent  SET 
		Deleted=@Delete,
		DeletedBy = @DeletedBy,
		DeletedDate = @DeletedDate
    WHERE pkID IN (SELECT fkChildID FROM tblTree WHERE fkParentID=@ContentID) OR pkID=@ContentID
	/* Update saved date for Content */
	IF(@Delete > 0)
	BEGIN
		UPDATE tblContentLanguage  SET 
				Saved = @Saved
   		WHERE fkContentID IN (SELECT fkChildID FROM tblTree WHERE fkParentID=@ContentID) OR fkContentID=@ContentID
	END
 
    /* Create materialized path to moved Contents */
    UPDATE tblContent
    SET ContentPath=@TargetPath + CONVERT(VARCHAR, @ContentID) + '.' + RIGHT(ContentPath, LEN(ContentPath) - LEN(@SourcePath))
    WHERE pkID IN (SELECT fkChildID FROM tblTree WHERE fkParentID = @ContentID) /* Where Content is below source */    
    
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netContentRootList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentRootList]
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		pkID as RootPage from tblContent WHERE ContentGUID = '43F936C9-9B23-4EA3-97B2-61C538AD07C9'
	SELECT
		pkID as WasteBasket from tblContent WHERE ContentGUID = '2F40BA47-F4FC-47AE-A244-0B909D4CF988' 
	SELECT
		pkID as GlobalAssets from tblContent WHERE ContentGUID = 'E56F85D0-E833-4E02-976A-2D11FE4D598C' 
	SELECT
		pkID as ContentAssets from tblContent WHERE ContentGUID = '99D57529-61F2-47C0-80C0-F91ECA6AF1AC'
END
GO
/****** Object:  StoredProcedure [dbo].[netContentTypeAddAvailable]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentTypeAddAvailable]
(
	@ContentTypeID INT,
	@ChildID INT,
	@Availability INT = 0,
	@Access INT = 2,
	@Allow BIT = NULL
)
AS
BEGIN
	IF (@Availability = 1 OR @Availability = 2)
		DELETE FROM tblContentTypeToContentType WHERE
			fkContentTypeParentID = @ContentTypeID
	ELSE
		DELETE FROM tblContentTypeToContentType WHERE
			fkContentTypeParentID = @ContentTypeID AND fkContentTypeChildID = @ChildID
	INSERT INTO tblContentTypeToContentType
	(fkContentTypeParentID, fkContentTypeChildID, Access, Availability, Allow)
	VALUES
	(@ContentTypeID, @ChildID, @Access, @Availability, @Allow)
END
GO
/****** Object:  StoredProcedure [dbo].[netContentTypeDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentTypeDelete]
(
	@ContentTypeID		INT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	/* Do not try to delete a type that is in use */
	SELECT pkID as ContentID, Name as ContentName
	FROM tblContent
	INNER JOIN tblContentLanguage ON tblContentLanguage.fkContentID=tblContent.pkID
	WHERE fkContentTypeID=@ContentTypeID AND tblContentLanguage.fkLanguageBranchID=tblContent.fkMasterLanguageBranchID
	IF (@@ROWCOUNT <> 0)
		RETURN 1
	/* If the content type is used in a content definition, it can't be deleted */
	DECLARE @ContentTypeGuid UNIQUEIDENTIFIER
	SET @ContentTypeGuid = (SELECT ContentType.ContentTypeGUID
	FROM tblContentType as ContentType 
	WHERE ContentType.pkID=@ContentTypeID)
	
	DECLARE @PropertyDefinitionTypeID INT
	SET @PropertyDefinitionTypeID = (SELECT pkID FROM tblPropertyDefinitionType WHERE fkContentTypeGUID = @ContentTypeGuid)
	
	SELECT ContentType.pkID AS ContentTypeID, ContentType.Name AS ContentTypeName 
	FROM tblContentType AS ContentType
	INNER JOIN tblPropertyDefinition AS PropertyDefinition ON ContentType.pkID = PropertyDefinition.fkContentTypeID
	WHERE PropertyDefinition.fkPropertyDefinitionTypeID = @PropertyDefinitionTypeID
	IF (@@ROWCOUNT <> 0)
		RETURN 1
		
	/* If the content type is in use, do not delete */
	SELECT TOP 1 Property.pkID
	FROM  
	tblContentProperty as Property WITH(INDEX(IDX_tblContentProperty_ScopeName))
	INNER JOIN dbo.GetScopedBlockProperties(@ContentTypeID) as ScopedProperties ON 
			Property.ScopeName LIKE (ScopedProperties.ScopeName + '%')
	IF (@@ROWCOUNT <> 0)
		RETURN 1
	
	DELETE FROM 
		tblContentTypeDefault
	WHERE 
		fkContentTypeID=@ContentTypeID
	DELETE FROM 
		tblWorkContentProperty
	FROM 
		tblWorkContentProperty AS WP
	INNER JOIN 
		tblPropertyDefinition AS PD ON WP.fkPropertyDefinitionID=PD.pkID 
	WHERE 
		PD.Property=3 AND 
		ContentType=@ContentTypeID
	DELETE FROM 
		tblContentProperty
	FROM 
		tblContentProperty AS P
	INNER JOIN 
		tblPropertyDefinition AS PD ON P.fkPropertyDefinitionID=PD.pkID 
	WHERE 
		PD.Property=3 AND 
		ContentType=@ContentTypeID
	DELETE FROM 
		tblContentTypeToContentType 
	WHERE 
		fkContentTypeParentID=@ContentTypeID OR 
		fkContentTypeChildID=@ContentTypeID
		
	DELETE FROM 
		tblPropertyDefinition 
	WHERE 
		fkContentTypeID=@ContentTypeID
	DELETE FROM 
		tblPropertyDefinitionType
	FROM 
		tblPropertyDefinitionType
	INNER JOIN tblContentType ON tblPropertyDefinitionType.fkContentTypeGUID = tblContentType.ContentTypeGUID
	WHERE
		tblContentType.pkID=@ContentTypeID
		
	DELETE FROM 
		tblContentType
	WHERE
		pkID=@ContentTypeID
	
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netContentTypeDeleteAvailable]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentTypeDeleteAvailable]
	@ContentTypeID INT,
	@ChildID INT = 0
AS
BEGIN
	IF (@ChildID = 0)
		DELETE FROM tblContentTypeToContentType WHERE fkContentTypeParentID = @ContentTypeID
	ELSE
		DELETE FROM tblContentTypeToContentType WHERE fkContentTypeParentID = @ContentTypeID AND fkContentTypeChildID = @ChildID
END
GO
/****** Object:  StoredProcedure [dbo].[netContentTypeList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentTypeList]
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT	CT.pkID AS ID,
			CONVERT(NVARCHAR(38),CT.ContentTypeGUID) AS Guid,
			CT.Created,
			CT.Saved,
			CT.SavedBy,
			CT.Name,
			CT.Base,
			CT.Version,
			CT.DisplayName,
			CT.Description,
			CT.DefaultWebFormTemplate,
			CT.DefaultMvcController,
			CT.DefaultMvcPartialView,
			CT.Available,
			CT.SortOrder,
			CT.ModelType,
			CT.Filename,
			CT.ACL,
			CT.ContentType,
			CTD.pkID AS DefaultID,
			CTD.Name AS DefaultName,
			CTD.StartPublishOffset,
			CTD.StopPublishOffset,
			CONVERT(INT,CTD.VisibleInMenu) AS VisibleInMenu,
			CTD.PeerOrder,
			CTD.ChildOrderRule,
			CTD.fkFrameID AS FrameID,
			CTD.fkArchiveContentID AS ArchiveContentLink
	FROM tblContentType CT
	LEFT JOIN tblContentTypeDefault AS CTD ON CTD.fkContentTypeID=CT.pkID 
	ORDER BY CT.SortOrder
END
GO
/****** Object:  StoredProcedure [dbo].[netContentTypeSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentTypeSave]
(
	@ContentTypeID			INT,
	@ContentTypeGUID		UNIQUEIDENTIFIER,
	@Saved					DATETIME		= NULL,
	@SavedBy				NVARCHAR(255)	= NULL,
	@Name					NVARCHAR(50),
	@Base					NVARCHAR(50)	= NULL,
	@Version				NVARCHAR(50)	= NULL,
	@DisplayName			NVARCHAR(50)	= NULL,
	@Description			NVARCHAR(255)	= NULL,
	@DefaultWebFormTemplate	NVARCHAR(1024)	= NULL,
	@DefaultMvcController	NVARCHAR(1024)	= NULL,
	@DefaultMvcPartialView	NVARCHAR(255)	= NULL,
	@Filename				NVARCHAR(255)	= NULL,
	@Available				BIT				= NULL,
	@SortOrder				INT				= NULL,
	@ModelType				NVARCHAR(1024)	= NULL,
	
	@DefaultID				INT				= NULL,
	@DefaultName 			NVARCHAR(100)	= NULL,
	@StartPublishOffset		INT				= NULL,
	@StopPublishOffset		INT				= NULL,
	@VisibleInMenu			BIT				= NULL,
	@PeerOrder 				INT				= NULL,
	@ChildOrderRule 		INT				= NULL,
	@ArchiveContentID 		INT				= NULL,
	@FrameID 				INT				= NULL,
	@ACL					NVARCHAR(MAX)	= NULL,
	@ContentType			INT				= 0,
	@Created				DATETIME
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @IdString NVARCHAR(255)
	
	IF @ContentTypeID <= 0
	BEGIN
		SET @ContentTypeID = ISNULL((SELECT pkID FROM tblContentType where Name = @Name), @ContentTypeID)
	END
	IF (@ContentTypeID <= 0)
	BEGIN
		SELECT TOP 1 @IdString = IdString FROM tblContentType
		INSERT INTO tblContentType
			(Saved,
			SavedBy,
			Name,
			DisplayName,
			Base,
			Version,
			DefaultMvcController,
			DefaultWebFormTemplate,
			DefaultMvcPartialView,
			Description,
			Available,
			SortOrder,
			ModelType,
			Filename,
			IdString,
			ContentTypeGUID,
			ACL,
			ContentType,
			Created)
		VALUES
			(@Saved,
			@SavedBy,
			@Name,
			@DisplayName,
			@Base,
			@Version,
			@DefaultMvcController,
			@DefaultWebFormTemplate,
			@DefaultMvcPartialView,
			@Description,
			@Available,
			@SortOrder,
			@ModelType,
			@Filename,
			@IdString,
			@ContentTypeGUID,
			@ACL,
			@ContentType,
			@Created)
		SET @ContentTypeID = SCOPE_IDENTITY() 
		
	END
	ELSE
	BEGIN
		BEGIN
			UPDATE tblContentType
			SET
				Saved = @Saved,
				SavedBy = @SavedBy,
				Name=@Name,
				Base=@Base,
				Version=@Version,
				DisplayName=@DisplayName,
				Description=@Description,
				DefaultWebFormTemplate=@DefaultWebFormTemplate,
				DefaultMvcController=@DefaultMvcController,
				DefaultMvcPartialView=@DefaultMvcPartialView,
				Available=@Available,
				SortOrder=@SortOrder,
				ModelType = @ModelType,
				Filename = @Filename,
				ACL=@ACL,
				ContentType = @ContentType,
				@ContentTypeGUID = ContentTypeGUID
			WHERE
				pkID = @ContentTypeID
		END
	END
	IF (@DefaultID IS NULL)
	BEGIN
		DELETE FROM tblContentTypeDefault WHERE fkContentTypeID=@ContentTypeID
	END
	ELSE
	BEGIN
		IF (EXISTS (SELECT pkID FROM tblContentTypeDefault WHERE fkContentTypeID=@ContentTypeID))
		BEGIN
			UPDATE tblContentTypeDefault SET
				Name 				= @DefaultName,
				StartPublishOffset 	= @StartPublishOffset,
				StopPublishOffset 	= @StopPublishOffset,
				VisibleInMenu 		= @VisibleInMenu,
				PeerOrder 			= @PeerOrder,
				ChildOrderRule 		= @ChildOrderRule,
				fkArchiveContentID 	= @ArchiveContentID,
				fkFrameID 			= @FrameID
			WHERE fkContentTypeID = @ContentTypeID
		END
		ELSE
		BEGIN
			INSERT INTO tblContentTypeDefault 
				(fkContentTypeID,
				Name,
				StartPublishOffset,
				StopPublishOffset,
				VisibleInMenu,
				PeerOrder,
				ChildOrderRule,
				fkArchiveContentID,
				fkFrameID)
			VALUES
				(@ContentTypeID,
				@DefaultName,
				@StartPublishOffset,
				@StopPublishOffset,
				@VisibleInMenu,
				@PeerOrder,
				@ChildOrderRule,
				@ArchiveContentID,
				@FrameID)
		END
	END
		
	SELECT @ContentTypeID AS "ID", @ContentTypeGUID AS "GUID"
END
GO
/****** Object:  StoredProcedure [dbo].[netContentTypeToContentTypeList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netContentTypeToContentTypeList]
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		fkContentTypeParentID AS ID,
		fkContentTypeChildID AS ChildID,
		Access AS AccessMask,
		Availability,
		Allow
	FROM tblContentTypeToContentType
	ORDER BY fkContentTypeParentID
END
GO
/****** Object:  StoredProcedure [dbo].[netConvertCategoryPropertyForPageType]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netConvertCategoryPropertyForPageType]
(
	@PageID		INT,
	@FromPageType	INT,
	@FromPropertyID 	INT,
	@ToPropertyID		INT,
	@Recursive		BIT,
	@MasterLanguageID INT,
	@IsTest			BIT
)
AS
BEGIN
	DECLARE @LanguageSpecific INT
	DECLARE @LanguageSpecificSource INT
	SET @LanguageSpecific = 0
	SET @LanguageSpecificSource = 0
	CREATE TABLE  #updatepages(fkChildID int)
 
	INSERT INTO #updatepages(fkChildID)  
	SELECT fkChildID 
	FROM tblTree tree
	INNER JOIN tblContent content
	ON content.pkID = tree.fkChildID 
	WHERE @Recursive = 1
	AND tree.fkParentID = @PageID
	AND content.fkContentTypeID = @FromPageType
	UNION (SELECT pkID FROM tblContent WHERE pkID = @PageID AND fkContentTypeID = @FromPageType)
	IF @ToPropertyID IS NULL OR @ToPropertyID = 0-- no definition exists for the new page type for this property so remove it
	BEGIN
		DELETE
		FROM tblContentCategory 
		WHERE CategoryType = @FromPropertyID
		AND  EXISTS (
			SELECT * from #updatepages WHERE fkChildID=fkContentID)
		DELETE 
		FROM tblWorkContentCategory 
		WHERE CategoryType = @FromPropertyID
		AND EXISTS (
			SELECT * 
			FROM tblWorkContent 
			WHERE pkID = fkWorkContentID
			AND  EXISTS (
				SELECT * from #updatepages WHERE fkChildID=fkContentID)
			)
	END 	
	ELSE IF @FromPropertyID IS NOT NULL -- from property exists and has to be replaced
	BEGIN
		-- Need to check if the property we're converting to is unique for each language or not
		SELECT @LanguageSpecific = LanguageSpecific 
		FROM tblPropertyDefinition 
		WHERE pkID = @ToPropertyID
		-- Need to check if the property we're converting from is unique for each language or not
		SELECT @LanguageSpecificSource = LanguageSpecific 
		FROM tblPropertyDefinition 
		WHERE pkID = @FromPropertyID
			
		-- Update older versions
		UPDATE tblWorkContentCategory SET CategoryType = @ToPropertyID, ScopeName = CAST(@ToPropertyID AS NVARCHAR)
			FROM tblWorkContentCategory prop
			INNER JOIN tblWorkContent wpa ON prop.fkWorkContentID = wpa.pkID
			WHERE prop.CategoryType = @FromPropertyID
			AND EXISTS (SELECT * from #updatepages WHERE fkChildID=wpa.fkContentID)
			
		-- Update current version 
		UPDATE tblContentCategory SET CategoryType = @ToPropertyID, ScopeName = CAST(@ToPropertyID AS NVARCHAR)
		WHERE CategoryType = @FromPropertyID
		AND  EXISTS (
			SELECT * from #updatepages WHERE fkChildID=fkContentID)
        --update value in tblContentProperty
        UPDATE tblContentProperty SET Number = @ToPropertyID, ScopeName = CAST(@ToPropertyID AS NVARCHAR)
		WHERE fkPropertyDefinitionID = @ToPropertyID
        AND Number = @FromPropertyID
        
        --update value in tblWorkContentProperty
        UPDATE tblWorkContentProperty SET Number = @ToPropertyID, ScopeName = CAST(@ToPropertyID AS NVARCHAR)
		WHERE fkPropertyDefinitionID = @ToPropertyID
        AND Number = @FromPropertyID
		IF (@LanguageSpecific < 3 AND @LanguageSpecificSource > 2)
		BEGIN
			-- The destination property is not language specific which means
			-- that we need to remove all of the old properties in other
			-- languages that could not be mapped
			DELETE FROM tblWorkContentCategory
				FROM tblWorkContentCategory prop
				INNER JOIN tblWorkContent wpa ON prop.fkWorkContentID = wpa.pkID
				WHERE prop.CategoryType = @ToPropertyID -- already converted to new type!
				AND wpa.fkLanguageBranchID <> @MasterLanguageID
				AND EXISTS (SELECT * from #updatepages WHERE fkChildID=wpa.fkContentID)	
				
			DELETE FROM tblContentCategory 
			WHERE CategoryType = @ToPropertyID -- already converted to new type!
			AND fkLanguageBranchID <> @MasterLanguageID
			AND  EXISTS (
				SELECT * from #updatepages WHERE fkChildID=fkContentID)
		
		END
		ELSE IF (@LanguageSpecificSource < 3)
		BEGIN
			-- Converting from language neutral to language supporting property
			-- We must copy existing master language property to other languages for the page
				
			-- NOTE: Due to the way language neutral properties are loaded, that is they are always
			-- loaded from published version, see netPageDataLoadVersion it is sufficient to add property
			-- values to tblProperty 
				
			INSERT INTO tblContentCategory
				(fkContentID,
				fkCategoryID,
				fkLanguageBranchID,
				ScopeName,
				CategoryType)
			SELECT 
                Prop.fkContentID,
                Prop.fkCategoryID,
                Lang.fkLanguageBranchID,
                ScopeName = dbo.ConvertScopeName(ScopeName,@FromPropertyID, @ToPropertyID),
                @ToPropertyID
			FROM
			tblContentLanguage Lang
			INNER JOIN
			tblContentCategory Prop ON Prop.fkLanguageBranchID = @MasterLanguageID
			WHERE
			Prop.fkContentID = @PageID AND
			Prop.CategoryType = @ToPropertyID AND -- already converted to new type!
			Prop.fkLanguageBranchID = @MasterLanguageID AND
			Lang.fkLanguageBranchID <> @MasterLanguageID AND
			Lang.fkContentID = @PageID
			-- Need to add entries to tblWorkContentCategory for all pages not in the master language
			-- First we need to read the master language property into a temp table
			CREATE TABLE #TempWorkProperty
			(
                CategoryID int,
				CategoryType int,
				ScopeName nvarchar(450)
			)
			INSERT INTO #TempWorkProperty
			SELECT
                Prop.fkCategoryID,
				Prop.CategoryType,
				ScopeName = CAST(@ToPropertyID AS NVARCHAR)
			FROM
				tblWorkContentCategory AS Prop
				INNER JOIN
				tblWorkContent AS Content ON Prop.fkWorkContentID = Content.pkID
			WHERE
				Prop.CategoryType = @ToPropertyID AND -- already converted to new type!
				Content.fkLanguageBranchID = @MasterLanguageID AND
				Content.fkContentID = @PageID
				ORDER BY Content.pkID DESC
			-- Now add a new property for every language (except master) using the master value
			INSERT INTO	tblWorkContentCategory(fkWorkContentID, fkCategoryID, CategoryType, ScopeName)
			SELECT
				Content.pkID,
                TempProp.CategoryID,
                TempProp.CategoryType,
				TempProp.ScopeName
			FROM 
				tblWorkContent AS Content
				CROSS JOIN #TempWorkProperty AS TempProp
			WHERE
                Content.fkContentID = @PageID AND
				Content.fkLanguageBranchID <> @MasterLanguageID
			DROP TABLE #TempWorkProperty
		END
	END
	DROP TABLE #updatepages
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netConvertPageType]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netConvertPageType]
(
	@PageID		INT,
	@FromPageType	INT,
	@ToPageType		INT,
	@Recursive		BIT,
	@IsTest			BIT
)
AS
BEGIN
	DECLARE @cnt INT;
	CREATE TABLE #updatepages (fkChildID INT)
	INSERT INTO #updatepages(fkChildID)
	SELECT fkChildID
	FROM tblTree tree
	JOIN tblPage page
	ON page.pkID = tree.fkChildID 
	WHERE @Recursive = 1
	AND tree.fkParentID = @PageID
	AND page.fkPageTypeID = @FromPageType
	UNION (SELECT pkID FROM tblPage WHERE pkID = @PageID AND fkPageTypeID = @FromPageType)
	IF @IsTest = 1
	BEGIN
		SET @cnt = (SELECT COUNT(*) FROM #updatepages)
	END
	ELSE
	BEGIN		
		UPDATE tblPage SET fkPageTypeID=@ToPageType
		WHERE EXISTS (
			SELECT * from #updatepages WHERE fkChildID=pkID)
		SET @cnt = @@rowcount
	END		
	DROP TABLE #updatepages
	RETURN (@cnt)
END
GO
/****** Object:  StoredProcedure [dbo].[netConvertPropertyForPageType]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netConvertPropertyForPageType]
(
	@PageID		INT,
	@FromPageType	INT,
	@FromPropertyID 	INT,
	@ToPropertyID		INT,
	@Recursive		BIT,
	@MasterLanguageID INT,
	@IsTest			BIT
)
AS
BEGIN
	DECLARE @cnt INT;
	DECLARE @LanguageSpecific INT
	DECLARE @LanguageSpecificSource INT
	DECLARE @IsBlock BIT
	SET @LanguageSpecific = 0
	SET @LanguageSpecificSource = 0
	SET @IsBlock = 0
	CREATE TABLE  #updatepages(fkChildID int)
 
	INSERT INTO #updatepages(fkChildID)  
	SELECT fkChildID 
	FROM tblTree tree
	INNER JOIN tblPage page
	ON page.pkID = tree.fkChildID 
	WHERE @Recursive = 1
	AND tree.fkParentID = @PageID
	AND page.fkPageTypeID = @FromPageType
	UNION (SELECT pkID FROM tblPage WHERE pkID = @PageID AND fkPageTypeID = @FromPageType)
	IF @IsTest = 1
	BEGIN	
		SET @cnt = (	SELECT COUNT(*)
				FROM tblProperty 
				WHERE (fkPageDefinitionID = @FromPropertyID
				or ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%')
				AND  EXISTS (
					SELECT * from #updatepages WHERE fkChildID=fkPageID))
			+ (	SELECT COUNT(*)
				FROM tblWorkProperty 
				WHERE (fkPageDefinitionID = @FromPropertyID
				or ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%')
				AND EXISTS (
				SELECT * 
					FROM tblWorkPage 
					WHERE pkID = fkWorkPageID
					AND  EXISTS (
						SELECT * from #updatepages WHERE fkChildID=fkPageID)
				))
		IF @ToPropertyID IS NULL OR @ToPropertyID = 0-- mark deleted rows with -
			SET @cnt = -@cnt
	END
	ELSE
	BEGIN
		IF @ToPropertyID IS NULL OR @ToPropertyID = 0-- no definition exists for the new page type for this property so remove it
		BEGIN
			DELETE
			FROM tblProperty 
			WHERE (fkPageDefinitionID = @FromPropertyID
			or ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%')
			AND  EXISTS (
				SELECT * from #updatepages WHERE fkChildID=fkPageID)
			SET @cnt = -@@rowcount
			DELETE 
			FROM tblWorkProperty 
			WHERE (fkPageDefinitionID = @FromPropertyID
			or ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%')
			AND EXISTS (
				SELECT * 
				FROM tblWorkPage 
				WHERE pkID = fkWorkPageID
				AND  EXISTS (
					SELECT * from #updatepages WHERE fkChildID=fkPageID)
				)
			SET @cnt = @cnt-@@rowcount 
		END 	
		ELSE IF @FromPropertyID IS NOT NULL -- from property exists and has to be replaced
		BEGIN
			-- Need to check if the property we're converting to is unique for each language or not
			SELECT @LanguageSpecific = LanguageSpecific 
			FROM tblPageDefinition 
			WHERE pkID = @ToPropertyID
			-- Need to check if the property we're converting from is unique for each language or not
			SELECT @LanguageSpecificSource = LanguageSpecific 
			FROM tblPageDefinition 
			WHERE pkID = @FromPropertyID
			
			-- Need to check if the property we're converting is a block (Property 12 is a block)
			SELECT @IsBlock = CAST(count(*) as bit)
			FROM tblPageDefinition 
			Where pkID = @FromPropertyID and Property = 12
			IF @IsBlock = 1
			BEGIN
				DECLARE @DefinitionTypeFrom int
				DECLARE @DefinitionTypeTo int
				SET @DefinitionTypeFrom = 
					(SELECT fkPageDefinitionTypeID FROM tblPageDefinition WHERE pkID =@FromPropertyID)
				SET @DefinitionTypeTo = 
					(SELECT fkPageDefinitionTypeID FROM tblPageDefinition WHERE pkID =@ToPropertyID)
				IF (@DefinitionTypeFrom <> @DefinitionTypeTo)
				BEGIN
					RAISERROR (N'Property definitions are not of same block type.', 16, 1)
					RETURN 0
				END
				
				-- Update older versions of block
				-- update scopename in tblWorkProperty
				
				 UPDATE tblWorkProperty 
				 SET ScopeName = dbo.ConvertScopeName(ScopeName,@FromPropertyID, @ToPropertyID)
				 FROM tblWorkProperty prop
				 INNER JOIN tblWorkPage wpa ON prop.fkWorkPageID = wpa.pkID
				 WHERE ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%'
				 AND EXISTS (SELECT * from #updatepages WHERE fkChildID=wpa.fkPageID)
			
				SET @cnt = @@rowcount
				-- Update current version of block
				-- update scopename in tblProperty
				
				 UPDATE tblProperty 
				 SET ScopeName = dbo.ConvertScopeName(ScopeName,@FromPropertyID, @ToPropertyID)
				 WHERE ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%'
				 AND  EXISTS (
					SELECT * from #updatepages WHERE fkChildID=fkPageID)
				SET @cnt = @cnt + @@rowcount
                 --Update category tables in case block has category properties
                 UPDATE tblWorkContentCategory
				 SET ScopeName = dbo.ConvertScopeName(ScopeName,@FromPropertyID, @ToPropertyID)
				 FROM tblWorkContentCategory prop
				 INNER JOIN tblWorkPage wpa ON prop.fkWorkContentID = wpa.pkID
				 WHERE ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%'
				 AND EXISTS (SELECT * from #updatepages WHERE fkChildID=wpa.fkPageID)
                 UPDATE tblContentCategory 
				 SET ScopeName = dbo.ConvertScopeName(ScopeName,@FromPropertyID, @ToPropertyID)
				 WHERE ScopeName LIKE '%.' + CAST(@FromPropertyID as varchar) + '.%'
				 AND  EXISTS (
					SELECT * from #updatepages WHERE fkChildID=fkContentID)
			END
			ELSE -- Not a block.
			BEGIN
				-- Update older versions
				UPDATE tblWorkProperty SET fkPageDefinitionID = @ToPropertyID
					FROM tblWorkProperty prop
					INNER JOIN tblWorkPage wpa ON prop.fkWorkPageID = wpa.pkID
					WHERE prop.fkPageDefinitionID = @FromPropertyID
					AND EXISTS (SELECT * from #updatepages WHERE fkChildID=wpa.fkPageID)
			
				SET @cnt = @@rowcount
				-- Update current version 
				UPDATE tblProperty SET fkPageDefinitionID = @ToPropertyID
				WHERE fkPageDefinitionID = @FromPropertyID
				AND  EXISTS (
					SELECT * from #updatepages WHERE fkChildID=fkPageID)
				SET @cnt = @cnt + @@rowcount
			END
			IF (@LanguageSpecific < 3 AND @LanguageSpecificSource > 2)
			BEGIN
				-- The destination property is not language specific which means
				-- that we need to remove all of the old properties in other
				-- languages that could not be mapped
				DELETE FROM tblWorkProperty
					FROM tblWorkProperty prop
					INNER JOIN tblWorkPage wpa ON prop.fkWorkPageID = wpa.pkID
					WHERE (prop.fkPageDefinitionID = @ToPropertyID -- already converted to new type!
					or prop.ScopeName LIKE '%.' + CAST(@ToPropertyID as varchar) + '.%')
					AND wpa.fkLanguageBranchID <> @MasterLanguageID
					AND EXISTS (SELECT * from #updatepages WHERE fkChildID=wpa.fkPageID)
				
				SET @cnt = @cnt - @@rowcount		
				
				DELETE FROM tblProperty 
				WHERE (fkPageDefinitionID = @ToPropertyID -- already converted to new type!
				or ScopeName LIKE '%.' + CAST(@ToPropertyID as varchar) + '.%')
				AND fkLanguageBranchID <> @MasterLanguageID
				AND  EXISTS (
					SELECT * from #updatepages WHERE fkChildID=fkPageID)
				SET @cnt = @cnt - @@rowcount				
			END
			ELSE IF (@LanguageSpecificSource < 3)
			BEGIN
				-- Converting from language neutral to language supporting property
				-- We must copy existing master language property to other languages for the page
				
				-- NOTE: Due to the way language neutral properties are loaded, that is they are always
				-- loaded from published version, see netPageDataLoadVersion it is sufficient to add property
				-- values to tblProperty (no need to update tblWorkProperty
				
				INSERT INTO tblProperty
					(fkPageDefinitionID,
					fkPageID,
					fkLanguageBranchID,
					ScopeName,
					Boolean,
					Number,
					FloatNumber,
					PageType,
					PageLink,
					LinkGuid,
					Date,
					String,
					LongString,
					LongStringLength)
				SELECT 
					CASE @IsBlock when 1 then Prop.fkPageDefinitionID else @ToPropertyID end, 
					Prop.fkPageID,
					Lang.fkLanguageBranchID,
					Prop.ScopeName,
					Prop.Boolean,
					Prop.Number,
					Prop.FloatNumber,
					Prop.PageType,
					Prop.PageLink,
					Prop.LinkGuid,
					Prop.Date,
					Prop.String,
					Prop.LongString,
					Prop.LongStringLength
				FROM
				tblPageLanguage Lang
				INNER JOIN
				tblProperty Prop ON Prop.fkLanguageBranchID = @MasterLanguageID
				WHERE
				Prop.fkPageID = @PageID AND
				(Prop.fkPageDefinitionID = @ToPropertyID -- already converted to new type!
				or Prop.ScopeName LIKE '%.' + CAST(@ToPropertyID as varchar) + '.%') AND
				Prop.fkLanguageBranchID = @MasterLanguageID AND
				Lang.fkLanguageBranchID <> @MasterLanguageID AND
				Lang.fkPageID = @PageID
				-- Need to add entries to tblWorkProperty for all pages not in the master language
				-- First we need to read the master language property into a temp table
				CREATE TABLE #TempWorkProperty
				(
					fkPageDefinitionID int,
					ScopeName nvarchar(450),
					Boolean bit,
					Number int,
					FloatNumber float,
					PageType int,
					PageLink int,
				    LinkGuid uniqueidentifier,
					Date datetime,
					String nvarchar(450),
					LongString nvarchar(max)
				)
				INSERT INTO #TempWorkProperty
				SELECT
					Prop.fkPageDefinitionID,
					Prop.ScopeName,
					Prop.Boolean,
					Prop.Number,
					Prop.FloatNumber,
					Prop.PageType,
					Prop.PageLink,
				    Prop.LinkGuid,
					Prop.Date,
					Prop.String,
					Prop.LongString
				FROM
					tblWorkProperty AS Prop
					INNER JOIN
					tblWorkPage AS Page ON Prop.fkWorkPageID = Page.pkID
				WHERE
					(Prop.fkPageDefinitionID = @ToPropertyID -- already converted to new type!
				or Prop.ScopeName LIKE '%.' + CAST(@ToPropertyID as varchar) + '.%') AND
					Page.fkLanguageBranchID = @MasterLanguageID AND
					Page.fkPageID = @PageID
					ORDER BY Page.pkID DESC
				-- Now add a new property for every language (except master) using the master value
				INSERT INTO	tblWorkProperty 
				SELECT
					CASE @IsBlock when 1 then TempProp.fkPageDefinitionID else @ToPropertyID end,
					Page.pkID,
					TempProp.ScopeName,
					TempProp.Boolean,
					TempProp.Number,
					TempProp.FloatNumber,
					TempProp.PageType,
					TempProp.PageLink,
					TempProp.Date,
					TempProp.String,
					TempProp.LongString,
					TempProp.LinkGuid
				FROM 
					tblWorkPage AS Page
					CROSS JOIN #TempWorkProperty AS TempProp
				WHERE
                    Page.fkPageID = @PageID AND
					Page.fkLanguageBranchID <> @MasterLanguageID
				DROP TABLE #TempWorkProperty
			END
		END
	END
	DROP TABLE #updatepages
	RETURN (@cnt)
END
GO
/****** Object:  StoredProcedure [dbo].[netCreatePath]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netCreatePath]
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @RootPage INT
	UPDATE tblPage SET PagePath=''
	SELECT @RootPage=pkID FROM tblPage WHERE fkParentID IS NULL AND PagePath = ''
	UPDATE tblPage SET PagePath='.' WHERE pkID=@RootPage
	
	WHILE (1 = 1)
	BEGIN
	
		UPDATE CHILD SET CHILD.PagePath = PARENT.PagePath + CONVERT(VARCHAR, PARENT.pkID) + '.'
		FROM tblPage CHILD INNER JOIN tblPage PARENT ON CHILD.fkParentID = PARENT.pkID
		WHERE CHILD.PagePath = '' AND PARENT.PagePath <> ''
		
		IF (@@ROWCOUNT = 0)
			BREAK	
	
	END	
	
END
GO
/****** Object:  StoredProcedure [dbo].[netDynamicPropertiesLoad]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netDynamicPropertiesLoad]
(
	@PageID INT
)
AS
BEGIN
	/* 
	Return dynamic properties for this page with edit-information
	*/
	SET NOCOUNT ON
	DECLARE @PropCount INT
	
	CREATE TABLE #tmpprop
	(
		fkPageID		INT NULL,
		fkPageDefinitionID	INT,
		fkPageDefinitionTypeID	INT,
		fkLanguageBranchID	INT NULL
	)
	/*Make sure page exists before starting*/
	IF NOT EXISTS(SELECT * FROM tblPage WHERE pkID=@PageID)
		RETURN 0
	SET @PropCount = 0
	/* Get all common dynamic properties */
	INSERT INTO #tmpprop
		(fkPageDefinitionID,
		fkPageDefinitionTypeID,
		fkLanguageBranchID)
	SELECT
		tblPageDefinition.pkID,
		fkPageDefinitionTypeID,
		1
	FROM
		tblPageDefinition
	WHERE
		fkPageTypeID IS NULL
	AND
		LanguageSpecific < 3
	/* Remember how many properties we have */
	SET @PropCount = @PropCount + @@ROWCOUNT
	/* Get all language specific dynamic properties */
	INSERT INTO #tmpprop
		(fkPageDefinitionID,
		fkPageDefinitionTypeID,
		fkLanguageBranchID)
	SELECT
		tblPageDefinition.pkID,
		fkPageDefinitionTypeID,
		tblLanguageBranch.pkID
	FROM
		tblPageDefinition
	CROSS JOIN
		tblLanguageBranch
	WHERE
		fkPageTypeID IS NULL
	AND
		LanguageSpecific > 2
	AND
		tblLanguageBranch.Enabled = 1
	ORDER BY
		tblLanguageBranch.pkID
	
	/* Remember how many properties we have */
	SET @PropCount = @PropCount + @@ROWCOUNT
	/* Get page references for all properties (if possible) */
	WHILE (@PropCount > 0 AND @PageID IS NOT NULL)
	BEGIN
	
		/* Update properties that are defined for this page */
		UPDATE #tmpprop
		SET fkPageID=@PageID
		FROM #tmpprop
		INNER JOIN tblProperty ON #tmpprop.fkPageDefinitionID=tblProperty.fkPageDefinitionID
		WHERE 				
			tblProperty.fkPageID=@PageID AND 
			#tmpprop.fkPageID IS NULL
		AND
			#tmpprop.fkLanguageBranchID = tblProperty.fkLanguageBranchID
		OR
			#tmpprop.fkLanguageBranchID IS NULL
			
		/* Remember how many properties we have left */
		SET @PropCount = @PropCount - @@ROWCOUNT
		
		/* Go up one step in the tree */
		SELECT @PageID = fkParentID FROM tblPage WHERE pkID = @PageID
	END
	
	/* Include all property rows */
	SELECT
		#tmpprop.fkPageDefinitionID,
		#tmpprop.fkPageID,
		PD.Name AS PropertyName,
		LanguageSpecific,
		RTRIM(LB.LanguageID) AS BranchLanguageID,
		ScopeName,
		CONVERT(INT,Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		PageType, 
		PageLink AS ContentLink,
		LinkGuid,
		Date AS DateValue, 
		String, 
		LongString
	FROM
		#tmpprop
	LEFT JOIN
		tblLanguageBranch AS LB
	ON
		LB.pkID = #tmpprop.fkLanguageBranchID
	LEFT JOIN
		tblPageDefinition AS PD
	ON
		PD.pkID = #tmpprop.fkPageDefinitionID
	LEFT JOIN
		tblProperty AS P
	ON
		P.fkPageID = #tmpprop.fkPageID
	AND
		P.fkPageDefinitionID = #tmpprop.fkPageDefinitionID
	AND
		P.fkLanguageBranchID = #tmpprop.fkLanguageBranchID
	ORDER BY
		LanguageSpecific,
		#tmpprop.fkLanguageBranchID,
		FieldOrder
	DROP TABLE #tmpprop
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netDynamicPropertyLookup]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netDynamicPropertyLookup]
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		P.fkPageID AS PageID,
		P.fkPageDefinitionID,
		PD.Name AS PropertyName,
		LanguageSpecific,
		RTRIM(LB.LanguageID) AS BranchLanguageID,
		ScopeName,
		CONVERT(INT,Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		PageType,
		PageLink AS ContentLink,
		LinkGuid,
		Date AS DateValue,
		String,
		LongString
	FROM
		tblProperty AS P
	INNER JOIN
		tblLanguageBranch AS LB
	ON
		P.fkLanguageBranchID = LB.pkID
	INNER JOIN
		tblPageDefinition AS PD
	ON
		PD.pkID = P.fkPageDefinitionID
	WHERE   
		(LB.Enabled = 1 OR PD.LanguageSpecific < 3) AND
		(PD.fkPageTypeID IS NULL)	
END
GO
/****** Object:  StoredProcedure [dbo].[netFindContentCoreDataByContentGuid]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFindContentCoreDataByContentGuid]
	@ContentGuid UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
        --- *** use NOLOCK since this may be called during page save if debugging. The code should not be written so this happens, it's to make it work in the debugger ***
	SELECT TOP 1 P.pkID as ID, P.fkContentTypeID as ContentTypeID, P.fkParentID as ParentID, P.ContentGUID, PL.LinkURL, P.Deleted, CASE WHEN Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PendingPublish, PL.Created, PL.Changed, PL.Saved, PL.StartPublish, PL.StopPublish, P.ContentAssetsID, P.fkMasterLanguageBranchID as MasterLanguageBranchID, PL.ContentLinkGUID as ContentLinkID, PL.AutomaticLink, PL.FetchData, P.ContentType
	FROM tblContent AS P WITH (NOLOCK)
	LEFT JOIN tblContentLanguage AS PL ON PL.fkContentID=P.pkID
	WHERE P.ContentGUID = @ContentGuid AND (P.fkMasterLanguageBranchID=PL.fkLanguageBranchID OR P.fkMasterLanguageBranchID IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[netFindContentCoreDataByContentGuidBatch]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFindContentCoreDataByContentGuidBatch]
	@ContentGuids AS GuidParameterTable READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
        --- *** use NOLOCK since this may be called during page save if debugging. The code should not be written so this happens, it's to make it work in the debugger ***
	SELECT P.pkID as ID, P.fkContentTypeID as ContentTypeID, P.fkParentID as ParentID, P.ContentGUID, PL.LinkURL, P.Deleted, CASE WHEN Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PendingPublish, PL.Created, PL.Changed, PL.Saved, PL.StartPublish, PL.StopPublish, P.ContentAssetsID, P.fkMasterLanguageBranchID as MasterLanguageBranchID, PL.ContentLinkGUID as ContentLinkID, PL.AutomaticLink, PL.FetchData, P.ContentType
	FROM tblContent AS P WITH (NOLOCK)
    INNER JOIN @ContentGuids as ParamGuids on P.ContentGUID = ParamGuids.Id	
	LEFT JOIN tblContentLanguage AS PL ON PL.fkContentID=P.pkID
	WHERE P.fkMasterLanguageBranchID=PL.fkLanguageBranchID OR P.fkMasterLanguageBranchID IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[netFindContentCoreDataByID]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFindContentCoreDataByID]
	@ContentID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
        --- *** use NOLOCK since this may be called during content save if debugging. The code should not be written so this happens, it's to make it work in the debugger ***
	SELECT TOP 1 P.pkID as ID, P.fkContentTypeID as ContentTypeID, P.fkParentID as ParentID, P.ContentGUID, PL.LinkURL, P.Deleted, CASE WHEN Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PendingPublish, PL.Created, PL.Changed, PL.Saved, PL.StartPublish, PL.StopPublish, P.ContentAssetsID, P.fkMasterLanguageBranchID as MasterLanguageBranchID, PL.ContentLinkGUID as ContentLinkID, PL.AutomaticLink, PL.FetchData, P.ContentType
	FROM tblContent AS P WITH (NOLOCK)
	LEFT JOIN tblContentLanguage AS PL ON PL.fkContentID = P.pkID
	WHERE P.pkID = @ContentID AND (P.fkMasterLanguageBranchID = PL.fkLanguageBranchID OR P.fkMasterLanguageBranchID IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[netFindContentCoreDataByIDBatch]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFindContentCoreDataByIDBatch]
	@ContentIDs AS IDTable READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
        --- *** use NOLOCK since this may be called during content save if debugging. The code should not be written so this happens, it's to make it work in the debugger ***
	SELECT P.pkID as ID, P.fkContentTypeID as ContentTypeID, P.fkParentID as ParentID, P.ContentGUID, PL.LinkURL, P.Deleted, CASE WHEN Status = 4 THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS PendingPublish, PL.Created, PL.Changed, PL.Saved, PL.StartPublish, PL.StopPublish, P.ContentAssetsID, P.fkMasterLanguageBranchID as MasterLanguageBranchID, PL.ContentLinkGUID as ContentLinkID, PL.AutomaticLink, PL.FetchData, P.ContentType
	FROM tblContent AS P WITH (NOLOCK)
    INNER JOIN @ContentIDs as ParamIds on P.pkID = ParamIds.Id	
	LEFT JOIN tblContentLanguage AS PL ON PL.fkContentID = P.pkID
	WHERE P.fkMasterLanguageBranchID = PL.fkLanguageBranchID OR P.fkMasterLanguageBranchID IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[netFrameDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFrameDelete]
(
	@FrameID		INT,
	@ReplaceFrameID	INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
		
		IF (NOT EXISTS(SELECT pkID FROM tblFrame WHERE pkID=@ReplaceFrameID))
			SET @ReplaceFrameID=NULL
		UPDATE tblWorkPage SET fkFrameID=@ReplaceFrameID WHERE fkFrameID=@FrameID
		UPDATE tblPageLanguage SET fkFrameID=@ReplaceFrameID WHERE fkFrameID=@FrameID
		DELETE FROM tblFrame WHERE pkID=@FrameID
					
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netFrameInsert]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFrameInsert]
(
	@FrameID		INTEGER OUTPUT,
	@FrameName		NVARCHAR(100),
	@FrameDescription	NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	
	INSERT INTO tblFrame
		(FrameName,
		FrameDescription)
	VALUES
		('target="' + @FrameName + '"', 
		@FrameDescription)
	SET @FrameID =  SCOPE_IDENTITY() 
		
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netFrameList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFrameList]
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT
		pkID AS FrameID, 
		CASE
			WHEN FrameName IS NULL THEN
				N''
			ELSE
				SUBSTRING(FrameName, 9, LEN(FrameName) - 9)
		END AS FrameName,
		FrameDescription,
		'' AS FrameDescriptionLocalized,
		CONVERT(INT, SystemFrame) AS SystemFrame
	FROM
		tblFrame
	ORDER BY
		SystemFrame DESC,
		FrameName
END
GO
/****** Object:  StoredProcedure [dbo].[netFrameUpdate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netFrameUpdate]
(
	@FrameID			INT,
	@FrameName			NVARCHAR(100),
	@FrameDescription		NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	UPDATE 
		tblFrame 
	SET 
		FrameName='target="' + @FrameName + '"', 
		FrameDescription=@FrameDescription
	WHERE
		pkID=@FrameID
		
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netLanguageBranchDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netLanguageBranchDelete]
(
	@ID INT
)
AS
BEGIN
	DELETE FROM tblLanguageBranch WHERE pkID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[netLanguageBranchInsert]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netLanguageBranchInsert]
(
	@ID INT OUTPUT,
	@Name NVARCHAR(50) = NULL,
	@LanguageID NCHAR(17),
	@SortIndex INT = 0,
	@SystemIconPath NVARCHAR(255) = NULL,
	@URLSegment NVARCHAR(255) = NULL,
	@Enabled BIT,
	@ACL NVARCHAR(MAX) = NULL
)
AS
BEGIN
	INSERT INTO tblLanguageBranch
	(
		LanguageID,
		[Name],
		SortIndex,
		SystemIconPath,
		URLSegment,
		Enabled,
		ACL
	)
	VALUES
	(
		@LanguageID,
		@Name,
		@SortIndex,
		@SystemIconPath,
		@URLSegment,
		@Enabled,
		@ACL
	)
	SET @ID	=  SCOPE_IDENTITY() 
END
GO
/****** Object:  StoredProcedure [dbo].[netLanguageBranchList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netLanguageBranchList]
AS
BEGIN
	SELECT 
		pkID AS ID,
		Name,
		LanguageID,
		SortIndex,
		SystemIconPath,
		URLSegment,
		Enabled,
		ACL
	FROM 
		tblLanguageBranch
	ORDER BY 
		SortIndex
END
GO
/****** Object:  StoredProcedure [dbo].[netLanguageBranchUpdate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netLanguageBranchUpdate]
(
	@ID INT,
	@Name NVARCHAR(255) = NULL,
	@LanguageID NCHAR(17),
	@SortIndex INT,
	@SystemIconPath NVARCHAR(255) = NULL,
	@URLSegment NVARCHAR(255) = NULL,
	@Enabled BIT,
	@ACL NVARCHAR(MAX) = NULL
)
AS
BEGIN
	UPDATE
		tblLanguageBranch
	SET
		[Name] = @Name,
		LanguageID = @LanguageID,
		SortIndex = @SortIndex,
		SystemIconPath = @SystemIconPath,
		URLSegment = @URLSegment,
		Enabled = @Enabled,
		ACL = @ACL
	WHERE
		pkID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityDelete]
	@Provider NVARCHAR(255),
	@ProviderUniqueId NVARCHAR(2048)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE
	FROM tblMappedIdentity
	WHERE tblMappedIdentity.Provider = @Provider AND tblMappedIdentity.ProviderUniqueId = @ProviderUniqueId
END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityDeleteItems]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityDeleteItems]
	@ContentGuids dbo.GuidParameterTable READONLY
AS
BEGIN
	SET NOCOUNT ON;
	DELETE mi 
	FROM tblMappedIdentity mi
	INNER JOIN @ContentGuids cg ON mi.ContentGuid = cg.Id
END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityForProvider]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityForProvider]
	@Provider NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT MI.pkID AS ContentId, MI.Provider, MI.ProviderUniqueId, MI.ContentGuid, MI.ExistingContentId, MI.ExistingCustomProvider
	FROM tblMappedIdentity AS MI
	WHERE MI.Provider = @Provider
END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityGetByGuid]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityGetByGuid]
	@ContentGuids dbo.GuidParameterTable READONLY
AS
BEGIN
	SET NOCOUNT ON;
	SELECT MI.pkID AS ContentId, MI.Provider, MI.ProviderUniqueId, MI.ContentGuid, MI.ExistingContentId, MI.ExistingCustomProvider
	FROM tblMappedIdentity AS MI INNER JOIN @ContentGuids AS EI ON MI.ContentGuid = EI.Id
END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityGetById]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityGetById]
	@InternalIds dbo.ContentReferenceTable READONLY
AS
BEGIN
	SET NOCOUNT ON;
	SELECT MI.pkID AS ContentId, MI.Provider, MI.ProviderUniqueId, MI.ContentGuid, MI.ExistingContentId, MI.ExistingCustomProvider
	FROM tblMappedIdentity AS MI 
	INNER JOIN @InternalIds AS EI ON (MI.pkID = EI.ID AND MI.Provider = EI.Provider)
	UNION (SELECT MI2.pkID AS ContentId, MI2.Provider, MI2.ProviderUniqueId, MI2.ContentGuid, MI2.ExistingContentId, MI2.ExistingCustomProvider
		FROM tblMappedIdentity AS MI2
		INNER JOIN @InternalIds AS EI2 ON (MI2.ExistingContentId = EI2.ID)
		WHERE ((MI2.ExistingCustomProvider = 1 AND MI2.Provider = EI2.Provider) OR (MI2.ExistingCustomProvider IS NULL AND EI2.Provider IS NULL)))
	END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityGetOrCreate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityGetOrCreate]
	@ExternalIds dbo.UriPartsTable READONLY,
	@CreateIfMissing BIT
AS
BEGIN
	SET NOCOUNT ON;
	--Create first missing entries
	IF @CreateIfMissing = 1
	BEGIN
		MERGE tblMappedIdentity AS Target
		USING @ExternalIds AS Source
		ON (Target.Provider = Source.Host AND Target.ProviderUniqueId = Source.Path)
		WHEN NOT MATCHED BY Target THEN
			INSERT (Provider, ProviderUniqueId)
			VALUES (Source.Host, Source.Path);
	END
	SELECT MI.pkID AS ContentId, MI.Provider, MI.ProviderUniqueId, MI.ContentGuid, MI.ExistingContentId, MI.ExistingCustomProvider
	FROM tblMappedIdentity AS MI INNER JOIN @ExternalIds AS EI ON MI.ProviderUniqueId = EI.Path
	WHERE MI.Provider = EI.Host
END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityListProviders]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityListProviders]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT DISTINCT Provider
	FROM tblMappedIdentity 
END
GO
/****** Object:  StoredProcedure [dbo].[netMappedIdentityMapContent]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netMappedIdentityMapContent]
	@Provider NVARCHAR(255),
	@ProviderUniqueId NVARCHAR(2048),
	@ExistingContentId INT,
	@ExistingCustomProvider BIT = NULL,
	@ContentGuid UniqueIdentifier
AS
BEGIN
	SET NOCOUNT ON;
	--Return 1 if already exist entry
	IF EXISTS(SELECT 1 FROM tblMappedIdentity WHERE Provider=@Provider AND ProviderUniqueId = @ProviderUniqueId)
	BEGIN
		RETURN 1
	END
	INSERT INTO tblMappedIdentity(Provider, ProviderUniqueId, ContentGuid, ExistingContentId, ExistingCustomProvider) 
		VALUES(@Provider, @ProviderUniqueId, @ContentGuid, @ExistingContentId, @ExistingCustomProvider)
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessageGet]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessageGet]
	@Id	INT
AS
BEGIN
	SELECT
		pkID AS ID, Recipient, Sender, Channel, [Type], [Subject], Content, Sent, SendAt, Saved, [Read], Category
	FROM
		[tblNotificationMessage]
	WHERE pkID = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessageGetForRecipients]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessageGetForRecipients]
	@ScheduledBefore DATETIME2 = NULL,
	@Recipients dbo.StringParameterTable READONLY
AS
BEGIN
	SELECT
		pkID AS ID, Recipient, Sender, Channel, [Type], [Subject], Content, Sent, SendAt, Saved, [Read], Category
		FROM
			[tblNotificationMessage] AS M INNER JOIN @Recipients AS R ON M.Recipient = R.String
		WHERE
			Sent IS NULL AND
			(SendAt IS NULL OR
			(@ScheduledBefore IS NOT NULL AND SendAt IS NOT NULL AND @ScheduledBefore > SendAt))
					
		ORDER BY Recipient
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessageGetRecipients]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessageGetRecipients]
	@Read BIT = NULL,
	@Sent BIT = NULL
AS 
BEGIN
	SELECT Distinct(Recipient) FROM tblNotificationMessage
	WHERE 
		(@Read IS NULL OR 
			((@Read = 1 AND [Read] IS NOT NULL) OR
			(@Read = 0 AND [Read] IS NULL)))
		AND
		(@Sent IS NULL OR 
			((@Sent = 1 AND [Sent] IS NOT NULL) OR
			(@Sent = 0 AND [Sent] IS NULL)))
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessageInsert]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessageInsert]
	@Recipient NVARCHAR(255),
	@Sender NVARCHAR(255),
	@Channel NVARCHAR(50) = NULL,
	@Type NVARCHAR(50) = NULL,
	@Subject NVARCHAR(255) = NULL,
	@Content NVARCHAR(MAX) = NULL,
	@Saved DATETIME2,
	@Sent DATETIME2 = NULL,
	@SendAt DATETIME2 = NULL,
	@Category NVARCHAR(255) = NULL
AS
BEGIN
	INSERT INTO tblNotificationMessage(Recipient, Sender, Channel, Type, Subject, Content, SendAt, Saved, Sent ,Category)
	VALUES(@Recipient, @Sender, @Channel, @Type, @Subject, @Content, @SendAt, @Saved, @Sent, @Category)
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessageList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessageList]
	@Recipient NVARCHAR(255) = NULL,
	@Channel NVARCHAR(50) = NULL,
	@Category NVARCHAR(255) = NULL,
	@Read BIT = NULL,
	@Sent BIT = NULL,
	@StartIndex	INT,
	@MaxCount	INT
AS
BEGIN
	DECLARE @Ids AS TABLE([RowNr] [int] IDENTITY(0,1), [ID] [bigint] NOT NULL)
	INSERT INTO @Ids
	SELECT pkID
	FROM [tblNotificationMessage]
	WHERE
		((@Recipient IS NULL) OR (@Recipient = Recipient))
		AND
		((@Channel IS NULL) OR (@Channel = Channel))
		AND
		((@Category IS NULL) OR (Category LIKE @Category + '%'))
		AND
		(@Read IS NULL OR 
			((@Read = 1 AND [Read] IS NOT NULL) OR
			(@Read = 0 AND [Read] IS NULL)))
		AND
		(@Sent IS NULL OR 
			((@Sent = 1 AND [Sent] IS NOT NULL) OR
			(@Sent = 0 AND [Sent] IS NULL)))
	ORDER BY Saved DESC
	DECLARE @TotalCount INT = (SELECT COUNT(*) FROM @Ids)
 
	SELECT TOP(@MaxCount) pkID AS ID, [Recipient], [Sender], [Channel], [Type], [Subject], [Content], [Sent], [SendAt], [Saved], [Read], [Category], @TotalCount AS 'TotalCount'
	FROM [tblNotificationMessage] nm
	JOIN @Ids ids ON nm.[pkID] = ids.[ID]
	WHERE ids.RowNr >= @StartIndex
	ORDER BY nm.[Saved] DESC, nm.[pkID] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessagesDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessagesDelete]
	@MessageIDs dbo.IDTable READONLY
AS
BEGIN
	DELETE M
	FROM [tblNotificationMessage] AS M INNER JOIN @MessageIDs AS IDS ON M.pkID = IDS.ID
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessagesRead]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessagesRead]
	@MessageIDs dbo.IDTable READONLY,
	@Read DATETIME2
AS
BEGIN
	UPDATE M SET [Read] = @Read
	FROM [tblNotificationMessage] AS M INNER JOIN @MessageIDs AS IDS ON M.pkID = IDS.ID
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessagesSent]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessagesSent]
	@MessageIDs dbo.IDTable READONLY,
	@Sent DATETIME2
AS
BEGIN
	UPDATE M SET Sent = @Sent
	FROM [tblNotificationMessage] AS M INNER JOIN @MessageIDs AS IDS ON M.pkID = IDS.ID
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationMessagesTruncate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationMessagesTruncate]
(	
	@OlderThan	DATETIME2,
	@MaxRows BIGINT = NULL
)
AS
BEGIN
	IF (@MaxRows IS NOT NULL)
	BEGIN
		DELETE TOP(@MaxRows) FROM [tblNotificationMessage]
		WHERE Saved < @OlderThan
	END
	ELSE
	BEGIN
		DELETE FROM [tblNotificationMessage] 
		WHERE Saved < @OlderThan
	END
	SELECT @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationSubscriptionClearSubscription]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationSubscriptionClearSubscription]
	@SubscriptionKey [nvarchar](255)
AS
BEGIN
	DECLARE @key [nvarchar](256) = @SubscriptionKey + CASE SUBSTRING(@SubscriptionKey, LEN(@SubscriptionKey), 1) WHEN N'/' THEN N'' ELSE N'/' END
	DELETE FROM [dbo].[tblNotificationSubscription] WHERE SubscriptionKey LIKE @key + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationSubscriptionClearUser]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationSubscriptionClearUser]
	@UserName [nvarchar](255)
AS
BEGIN
	DELETE FROM [dbo].[tblNotificationSubscription] WHERE UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationSubscriptionListByKey]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationSubscriptionListByKey]
	@SubscriptionKey [nvarchar](255),
	@SubscriptionKeyMatchMode INT = 0		-- Exact = 0, Before = 1, After = 2
AS
BEGIN 
	DECLARE @key [nvarchar](256) = @SubscriptionKey + CASE SUBSTRING(@SubscriptionKey, LEN(@SubscriptionKey), 1) WHEN N'/' THEN N'' ELSE N'/' END
	IF @SubscriptionKeyMatchMode = 1 
		SELECT [pkID], [UserName], [SubscriptionKey] FROM [dbo].[tblNotificationSubscription] WHERE Active = 1 AND (SubscriptionKey = @key OR @key LIKE SubscriptionKey + '%')
	ELSE IF @SubscriptionKeyMatchMode = 2 
		SELECT [pkID], [UserName], [SubscriptionKey] FROM [dbo].[tblNotificationSubscription] WHERE Active = 1 AND (SubscriptionKey = @key OR SubscriptionKey LIKE @key + '%')
	ELSE
		SELECT [pkID], [UserName], [SubscriptionKey] FROM [dbo].[tblNotificationSubscription] WHERE Active = 1 AND SubscriptionKey = @key
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationSubscriptionListByUser]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationSubscriptionListByUser]
	@UserName [nvarchar](255)
AS
BEGIN 
	SELECT [pkID], [UserName], [SubscriptionKey] FROM [dbo].[tblNotificationSubscription] WHERE Active = 1 AND UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationSubscriptionSubscribe]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationSubscriptionSubscribe]
	@UserName [nvarchar](255),
	@SubscriptionKey [nvarchar](255)
AS
BEGIN
	DECLARE @key [nvarchar](256) = @SubscriptionKey + CASE SUBSTRING(@SubscriptionKey, LEN(@SubscriptionKey), 1) WHEN N'/' THEN N'' ELSE N'/' END
	DECLARE @SubscriptionCount INT 
	SELECT @SubscriptionCount = COUNT(*) FROM [dbo].[tblNotificationSubscription] WHERE UserName = @UserName AND SubscriptionKey = @key AND Active = 1
	IF (@SubscriptionCount > 0)
	BEGIN
		SELECT 0
		RETURN
	END
	SELECT @SubscriptionCount = COUNT(*) FROM [dbo].[tblNotificationSubscription] WHERE UserName = @UserName AND SubscriptionKey = @key AND Active = 0
	IF (@SubscriptionCount > 0)
		UPDATE [dbo].[tblNotificationSubscription] SET Active = 1 WHERE UserName = @UserName AND SubscriptionKey = @key
	ELSE 
		INSERT INTO [dbo].[tblNotificationSubscription](UserName, SubscriptionKey) VALUES (@UserName, @key)	
	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[netNotificationSubscriptionUnsubscribe]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netNotificationSubscriptionUnsubscribe]
	@UserName [nvarchar](255),
	@SubscriptionKey [nvarchar](255)
AS
BEGIN
	DECLARE @key [nvarchar](256) = @SubscriptionKey + CASE SUBSTRING(@SubscriptionKey, LEN(@SubscriptionKey), 1) WHEN N'/' THEN N'' ELSE N'/' END
	DECLARE @SubscriptionCount INT = (SELECT COUNT(*) FROM [dbo].[tblNotificationSubscription] WHERE UserName = @UserName AND SubscriptionKey = @key AND Active = 1)
	DECLARE @Result INT = CASE @SubscriptionCount WHEN 0 THEN 0 ELSE 1 END
	IF (@SubscriptionCount > 0)
		UPDATE [dbo].[tblNotificationSubscription] SET Active = 0 WHERE UserName = @UserName AND SubscriptionKey = @key
	SELECT @Result
END
GO
/****** Object:  StoredProcedure [dbo].[netPageChangeMasterLanguage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageChangeMasterLanguage]
(
	@PageID						INT,
	@NewMasterLanguageBranchID	INT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @OldMasterLanguageBranchID INT;
	DECLARE @LastNewMasterLanguageVersion INT;
	DECLARE @LastOldMasterLanguageVersion INT;
	SET @OldMasterLanguageBranchID = (SELECT fkMasterLanguageBranchID FROM tblPage WHERE pkID = @PageID);
	IF(@NewMasterLanguageBranchID = @OldMasterLanguageBranchID)
		RETURN -1;
	SET @LastNewMasterLanguageVersion = (SELECT [Version] FROM tblPageLanguage WHERE fkPageID = @PageID AND fkLanguageBranchID = @NewMasterLanguageBranchID AND PendingPublish = 0)
	IF (@LastNewMasterLanguageVersion IS NULL)
		RETURN -1;
	SET @LastOldMasterLanguageVersion = (SELECT PublishedVersion FROM tblPage WHERE pkID = @PageID)
	IF (@LastOldMasterLanguageVersion IS NULL)
		RETURN -1
	
	--Do the actual change of master language branch
	UPDATE
		tblPage
	SET
		tblPage.fkMasterLanguageBranchID = @NewMasterLanguageBranchID
	WHERE
		pkID = @PageID
	--Update tblProperty for common properties
	UPDATE
		tblProperty
	SET
		fkLanguageBranchID = @NewMasterLanguageBranchID
	FROM
		tblProperty
	INNER JOIN
		tblPageDefinition
	ON
		tblProperty.fkPageDefinitionID = tblPageDefinition.pkID
	WHERE
		LanguageSpecific < 3
	AND
		fkPageID = @PageID
	--Update tblCategoryPage for builtin and common categories
	UPDATE
		tblCategoryPage
	SET
		fkLanguageBranchID = @NewMasterLanguageBranchID
	FROM
		tblCategoryPage
	LEFT JOIN
		tblPageDefinition
	ON
		tblCategoryPage.CategoryType = tblPageDefinition.pkID
	WHERE
		(LanguageSpecific < 3
	OR
		LanguageSpecific IS NULL)
	AND
		fkPageID = @PageID
	--Move work categories and properties between the last versions of the languages
	UPDATE
		tblWorkProperty
	SET
		fkWorkPageID = @LastNewMasterLanguageVersion
	FROM
		tblWorkProperty
	INNER JOIN
		tblPageDefinition
	ON
		tblWorkProperty.fkPageDefinitionID = tblPageDefinition.pkID
	WHERE
		LanguageSpecific < 3
	AND
		fkWorkPageID = @LastOldMasterLanguageVersion
	UPDATE
		tblWorkCategory
	SET
		fkWorkPageID = @LastNewMasterLanguageVersion
	FROM
		tblWorkCategory
	LEFT JOIN
		tblPageDefinition
	ON
		tblWorkCategory.CategoryType = tblPageDefinition.pkID
	WHERE
		(LanguageSpecific < 3
	OR
		LanguageSpecific IS NULL)
	AND
		fkWorkPageID = @LastOldMasterLanguageVersion
	--Remove any remaining common properties for old master language versions
	DELETE FROM
		tblWorkProperty
	FROM
		tblWorkProperty
	INNER JOIN
		tblPageDefinition
	ON
		tblWorkProperty.fkPageDefinitionID = tblPageDefinition.pkID
	WHERE
		LanguageSpecific < 3
	AND
		fkWorkPageID IN (SELECT pkID FROM tblWorkPage WHERE fkPageID = @PageID AND fkLanguageBranchID = @OldMasterLanguageBranchID)
	--Remove any remaining common categories for old master language versions
	DELETE FROM
		tblWorkCategory
	FROM
		tblWorkCategory
	LEFT JOIN
		tblPageDefinition
	ON
		tblWorkCategory.CategoryType = tblPageDefinition.pkID
	WHERE
		(LanguageSpecific < 3
	OR
		LanguageSpecific IS NULL)
	AND
		fkWorkPageID IN (SELECT pkID FROM tblWorkPage WHERE fkPageID = @PageID AND fkLanguageBranchID = @OldMasterLanguageBranchID)
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netPageCountDescendants]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageCountDescendants]
(
	@PageID INT = NULL
)
AS
BEGIN
	DECLARE @pageCount INT
	SET NOCOUNT ON
	IF @PageID IS NULL
	BEGIN
		SET @pageCount =
			(SELECT COUNT(*) AS PageCount
			 FROM tblPage)
	END
	ELSE
	BEGIN
		SET @pageCount =
			(SELECT COUNT(*) AS PageCount
			 FROM tblPage
			 INNER JOIN tblTree ON tblTree.fkChildID=tblPage.pkID
			 WHERE tblTree.fkParentID=@PageID)
	END
	RETURN @pageCount
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionConvertList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionConvertList]
(
	@PageDefinitionID INT
)
AS
BEGIN
	SELECT 
			fkPageDefinitionID,
			fkPageID,
			NULL AS fkWorkPageID,
			fkLanguageBranchID,
			NULL AS fkUserPropertyID,
			ScopeName,
			CONVERT(INT,Boolean) AS Boolean,
			Number AS IntNumber,
			FloatNumber,
			PageType,
			LinkGuid,
			PageLink,
			Date AS DateValue,
			String,
			LongString,
			CONVERT(INT,0) AS DeleteProperty
	FROM tblProperty 
	WHERE fkPageDefinitionID=@PageDefinitionID
	UNION ALL
	
	SELECT 
			fkPageDefinitionID,
			NULL AS fkPageID,
			fkWorkPageID,
			NULL AS fkLanguageBranchID,
			NULL AS fkUserPropertyID,
			ScopeName,
			CONVERT(INT,Boolean) AS Boolean,
			Number AS IntNumber,
			FloatNumber,
			PageType,
			LinkGuid,
			PageLink,
			Date AS DateValue,
			String,
			LongString,
			CONVERT(INT,0) AS DeleteProperty
	FROM tblWorkProperty 
	WHERE fkPageDefinitionID=@PageDefinitionID
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionConvertSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionConvertSave]
(
	@PageDefinitionID INT,
	@PageID INT = NULL,
	@WorkPageID INT = NULL,
	@LanguageBranchID INT = NULL,
	@Type INT,
	@ScopeName NVARCHAR(450) = NULL,
	@Boolean BIT = NULL,
	@IntNumber INT = NULL,
	@FloatNumber FLOAT = NULL,
	@PageType INT = NULL,
	@LinkGuid uniqueidentifier = NULL,
	@PageReference INT = NULL,
	@DateValue DATETIME = NULL,
	@String NVARCHAR(450) = NULL,
	@LongString NVARCHAR(MAX) = NULL,
	@DeleteProperty BIT = 0
)
AS
BEGIN
	IF NOT @WorkPageID IS NULL
	BEGIN		
		IF @DeleteProperty=1 OR (@Type=0 AND @Boolean=0) OR @Type > 7
			DELETE FROM tblWorkProperty 
			WHERE fkPageDefinitionID=@PageDefinitionID AND fkWorkPageID=@WorkPageID AND ((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
		ELSE
		BEGIN
			UPDATE tblWorkProperty
				SET
					Boolean=@Boolean,
					Number=@IntNumber,
					FloatNumber=@FloatNumber,
					PageType=@PageType,
					LinkGuid = @LinkGuid,
					PageLink=@PageReference,
					Date=@DateValue,
					String=@String,
					LongString=@LongString
			WHERE fkPageDefinitionID=@PageDefinitionID AND fkWorkPageID=@WorkPageID AND ((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
		END
	END
	ELSE
	BEGIN
		IF @DeleteProperty=1 OR (@Type=0 AND @Boolean=0) OR @Type > 7
			DELETE FROM tblProperty 
			WHERE fkPageDefinitionID=@PageDefinitionID AND fkPageID=@PageID AND fkLanguageBranchID = @LanguageBranchID AND ((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
		ELSE
		BEGIN
			UPDATE tblProperty
				SET
					Boolean=@Boolean,
					Number=@IntNumber,
					FloatNumber=@FloatNumber,
					PageType=@PageType,
					PageLink=@PageReference,
					LinkGuid = @LinkGuid,
					Date=@DateValue,
					String=@String,
					LongString=@LongString
			WHERE fkPageDefinitionID=@PageDefinitionID AND fkPageID=@PageID AND fkLanguageBranchID = @LanguageBranchID AND ((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionDefault]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionDefault]
(
	@PageDefinitionID	INT,
	@Boolean			BIT				= NULL,
	@Number				INT				= NULL,
	@FloatNumber		FLOAT			= NULL,
	@PageType			INT				= NULL,
	@PageReference		INT				= NULL,
	@Date				DATETIME		= NULL,
	@String				NVARCHAR(450)	= NULL,
	@LongString			NVARCHAR(MAX)	= NULL
)
AS
BEGIN
	SET NOCOUNT ON
	
	DELETE FROM tblPropertyDefault WHERE fkPageDefinitionID=@PageDefinitionID
	IF (@Boolean IS NULL AND @Number IS NULL AND @FloatNumber IS NULL AND @PageType IS NULL AND 
		@PageReference IS NULL AND @Date IS NULL AND @String IS NULL AND @LongString IS NULL)
		RETURN
	
	IF (@Boolean IS NULL)
		SET @Boolean=0
		
	INSERT INTO tblPropertyDefault 
		(fkPageDefinitionID, Boolean, Number, FloatNumber, PageType, PageLink, Date, String, LongString) 
	VALUES
		(@PageDefinitionID, @Boolean, @Number, @FloatNumber, @PageType, @PageReference, @Date, @String, @LongString)
	RETURN 
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionDynamicCheck]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionDynamicCheck]
(
	@PageDefinitionID	INT
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT  DISTINCT
		tblProperty.fkPageID as ContentID, 
		tblLanguageBranch.Name,
		tblLanguageBranch.LanguageID AS LanguageBranch,
		tblLanguageBranch.Name AS LanguageBranchName,
		0 AS WorkID
	FROM 
		tblProperty
	INNER JOIN
		tblPage ON tblPage.pkID=tblProperty.fkPageID
	INNER JOIN
		tblLanguageBranch ON tblLanguageBranch.pkID=tblProperty.fkLanguageBranchID
	WHERE
		tblProperty.fkPageDefinitionID=@PageDefinitionID AND
		tblProperty.fkLanguageBranchID<>tblPage.fkMasterLanguageBranchID
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionGet]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionGet]
(
	@PageDefinitionID INT
)
AS
BEGIN
	SELECT tblPageDefinition.pkID AS ID,
		fkPageTypeID AS PageTypeID,
		COALESCE(fkPageDefinitionTypeID,tblPageDefinition.Property) AS PageDefinitionTypeID,
		tblPageDefinition.Name,
		COALESCE(tblPageDefinitionType.Property,tblPageDefinition.Property) AS Type,
		CONVERT(INT,Required) AS Required,
		Advanced,
		CONVERT(INT,Searchable) AS Searchable,
		DefaultValueType,
		EditCaption,
		HelpText,
		ObjectProgID,
		LongStringSettings,
		SettingsID,
		CONVERT(INT,Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		PageType,
		PageLink,
		Date AS DateValue,
		String,
		LongString,
		FieldOrder,
		LanguageSpecific,
		DisplayEditUI,
		ExistsOnModel,
        EditorHint
	FROM tblPageDefinition
	LEFT JOIN tblPropertyDefault ON tblPropertyDefault.fkPageDefinitionID=tblPageDefinition.pkID
	LEFT JOIN tblPageDefinitionType ON tblPageDefinitionType.pkID=tblPageDefinition.fkPageDefinitionTypeID
	WHERE tblPageDefinition.pkID = @PageDefinitionID
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionList]
(
	@PageTypeID INT = NULL
)
AS
BEGIN
	SELECT tblPageDefinition.pkID AS ID,
		fkPageTypeID AS PageTypeID,
		COALESCE(fkPageDefinitionTypeID,tblPageDefinition.Property) AS PageDefinitionTypeID,
		tblPageDefinition.Name,
		COALESCE(tblPageDefinitionType.Property,tblPageDefinition.Property) AS Type,
		CONVERT(INT,Required) AS Required,
		Advanced,
		CONVERT(INT,Searchable) AS Searchable,
		DefaultValueType,
		EditCaption,
		HelpText,
		ObjectProgID,
		LongStringSettings,
		SettingsID,
		CONVERT(INT,Boolean) AS Boolean,
		Number AS IntNumber,
		FloatNumber,
		PageType,
		PageLink,
		Date AS DateValue,
		String,
		LongString,
		NULL AS OldType,
		FieldOrder,
		LanguageSpecific,
		DisplayEditUI,
		ExistsOnModel,
        EditorHint
	FROM tblPageDefinition
	LEFT JOIN tblPropertyDefault ON tblPropertyDefault.fkPageDefinitionID=tblPageDefinition.pkID
	LEFT JOIN tblPageDefinitionType ON tblPageDefinitionType.pkID=tblPageDefinition.fkPageDefinitionTypeID
	WHERE (fkPageTypeID = @PageTypeID) OR (fkPageTypeID IS NULL AND @PageTypeID IS NULL)
	ORDER BY FieldOrder,tblPageDefinition.pkID
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionSave]
(
	@PageDefinitionID      INT OUTPUT,
	@PageTypeID            INT,
	@Name                  NVARCHAR(100),
	@PageDefinitionTypeID  INT,
	@Required              BIT = NULL,
	@Advanced              INT = NULL,
	@Searchable            BIT = NULL,
	@DefaultValueType      INT = NULL,
	@EditCaption           NVARCHAR(255) = NULL,
	@HelpText              NVARCHAR(2000) = NULL,
	@ObjectProgID          NVARCHAR(255) = NULL,
	@LongStringSettings    INT = NULL,
	@SettingsID            UNIQUEIDENTIFIER = NULL,
	@FieldOrder            INT = NULL,
	@Type                  INT = NULL OUTPUT,
	@OldType               INT = NULL OUTPUT,
	@LanguageSpecific      INT = 0,
	@DisplayEditUI         BIT = NULL,
	@ExistsOnModel         BIT = 0,
    @EditorHint               NVARCHAR(255) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	SELECT @OldType = tblPageDefinitionType.Property 
	FROM tblPageDefinition
	INNER JOIN tblPageDefinitionType ON tblPageDefinitionType.pkID=tblPageDefinition.fkPageDefinitionTypeID
	WHERE tblPageDefinition.pkID=@PageDefinitionID
	SELECT @Type = Property FROM tblPageDefinitionType WHERE pkID=@PageDefinitionTypeID
	IF @Type IS NULL
		RAISERROR('Cannot find data type',16,1)
	IF @PageTypeID=0
		SET @PageTypeID = NULL
	IF @PageDefinitionID = 0 AND @ExistsOnModel = 1
	BEGIN
		SET @PageDefinitionID = ISNULL((SELECT pkID FROM tblPageDefinition where Name = @Name AND fkPageTypeID = @PageTypeID), @PageDefinitionID)
	END
	IF @PageDefinitionID=0
	BEGIN	
		INSERT INTO tblPageDefinition
		(
			fkPageTypeID,
			fkPageDefinitionTypeID,
			Name,
			Property,
			Required,
			Advanced,
			Searchable,
			DefaultValueType,
			EditCaption,
			HelpText,
			ObjectProgID,
			LongStringSettings,
			SettingsID,
			FieldOrder,
			LanguageSpecific,
			DisplayEditUI,
			ExistsOnModel,
            EditorHint
		)
		VALUES
		(
			@PageTypeID,
			@PageDefinitionTypeID,
			@Name,
			@Type,
			@Required,
			@Advanced,
			@Searchable,
			@DefaultValueType,
			@EditCaption,
			@HelpText,
			@ObjectProgID,
			@LongStringSettings,
			@SettingsID,
			@FieldOrder,
			@LanguageSpecific,
			@DisplayEditUI,
			@ExistsOnModel,
            @EditorHint
		)
		SET @PageDefinitionID =  SCOPE_IDENTITY() 
	END
	ELSE
	BEGIN
		UPDATE tblPageDefinition SET
			Name 		= @Name,
			fkPageDefinitionTypeID	= @PageDefinitionTypeID,
			Property 	= @Type,
			Required 	= @Required,
			Advanced 	= @Advanced,
			Searchable 	= @Searchable,
			DefaultValueType = @DefaultValueType,
			EditCaption 	= @EditCaption,
			HelpText 	= @HelpText,
			ObjectProgID 	= @ObjectProgID,
			LongStringSettings = @LongStringSettings,
			SettingsID = @SettingsID,
			LanguageSpecific = @LanguageSpecific,
			FieldOrder = @FieldOrder,
			DisplayEditUI = @DisplayEditUI,
			ExistsOnModel = @ExistsOnModel,
            EditorHint = @EditorHint
		WHERE pkID=@PageDefinitionID
	END
	DELETE FROM tblPropertyDefault WHERE fkPageDefinitionID=@PageDefinitionID
	IF @LanguageSpecific<3
	BEGIN
		/* NOTE: Here we take into consideration that language neutral dynamic properties are always stored on language 
			with id 1 (which perhaps should be changed and in that case the special handling here could be removed). */
		IF @PageTypeID IS NULL
		BEGIN
			DELETE tblProperty
			FROM tblProperty
			INNER JOIN tblPage ON tblPage.pkID=tblProperty.fkPageID
			WHERE fkPageDefinitionID=@PageDefinitionID AND tblProperty.fkLanguageBranchID<>1
		END
		ELSE
		BEGIN
			DELETE tblProperty
			FROM tblProperty
			INNER JOIN tblPage ON tblPage.pkID=tblProperty.fkPageID
			WHERE fkPageDefinitionID=@PageDefinitionID AND tblProperty.fkLanguageBranchID<>tblPage.fkMasterLanguageBranchID
		END
		DELETE tblWorkProperty
		FROM tblWorkProperty
		INNER JOIN tblWorkPage ON tblWorkProperty.fkWorkPageID=tblWorkPage.pkID
		INNER JOIN tblPage ON tblPage.pkID=tblWorkPage.fkPageID
		WHERE fkPageDefinitionID=@PageDefinitionID AND tblWorkPage.fkLanguageBranchID<>tblPage.fkMasterLanguageBranchID
		DELETE 
			tblCategoryPage
		FROM
			tblCategoryPage
		INNER JOIN
			tblPage
		ON
			tblPage.pkID = tblCategoryPage.fkPageID
		WHERE
			CategoryType = @PageDefinitionID
		AND
			tblCategoryPage.fkLanguageBranchID <> tblPage.fkMasterLanguageBranchID
		DELETE 
			tblWorkCategory
		FROM
			tblWorkCategory
		INNER JOIN 
			tblWorkPage
		ON
			tblWorkCategory.fkWorkPageID = tblWorkPage.pkID
		INNER JOIN
			tblPage
		ON
			tblPage.pkID = tblWorkPage.fkPageID
		WHERE
			CategoryType = @PageDefinitionID
		AND
			tblWorkPage.fkLanguageBranchID <> tblPage.fkMasterLanguageBranchID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionTypeDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionTypeDelete]
(
	@ID INT
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT DISTINCT pkID
	FROM tblPageDefinition 
	WHERE fkPageDefinitionTypeID=@ID
	IF (@@ROWCOUNT <> 0)
		RETURN
	
	IF @ID>=1000
		DELETE FROM tblPageDefinitionType WHERE pkID=@ID
	ELSE
		RAISERROR('Cannot delete system types',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDefinitionWithContentType]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDefinitionWithContentType]
(
	@ContentTypeID	UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT count(*) FROM tblPageDefinition INNER JOIN 
	tblPageDefinitionType ON tblPageDefinition.fkPageDefinitionTypeID = tblPageDefinitionType.pkID
	WHERE
	fkPageTypeGUID = @ContentTypeID
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDynamicBlockDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDynamicBlockDelete]
(
	@PageID INT,
	@WorkPageID INT,
	@DynamicBlock NVARCHAR(450)
)
AS
BEGIN
	SET NOCOUNT ON
	IF (@WorkPageID IS NULL OR @WorkPageID=0)
		DELETE
		FROM 
			tblProperty
		WHERE 
			fkPageID=@PageID AND ScopeName LIKE '%' + @DynamicBlock + '%'
	ELSE
		DELETE
		FROM 
			tblWorkProperty
		WHERE 
			fkWorkPageID=@WorkPageID AND ScopeName LIKE '%' + @DynamicBlock + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[netPageDynamicBlockList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageDynamicBlockList]
(
	@PageID INT,
	@WorkPageID INT
)
AS
BEGIN
	SET NOCOUNT ON
	IF (@WorkPageID IS NULL OR @WorkPageID=0)
		SELECT 
			ScopeName
		FROM 
			tblProperty
		WHERE 
			fkPageID=@PageID AND ScopeName LIKE '%.D:%'
	ELSE
		SELECT 
			ScopeName
		FROM 
			tblWorkProperty
		WHERE 
			fkWorkPageID=@WorkPageID AND ScopeName LIKE '%.D:%'
END
GO
/****** Object:  StoredProcedure [dbo].[netPageLanguageSettingDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageLanguageSettingDelete]
(
	@PageID			INT,
	@LanguageBranch	NCHAR(17)
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @LangBranchID INT
	SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID = @LanguageBranch
	IF @LangBranchID IS NULL
	BEGIN
		RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		RETURN 0
	END
	DELETE FROM tblPageLanguageSetting WHERE fkPageID=@PageID AND fkLanguageBranchID=@LangBranchID
	
END
GO
/****** Object:  StoredProcedure [dbo].[netPageLanguageSettingList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageLanguageSettingList]
@PageID INT
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT	fkPageID,
			RTRIM(Branch.LanguageID) as LanguageBranch,
			RTRIM(ReplacementBranch.LanguageID) as ReplacementBranch,
			LanguageBranchFallback,
			Active
	FROM tblPageLanguageSetting
	INNER JOIN tblLanguageBranch AS Branch ON Branch.pkID = tblPageLanguageSetting.fkLanguageBranchID
	LEFT JOIN tblLanguageBranch AS ReplacementBranch ON ReplacementBranch.pkID = tblPageLanguageSetting.fkReplacementBranchID
	WHERE fkPageID=@PageID
END
GO
/****** Object:  StoredProcedure [dbo].[netPageLanguageSettingListTree]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageLanguageSettingListTree]
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT
	    fkPageID,
        RTRIM(Branch.LanguageID) as LanguageBranch,
        RTRIM(ReplacementBranch.LanguageID) as ReplacementBranch,
        LanguageBranchFallback,
        Active
	FROM 
	    tblPageLanguageSetting
	INNER JOIN 
	    tblLanguageBranch AS Branch 
	ON 
	    Branch.pkID = tblPageLanguageSetting.fkLanguageBranchID
	LEFT JOIN 
	    tblLanguageBranch AS ReplacementBranch 
	ON 
	    ReplacementBranch.pkID = tblPageLanguageSetting.fkReplacementBranchID
	ORDER BY 
	    fkPageID ASC
END
GO
/****** Object:  StoredProcedure [dbo].[netPageLanguageSettingUpdate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageLanguageSettingUpdate]
(
	@PageID				INT,
	@LanguageBranch		NCHAR(17),
	@ReplacementBranch	NCHAR(17) = NULL,
	@LanguageBranchFallback NVARCHAR(1000) = NULL,
	@Active				BIT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @LangBranchID INT
	DECLARE @ReplacementBranchID INT
	SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID = @LanguageBranch
	IF @LangBranchID IS NULL
	BEGIN
		RAISERROR('Language branch "%s" is not defined',16,1, @LanguageBranch)
		RETURN 0
	END
	IF NOT @ReplacementBranch IS NULL
	BEGIN
		SELECT @ReplacementBranchID = pkID FROM tblLanguageBranch WHERE LanguageID = @ReplacementBranch
		IF @ReplacementBranchID IS NULL
		BEGIN
			RAISERROR('Replacement language branch "%s" is not defined',16,1, @ReplacementBranch)
			RETURN 0
		END
	END
	
	IF EXISTS(SELECT * FROM tblPageLanguageSetting WHERE fkPageID=@PageID AND fkLanguageBranchID=@LangBranchID)
		UPDATE tblPageLanguageSetting SET
			fkReplacementBranchID	= @ReplacementBranchID,
			LanguageBranchFallback  = @LanguageBranchFallback,
			Active					= @Active
		WHERE fkPageID=@PageID AND fkLanguageBranchID=@LangBranchID
	ELSE
		INSERT INTO tblPageLanguageSetting(
				fkPageID,
				fkLanguageBranchID,
				fkReplacementBranchID,
				LanguageBranchFallback,
				Active)
		VALUES(
				@PageID, 
				@LangBranchID,
				@ReplacementBranchID,
				@LanguageBranchFallback,
				@Active
			)
		
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netPageListAll]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageListAll]
(
	@PageID INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	IF @PageID IS NULL
	BEGIN
		SELECT tblPage.pkID as "PageID", tblPage.fkParentID AS "ParentID", tblPage.ContentType
		FROM tblPage
	END
	ELSE
	BEGIN
		SELECT tblPage.pkID as "PageID", tblPage.fkParentID AS "ParentID", tblPage.ContentType
		FROM tblPage
		INNER JOIN tblTree ON tblTree.fkChildID=tblPage.pkID
		WHERE tblTree.fkParentID=@PageID
		ORDER BY NestingLevel DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netPageListByLanguage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageListByLanguage]
(
	@LanguageID nchar(17),
	@PageID INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	IF @PageID IS NULL
	BEGIN
		SELECT tblPageLanguage.fkPageID as "PageID", tblPage.ContentType
		FROM tblPageLanguage
		INNER JOIN tblPage on tblPage.pkID = tblPageLanguage.fkPageID
		INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkID=tblPageLanguage.fkLanguageBranchID
		WHERE tblLanguageBranch.LanguageID = @LanguageID
	END
	ELSE
	BEGIN
		SELECT tblPageLanguage.fkPageID as "PageID", tblPage.ContentType
		FROM tblPageLanguage
		INNER JOIN tblPage on tblPage.pkID = tblPageLanguage.fkPageID
		INNER JOIN tblTree ON tblTree.fkChildID=tblPageLanguage.fkPageID
		INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkID=tblPageLanguage.fkLanguageBranchID
		WHERE tblTree.fkParentID=@PageID AND
		tblLanguageBranch.LanguageID = @LanguageID
		ORDER BY NestingLevel DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netPagePath]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[netPagePath]
(
	@PageID INT
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT PagePath FROM tblPage where tblPage.pkID = @PageID
END
GO
/****** Object:  StoredProcedure [dbo].[netPagesChangedAfter]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPagesChangedAfter]
( 
	@RootID INT,
	@ChangedAfter DATETIME,
	@MaxHits INT,
	@StopPublish DATETIME
)
AS
BEGIN
	SET NOCOUNT ON
    SET @MaxHits = @MaxHits + 1 -- Return one more to determine if there are more pages to fetch (gets MaxHits + 1)
    SET ROWCOUNT @MaxHits
    
	SELECT 
	    tblPageLanguage.fkPageID AS PageID,
		RTRIM(tblLanguageBranch.LanguageID) AS LanguageID
	FROM
		tblPageLanguage
	INNER JOIN
		tblTree
	ON
		tblPageLanguage.fkPageID = tblTree.fkChildID AND (tblTree.fkParentID = @RootID OR (tblTree.fkChildID = @RootID AND tblTree.NestingLevel = 1))
	INNER JOIN
		tblLanguageBranch
	ON
		tblPageLanguage.fkLanguageBranchID = tblLanguageBranch.pkID
	WHERE
		(tblPageLanguage.Changed > @ChangedAfter OR tblPageLanguage.StartPublish > @ChangedAfter) AND
		(tblPageLanguage.StopPublish is NULL OR tblPageLanguage.StopPublish > @StopPublish) AND
		tblPageLanguage.PendingPublish=0
	ORDER BY
		tblTree.NestingLevel,
		tblPageLanguage.fkPageID,
		tblPageLanguage.Changed DESC
		
	SET ROWCOUNT 0
END
GO
/****** Object:  StoredProcedure [dbo].[netPageTypeCheckUsage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageTypeCheckUsage]
(
	@PageTypeID		INT,
	@OnlyPublished	BIT = 0
)
AS
BEGIN
	SET NOCOUNT ON
	IF (@OnlyPublished = 1)
	BEGIN
		SELECT TOP 1
			tblPage.pkID as PageID, 
			0 AS WorkID
		FROM 
			tblPage
		WHERE
			tblPage.fkPageTypeID = @PageTypeID
	END
	ELSE
	BEGIN
		SELECT TOP 1
			tblPage.pkID as PageID, 
			tblWorkPage.pkID as WorkID
		FROM 
			tblWorkPage
		INNER JOIN 
			tblPage ON tblWorkPage.fkPageID = tblPage.pkID
		WHERE
			tblPage.fkPageTypeID = @PageTypeID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netPageTypeGetUsage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPageTypeGetUsage]
(
	@PageTypeID		INT,
	@OnlyPublished	BIT = 0
)
AS
BEGIN
	SET NOCOUNT ON
	IF (@OnlyPublished = 1)
	BEGIN
		SELECT DISTINCT
			tblPage.pkID as PageID, 
			0 AS WorkID,
			tblPageLanguage.Name,
			tblLanguageBranch.LanguageID AS LanguageBranch
		FROM 
			tblPage
		INNER JOIN 
			tblPageLanguage ON tblPage.pkID=tblPageLanguage.fkPageID
		INNER JOIN
			tblLanguageBranch ON tblLanguageBranch.pkID=tblPageLanguage.fkLanguageBranchID
		WHERE
			tblPage.fkPageTypeID = @PageTypeID
	END
	ELSE
	BEGIN
		SELECT DISTINCT
			tblPage.pkID as PageID, 
			tblWorkPage.pkID as WorkID,
			tblWorkPage.Name,
			tblLanguageBranch.LanguageID AS LanguageBranch
		FROM 
			tblWorkPage
		INNER JOIN 
			tblPage ON tblWorkPage.fkPageID = tblPage.pkID
		INNER JOIN 
			tblPageLanguage ON tblWorkPage.fkPageID=tblPageLanguage.fkPageID 
		INNER JOIN
			tblLanguageBranch ON tblLanguageBranch.pkID=tblWorkPage.fkLanguageBranchID
		WHERE
			tblPage.fkPageTypeID = @PageTypeID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netPermissionDeleteMembership]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPermissionDeleteMembership]
(
	@Name	NVARCHAR(255) = NULL,
	@IsRole int = NULL
)
AS
BEGIN
    SET NOCOUNT ON
	IF(@Name IS NOT NULL AND @IsRole IS NOT NULL)
	BEGIN
		DELETE
		FROM
			tblUserPermission
		WHERE
			Name=@Name 
			AND 
			IsRole=@IsRole
    END
END
GO
/****** Object:  StoredProcedure [dbo].[netPermissionRoles]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPermissionRoles]
(
	@Permission	NVARCHAR(150),
	@GroupName  NVARCHAR(150)
)
AS
BEGIN
    SET NOCOUNT ON
    SELECT
        Name,
        IsRole
    FROM
        tblUserPermission
    WHERE
        Permission=@Permission AND GroupName = @GroupName
    ORDER BY
        IsRole
END
GO
/****** Object:  StoredProcedure [dbo].[netPermissionSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPermissionSave]
(
	@Name NVARCHAR(255) = NULL,
	@IsRole INT = NULL,
	@Permission NVARCHAR(150),
	@GroupName NVARCHAR(150),
	@ClearByName INT = NULL,
	@ClearByPermission INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	
	IF (NOT @ClearByName IS NULL)
		DELETE FROM 
		    tblUserPermission 
		WHERE 
		    Name=@Name AND 
		IsRole=@IsRole
		
	IF (NOT @ClearByPermission IS NULL)
		DELETE FROM 
		    tblUserPermission 
		WHERE 
		    Permission=@Permission AND GroupName = @GroupName	
    IF ((@Name IS NULL) OR (@IsRole IS NULL))
        RETURN
        
	IF (NOT EXISTS(SELECT Name FROM tblUserPermission WHERE Name=@Name AND IsRole=@IsRole AND Permission=@Permission AND GroupName = @GroupName))
		INSERT INTO tblUserPermission 
		    (Name, 
		    IsRole, 
		    Permission,
			GroupName) 
		VALUES 
		    (@Name, 
		    @IsRole, 
		    @Permission,
			@GroupName)
END
GO
/****** Object:  StoredProcedure [dbo].[netPlugInLoad]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPlugInLoad]
@PlugInID INT
AS
BEGIN
	SELECT pkID, AssemblyName, TypeName, Settings, Saved, Created, Enabled
	FROM tblPlugIn
	WHERE pkID = @PlugInID OR @PlugInID = -1
END
GO
/****** Object:  StoredProcedure [dbo].[netPlugInLoadByType]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPlugInLoadByType]
(
	@AssemblyName NVARCHAR(255),
	@TypeName NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT pkID, TypeName, AssemblyName, Saved, Created, Enabled FROM tblPlugIn WHERE AssemblyName=@AssemblyName AND TypeName=@TypeName
END
GO
/****** Object:  StoredProcedure [dbo].[netPlugInSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPlugInSave]
@PlugInID 		INT,
@Enabled 		BIT,
@Saved		DATETIME
AS
BEGIN
	UPDATE tblPlugIn SET
		Enabled 	= @Enabled,
		Saved		= @Saved
	WHERE pkID = @PlugInID
END
GO
/****** Object:  StoredProcedure [dbo].[netPlugInSaveSettings]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPlugInSaveSettings]
@PlugInID 		INT,
@Settings 		NVARCHAR(MAX),
@Saved			DATETIME
AS
BEGIN
	UPDATE tblPlugIn SET
		Settings 	= @Settings,
		Saved		= @Saved	
	WHERE pkID = @PlugInID
END
GO
/****** Object:  StoredProcedure [dbo].[netPlugInSynchronize]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPlugInSynchronize]
(
	@AssemblyName NVARCHAR(255),
	@TypeName NVARCHAR(255),
	@DefaultEnabled Bit,
	@CurrentDate DATETIME
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @id INT
	SELECT @id = pkID FROM tblPlugIn WHERE AssemblyName=@AssemblyName AND TypeName=@TypeName
	IF @id IS NULL
	BEGIN
		INSERT INTO tblPlugIn(AssemblyName,TypeName,Enabled, Created, Saved) VALUES(@AssemblyName,@TypeName,@DefaultEnabled, @CurrentDate, @CurrentDate)
		SET @id =  SCOPE_IDENTITY() 
	END
	SELECT pkID, TypeName, AssemblyName, Saved, Created, Enabled FROM tblPlugIn WHERE pkID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectDelete]
	@ID	INT
AS
	SET NOCOUNT ON
		DELETE FROM tblProjectItem WHERE fkProjectID = @ID
		DELETE FROM tblProjectMember WHERE fkProjectID = @ID 
		DELETE FROM tblProject WHERE pkID = @ID 
	RETURN @@ROWCOUNT
GO
/****** Object:  StoredProcedure [dbo].[netProjectGet]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectGet]
	@ID int
AS
BEGIN
	SELECT pkID, IsPublic, Name, Created, CreatedBy, [Status], DelayPublishUntil, PublishingTrackingToken
	FROM tblProject
	WHERE tblProject.pkID = @ID
	SELECT pkID, Name, Type
	FROM tblProjectMember
	WHERE tblProjectMember.fkProjectID = @ID
	ORDER BY Name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectItemDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectItemDelete]
	@ProjectItemIDs dbo.IDTable READONLY
AS
BEGIN
	SET NOCOUNT ON
	MERGE tblProjectItem AS Target
	USING @ProjectItemIDs AS Source
    ON (Target.pkID = Source.ID)
    WHEN MATCHED THEN 
		DELETE
	OUTPUT deleted.pkID, deleted.fkProjectID, deleted.ContentLinkID, deleted.ContentLinkWorkID, deleted.ContentLinkProvider, deleted.Language, deleted.Category;
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectItemGet]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectItemGet]
	@ProjectID INT,
	@StartIndex INT = 0,
	@MaxRows INT,
	@Category VARCHAR(2555) = NULL,
	@Language VARCHAR(17) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	WITH PageCTE AS
    (SELECT pkID,fkProjectID, ContentLinkID, ContentLinkWorkID, ContentLinkProvider, Language, Category,
     ROW_NUMBER() OVER(ORDER By pkID) AS intRow
     FROM tblProjectItem
	 WHERE	(@Category IS NULL OR tblProjectItem.Category = @Category) AND 
			(@Language IS NULL OR tblProjectItem.Language = @Language OR tblProjectItem.Language = '') AND
			(tblProjectItem.fkProjectID = @ProjectID))
	 
	--ProjectItems
	SELECT
		  pkID, fkProjectID, ContentLinkID, ContentLinkWorkID, ContentLinkProvider, Language, Category, (SELECT COUNT(*) FROM PageCTE) AS 'TotalRows'
	FROM
		PageCTE
	WHERE intRow BETWEEN (@StartIndex +1) AND (@MaxRows + @StartIndex)
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectItemGetByReferences]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectItemGetByReferences]
	@References dbo.ContentReferenceTable READONLY
AS
BEGIN
	SET NOCOUNT ON;
	--ProjectItems
	SELECT
		tblProjectItem.pkID, tblProjectItem.fkProjectID, tblProjectItem.ContentLinkID, tblProjectItem.ContentLinkWorkID, tblProjectItem.ContentLinkProvider, tblProjectItem.Language, tblProjectItem.Category
	FROM
		tblProjectItem
	INNER JOIN @References AS Refs ON Refs.ID = tblProjectItem.ContentLinkID
	WHERE 
		(Refs.WorkID = 0 OR Refs.WorkID = tblProjectItem.ContentLinkWorkID) AND 
		((Refs.Provider IS NULL AND tblProjectItem.ContentLinkProvider = '') OR (Refs.Provider = tblProjectItem.ContentLinkProvider)) 
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectItemGetSingle]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectItemGetSingle]
	@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		  pkID, fkProjectID, ContentLinkID, ContentLinkWorkID, ContentLinkProvider, [Language], Category
	FROM
		tblProjectItem
	WHERE pkID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectItemSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectItemSave]
	@ProjectItems dbo.ProjectItemTable READONLY
AS
BEGIN
	SET NOCOUNT ON
	IF (SELECT COUNT(*) FROM tblProjectItem tbl JOIN @ProjectItems items ON tbl.pkID = items.ID AND tbl.fkProjectID != items.ProjectID) > 0
		RAISERROR('Not allowed to change ProjectId', 16, 1)
	ELSE
		MERGE tblProjectItem AS Target
		USING @ProjectItems AS Source
		ON (Target.pkID = Source.ID)
		WHEN MATCHED THEN
		    UPDATE SET 
				Target.fkProjectID = Source.ProjectID,
				Target.ContentLinkID = Source.ContentLinkID,
				Target.ContentLinkWorkID = Source.ContentLinkWorkID,
				Target.ContentLinkProvider = Source.ContentLinkProvider,
				Target.Language = Source.Language,
				Target.Category = Source.Category
		WHEN NOT MATCHED BY Target THEN
			INSERT (fkProjectID, ContentLinkID, ContentLinkWorkID, ContentLinkProvider, Language, Category)
			VALUES (Source.ProjectID, Source.ContentLinkID, Source.ContentLinkWorkID, Source.ContentLinkProvider, Source.Language, Source.Category)
		OUTPUT inserted.pkID, inserted.fkProjectID, inserted.ContentLinkID, inserted.ContentLinkWorkID, inserted.ContentLinkProvider, inserted.Language, inserted.Category;
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectList]
	@StartIndex INT = 0,
	@MaxRows INT,
	@Status INT = -1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @projectIDs TABLE(projectID INT NOT NULL, TotalRows INT NOT NULL);
	WITH PageCTE AS
    (SELECT pkID, [Status],
     ROW_NUMBER() OVER(ORDER BY Name ASC, pkID ASC) AS intRow
     FROM tblProject
	 WHERE @Status  = -1 OR @Status = [Status])
	INSERT INTO  @projectIDs 
		SELECT PageCTE.pkID, (SELECT COUNT(*) FROM PageCTE) AS 'TotalRows' 
		FROM PageCTE 
		WHERE intRow BETWEEN (@StartIndex +1) AND (@MaxRows + @StartIndex)
	--Projects
	SELECT 
		pkID, Name, IsPublic, CreatedBy, Created, [Status], DelayPublishUntil, PublishingTrackingToken
	FROM 
		tblProject 
	INNER JOIN @projectIDs AS projects ON projects.projectID = tblProject.pkID
	--ProjectMembers
	SELECT 
		pkID, projectID, Name, Type
	FROM 
		tblProjectMember 
	INNER JOIN @projectIDs AS projects ON projects.projectID = tblProjectMember.fkProjectID
	ORDER BY projectID, Name
	RETURN COALESCE((SELECT TOP 1 TotalRows FROM @projectIDs), 0)
END
GO
/****** Object:  StoredProcedure [dbo].[netProjectSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netProjectSave]
	@ID INT,
	@Name	nvarchar(255),
	@IsPublic BIT,
	@Created	datetime,
	@CreatedBy	nvarchar(255),
	@Status INT,
	@DelayPublishUntil datetime = NULL,
	@PublishingTrackingToken nvarchar(255),
	@Members dbo.ProjectMemberTable READONLY
AS
BEGIN
	SET NOCOUNT ON
	IF @ID=0
	BEGIN
		INSERT INTO tblProject(Name, IsPublic, Created, CreatedBy, [Status], DelayPublishUntil, PublishingTrackingToken) VALUES(@Name, @IsPublic, @Created, @CreatedBy, @Status, @DelayPublishUntil, @PublishingTrackingToken)
		SET @ID = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE tblProject SET Name=@Name, IsPublic=@IsPublic, [Status] = @Status, DelayPublishUntil = @DelayPublishUntil, PublishingTrackingToken = @PublishingTrackingToken  WHERE pkID=@ID
	END
	MERGE tblProjectMember AS Target
    USING @Members AS Source
    ON (Target.pkID = Source.ID AND Target.fkProjectID=@ID)
    WHEN MATCHED THEN 
        UPDATE SET Name = Source.Name, Type = Source.Type
	WHEN NOT MATCHED BY Source AND Target.fkProjectID = @ID THEN
		DELETE
	WHEN NOT MATCHED BY Target THEN
		INSERT (fkProjectID, Name, Type)
		VALUES (@ID, Source.Name, Source.Type);
	SELECT pkID, Name, Type
	FROM tblProjectMember
	WHERE tblProjectMember.fkProjectID = @ID
	ORDER BY Name ASC
	RETURN @ID
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertyDefinitionCheckUsage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertyDefinitionCheckUsage]
(
	@PropertyDefinitionID	INT,
	@OnlyNoneMasterLanguage	BIT = 0,
	@OnlyPublished	BIT = 0
)
AS
BEGIN
	
	SET NOCOUNT ON
	
	--Get blocktype if property is block property
	DECLARE @ContentTypeID INT;
	SET @ContentTypeID = (SELECT tblContentType.pkID FROM 
		tblPropertyDefinition
		INNER JOIN tblPropertyDefinitionType ON tblPropertyDefinition.fkPropertyDefinitionTypeID = tblPropertyDefinitionType.pkID
		INNER JOIN tblContentType ON tblPropertyDefinitionType.fkContentTypeGUID = tblContentType.ContentTypeGUID
		WHERE tblPropertyDefinition.pkID = @PropertyDefinitionID);
	
	IF (@OnlyPublished = 1)
	BEGIN
		IF (@ContentTypeID IS NOT NULL)
		BEGIN
			SELECT TOP 1
				tblContentLanguage.fkContentID as ContentID, 
				0 AS WorkID
			FROM 
				tblContentProperty 
			INNER JOIN 
				dbo.GetExistingScopesForDefinition(@PropertyDefinitionID) as ExistingScopes ON tblContentProperty.ScopeName = ExistingScopes.ScopeName
			INNER JOIN 
				tblContentLanguage ON tblContentProperty.fkContentID=tblContentLanguage.fkContentID
		END
		ELSE
		BEGIN
			SELECT TOP 1
				tblContentLanguage.fkContentID as ContentID, 
				0 AS WorkID
			FROM 
				tblContentProperty
			INNER JOIN 
				tblContentLanguage ON tblContentProperty.fkContentID=tblContentLanguage.fkContentID
			WHERE
				tblContentLanguage.fkLanguageBranchID=tblContentProperty.fkLanguageBranchID AND
				tblContentProperty.fkPropertyDefinitionID=@PropertyDefinitionID
		END
	END
	ELSE
	BEGIN
		IF (@ContentTypeID IS NOT NULL)
		BEGIN
			SELECT TOP 1
				tblWorkContent.fkContentID as ContentID, 
				tblWorkContent.pkID AS WorkID
			FROM 
				tblWorkContentProperty
			INNER JOIN
				dbo.GetExistingScopesForDefinition(@PropertyDefinitionID) as ExistingScopes ON tblWorkContentProperty.ScopeName = ExistingScopes.ScopeName
			INNER JOIN
				tblWorkContent ON tblWorkContentProperty.fkWorkContentID=tblWorkContent.pkID
		END
		ELSE
		BEGIN
			SELECT TOP 1
				tblWorkContent.fkContentID as ContentID, 
				tblWorkContent.pkID AS WorkID
			FROM 
				tblWorkContentProperty
			INNER JOIN
				tblWorkContent ON tblWorkContentProperty.fkWorkContentID=tblWorkContent.pkID
			WHERE
				tblWorkContentProperty.fkPropertyDefinitionID=@PropertyDefinitionID
		END
	END
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertyDefinitionDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertyDefinitionDelete]
(
	@PropertyDefinitionID INT
)
AS
BEGIN
	DECLARE @ScopedProperties TABLE (ScopeName nvarchar(450))
	INSERT INTO @ScopedProperties SELECT * FROM dbo.GetExistingScopesForDefinition(@PropertyDefinitionID) 
	DELETE FROM tblContentProperty WHERE ScopeName IN (SELECT ScopeName FROM @ScopedProperties) 
	DELETE FROM tblWorkContentProperty WHERE ScopeName IN (SELECT ScopeName FROM @ScopedProperties)
	DELETE FROM tblPropertyDefault WHERE fkPageDefinitionID=@PropertyDefinitionID
	DELETE FROM tblProperty WHERE fkPageDefinitionID=@PropertyDefinitionID
	DELETE FROM tblWorkProperty WHERE fkPageDefinitionID=@PropertyDefinitionID
	DELETE FROM tblCategoryPage WHERE CategoryType=@PropertyDefinitionID
	DELETE FROM tblWorkCategory WHERE CategoryType=@PropertyDefinitionID
	DELETE FROM tblPageDefinition WHERE pkID=@PropertyDefinitionID
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertyDefinitionGetUsage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertyDefinitionGetUsage]
(
	@PropertyDefinitionID	INT,
	@OnlyNoneMasterLanguage	BIT = 0,
	@OnlyPublished	BIT = 0
)
AS
BEGIN
	
	
	SET NOCOUNT ON
	
	--Get blocktype if property is block property
	DECLARE @ContentTypeID INT;
	SET @ContentTypeID = (SELECT tblContentType.pkID FROM 
		tblPropertyDefinition
		INNER JOIN tblPropertyDefinitionType ON tblPropertyDefinition.fkPropertyDefinitionTypeID = tblPropertyDefinitionType.pkID
		INNER JOIN tblContentType ON tblPropertyDefinitionType.fkContentTypeGUID = tblContentType.ContentTypeGUID
		WHERE tblPropertyDefinition.pkID = @PropertyDefinitionID);
	
	IF (@OnlyPublished = 1)
	BEGIN
		IF (@ContentTypeID IS NOT NULL)
		BEGIN
			SELECT DISTINCT
				tblContentLanguage.fkContentID as ContentID, 
				0 AS WorkID,
				tblContentLanguage.Name,
				tblLanguageBranch.LanguageID AS LanguageBranch,
				tblLanguageBranch.Name AS LanguageBranchName
			FROM 
				tblContentProperty 
			INNER JOIN 
				dbo.GetExistingScopesForDefinition(@PropertyDefinitionID) as ExistingScopes ON tblContentProperty.ScopeName = ExistingScopes.ScopeName
			INNER JOIN 
				tblContentLanguage ON tblContentProperty.fkContentID=tblContentLanguage.fkContentID
			INNER JOIN
				tblContent ON tblContent.pkID=tblContentLanguage.fkContentID
			INNER JOIN
				tblLanguageBranch ON tblLanguageBranch.pkID=tblContentLanguage.fkLanguageBranchID
			WHERE
				tblContentLanguage.fkLanguageBranchID=tblContentProperty.fkLanguageBranchID AND
				(@OnlyNoneMasterLanguage=0 OR tblContentProperty.fkLanguageBranchID<>tblContent.fkMasterLanguageBranchID)
		END
		ELSE
		BEGIN
			SELECT DISTINCT
				tblContentLanguage.fkContentID as ContentID, 
				0 AS WorkID,
				tblContentLanguage.Name,
				tblLanguageBranch.LanguageID AS LanguageBranch,
				tblLanguageBranch.Name AS LanguageBranchName
			FROM 
				tblContentProperty
			INNER JOIN 
				tblContentLanguage ON tblContentProperty.fkContentID=tblContentLanguage.fkContentID
			INNER JOIN
				tblContent ON tblContent.pkID=tblContentLanguage.fkContentID
			INNER JOIN
				tblLanguageBranch ON tblLanguageBranch.pkID=tblContentLanguage.fkLanguageBranchID
			WHERE
				tblContentLanguage.fkLanguageBranchID=tblContentProperty.fkLanguageBranchID AND
				tblContentProperty.fkPropertyDefinitionID=@PropertyDefinitionID AND
				(@OnlyNoneMasterLanguage=0 OR tblContentProperty.fkLanguageBranchID<>tblContent.fkMasterLanguageBranchID)
		END
	END
	ELSE
	BEGIN
		IF (@ContentTypeID IS NOT NULL)
		BEGIN
			SELECT DISTINCT
				tblContent.pkID as ContentID, 
				tblWorkContent.pkID AS WorkID,
				tblWorkContent.Name,
				tblLanguageBranch.LanguageID AS LanguageBranch
			FROM 
				tblWorkContentProperty
			INNER JOIN
				dbo.GetExistingScopesForDefinition(@PropertyDefinitionID) as ExistingScopes ON tblWorkContentProperty.ScopeName = ExistingScopes.ScopeName
			INNER JOIN
				tblWorkContent ON tblWorkContentProperty.fkWorkContentID=tblWorkContent.pkID
			INNER JOIN
				tblContent ON tblWorkContent.fkContentID=tblContent.pkID
			INNER JOIN 
				tblContentLanguage ON tblWorkContent.fkContentID=tblContentLanguage.fkContentID 
			INNER JOIN
				tblLanguageBranch ON tblLanguageBranch.pkID=tblContentLanguage.fkLanguageBranchID
			WHERE
				tblWorkContent.fkLanguageBranchID = tblLanguageBranch.pkID AND
				(@OnlyNoneMasterLanguage=0 OR tblWorkContent.fkLanguageBranchID<>tblContent.fkMasterLanguageBranchID)
		END
		ELSE
		BEGIN
			SELECT DISTINCT
				tblContent.pkID as ContentID, 
				tblWorkContent.pkID AS WorkID,
				tblWorkContent.Name,
				tblLanguageBranch.LanguageID AS LanguageBranch
			FROM 
				tblWorkContentProperty
			INNER JOIN
				tblWorkContent ON tblWorkContentProperty.fkWorkContentID=tblWorkContent.pkID
			INNER JOIN
				tblContent ON tblWorkContent.fkContentID=tblContent.pkID
			INNER JOIN 
				tblContentLanguage ON tblWorkContent.fkContentID=tblContentLanguage.fkContentID 
			INNER JOIN
				tblLanguageBranch ON tblLanguageBranch.pkID=tblContentLanguage.fkLanguageBranchID
			WHERE
				tblWorkContent.fkLanguageBranchID = tblLanguageBranch.pkID AND
				tblWorkContentProperty.fkPropertyDefinitionID=@PropertyDefinitionID AND
				(@OnlyNoneMasterLanguage=0 OR tblWorkContent.fkLanguageBranchID<>tblContent.fkMasterLanguageBranchID)
		END
	END
	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertyDefinitionTypeList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertyDefinitionTypeList]
AS
BEGIN
	SELECT 	DT.pkID AS ID,
			DT.Name,
			DT.Property,
            DT.GUID,
			DT.TypeName,
			DT.AssemblyName, 
			DT.fkContentTypeGUID AS BlockTypeID,
			PT.Name as BlockTypeName,
			PT.ModelType as BlockTypeModel
	FROM tblPropertyDefinitionType as DT
		LEFT OUTER JOIN tblContentType as PT ON DT.fkContentTypeGUID = PT.ContentTypeGUID
	ORDER BY DT.Name
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertyDefinitionTypeSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertyDefinitionTypeSave]
(
	@ID 			INT OUTPUT,
	@Property 		INT,
	@Name 			NVARCHAR(255),
    @GUID           uniqueidentifier = NULL,
	@TypeName 		NVARCHAR(255) = NULL,
	@AssemblyName 	NVARCHAR(255) = NULL,
	@BlockTypeID	uniqueidentifier = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	/* In case several sites start up at sametime, e.g. in enterprise it may occour that both sites tries to insert at same time. 
	Therefore a check is made to see it it already exist an entry with same guid, and if so an update is performed instead of insert.*/
	IF @ID <= 0
	BEGIN
		SET @ID = ISNULL((SELECT pkID FROM tblPropertyDefinitionType WHERE fkContentTypeGUID = @BlockTypeID), @ID)
	END
	IF @ID<0
	BEGIN
		IF @AssemblyName='EPiServer'
			SELECT @ID = Max(pkID)+1 FROM tblPropertyDefinitionType WHERE pkID<1000
		ELSE
			SELECT @ID = CASE WHEN Max(pkID)<1000 THEN 1000 ELSE Max(pkID)+1 END FROM tblPropertyDefinitionType
		INSERT INTO tblPropertyDefinitionType
		(
			pkID,
			Property,
			Name,
            GUID,
			TypeName,
			AssemblyName,
			fkContentTypeGUID
		)
		VALUES
		(
			@ID,
			@Property,
			@Name,
            @GUID,
			@TypeName,
			@AssemblyName,
			@BlockTypeID
		)
	END
	ELSE
		UPDATE tblPropertyDefinitionType SET
			Name 		= @Name,
			Property		= @Property,
            GUID        = @GUID,
			TypeName 	= @TypeName,
			AssemblyName 	= @AssemblyName,
			fkContentTypeGUID = @BlockTypeID
		WHERE pkID=@ID
		
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySave]
(
	@ContentID				INT,
	@WorkContentID			INT,
	@PropertyDefinitionID	INT,
	@Override			BIT,
	@LanguageBranch		NCHAR(17) = NULL,
	@ScopeName			NVARCHAR(450) = NULL,
--Per Type:
	@Number				INT = NULL,
	@Boolean			BIT = 0,
	@Date				DATETIME = NULL,
	@FloatNumber		FLOAT = NULL,
	@ContentType			INT = NULL,
	@String				NVARCHAR(450) = NULL,
	@LinkGuid			uniqueidentifier = NULL,
	@ContentLink			INT = NULL,
	@LongString			NVARCHAR(MAX) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @LangBranchID NCHAR(17);
	IF (@WorkContentID <> 0)
		SELECT @LangBranchID = fkLanguageBranchID FROM tblWorkContent WHERE pkID = @WorkContentID
	ELSE
		SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID = @LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = 1
	END
	DECLARE @IsLanguagePublished BIT;
	IF EXISTS(SELECT fkContentID FROM tblContentLanguage 
		WHERE fkContentID = @ContentID AND fkLanguageBranchID = CAST(@LangBranchID AS INT) AND Status = 4)
		SET @IsLanguagePublished = 1
	ELSE
		SET @IsLanguagePublished = 0
	
	DECLARE @DynProp INT
	DECLARE @retval	INT
	SET @retval = 0
	
		SELECT
			@DynProp = pkID
		FROM
			tblPropertyDefinition
		WHERE
			pkID = @PropertyDefinitionID
		AND
			fkContentTypeID IS NULL
		IF (@WorkContentID IS NOT NULL)
		BEGIN
			/* Never store dynamic properties in work table */
			IF (@DynProp IS NOT NULL)
				GOTO cleanup
				
			/* Insert or update property */
			IF EXISTS(SELECT fkWorkContentID FROM tblWorkContentProperty 
				WHERE fkWorkContentID=@WorkContentID AND fkPropertyDefinitionID=@PropertyDefinitionID AND ((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName)))
				UPDATE
					tblWorkContentProperty
				SET
					ScopeName = @ScopeName,
					Number = @Number,
					Boolean = @Boolean,
					[Date] = @Date,
					FloatNumber = @FloatNumber,
					ContentType = @ContentType,
					String = @String,
					LinkGuid = @LinkGuid,
					ContentLink = @ContentLink,
					LongString = @LongString
				WHERE
					fkWorkContentID = @WorkContentID
				AND
					fkPropertyDefinitionID = @PropertyDefinitionID
				AND 
					((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
			ELSE
				INSERT INTO
					tblWorkContentProperty
					(fkWorkContentID,
					fkPropertyDefinitionID,
					ScopeName,
					Number,
					Boolean,
					[Date],
					FloatNumber,
					ContentType,
					String,
					LinkGuid,
					ContentLink,
					LongString)
				VALUES
					(@WorkContentID,
					@PropertyDefinitionID,
					@ScopeName,
					@Number,
					@Boolean,
					@Date,
					@FloatNumber,
					@ContentType,
					@String,
					@LinkGuid,
					@ContentLink,
					@LongString)
		END
		
		/* For published or languages where no version is published we save value in tblContentProperty as well. Reason for this is that if when page is loaded
		through tblContentProperty (typically netPageListPaged) the page gets populated correctly. */
		IF (@WorkContentID IS NULL OR @IsLanguagePublished = 0)
		BEGIN
			/* Insert or update property */
			IF EXISTS(SELECT fkContentID FROM tblContentProperty 
				WHERE fkContentID = @ContentID AND fkPropertyDefinitionID = @PropertyDefinitionID  AND
					((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName)) AND @LangBranchID = tblContentProperty.fkLanguageBranchID)
				UPDATE
					tblContentProperty
				SET
					ScopeName = @ScopeName,
					Number = @Number,
					Boolean = @Boolean,
					[Date] = @Date,
					FloatNumber = @FloatNumber,
					ContentType = @ContentType,
					String = @String,
					LinkGuid = @LinkGuid,
					ContentLink = @ContentLink,
					LongString = @LongString,
                    /* LongString is utf-16 - Datalength gives bytes, i e div by 2 gives characters */
		            /* Include length to handle delayed loading of LongString with threshold */
		            LongStringLength = COALESCE(DATALENGTH(@LongString), 0) / 2
				WHERE
					fkContentID = @ContentID
				AND
					fkPropertyDefinitionID = @PropertyDefinitionID
				AND 
					((@ScopeName IS NULL AND ScopeName IS NULL) OR (@ScopeName = ScopeName))
				AND
					@LangBranchID = tblContentProperty.fkLanguageBranchID
			ELSE
				INSERT INTO
					tblContentProperty
					(fkContentID,
					fkPropertyDefinitionID,
					ScopeName,
					Number,
					Boolean,
					[Date],
					FloatNumber,
					ContentType,
					String,
					LinkGuid,
					ContentLink,
					LongString,
                    LongStringLength,
					fkLanguageBranchID)
				VALUES
					(@ContentID,
					@PropertyDefinitionID,
					@ScopeName,
					@Number,
					@Boolean,
					@Date,
					@FloatNumber,
					@ContentType,
					@String,
					@LinkGuid,
					@ContentLink,
					@LongString,
                    COALESCE(DATALENGTH(@LongString), 0) / 2,
					@LangBranchID)
				
			/* Override dynamic property definitions below the current level */
			IF (@DynProp IS NOT NULL)
			BEGIN
				IF (@Override = 1)
					DELETE FROM
						tblContentProperty
					WHERE
						fkPropertyDefinitionID = @PropertyDefinitionID
					AND
					(	
						@LanguageBranch IS NULL
					OR
						@LangBranchID = tblContentProperty.fkLanguageBranchID
					)
					AND
						fkContentID
					IN
						(SELECT fkChildID FROM tblTree WHERE fkParentID = @ContentID)
				SET @retval = 1
			END
		END
cleanup:		
		
	RETURN @retval
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearch]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearch]
(
	@PageID			INT,
	@FindProperty	NVARCHAR(255),
	@NotProperty	NVARCHAR(255),
	@LanguageBranch	NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID NCHAR(17);
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
		
	SET NOCOUNT ON
	/* All levels */
	SELECT
		tblPage.pkID
	FROM 
		tblPage
	INNER JOIN
		tblTree ON tblTree.fkChildID=tblPage.pkID
	INNER JOIN
		tblPageType ON tblPage.fkPageTypeID=tblPageType.pkID
	INNER JOIN
		tblPageDefinition ON tblPageType.pkID=tblPageDefinition.fkPageTypeID 
		AND tblPageDefinition.Name=@FindProperty
	INNER JOIN
		tblProperty ON tblProperty.fkPageID=tblPage.pkID 
		AND tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
	INNER JOIN 
		tblPageLanguage ON tblPageLanguage.fkPageID=tblPage.pkID
	WHERE
		tblPageType.ContentType = 0 AND
		tblTree.fkParentID=@PageID AND
		tblPage.Deleted = 0 AND
		tblPageLanguage.[Status] = 4 AND
		(@LangBranchID=-1 OR tblPageLanguage.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3) AND
		(@NotProperty IS NULL OR NOT EXISTS(
			SELECT * FROM tblProperty 
			INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID 
			WHERE tblPageDefinition.Name=@NotProperty 
			AND tblProperty.fkPageID=tblPage.pkID))
	ORDER BY tblPageLanguage.Name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearchCategory]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearchCategory]
(
	@PageID			INT,
	@PropertyName 	NVARCHAR(255),
	@Equals			BIT = 0,
	@NotEquals		BIT = 0,
	@CategoryList	NVARCHAR(2000) = NULL,
	@LanguageBranch	NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID NCHAR(17);
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
	
	DECLARE @categoryTable AS TABLE (fkCategoryID int)
	IF NOT @CategoryList IS NULL
	BEGIN
		INSERT INTO @categoryTable
		EXEC netCategoryStringToTable @CategoryList=@CategoryList
	END
	IF @CategoryList IS NULL
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM tblProperty
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
		INNER JOIN tblPageLanguage ON tblPageLanguage.fkPageID=tblProperty.fkPageID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		WHERE tblPageType.ContentType = 0 
		AND tblTree.fkParentID=@PageID 
		AND tblPageDefinition.Name=@PropertyName
		AND Property = 8		
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND (
					SELECT Count(tblCategoryPage.fkPageID)
					FROM tblCategoryPage
					INNER JOIN tblPageDefinition ON tblPageDefinition.pkID = tblCategoryPage.CategoryType
					WHERE tblCategoryPage.CategoryType=tblProperty.fkPageDefinitionID
					AND tblCategoryPage.fkPageID=tblProperty.fkPageID
					AND (@LangBranchID=-1 OR tblCategoryPage.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
			)=0	
			
				
	ELSE
		IF @Equals=1
			SELECT DISTINCT(tblProperty.fkPageID)
			FROM tblProperty
			INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
			INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
			INNER JOIN tblPageLanguage ON tblPageLanguage.fkPageID=tblProperty.fkPageID
			INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
			WHERE tblPageType.ContentType = 0 
			AND tblTree.fkParentID=@PageID 
			AND tblPageDefinition.Name=@PropertyName
			AND Property = 8		
			AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
			AND EXISTS
					(SELECT *
					FROM tblCategoryPage 
					INNER JOIN @categoryTable ct ON tblCategoryPage.fkCategoryID=ct.fkCategoryID
					INNER JOIN tblPageDefinition ON tblPageDefinition.pkID = tblCategoryPage.CategoryType
					WHERE tblCategoryPage.fkPageID=tblProperty.fkPageID AND tblCategoryPage.CategoryType=tblProperty.fkPageDefinitionID
					AND (@LangBranchID=-1 OR tblCategoryPage.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3))
		ELSE
			SELECT DISTINCT(tblProperty.fkPageID)
			FROM tblProperty
			INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
			INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
			INNER JOIN tblPageLanguage ON tblPageLanguage.fkPageID=tblProperty.fkPageID
			INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
			WHERE tblPageType.ContentType = 0 
			AND tblTree.fkParentID=@PageID 
			AND tblPageDefinition.Name=@PropertyName
			AND Property = 8		
			AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
			AND NOT EXISTS
					(SELECT *
					FROM tblCategoryPage 
					INNER JOIN @categoryTable ct ON tblCategoryPage.fkCategoryID=ct.fkCategoryID
					INNER JOIN tblPageDefinition ON tblPageDefinition.pkID = tblCategoryPage.CategoryType
					WHERE tblProperty.fkPageID=tblCategoryPage.fkPageID AND tblCategoryPage.CategoryType=tblProperty.fkPageDefinitionID
					AND (@LangBranchID=-1 OR tblCategoryPage.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3))
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearchCategoryMeta]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearchCategoryMeta]
(
	@PageID			INT,
	@PropertyName 	NVARCHAR(255),
	@Equals			BIT = 0,
	@NotEquals		BIT = 0,
	@CategoryList	NVARCHAR(2000) = NULL,
	@LanguageBranch		NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID NCHAR(17);
	
	DECLARE @categoryTable AS TABLE (fkCategoryID int)
	IF NOT @CategoryList IS NULL
	BEGIN
		INSERT INTO @categoryTable
		EXEC netCategoryStringToTable @CategoryList=@CategoryList
	END
	SELECT fkChildID
	FROM tblTree
	INNER JOIN tblContent WITH (NOLOCK) ON tblTree.fkChildID=tblContent.pkID
	WHERE tblContent.ContentType = 0 AND tblTree.fkParentID=@PageID 
	AND
    	(
		(@CategoryList IS NULL AND 	(
							SELECT Count(tblCategoryPage.fkPageID)
							FROM tblCategoryPage
							WHERE tblCategoryPage.CategoryType=0
							AND tblCategoryPage.fkPageID=tblTree.fkChildID
						)=0
		)
		OR
		(@Equals=1 AND tblTree.fkChildID IN
						(SELECT tblCategoryPage.fkPageID 
						FROM tblCategoryPage 
						INNER JOIN @categoryTable ct ON tblCategoryPage.fkCategoryID=ct.fkCategoryID 
						WHERE tblCategoryPage.CategoryType=0)
		)
		OR
		(@NotEquals=1 AND tblTree.fkChildID NOT IN
						(SELECT tblCategoryPage.fkPageID 
						FROM tblCategoryPage 
						INNER JOIN @categoryTable ct ON tblCategoryPage.fkCategoryID=ct.fkCategoryID 
						WHERE tblCategoryPage.CategoryType=0)
		)
	)
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearchNull]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearchNull]
(
	@PageID			INT,
	@PropertyName 	NVARCHAR(255),
	@LanguageBranch	NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID NCHAR(17);
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
	
	SELECT DISTINCT(tblPageLanguage.fkPageID)
	FROM tblPageLanguage
	INNER JOIN tblTree ON tblTree.fkChildID=tblPageLanguage.fkPageID
	INNER JOIN tblPage ON tblPage.pkID=tblPageLanguage.fkPageID
	INNER JOIN tblPageType ON tblPageType.pkID=tblPage.fkPageTypeID
	INNER JOIN tblPageDefinition ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
	WHERE tblPageType.ContentType = 0
	AND tblTree.fkParentID=@PageID  
	AND tblPageDefinition.Name=@PropertyName
	AND (@LangBranchID=-1 OR tblPageLanguage.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
	AND NOT EXISTS
		(SELECT * FROM tblProperty 
		WHERE fkPageDefinitionID=tblPageDefinition.pkID 
		AND tblProperty.fkPageID=tblPage.pkID)
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearchString]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearchString]
(
	@PageID				INT,
	@PropertyName 		NVARCHAR(255),
	@UseWildCardsBefore	BIT = 0,
	@UseWildCardsAfter	BIT = 0,
	@String				NVARCHAR(2000) = NULL,
	@LanguageBranch		NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID INT
	DECLARE @Path VARCHAR(7000)
	DECLARE @SearchString NVARCHAR(2002)
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
	SELECT @Path=PagePath + CONVERT(VARCHAR, @PageID) + '.' FROM tblPage WHERE pkID=@PageID
	SET @SearchString=CASE    
		WHEN @UseWildCardsBefore=0 AND @UseWildCardsAfter=0 THEN @String
		WHEN @UseWildCardsBefore=1 AND @UseWildCardsAfter=0 THEN '%' + @String
		WHEN @UseWildCardsBefore=0 AND @UseWildCardsAfter=1 THEN @String + '%'
		ELSE '%' + @String + '%'
	END
	
	IF @String IS NULL
		SELECT P.pkID
		FROM tblContent AS P
		INNER JOIN tblProperty ON tblProperty.fkPageID=P.pkID
		INNER JOIN tblPageLanguage ON tblPageLanguage.fkPageID=P.pkID
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID = tblProperty.fkPageDefinitionID and tblPageDefinition.Name = @PropertyName and tblPageDefinition.Property in (6,7)
		WHERE 
			P.ContentType = 0 
		AND
			P.ContentPath LIKE (@Path + '%')
		AND 
			(@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND 
			(String IS NULL AND LongString IS NULL)
	ELSE
		SELECT P.pkID
		FROM tblContent AS P
		INNER JOIN tblProperty ON tblProperty.fkPageID=P.pkID
		INNER JOIN tblPageLanguage ON tblPageLanguage.fkPageID=P.pkID
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID = tblProperty.fkPageDefinitionID and tblPageDefinition.Name = @PropertyName and tblPageDefinition.Property = 6
		WHERE 
			P.ContentType = 0 
		AND
			P.ContentPath LIKE (@Path + '%')
		AND 
			(@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND
			String LIKE @SearchString
		UNION
		SELECT P.pkID
		FROM tblContent AS P
		INNER JOIN tblProperty ON tblProperty.fkPageID=P.pkID
		INNER JOIN tblPageLanguage ON tblPageLanguage.fkPageID=P.pkID
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID = tblProperty.fkPageDefinitionID and tblPageDefinition.Name = @PropertyName and tblPageDefinition.Property = 7
		WHERE 
			P.ContentType = 0 
		AND
			P.ContentPath LIKE (@Path + '%')
		AND 
			(@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND
			LongString LIKE @SearchString
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearchStringMeta]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearchStringMeta]
(
	@PageID				INT,
	@PropertyName 		NVARCHAR(255),
	@UseWildCardsBefore	BIT = 0,
	@UseWildCardsAfter	BIT = 0,
	@String				NVARCHAR(2000) = NULL,
	@LanguageBranch		NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @SearchString NVARCHAR(2010)
	DECLARE @DynSqlSelect NVARCHAR(2000)
	DECLARE @DynSqlWhere NVARCHAR(2000)
	DECLARE @LangBranchID NCHAR(17)
    
	
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		IF @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		ELSE
			SET @LangBranchID = -1
	END
			
	SELECT @SearchString=CASE    WHEN @UseWildCardsBefore=0 AND @UseWildCardsAfter=0 THEN @String
						WHEN @UseWildCardsBefore=1 AND @UseWildCardsAfter=0 THEN N'%' + @String
						WHEN @UseWildCardsBefore=0 AND @UseWildCardsAfter=1 THEN @String + N'%'
						ELSE N'%' + @String + N'%'
					END
	SET @DynSqlSelect = 'SELECT tblPageLanguage.fkPageID FROM tblPageLanguage INNER JOIN tblTree ON tblTree.fkChildID=tblPageLanguage.fkPageID INNER JOIN tblContent as tblPage ON tblPageLanguage.fkPageID=tblPage.pkID'
	SET @DynSqlWhere = ' WHERE tblPage.ContentType = 0 AND tblTree.fkParentID=@PageID'
	IF (@LangBranchID <> -1)
		SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.fkLanguageBranchID=@LangBranchID'
	IF (@PropertyName = 'PageName')
	BEGIN
		IF (@String IS NULL)
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.Name IS NULL'
		ELSE
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.Name LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageLinkURL')
	BEGIN
		IF (@String IS NULL)
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.LinkURL IS NULL'
		ELSE
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.LinkURL LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageCreatedBy')
	BEGIN
		IF (@String IS NULL)
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.CreatorName IS NULL'
		ELSE
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.CreatorName LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageChangedBy')
	BEGIN
		IF (@String IS NULL)
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.ChangedByName IS NULL'
		ELSE
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.ChangedByName LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageTypeName')
	BEGIN
		SET @DynSqlSelect = @DynSqlSelect + ' INNER JOIN tblPageType ON tblPageType.pkID=tblPage.fkContentTypeID'
		IF (@String IS NULL)
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageType.Name IS NULL'
		ELSE
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageType.Name LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageExternalURL')
	BEGIN
		IF (@String IS NULL)
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.ExternalURL IS NULL'
		ELSE
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.ExternalURL LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageLanguageBranch')
	BEGIN
        SET @DynSqlSelect = @DynSqlSelect + ' INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkid = tblPageLanguage.fklanguagebranchid'
		IF (@String IS NULL)
			SET @DynSqlWhere = @DynSqlWhere + ' AND tblLanguageBranch.languageid IS NULL'
		ELSE
			SET @DynSqlWhere = @DynSqlWhere + ' AND RTRIM(tblLanguageBranch.languageid) LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageShortcutLink')
	BEGIN
	    IF (@String IS NULL)
	        SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.PageLinkGUID IS NULL' 
	    ELSE
	        SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.PageLinkGUID LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageArchiveLink')
	BEGIN
	    IF (@String IS NULL)
	        SET @DynSqlWhere = @DynSqlWhere + ' AND tblPage.ArchiveContentGUID IS NULL' 
	    ELSE
	        SET @DynSqlWhere = @DynSqlWhere + ' AND tblPage.ArchiveContentGUID LIKE @SearchString'
	END
	ELSE IF (@PropertyName = 'PageURLSegment')
	BEGIN
	    IF (@String IS NULL)
	        SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.URLSegment IS NULL' 
	    ELSE
	        SET @DynSqlWhere = @DynSqlWhere + ' AND tblPageLanguage.URLSegment LIKE @SearchString'
	END
	SET @DynSqlSelect = @DynSqlSelect + @DynSqlWhere
	EXEC sp_executesql @DynSqlSelect, 
		N'@PageID INT, @LangBranchID NCHAR(17), @SearchString NVARCHAR(2010)',
		@PageID=@PageID,
		@LangBranchID=@LangBranchID, 
		@SearchString=@SearchString
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearchValue]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearchValue]
(
	@PageID			INT,
	@PropertyName 	NVARCHAR(255),
	@Equals			BIT = 0,
	@NotEquals		BIT = 0,
	@GreaterThan	BIT = 0,
	@LessThan		BIT = 0,
	@Boolean		BIT = NULL,
	@Number			INT = NULL,
	@FloatNumber	FLOAT = NULL,
	@PageType		INT = NULL,
	@PageLink		INT = NULL,
	@Date			DATETIME = NULL,
	@LanguageBranch	NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID NCHAR(17);
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
		
	IF NOT @Boolean IS NULL
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM       tblProperty
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
		INNER JOIN tblPageLanguage on tblPageLanguage.fkPageID=tblProperty.fkPageID
		WHERE tblPageType.ContentType = 0
		AND tblTree.fkParentID=@PageID 
		AND tblPageDefinition.Name=@PropertyName
		AND Property = 0
		AND Boolean = @Boolean
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
	ELSE IF NOT @Number IS NULL
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM       tblProperty
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
		INNER JOIN tblPageLanguage on tblPageLanguage.fkPageID=tblProperty.fkPageID
		WHERE tblPageType.ContentType = 0
		AND tblTree.fkParentID=@PageID 
		AND tblPageDefinition.Name=@PropertyName
		AND Property = 1
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND 
		(
			(@Equals=1 		AND (Number = @Number OR (@Number IS NULL AND Number IS NULL)))
			OR
			(@GreaterThan=1 	AND Number > @Number)
			OR
			(@LessThan=1 		AND Number < @Number)
			OR
			(@NotEquals=1		AND Number <> @Number)
		)
	ELSE IF NOT @FloatNumber IS NULL
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM       tblProperty
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
		INNER JOIN tblPageLanguage on tblPageLanguage.fkPageID=tblProperty.fkPageID
		WHERE tblPageType.ContentType = 0
		AND tblTree.fkParentID=@PageID 
		AND tblPageDefinition.Name=@PropertyName
		AND Property = 2
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND
		(
			(@Equals=1 		AND (FloatNumber = @FloatNumber OR (@FloatNumber IS NULL AND FloatNumber IS NULL)))
			OR
			(@GreaterThan=1 	AND FloatNumber > @FloatNumber)
			OR
			(@LessThan=1 		AND FloatNumber < @FloatNumber)
			OR
			(@NotEquals=1		AND FloatNumber <> @FloatNumber)
		)
	ELSE IF NOT @PageType IS NULL
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM       tblProperty
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
		INNER JOIN tblPageLanguage on tblPageLanguage.fkPageID=tblProperty.fkPageID
		WHERE tblPageType.ContentType = 0
		AND tblTree.fkParentID=@PageID 
		AND tblPageDefinition.Name=@PropertyName
		AND Property = 3
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND
		(
			(@Equals=1 		AND (PageType = @PageType OR (@PageType IS NULL AND PageType IS NULL)))
			OR
			(@GreaterThan=1 	AND PageType > @PageType)
			OR
			(@LessThan=1 		AND PageType < @PageType)
			OR
			(@NotEquals=1		AND PageType <> @PageType)
		)
	ELSE IF NOT @PageLink IS NULL
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM       tblProperty
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
		INNER JOIN tblPageLanguage on tblPageLanguage.fkPageID=tblProperty.fkPageID
		WHERE tblPageType.ContentType = 0
		AND tblTree.fkParentID=@PageID 
		AND tblPageDefinition.Name=@PropertyName
		AND Property = 4
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND
		(
			(@Equals=1 		AND (PageLink = @PageLink OR (@PageLink IS NULL AND PageLink IS NULL)))
			OR
			(@GreaterThan=1 	AND PageLink > @PageLink)
			OR
			(@LessThan=1 		AND PageLink < @PageLink)
			OR
			(@NotEquals=1		AND PageLink <> @PageLink)
		)
	ELSE IF NOT @Date IS NULL
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM       tblProperty
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		INNER JOIN tblTree ON tblTree.fkChildID=tblProperty.fkPageID
		INNER JOIN tblPageLanguage on tblPageLanguage.fkPageID=tblProperty.fkPageID
		WHERE tblPageType.ContentType = 0
		AND tblTree.fkParentID=@PageID 
		AND tblPageDefinition.Name=@PropertyName
		AND Property = 5
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
		AND
		(
			(@Equals=1 		AND ([Date] = @Date OR (@Date IS NULL AND [Date] IS NULL)))
			OR
			(@GreaterThan=1 	AND [Date] > @Date)
			OR
			(@LessThan=1 		AND [Date] < @Date)
			OR
			(@NotEquals=1		AND [Date] <> @Date)
		)
	ELSE
		SELECT DISTINCT(tblProperty.fkPageID)
		FROM tblProperty
		INNER JOIN tblPageLanguage on tblPageLanguage.fkPageID=tblProperty.fkPageID
		INNER JOIN tblPageDefinition ON tblPageDefinition.pkID=tblProperty.fkPageDefinitionID
		INNER JOIN tblPageType ON tblPageDefinition.fkPageTypeID=tblPageType.pkID
		WHERE tblPageType.ContentType = 0
		AND (@LangBranchID=-1 OR tblProperty.fkLanguageBranchID=@LangBranchID OR tblPageDefinition.LanguageSpecific<3)
END
GO
/****** Object:  StoredProcedure [dbo].[netPropertySearchValueMeta]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netPropertySearchValueMeta]
(
	@PageID			INT,
	@PropertyName 	NVARCHAR(255),
	@Equals			BIT = 0,
	@NotEquals		BIT = 0,
	@GreaterThan	BIT = 0,
	@LessThan		BIT = 0,
	@Boolean		BIT = NULL,
	@Number			INT = NULL,
	@FloatNumber	FLOAT = NULL,
	@PageType		INT = NULL,
	@PageLink		INT = NULL,
	@Date			DATETIME = NULL,
	@LanguageBranch	NCHAR(17) = NULL
)
AS
BEGIN
	DECLARE @LangBranchID NCHAR(17)
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
	
	DECLARE @DynSql NVARCHAR(2000)
	DECLARE @compare NVARCHAR(2)
	
	IF (@Equals = 1)
	BEGIN
	    SET @compare = '='
	END
	ELSE IF (@GreaterThan = 1)
	BEGIN
	    SET @compare = '>'
	END
	ELSE IF (@LessThan = 1)
	BEGIN
	    SET @compare = '<'
	END
	ELSE IF (@NotEquals = 1)
	BEGIN
	    SET @compare = '<>'
	END
	ELSE
	BEGIN
	    RAISERROR('No compare condition is defined.',16,1)
	END
	
	SET @DynSql = 'SELECT PageLanguages.fkPageID FROM tblPageLanguage as PageLanguages INNER JOIN tblTree ON tblTree.fkChildID=PageLanguages.fkPageID INNER JOIN tblContent as Pages ON Pages.pkID=PageLanguages.fkPageID'
	IF (@PropertyName = 'PageArchiveLink')
	BEGIN
		SET @DynSql = @DynSql + ' LEFT OUTER JOIN tblContent as Pages2 ON Pages.ArchiveContentGUID = Pages2.ContentGUID'
	END
	
	IF (@PropertyName = 'PageShortcutLink')
	BEGIN
		SET @DynSql = @DynSql + ' LEFT OUTER JOIN tblContent as Pages2 ON PageLanguages.PageLinkGUID = Pages2.ContentGUID'
	END
	
	SET @DynSql = @DynSql + ' WHERE Pages.ContentType = 0 AND tblTree.fkParentID=@PageID'
	IF (@LangBranchID <> -1)
	BEGIN
	    SET @DynSql = @DynSql + ' AND PageLanguages.fkLanguageBranchID=@LangBranchID'
	END
	
	IF (@PropertyName = 'PageVisibleInMenu')
	BEGIN
	    SET @DynSql = @DynSql + ' AND Pages.VisibleInMenu=@Boolean'
	END
	ELSE IF (@PropertyName = 'PageTypeID')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (Pages.fkContentTypeID = @PageType OR (@PageType IS NULL AND Pages.fkContentTypeID IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (Pages.fkContentTypeID' + @compare + '@PageType OR (@PageType IS NULL AND NOT Pages.fkContentTypeID IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageLink')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (PageLanguages.fkPageID = @PageLink OR (@PageLink IS NULL AND PageLanguages.fkPageID IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (PageLanguages.fkPageID' + @compare + '@PageLink OR (@PageLink IS NULL AND NOT PageLanguages.fkPageID IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageParentLink')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (Pages.fkParentID = @PageLink OR (@PageLink IS NULL AND Pages.fkParentID IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (Pages.fkParentID' + @compare + '@PageLink OR (@PageLink IS NULL AND NOT Pages.fkParentID IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageShortcutLink')
	BEGIN
		SET @DynSql = @DynSql + ' AND (Pages2.pkID' + @compare + '@PageLink OR (@PageLink IS NULL AND NOT PageLanguages.PageLinkGUID IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageArchiveLink')
	BEGIN
		SET @DynSql = @DynSql + ' AND (Pages2.pkID' + @compare + '@PageLink OR (@PageLink IS NULL AND NOT Pages.ArchiveContentGUID IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageChanged')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (PageLanguages.Changed = @Date OR (@Date IS NULL AND PageLanguages.Changed IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (PageLanguages.Changed' + @compare + '@Date OR (@Date IS NULL AND NOT PageLanguages.Changed IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageCreated')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (PageLanguages.Created = @Date OR (@Date IS NULL AND PageLanguages.Created IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (PageLanguages.Created' + @compare + '@Date OR (@Date IS NULL AND NOT PageLanguages.Created IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageSaved')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (PageLanguages.Saved = @Date OR (@Date IS NULL AND PageLanguages.Saved IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (PageLanguages.Saved' + @compare + '@Date  OR (@Date IS NULL AND NOT PageLanguages.Saved IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageStartPublish')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (PageLanguages.StartPublish = @Date OR (@Date IS NULL AND PageLanguages.StartPublish IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (PageLanguages.StartPublish' + @compare + '@Date OR (@Date IS NULL AND NOT PageLanguages.StartPublish IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageStopPublish')
	BEGIN
	    IF (@Equals=1)
	        SET @DynSql = @DynSql + ' AND (PageLanguages.StopPublish = @Date OR (@Date IS NULL AND PageLanguages.StopPublish IS NULL))'
	    ELSE
	        SET @DynSql = @DynSql + ' AND (PageLanguages.StopPublish' + @compare + '@Date OR (@Date IS NULL AND NOT PageLanguages.StopPublish IS NULL))'
	END
	ELSE IF (@PropertyName = 'PageDeleted')
	BEGIN
		SET @DynSql = @DynSql + ' AND Pages.Deleted = @Boolean'
	END
	ELSE IF (@PropertyName = 'PagePendingPublish')
	BEGIN
		SET @DynSql = @DynSql + ' AND PageLanguages.PendingPublish = @Boolean'
	END
	ELSE IF (@PropertyName = 'PageShortcutType')
	BEGIN
	    IF (@Number=0)
	        SET @DynSql = @DynSql + ' AND PageLanguages.AutomaticLink=1 AND PageLanguages.PageLinkGUID IS NULL'
	    ELSE IF (@Number=1)
	        SET @DynSql = @DynSql + ' AND PageLanguages.AutomaticLink=1 AND NOT PageLanguages.PageLinkGUID IS NULL AND PageLanguages.FetchData=0'
	    ELSE IF (@Number=2)
	        SET @DynSql = @DynSql + ' AND PageLanguages.AutomaticLink=0 AND PageLanguages.LinkURL<>N''#'''
	    ELSE IF (@Number=3)
	        SET @DynSql = @DynSql + ' AND PageLanguages.AutomaticLink=0 AND PageLanguages.LinkURL=N''#'''
	    ELSE IF (@Number=4)
	        SET @DynSql = @DynSql + ' AND PageLanguages.AutomaticLink=1 AND PageLanguages.FetchData=1'
	END
	EXEC sp_executesql @DynSql, 
		N'@PageID INT, @LangBranchID NCHAR(17), @Boolean BIT, @Number INT, @PageType INT, @PageLink INT, @Date DATETIME',
		@PageID=@PageID,
		@LangBranchID=@LangBranchID, 
		@Boolean=@Boolean,
		@Number=@Number,
		@PageType=@PageType,
		@PageLink=@PageLink,
		@Date=@Date
END
GO
/****** Object:  StoredProcedure [dbo].[netQuickSearchByExternalUrl]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netQuickSearchByExternalUrl]
(
	@Url	NVARCHAR(255),
	@CurrentTime	DATETIME
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @LoweredUrl NVARCHAR(255)
	
	SET @LoweredUrl = Lower(@Url)
	/*
		Performance notes: The subquery "Pages" must not have any more predicates or return the values used in the outer WHERE-clause, otherwise
		SQL Server falls back to a costly index scan. The performance hints LOOP on the joins are also required for the same reason, the resultset
		from "Pages" is so small that a loop join is superior in performance to index scan/hash match, a factor 1000x.
	*/
	
	SELECT 
		tblPageLanguage.fkPageID,
		tblLanguageBranch.LanguageID as LanguageBranch
	FROM 
		(
			SELECT fkPageID,fkLanguageBranchID
			FROM tblPageLanguage
			WHERE tblPageLanguage.ExternalURL=@LoweredUrl
		) AS Pages
	INNER LOOP JOIN 
		tblPage ON tblPage.pkID = Pages.fkPageID
	INNER LOOP JOIN
		tblPageLanguage ON tblPageLanguage.fkPageID=Pages.fkPageID AND tblPageLanguage.fkLanguageBranchID=Pages.fkLanguageBranchID
	INNER LOOP JOIN
		tblLanguageBranch ON tblLanguageBranch.pkID = Pages.fkLanguageBranchID
	WHERE 
		tblPage.Deleted=0 AND 
		tblPageLanguage.[Status]=4 AND
		tblPageLanguage.StartPublish <= @CurrentTime AND
		(tblPageLanguage.StopPublish IS NULL OR tblPageLanguage.StopPublish >= @CurrentTime)
	ORDER BY
		tblPageLanguage.Changed DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netQuickSearchByPath]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netQuickSearchByPath]
(
	@Path	NVARCHAR(1000),
	@PageID	INT,
	@LanguageBranch	NCHAR(17) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Index INT
	DECLARE @LastIndex INT
	DECLARE @LinkURL NVARCHAR(255)
	DECLARE @Name NVARCHAR(255)
	DECLARE @LangBranchID NCHAR(17);
	
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
	SET @Index = CHARINDEX('/',@Path)
	SET @LastIndex = 0
	WHILE @Index > 0 OR @Index IS NULL
	BEGIN
		SET @Name = SUBSTRING(@Path,@LastIndex,@Index-@LastIndex)
		SELECT TOP 1 @PageID=pkID,@LinkURL=tblPageLanguage.LinkURL
		FROM tblPageLanguage
		LEFT JOIN tblPage AS tblPage ON tblPage.pkID=tblPageLanguage.fkPageID
		WHERE tblPageLanguage.Name LIKE @Name AND (tblPage.fkParentID=@PageID OR @PageID IS NULL)
		AND (tblPageLanguage.fkLanguageBranchID=@LangBranchID OR @LangBranchID=-1)
		IF @@ROWCOUNT=0
		BEGIN
			SET @Index=0
			SET @LinkURL = NULL
		END
		ELSE
		BEGIN
			SET @LastIndex = @Index + 1
			SET @Index = CHARINDEX('/',@Path,@LastIndex+1)
		END
	END	
		
	SELECT @LinkURL
END
GO
/****** Object:  StoredProcedure [dbo].[netRemoteSiteDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netRemoteSiteDelete]
(
	@ID INT OUTPUT
)
AS
BEGIN
	DELETE FROM tblRemoteSite WHERE pkID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[netRemoteSiteList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netRemoteSiteList]
AS
BEGIN
SELECT pkID,Name,Url,IsTrusted,UserName,[Password],Domain,AllowUrlLookup
FROM tblRemoteSite
ORDER BY Name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[netRemoteSiteLoad]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netRemoteSiteLoad]
(
	@ID INT
)
AS
BEGIN
	SELECT pkID,Name,Url,IsTrusted,UserName,[Password],Domain,AllowUrlLookup
	FROM tblRemoteSite
	WHERE pkID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[netRemoteSiteSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netRemoteSiteSave]
(
	@ID				INT OUTPUT,
	@Name			NVARCHAR(100),
	@Url			NVARCHAR(255),
	@IsTrusted		BIT = 0,
	@UserName		NVARCHAR(50) = NULL,
	@Password		NVARCHAR(50) = NULL,
	@Domain			NVARCHAR(50) = NULL,
	@AllowUrlLookup BIT = 0
)
AS
BEGIN
	IF @ID=0
	BEGIN
		INSERT INTO tblRemoteSite(Name,Url,IsTrusted,UserName,Password,Domain,AllowUrlLookup) VALUES(@Name,@Url,@IsTrusted,@UserName,@Password,@Domain,@AllowUrlLookup)
		SET @ID =  SCOPE_IDENTITY() 
	END
	ELSE
		UPDATE tblRemoteSite SET Name=@Name,Url=@Url,IsTrusted=@IsTrusted,UserName=@UserName,Password=@Password,Domain=@Domain,AllowUrlLookup=@AllowUrlLookup WHERE pkID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[netReportChangedPages]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Return a list of pages in a particular branch of the tree changed between a start date and a stop date
CREATE PROCEDURE [dbo].[netReportChangedPages](
	@PageID int,
	@StartDate datetime,
	@StopDate datetime,
	@Language int = -1,
	@ChangedByUserName nvarchar(256) = null,
	@PageSize int,
	@PageNumber int = 0,
	@SortColumn varchar(40) = 'Saved',
	@SortDescending bit = 0
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @OrderBy NVARCHAR(MAX)
	SET @OrderBy =
		CASE @SortColumn
			WHEN 'PageName' THEN 'tblPageLanguage.Name'
			WHEN 'ChangedBy' THEN 'tblPageLanguage.ChangedByName'
			WHEN 'Saved' THEN 'tblPageLanguage.Saved'
			WHEN 'Language' THEN 'tblLanguageBranch.LanguageID'
			WHEN 'PageTypeName' THEN 'tblPageType.Name'
		END
	IF(@SortDescending = 1)
		SET @OrderBy = @OrderBy + ' DESC'
		
	DECLARE @sql NVARCHAR(MAX)
	Set @sql = 'WITH PageCTE AS
	(
		SELECT ROW_NUMBER() OVER(ORDER BY '
			+ @OrderBy
			+ ') AS rownum,
		tblPageLanguage.fkPageID, tblPageLanguage.Version AS PublishedVersion, count(*) over () as totcount
		FROM tblPageLanguage 
		INNER JOIN tblTree ON tblTree.fkChildID=tblPageLanguage.fkPageID 
		INNER JOIN tblPage ON tblPage.pkID=tblPageLanguage.fkPageID 
		INNER JOIN tblPageType ON tblPageType.pkID=tblPage.fkPageTypeID 
		INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkID=tblPageLanguage.fkLanguageBranchID 
		WHERE (tblTree.fkParentID=@PageID OR (tblPageLanguage.fkPageID=@PageID AND tblTree.NestingLevel = 1 ))
        AND (@StartDate IS NULL OR tblPageLanguage.Saved >= @StartDate)
        AND (@StopDate IS NULL OR tblPageLanguage.Saved <= @StopDate)
        AND (@Language = -1 OR tblPageLanguage.fkLanguageBranchID = @Language)
        AND (@ChangedByUserName IS NULL OR tblPageLanguage.ChangedByName = @ChangedByUserName)
        AND (@ChangedByUserName IS NULL OR tblPageLanguage.ChangedByName = @ChangedByUserName)
        AND tblPage.ContentType = 0
        AND tblPageLanguage.Status=4
	)
	SELECT PageCTE.fkPageID, PageCTE.PublishedVersion, PageCTE.rownum, totcount
	FROM PageCTE
	WHERE rownum > @PageSize * (@PageNumber)
	AND rownum <= @PageSize * (@PageNumber+1)
	ORDER BY rownum'
	
	EXEC sp_executesql @sql, N'@PageID int, @StartDate datetime, @StopDate datetime, @Language int, @ChangedByUserName nvarchar(256), @PageSize int, @PageNumber int',
		@PageID = @PageID, 
		@StartDate = @StartDate, 
		@StopDate = @StopDate, 
		@Language = @Language, 
		@ChangedByUserName = @ChangedByUserName, 
		@PageSize = @PageSize, 
		@PageNumber = @PageNumber
END
GO
/****** Object:  StoredProcedure [dbo].[netReportExpiredPages]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Returns a list of pages which will expire between the supplied dates in a particular branch of the tree.
CREATE PROCEDURE [dbo].[netReportExpiredPages](
	@PageID int,
	@StartDate datetime,
	@StopDate datetime,
	@Language int = -1,
	@PageSize int,
	@PageNumber int = 0,
	@SortColumn varchar(40) = 'StopPublish',
	@SortDescending bit = 0,
	@PublishedByName nvarchar(256) = null
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @OrderBy NVARCHAR(MAX)
	SET @OrderBy =
		CASE @SortColumn
			WHEN 'PageName' THEN 'tblPageLanguage.Name'
			WHEN 'StartPublish' THEN 'tblPageLanguage.StartPublish'
			WHEN 'StopPublish' THEN 'tblPageLanguage.StopPublish'
			WHEN 'ChangedBy' THEN 'tblPageLanguage.ChangedByName'
			WHEN 'Saved' THEN 'tblPageLanguage.Saved'
			WHEN 'Language' THEN 'tblLanguageBranch.LanguageID'
			WHEN 'PageTypeName' THEN 'tblPageType.Name'
		END
	IF(@SortDescending = 1)
		SET @OrderBy = @OrderBy + ' DESC'
    DECLARE @sql NVARCHAR(MAX)
	SET @sql = 'WITH PageCTE AS
    (
        SELECT ROW_NUMBER() OVER(ORDER BY ' 
			+ @OrderBy 
			+ ') AS rownum,
        tblPageLanguage.fkPageID, tblPageLanguage.Version AS PublishedVersion, count(tblPageLanguage.fkPageID) over () as totcount                        
        FROM tblPageLanguage 
        INNER JOIN tblTree ON tblTree.fkChildID=tblPageLanguage.fkPageID 
        INNER JOIN tblPage ON tblPage.pkID=tblPageLanguage.fkPageID 
        INNER JOIN tblPageType ON tblPageType.pkID=tblPage.fkPageTypeID 
        INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkID=tblPageLanguage.fkLanguageBranchID 
        WHERE 
        (tblTree.fkParentID = @PageID OR (tblPageLanguage.fkPageID = @PageID AND tblTree.NestingLevel = 1))
        AND 
        (@StartDate IS NULL OR tblPageLanguage.StopPublish >= @StartDate)
        AND
        (@StopDate IS NULL OR tblPageLanguage.StopPublish <= @StopDate)
		AND
		(@Language = -1 OR tblPageLanguage.fkLanguageBranchID = @Language)
        AND tblPage.ContentType = 0
		AND tblPageLanguage.Status=4
		AND
		(@PublishedByName IS NULL OR tblPageLanguage.ChangedByName = @PublishedByName)
    )
    SELECT PageCTE.fkPageID, PageCTE.PublishedVersion, PageCTE.rownum, totcount
    FROM PageCTE
    WHERE rownum > @PageSize * (@PageNumber)
    AND rownum <= @PageSize * (@PageNumber+1)
    ORDER BY rownum'
    
    EXEC sp_executesql @sql, N'@PageID int, @StartDate datetime, @StopDate datetime, @Language int, @PublishedByName nvarchar(256), @PageSize int, @PageNumber int',
		@PageID = @PageID, 
		@StartDate = @StartDate, 
		@StopDate = @StopDate, 
		@Language = @Language, 
		@PublishedByName = @PublishedByName, 
		@PageSize = @PageSize, 
		@PageNumber = @PageNumber
END
GO
/****** Object:  StoredProcedure [dbo].[netReportPublishedPages]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Return a list of pages in a particular branch of the tree published between a start date and a stop date
CREATE PROCEDURE [dbo].[netReportPublishedPages](
	@PageID int,
	@StartDate datetime,
	@StopDate datetime,
	@Language int = -1,
	@ChangedByUserName nvarchar(256) = null,
	@PageSize int,
	@PageNumber int = 0,
	@SortColumn varchar(40) = 'StartPublish',
	@SortDescending bit = 0
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @OrderBy NVARCHAR(MAX)
	SET @OrderBy =
		CASE @SortColumn
			WHEN 'PageName' THEN 'tblPageLanguage.Name'
			WHEN 'StartPublish' THEN 'tblPageLanguage.StartPublish'
			WHEN 'StopPublish' THEN 'tblPageLanguage.StopPublish'
			WHEN 'ChangedBy' THEN 'tblPageLanguage.ChangedByName'
			WHEN 'Saved' THEN 'tblPageLanguage.Saved'
			WHEN 'Language' THEN 'tblLanguageBranch.LanguageID'
			WHEN 'PageTypeName' THEN 'tblPageType.Name'
		END
	IF(@SortDescending = 1)
		SET @OrderBy = @OrderBy + ' DESC'
	DECLARE @sql NVARCHAR(MAX)
	SET @sql = 'WITH PageCTE AS
	(
		SELECT ROW_NUMBER() OVER(ORDER BY ' 
			+ @OrderBy
			+ ') AS rownum,
		tblPageLanguage.fkPageID, tblPageLanguage.Version AS PublishedVersion, count(*) over () as totcount
		FROM tblPageLanguage 
		INNER JOIN tblTree ON tblTree.fkChildID=tblPageLanguage.fkPageID 
		INNER JOIN tblPage ON tblPage.pkID=tblPageLanguage.fkPageID 
		INNER JOIN tblPageType ON tblPageType.pkID=tblPage.fkPageTypeID 
		INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkID=tblPageLanguage.fkLanguageBranchID
		WHERE
		(tblTree.fkParentID=@PageID OR (tblPageLanguage.fkPageID=@PageID AND tblTree.NestingLevel = 1 ))
        AND tblPage.ContentType = 0
		AND tblPageLanguage.Status=4
		AND 
		(@StartDate IS NULL OR tblPageLanguage.StartPublish >= @StartDate)
		AND
		(@StopDate IS NULL OR tblPageLanguage.StartPublish <= @StopDate)
		AND
		(@Language = -1 OR tblPageLanguage.fkLanguageBranchID = @Language)
		AND
		(@ChangedByUserName IS NULL OR tblPageLanguage.ChangedByName = @ChangedByUserName)
	)
	SELECT PageCTE.fkPageID, PageCTE.PublishedVersion, PageCTE.rownum, totcount
	FROM PageCTE
	WHERE rownum > @PageSize * (@PageNumber)
	AND rownum <= @PageSize * (@PageNumber+1)
	ORDER BY rownum'
	EXEC sp_executesql @sql, N'@PageID int, @StartDate datetime, @StopDate datetime, @Language int, @ChangedByUserName nvarchar(256), @PageSize int, @PageNumber int',
		@PageID = @PageID, 
		@StartDate = @StartDate, 
		@StopDate = @StopDate, 
		@Language = @Language, 
		@ChangedByUserName = @ChangedByUserName, 
		@PageSize = @PageSize, 
		@PageNumber = @PageNumber
	
END
GO
/****** Object:  StoredProcedure [dbo].[netReportReadyToPublish]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Return a list of pages in a particular branch of the tree published between a start date and a stop date
CREATE PROCEDURE [dbo].[netReportReadyToPublish](
	@PageID int,
	@StartDate datetime,
	@StopDate datetime,
	@Language int = -1,
	@ChangedByUserName nvarchar(256) = null,
	@PageSize int,
	@PageNumber int = 0,
	@SortColumn varchar(40) = 'PageName',
	@SortDescending bit = 0,
	@IsReadyToPublish bit = 1
)
AS
BEGIN
	SET NOCOUNT ON;
	WITH PageCTE AS
                    (
                        SELECT ROW_NUMBER() OVER(ORDER BY 
							-- Page Name Sorting
							CASE WHEN @SortColumn = 'PageName' AND @SortDescending = 1 THEN tblWorkPage.Name END DESC,
							CASE WHEN @SortColumn = 'PageName' THEN tblWorkPage.Name END ASC,
							-- Saved Sorting
							CASE WHEN @SortColumn = 'Saved' AND @SortDescending = 1 THEN tblWorkPage.Saved END DESC,
							CASE WHEN @SortColumn = 'Saved' THEN tblWorkPage.Saved END ASC,
							-- StartPublish Sorting
							CASE WHEN @SortColumn = 'StartPublish' AND @SortDescending = 1 THEN tblWorkPage.StartPublish END DESC,
							CASE WHEN @SortColumn = 'StartPublish' THEN tblWorkPage.StartPublish END ASC,
							-- Changed By Sorting
							CASE WHEN @SortColumn = 'ChangedBy' AND @SortDescending = 1 THEN tblWorkPage.ChangedByName END DESC,
							CASE WHEN @SortColumn = 'ChangedBy' THEN tblWorkPage.ChangedByName END ASC,
							-- Language Sorting
							CASE WHEN @SortColumn = 'Language' AND @SortDescending = 1 THEN tblLanguageBranch.LanguageID END DESC,
							CASE WHEN @SortColumn = 'Language' THEN tblLanguageBranch.LanguageID END ASC
							, 
							tblWorkPage.pkID ASC
                        ) AS rownum,
                        tblWorkPage.fkPageID, count(tblWorkPage.fkPageID) over () as totcount,
                        tblWorkPage.pkID as versionId
                        FROM tblWorkPage 
                        INNER JOIN tblTree ON tblTree.fkChildID=tblWorkPage.fkPageID 
                        INNER JOIN tblPage ON tblPage.pkID=tblWorkPage.fkPageID 
						INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkID=tblWorkPage.fkLanguageBranchID 
                        WHERE 
							(tblTree.fkParentID=@PageID OR (tblWorkPage.fkPageID=@PageID AND tblTree.NestingLevel = 1 ))
                        AND
							(@ChangedByUserName IS NULL OR tblWorkPage.ChangedByName = @ChangedByUserName)
                        AND
							tblPage.ContentType = 0
                        AND
							(@Language = -1 OR tblWorkPage.fkLanguageBranchID = @Language)
                        AND 
							(@StartDate IS NULL OR tblWorkPage.Saved >= @StartDate)
                        AND
							(@StopDate IS NULL OR tblWorkPage.Saved <= @StopDate)
                        AND
							(tblWorkPage.ReadyToPublish = @IsReadyToPublish AND tblWorkPage.HasBeenPublished = 0)
                    )
                    SELECT PageCTE.fkPageID, PageCTE.rownum, totcount, PageCTE.versionId
                    FROM PageCTE
                    WHERE rownum > @PageSize * (@PageNumber)
                    AND rownum <= @PageSize * (@PageNumber+1)
                    ORDER BY rownum
	END
GO
/****** Object:  StoredProcedure [dbo].[netReportSimpleAddresses]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Return a list of pages in a particular branch of the tree changed between a start date and a stop date
CREATE PROCEDURE [dbo].[netReportSimpleAddresses](
	@PageID int,
	@Language int = -1,
	@PageSize int,
	@PageNumber int = 0,
	@SortColumn varchar(40) = 'ExternalURL',
	@SortDescending bit = 0
)
AS
BEGIN
	SET NOCOUNT ON;
	WITH PageCTE AS
	(
		SELECT ROW_NUMBER() OVER(ORDER BY 
			-- Page Name Sorting
			CASE WHEN @SortColumn = 'PageName' AND @SortDescending = 1 THEN tblPageLanguage.Name END DESC,
			CASE WHEN @SortColumn = 'PageName' THEN tblPageLanguage.Name END ASC,
			-- Changed By Sorting
			CASE WHEN @SortColumn = 'ChangedBy' AND @SortDescending = 1 THEN tblPageLanguage.ChangedByName END DESC,
			CASE WHEN @SortColumn = 'ChangedBy' THEN tblPageLanguage.ChangedByName END ASC,
			-- External Url Sorting
			CASE WHEN @SortColumn = 'ExternalURL' AND @SortDescending = 1 THEN tblPageLanguage.ExternalURL END DESC,
			CASE WHEN @SortColumn = 'ExternalURL' THEN tblPageLanguage.ExternalURL END ASC,
			-- Language Sorting
			CASE WHEN @SortColumn = 'Language' AND @SortDescending = 1 THEN tblLanguageBranch.LanguageID END DESC,
			CASE WHEN @SortColumn = 'Language' THEN tblLanguageBranch.LanguageID END ASC
		) AS rownum,
		tblPageLanguage.fkPageID, tblPageLanguage.[Version], count(*) over () as totcount
		FROM tblPageLanguage 
		INNER JOIN tblTree ON tblTree.fkChildID=tblPageLanguage.fkPageID 
		INNER JOIN tblPage ON tblPage.pkID=tblPageLanguage.fkPageID 
		INNER JOIN tblPageType ON tblPageType.pkID=tblPage.fkPageTypeID
		INNER JOIN tblLanguageBranch ON tblLanguageBranch.pkID=tblPageLanguage.fkLanguageBranchID 
		WHERE 
        (tblTree.fkParentID=@PageID OR (tblPageLanguage.fkPageID=@PageID AND tblTree.NestingLevel = 1 ))
        AND 
        (tblPageLanguage.ExternalURL IS NOT NULL)
        AND tblPage.ContentType = 0
        AND
        (@Language = -1 OR tblPageLanguage.fkLanguageBranchID = @Language)
	)
	SELECT PageCTE.fkPageID, PageCTE.[Version], PageCTE.rownum, totcount
	FROM PageCTE
	WHERE rownum > @PageSize * (@PageNumber)
	AND rownum <= @PageSize * (@PageNumber+1)
	ORDER BY rownum
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerAdd]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerAdd]
(
	@out_Id			uniqueidentifier output,
	@methodName		nvarchar(100),
	@fStatic		bit,
	@typeName		nvarchar(1024),
	@assemblyName	nvarchar(100),
	@data			image,
	@dtExec			datetime,
	@sRecurDatePart	nchar(2),
	@Interval		int,
	@out_fRefresh	bit output
)
as
begin
	set nocount on
		
	select @out_Id = newid()
	
	select @out_fRefresh = case when exists( select * from tblScheduledItem where NextExec < @dtExec ) then 0 else 1 end
	
	insert into tblScheduledItem( pkID, Enabled, MethodName, fStatic, TypeName, AssemblyName, NextExec, [DatePart], [Interval], InstanceData )
	   values( @out_Id, 1, @methodName, @fStatic, @typeName, @assemblyName, @dtExec, @sRecurDatePart, @Interval, @data )
	
	return
end
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerExecute]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerExecute]
(
	@pkID        uniqueidentifier,
	@currentExec datetime,
	@updatedExec datetime,
	@pingSeconds int,
	@expectedExecutionAttempt int,
	@nextExecutionAttempt int,
	@updated	 bit out 
)
AS
BEGIN
	SET NOCOUNT ON
	IF EXISTS(SELECT * FROM tblScheduledItem WITH (rowlock, updlock) WHERE pkID = @pkID AND NextExec = @currentExec AND LastExecutionAttempt = @expectedExecutionAttempt AND Enabled = 1 AND (IsRunning <> 1 OR (GETUTCDATE() > DATEADD(second, @pingSeconds, LastPing))))
	BEGIN
		UPDATE tblScheduledItem SET 
			NextExec = @updatedExec, 
			LastExecutionAttempt = @nextExecutionAttempt, 
			LastPing = GETUTCDATE(),
			IsRunning = 1  
		WHERE 
			pkID = @pkID
		SET @updated = 1
	END
	ELSE
		SET @updated = 0
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerList]
AS
BEGIN
	SELECT CONVERT(NVARCHAR(40),pkID) AS pkID,Name,CONVERT(INT,Enabled) AS Enabled,LastExec,LastStatus,LastText,NextExec,[DatePart],Interval,MethodName,CONVERT(INT,fStatic) AS fStatic,TypeName,AssemblyName,InstanceData, IsRunning, CurrentStatusMessage, DateDiff(second, LastPing, GETUTCDATE()) as SecondsAfterLastPing, IsStoppable, Restartable, LastExecutionAttempt
	FROM tblScheduledItem
	ORDER BY Name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerListLog]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerListLog]
(
	@pkID UNIQUEIDENTIFIER,
	@startIndex BIGINT = 0,
	@maxCount INT = 100
)
AS
BEGIN
	DECLARE @TotalCount BIGINT = (SELECT COUNT(*) FROM tblScheduledItemLog WHERE fkScheduledItemId = @pkID)
	;WITH Items_CTE AS
	(
		SELECT [Exec], [Status], [Text], [Duration], [Trigger], [Server], ROW_NUMBER() OVER (ORDER BY [Exec] DESC) AS [RowIndex]
		FROM tblScheduledItemLog
		WHERE fkScheduledItemId = @pkID
	)
	SELECT TOP (@maxCount) [Exec], Status, [Text], [Duration], [Trigger], [Server], @TotalCount AS 'TotalCount'
	FROM Items_CTE
	WHERE RowIndex >= @startIndex
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerRemove]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[netSchedulerRemove]
@ID	uniqueidentifier
as
begin
	set nocount on
	
	delete from tblScheduledItemLog where fkScheduledItemId = @ID
	delete from tblScheduledItem where pkID = @ID
	
	return
end
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerReport]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerReport]
@ScheduledItemId UNIQUEIDENTIFIER,
@Status INT,
@Text	NVARCHAR(MAX) = null,
@ExecutionCompleted DATETIME,
@Duration BIGINT = NULL,
@Trigger INT = NULL,
@Server NVARCHAR(255) = NULL
AS
BEGIN
	UPDATE tblScheduledItem SET LastExec = @ExecutionCompleted,
								LastStatus = @Status,
								LastText = @Text
	FROM tblScheduledItem
	WHERE pkID = @ScheduledItemId
	INSERT INTO tblScheduledItemLog( fkScheduledItemId, [Exec], Status, [Text], [Duration], [Trigger], [Server]) 
		VALUES(@ScheduledItemId,@ExecutionCompleted,@Status,@Text, @Duration, @Trigger, @Server)
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerSave]
(
@pkID		UNIQUEIDENTIFIER,
@Name		NVARCHAR(50),
@Enabled	BIT = 0,
@NextExec 	DATETIME,
@DatePart	NCHAR(2) = NULL,
@Interval	INT = 0,
@MethodName NVARCHAR(100),
@fStatic 	BIT,
@TypeName 	NVARCHAR(1024),
@AssemblyName NVARCHAR(100),
@InstanceData   VARBINARY(MAX) = NULL,
@IsStoppable BIT = 0,
@Restartable    INT = 0
)
AS
BEGIN
IF EXISTS(SELECT * FROM tblScheduledItem WHERE pkID=@pkID)
	UPDATE tblScheduledItem SET
		Name 		= @Name,
		Enabled 	= @Enabled,
		NextExec 	= @NextExec,
		[DatePart] 	= @DatePart,
		Interval 		= @Interval,
		MethodName 	= @MethodName,
		fStatic 		= @fStatic,
		TypeName 	= @TypeName,
		AssemblyName 	= @AssemblyName,
		InstanceData	= @InstanceData,
		IsStoppable = @IsStoppable,
		Restartable		= @Restartable
	WHERE pkID = @pkID
ELSE
	INSERT INTO tblScheduledItem(pkID,Name,Enabled,NextExec,[DatePart],Interval,MethodName,fStatic,TypeName,AssemblyName,InstanceData,IsStoppable,Restartable)
	VALUES(@pkID,@Name,@Enabled,@NextExec,@DatePart,@Interval, @MethodName,@fStatic,@TypeName,@AssemblyName,@InstanceData, @IsStoppable, @Restartable)
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerSetCurrentStatus]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerSetCurrentStatus] 
	@pkID UNIQUEIDENTIFIER,
	@StatusMessage nvarchar(2048)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE tblScheduledItem SET CurrentStatusMessage = @StatusMessage
	WHERE pkID = @pkID
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerSetRunningState]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerSetRunningState]
	@pkID UNIQUEIDENTIFIER,
	@IsRunning bit,
	@resetLastExecutionAttempt bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN
	    UPDATE tblScheduledItem SET
				IsRunning = @IsRunning, 
				LastPing = GETUTCDATE(), 
				CurrentStatusMessage = NULL, 
				LastExecutionAttempt =  CASE @resetLastExecutionAttempt WHEN 1 THEN 0 ELSE ISNULL(LastExecutionAttempt, 0) END
		WHERE 
				pkID = @pkID
	END	
END
GO
/****** Object:  StoredProcedure [dbo].[netSchedulerTruncateLog]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSchedulerTruncateLog]
@ScheduledItemId UNIQUEIDENTIFIER,
@MaxHistoryCount	INT = NULL
AS
BEGIN
   DECLARE @MaxCount int = 0 
   SELECT  @MaxCount = COUNT(pkID) FROM tblScheduledItemLog WITH(NOLOCK) WHERE fkScheduledItemId = @ScheduledItemId 
   IF(@MaxCount > @MaxHistoryCount)
   BEGIN
		  DELETE
		  FROM tblScheduledItemLog 
		  WHERE pkID IN (SELECT TOP(@MaxCount - @MaxHistoryCount) pkID FROM tblScheduledItemLog WHERE fkScheduledItemId =  @ScheduledItemId ORDER BY pkID ASC)
   END
END
GO
/****** Object:  StoredProcedure [dbo].[netSiteConfigDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSiteConfigDelete]
	@SiteID VARCHAR(250),
	@PropertyName VARCHAR(250)
AS
BEGIN
	DELETE FROM tblSiteConfig WHERE SiteID = @SiteID AND PropertyName = @PropertyName
END
GO
/****** Object:  StoredProcedure [dbo].[netSiteConfigGet]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSiteConfigGet]
	@SiteID VARCHAR(250) = NULL,
	@PropertyName VARCHAR(250)
AS
BEGIN
	IF @SiteID IS NULL
	BEGIN
		SELECT * FROM tblSiteConfig WHERE PropertyName = @PropertyName
	END
	ELSE
	BEGIN
		SELECT * FROM tblSiteConfig WHERE SiteID = @SiteID AND PropertyName = @PropertyName
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netSiteConfigSet]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSiteConfigSet]
	@SiteID VARCHAR(250),
	@PropertyName VARCHAR(250),
	@PropertyValue NVARCHAR(max)
AS
BEGIN
	DECLARE @Id AS INT
	SELECT @Id = pkID FROM tblSiteConfig WHERE SiteID = @SiteID AND PropertyName = @PropertyName
	IF @Id IS NOT NULL
	BEGIN
		-- Update
		UPDATE tblSiteConfig SET PropertyValue = @PropertyValue WHERE pkID = @Id
	END
	ELSE
	BEGIN
		INSERT INTO tblSiteConfig(SiteID, PropertyName, PropertyValue) VALUES(@SiteID, @PropertyName, @PropertyValue)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netSiteDefinitionDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSiteDefinitionDelete]
(
	@UniqueId		uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM tblSiteDefinition WHERE UniqueId = @UniqueId
END
GO
/****** Object:  StoredProcedure [dbo].[netSiteDefinitionList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSiteDefinitionList]
AS
BEGIN
	SELECT UniqueId, Name, SiteUrl, StartPage, SiteAssetsRoot, SavedBy, Saved FROM tblSiteDefinition
	SELECT site.[UniqueId] AS SiteId, host.[Name], host.[Type], host.[Language], host.[Https] 
	FROM tblHostDefinition host
	INNER JOIN tblSiteDefinition site ON site.pkID = host.fkSiteID
END
GO
/****** Object:  StoredProcedure [dbo].[netSiteDefinitionSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSiteDefinitionSave]
(
	@UniqueId uniqueidentifier = NULL OUTPUT,
	@Name nvarchar(255),
	@SiteUrl varchar(MAX),
	@StartPage varchar(255),
	@SiteAssetsRoot varchar(255) = NULL,
	@Hosts dbo.HostDefinitionTable READONLY,
    @UserName nvarchar(255),
	@Saved datetime
)
AS
BEGIN
	DECLARE @SiteID int
	
	IF (@UniqueId IS NULL OR @UniqueId = CAST(0x0 AS uniqueidentifier))
		SET @UniqueId = NEWID()
	ELSE -- If UniqueId is set we must first check if it has been saved before
		SELECT @SiteID = pkID FROM tblSiteDefinition WHERE UniqueId = @UniqueId
	IF (@SiteID IS NULL) 
	BEGIN
		INSERT INTO tblSiteDefinition 
		(
			UniqueId,
			Name,
			SiteUrl,
			StartPage,
			SiteAssetsRoot,
            SavedBy,
            Saved
		) 
		VALUES
		(
			@UniqueId,
			@Name,
			@SiteUrl,
			@StartPage,
			@SiteAssetsRoot,
            @UserName,
            @Saved
		)
		SET @SiteID = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE tblSiteDefinition SET 
			UniqueId=@UniqueId,
			Name = @Name,
			SiteUrl = @SiteUrl,
			StartPage = @StartPage,
			SiteAssetsRoot = @SiteAssetsRoot,
            SavedBy = @UserName,
            Saved = @Saved
		WHERE 
			pkID = @SiteID
		
	END
	-- Site hosts
	MERGE tblHostDefinition AS Target
    USING @Hosts AS Source
    ON (Target.Name = Source.Name AND Target.fkSiteID=@SiteID)
    WHEN MATCHED THEN 
        UPDATE SET fkSiteID = @SiteID, Name = Source.Name, Type = Source.Type, Language = Source.Language, Https = Source.Https
	WHEN NOT MATCHED BY Source AND Target.fkSiteID = @SiteID THEN
		DELETE
	WHEN NOT MATCHED BY Target THEN
		INSERT (fkSiteID, Name, Type, Language, Https)
		VALUES (@SiteID, Source.Name, Source.Type, Source.Language, Source.Https);
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinkByExternalLink]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[netSoftLinkByExternalLink]
(
	@ContentLink NVARCHAR(255),
	@ContentGuid uniqueidentifier = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		pkID,
		fkOwnerContentID AS OwnerID,
		fkReferencedContentGUID AS ReferencedGUID,
		NULL AS OwnerName,
		NULL AS ReferencedName,
		OwnerLanguageID,
		ReferencedLanguageID,
		LinkURL,
		LinkType as ReferenceType ,
		LinkProtocol,
		LastCheckedDate,
		FirstDateBroken,
		HttpStatusCode,
		LinkStatus
	FROM tblContentSoftlink 
	WHERE [fkReferencedContentGUID] = @ContentGuid OR [ContentLink] = @ContentLink
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinkByPageLink]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[netSoftLinkByPageLink]
(
	@PageLink NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		pkID,
		fkOwnerContentID AS OwnerID,
		fkReferencedContentGUID AS ReferencedGUID,
		NULL AS OwnerName,
		NULL AS ReferencedName,
		OwnerLanguageID,
		ReferencedLanguageID,
		LinkURL,
		LinkType as ReferenceType ,
		LinkProtocol,
		LastCheckedDate,
		FirstDateBroken,
		HttpStatusCode,
		LinkStatus
	FROM tblContentSoftlink 
	WHERE [ContentLink] = @PageLink
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinkByUrl]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinkByUrl]
(
	@LinkURL NVARCHAR(2048),
	@ExactMatch INT = 1
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		pkID,
		fkOwnerContentID AS OwnerContentID,
		fkReferencedContentGUID AS ReferencedContentGUID,
		OwnerLanguageID,
		ReferencedLanguageID,
		LinkURL,
		LinkType,
		LinkProtocol,
		LastCheckedDate,
		FirstDateBroken,
		HttpStatusCode,
		LinkStatus
	FROM tblContentSoftlink 
	WHERE (@ExactMatch=1 AND LinkURL LIKE @LinkURL) OR (@ExactMatch=0 AND LinkURL LIKE (@LinkURL + '%'))
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinkDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinkDelete]
(
	@OwnerContentID	INT,
	@LanguageBranch nchar(17) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @LangBranchID INT
	IF NOT @LanguageBranch IS NULL
	BEGIN
		SELECT @LangBranchID = pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
		IF @LangBranchID IS NULL
		BEGIN
			RAISERROR (N'netSoftLinkDelete: LanguageBranchID is null, possibly empty table tblLanguageBranch', 16, 1)
			RETURN 0
		END
	END
	DELETE FROM tblContentSoftlink WHERE fkOwnerContentID = @OwnerContentID AND (@LanguageBranch IS NULL OR OwnerLanguageID=@LangBranchID)
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinkInsert]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinkInsert]
(
	@OwnerContentID	INT,
	@ReferencedContentGUID uniqueidentifier,
	@LinkURL	NVARCHAR(2048),
	@LinkType	INT,
	@LinkProtocol	NVARCHAR(10),
	@ContentLink	NVARCHAR(255),
	@LastCheckedDate datetime,
	@FirstDateBroken datetime,
	@HttpStatusCode int,
	@LinkStatus int,
	@OwnerLanguageID int,
	@ReferencedLanguageID int
)
AS
BEGIN
	INSERT INTO tblContentSoftlink
		(fkOwnerContentID,
		fkReferencedContentGUID,
	    OwnerLanguageID,
		ReferencedLanguageID,
		LinkURL,
		LinkType,
		LinkProtocol,
		ContentLink,
		LastCheckedDate,
		FirstDateBroken,
		HttpStatusCode,
		LinkStatus)
	VALUES
		(@OwnerContentID,
		@ReferencedContentGUID,
		@OwnerLanguageID,
		@ReferencedLanguageID,
		@LinkURL,
		@LinkType,
		@LinkProtocol,
		@ContentLink,
		@LastCheckedDate,
		@FirstDateBroken,
		@HttpStatusCode,
		@LinkStatus)
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinkList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinkList]
(
	@ReferenceGUID	uniqueidentifier,
	@Reversed INT = 0
)
AS
BEGIN
	SET NOCOUNT ON
	
	IF @Reversed = 1
		SELECT 
			pkID,
			fkOwnerContentID AS OwnerContentID,
			fkReferencedContentGUID AS ReferencedContentGUID,
			OwnerLanguageID,
			ReferencedLanguageID,
			LinkURL,
			LinkType,
			LinkProtocol,
			LastCheckedDate,
			FirstDateBroken,
			HttpStatusCode,
			LinkStatus
		FROM tblContentSoftlink 
		WHERE fkReferencedContentGUID=@ReferenceGUID
	ELSE
		SELECT 
			SoftLink.pkID,
			Content.pkID AS OwnerContentID,
			SoftLink.fkReferencedContentGUID AS ReferencedContentGUID,
			SoftLink.OwnerLanguageID,
			SoftLink.ReferencedLanguageID,
			SoftLink.LinkURL,
			SoftLink.LinkType,
			SoftLink.LinkProtocol,
			SoftLink.LastCheckedDate,
			SoftLink.FirstDateBroken,
			SoftLink.HttpStatusCode,
			SoftLink.LinkStatus
		FROM tblContentSoftlink AS SoftLink
		INNER JOIN tblContent as Content ON SoftLink.fkOwnerContentID = Content.pkID
		WHERE Content.ContentGUID=@ReferenceGUID
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinksGetBroken]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinksGetBroken]
	@SkipCount int,
	@MaxResults int,
	@RootPageId int
AS
BEGIN
	SELECT [pkID]
		,[fkOwnerContentID]
		,[fkReferencedContentGUID]
		,[OwnerLanguageID]
		,[ReferencedLanguageID]
		,[LinkURL]
		,[LinkType]
		,[LinkProtocol]
		,[ContentLink]
		,[LastCheckedDate]
		,[FirstDateBroken]
		,[HttpStatusCode]
		,[LinkStatus]
	FROM (
		SELECT [pkID]
			,[fkOwnerContentID]
			,[fkReferencedContentGUID]
			,[OwnerLanguageID]
			,[ReferencedLanguageID]
			,[LinkURL]
			,[LinkType]
			,[LinkProtocol]
			,[ContentLink]
			,[LastCheckedDate]
			,[FirstDateBroken]
			,[HttpStatusCode]
			,[LinkStatus]
			,ROW_NUMBER() OVER (ORDER BY pkID ASC) as RowNumber
		FROM [tblContentSoftlink]
		INNER JOIN tblTree ON tblContentSoftlink.fkOwnerContentID = tblTree.fkChildID 
		WHERE (tblTree.fkParentID = @RootPageId OR (tblContentSoftlink.fkOwnerContentID = @RootPageId AND tblTree.NestingLevel = 1)) AND LinkStatus <> 0
		) BrokenLinks
	WHERE BrokenLinks.RowNumber > @SkipCount AND BrokenLinks.RowNumber <= @SkipCount+@MaxResults
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinksGetBrokenCount]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinksGetBrokenCount]
	@OwnerContentID int
AS
BEGIN
		SELECT Count(*)
		FROM [tblContentSoftlink]
		INNER JOIN tblTree ON tblContentSoftlink.fkOwnerContentID = tblTree.fkChildID
		WHERE (tblTree.fkParentID = @OwnerContentID OR (tblContentSoftlink.fkOwnerContentID = @OwnerContentID AND tblTree.NestingLevel = 1)) AND LinkStatus <> 0
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinksGetUnchecked]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinksGetUnchecked]
(
	@LastCheckedDate	datetime,
	@LastCheckedDateBroken	datetime,
	@MaxNumberOfLinks INT = 1000
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT TOP(@MaxNumberOfLinks) *
	FROM tblContentSoftlink
	WHERE (LinkProtocol like 'http%' OR LinkProtocol is NULL) AND 
		(LastCheckedDate < @LastCheckedDate OR (LastCheckedDate < @LastCheckedDateBroken AND LinkStatus <> 0) OR LastCheckedDate IS NULL)
	ORDER BY LastCheckedDate
END
GO
/****** Object:  StoredProcedure [dbo].[netSoftLinksUpdateStatus]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSoftLinksUpdateStatus]
(
	@pkID int,
	@LastCheckedDate datetime,
	@FirstDateBroken datetime,
	@HttpStatusCode int,
	@LinkStatus int
)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE tblContentSoftlink SET
		LastCheckedDate = @LastCheckedDate,
		FirstDateBroken = @FirstDateBroken,
		HttpStatusCode = @HttpStatusCode,
		LinkStatus = @LinkStatus
	WHERE pkID = @pkID
END
GO
/****** Object:  StoredProcedure [dbo].[netSubscriptionListRoots]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSubscriptionListRoots]
AS
BEGIN
	SELECT tblPage.pkID AS PageID
	FROM tblPage
	INNER JOIN tblProperty ON tblProperty.fkPageID		= tblPage.pkID
	INNER JOIN tblPageDefinition ON tblPageDefinition.pkID	= tblProperty.fkPageDefinitionID
	WHERE tblPageDefinition.Name='EPSUBSCRIBE-ROOT' AND NOT tblProperty.PageLink IS NULL AND tblPage.Deleted=0
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedRoleDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedRoleDelete]
(
	@RoleName NVARCHAR(255),
	@ForceDelete INT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @GroupID INT
	DECLARE @LoweredName NVARCHAR(255)
    /* Check if group exists */
	SET @LoweredName=LOWER(@RoleName)
	SET @GroupID=NULL
	SELECT
		@GroupID = pkID
	FROM
		[tblSynchedUserRole]
	WHERE
		[LoweredRoleName]=@LoweredName
	
	/* Group does not exist - do nothing */	
    IF (@GroupID IS NULL)
    BEGIN
        RETURN 0
    END
    
    IF (@ForceDelete = 0)
    BEGIN
        IF (EXISTS(SELECT [fkSynchedRole] FROM [tblSynchedUserRelations] WHERE [fkSynchedRole]=@GroupID))
        BEGIN
            RETURN 1    /* Indicate failure - no force delete and group is populated */
        END
    END
    
    DELETE FROM
        [tblSynchedUserRelations]
    WHERE
        [fkSynchedRole]=@GroupID
    DELETE FROM
        [tblSynchedUserRole]
    WHERE
        pkID=@GroupID
        
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedRoleInsert]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedRoleInsert] 
(
	@RoleName NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @LoweredName NVARCHAR(255)
    /* Check if group exists, insert it if not */
	SET @LoweredName=LOWER(@RoleName)
    INSERT INTO [tblSynchedUserRole]
        ([RoleName], 
		[LoweredRoleName])
	SELECT
	    @RoleName,
	    @LoweredName
	WHERE NOT EXISTS(SELECT pkID FROM [tblSynchedUserRole] WHERE [LoweredRoleName]=@LoweredName)
	
    /* Inserted group, return the id */
    IF (@@ROWCOUNT > 0)
    BEGIN
        RETURN  SCOPE_IDENTITY() 
    END
	
	DECLARE @GroupID INT
	SELECT @GroupID=pkID FROM [tblSynchedUserRole] WHERE [LoweredRoleName]=@LoweredName
	RETURN @GroupID
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedRolesList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedRolesList] 
(
	@RoleName NVARCHAR(255) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
    SELECT
        [RoleName]
    FROM
        [tblSynchedUserRole]
    WHERE
		Enabled = 1 AND
        ((@RoleName IS NULL) OR
        ([LoweredRoleName] LIKE LOWER(@RoleName)))
    ORDER BY
        [RoleName]     
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserGetMetadata]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserGetMetadata]
(
	@UserName NVARCHAR(255)
)
AS
BEGIN
	SET @UserName = LOWER(@UserName)
	SELECT Email, GivenName, Surname, Metadata FROM [tblSynchedUser]
	WHERE LoweredUserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserInsertOrUpdate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserInsertOrUpdate] 
(
	@UserName NVARCHAR(255),
	@GivenName NVARCHAR(255) = NULL,
	@Surname NVARCHAR(255) = NULL,
	@Email NVARCHAR(255) = NULL,
	@Metadata NVARCHAR(MAX) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @UserID INT
	DECLARE @LoweredName NVARCHAR(255)
	SET @LoweredName=LOWER(@UserName)
	SET @UserID = (SELECT pkID FROM [tblSynchedUser] WHERE LoweredUserName=@LoweredName)
	IF (@UserID IS NOT NULL)
	BEGIN
		UPDATE [tblSynchedUser] SET
			UserName = @UserName,
			LoweredUserName = @LoweredName,
			Email =  LOWER(@Email),
			GivenName = @GivenName,
			LoweredGivenName = LOWER(@GivenName),
			Surname = @Surname,
			LoweredSurname = LOWER(@Surname),
			Metadata = @Metadata
		WHERE 
			pkID = @UserID
	END
	ELSE
	BEGIN
		INSERT INTO [tblSynchedUser] 
			(UserName, LoweredUserName, Email, GivenName, LoweredGivenName, Surname, LoweredSurname, Metadata) 
		SELECT 
			@UserName, 
			@LoweredName,
			Lower(@Email),
			@GivenName,
			Lower(@GivenName),
			@Surname,
			Lower(@Surname),
			@Metadata
		SET @UserID= SCOPE_IDENTITY()
	END
	SELECT @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserList]
(
	@UserNameToMatch NVARCHAR(255) = NULL,
	@StartIndex	INT,
	@MaxCount	INT
)
AS
BEGIN
	SET @UserNameToMatch = LOWER(@UserNameToMatch);
	WITH MatchedSynchedUsersCTE
	AS
	(
		SELECT 
		ROW_NUMBER() OVER (ORDER BY UserName) AS RowNum, UserName, Email, GivenName, Surname
		FROM
		(	
			SELECT
				pkID, UserName, GivenName, Surname, Email
			FROM
				[tblSynchedUser]
			WHERE
				(@UserNameToMatch IS NULL) OR 
				(	([tblSynchedUser].LoweredUserName LIKE @UserNameToMatch + '%') OR 
					([tblSynchedUser].Email LIKE @UserNameToMatch + '%') OR
					([tblSynchedUser].LoweredGivenName LIKE @UserNameToMatch + '%') OR
					([tblSynchedUser].LoweredSurname LIKE @UserNameToMatch + '%')
				)
		)
		AS Result
	)
	SELECT TOP(@MaxCount) UserName, GivenName, Surname, Email, (SELECT COUNT(*) FROM MatchedSynchedUsersCTE) AS 'TotalCount'
		FROM MatchedSynchedUsersCTE 
		WHERE RowNum BETWEEN (@StartIndex - 1) * @MaxCount + 1 AND @StartIndex * @MaxCount 
		ORDER BY UserName
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserMatchRoleList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserMatchRoleList] 
(
	@RoleName NVARCHAR(255),
	@UserNameToMatch NVARCHAR(255) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	DECLARE @GroupID INT
	SELECT 
	    @GroupID=pkID
	FROM
	    [tblSynchedUserRole]
	WHERE
	    [LoweredRoleName]=LOWER(@RoleName)
	IF (@GroupID IS NULL)
	BEGIN
	    RETURN -1   /* Role does not exist */
	END
	
	SELECT
	    UserName
	FROM
	    [tblSynchedUserRelations] AS WR
	INNER JOIN
	    [tblSynchedUser] AS WU
	ON
	    WU.pkID=WR.[fkSynchedUser]
	WHERE
	    WR.[fkSynchedRole]=@GroupID AND
	    ((WU.LoweredUserName LIKE LOWER(@UserNameToMatch)) OR (@UserNameToMatch IS NULL))
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserRoleEnableDisable]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserRoleEnableDisable]
(
	@RoleName NVARCHAR(255),
	@Enable BIT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
    UPDATE [tblSynchedUserRole]
        SET Enabled = @Enable
    WHERE
        [LoweredRoleName]=LOWER(@RoleName)
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserRoleList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserRoleList] 
(
    @UserID INT = NULL,
	@UserName NVARCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	IF (@UserID IS NULL)
	BEGIN
		DECLARE @LoweredName NVARCHAR(255)
		SET @LoweredName=LOWER(@UserName)
		SELECT 
			@UserID=pkID 
		FROM
			[tblSynchedUser]
		WHERE
			LoweredUserName=@LoweredName
	END
	
    /* Get Group name and id */
    SELECT
        [RoleName],
        [fkSynchedRole] AS GroupID
    FROM
        [tblSynchedUserRelations] AS WR
    INNER JOIN
        [tblSynchedUserRole] AS WG
    ON
        WR.[fkSynchedRole]=WG.pkID
    WHERE
        WR.[fkSynchedUser]=@UserID
    ORDER BY
        [RoleName]
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserRolesListStatuses]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserRolesListStatuses] 
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
    SELECT
        [RoleName] as Name, Enabled
    FROM
        [tblSynchedUserRole]
    ORDER BY
        [RoleName]     
END
GO
/****** Object:  StoredProcedure [dbo].[netSynchedUserRoleUpdate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netSynchedUserRoleUpdate]
(
	@UserName NVARCHAR(255),
	@Roles dbo.StringParameterTable READONLY,
    @RolesHash INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	DECLARE @UserID INT
    DECLARE @CurrentRolesHash INT
	SELECT @UserID = pkID, @CurrentRolesHash = RolesHash FROM [tblSynchedUser] WHERE LoweredUserName = LOWER(@UserName)
	IF (@UserID IS NULL)
	BEGIN
		RAISERROR(N'No user with username %s was found', 16, 1, @UserName)
	END
    
    IF ((@RolesHash IS NULL AND @CurrentRolesHash IS NOT NULL) OR (@RolesHash IS NOT NULL AND @CurrentRolesHash IS NULL) OR @RolesHash <>  @CurrentRolesHash)
    BEGIN
        UPDATE [tblSynchedUser] SET RolesHash = @RolesHash WHERE pkID = @UserID
	    /*First ensure roles are in role table*/
	    MERGE [tblSynchedUserRole] AS Target
		    USING @Roles AS Source
		    ON (Target.LoweredRoleName = LOWER(Source.String))
		    WHEN NOT MATCHED BY Target THEN
			    INSERT (RoleName, LoweredRoleName)
			    VALUES (Source.String, LOWER(Source.String));
	    /* Remove all existing fole for user */
	    DELETE FROM [tblSynchedUserRelations] WHERE [fkSynchedUser] = @UserID
	    /* Insert roles */
	    INSERT INTO [tblSynchedUserRelations] ([fkSynchedRole], [fkSynchedUser])
	    SELECT [tblSynchedUserRole].pkID, @UserID FROM 
	    [tblSynchedUserRole] INNER JOIN @Roles AS R ON [tblSynchedUserRole].LoweredRoleName = LOWER(R.String)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[netTabInfoDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTabInfoDelete]
(
	@pkID		INT,
	@ReplaceID	INT = NULL
)
AS
BEGIN
	IF NOT @ReplaceID IS NULL
		UPDATE tblPageDefinition SET Advanced = @ReplaceID WHERE Advanced = @pkID
	DELETE FROM tblPageDefinitionGroup WHERE pkID = @pkID AND SystemGroup = 0
END
GO
/****** Object:  StoredProcedure [dbo].[netTabInfoInsert]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTabInfoInsert]
(
	@pkID INT OUTPUT,
	@Name NVARCHAR(100),
	@DisplayName NVARCHAR(100),
	@GroupOrder INT,
	@Access INT
)
AS
BEGIN
	INSERT INTO tblPageDefinitionGroup (Name, DisplayName, GroupOrder, Access)
	VALUES (@Name, @DisplayName, @GroupOrder, @Access)
	SET @pkID =  SCOPE_IDENTITY() 
END
GO
/****** Object:  StoredProcedure [dbo].[netTabInfoList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTabInfoList] AS
BEGIN
	SELECT 	pkID as TabID, 
			Name,
			DisplayName,
			GroupOrder,
			Access AS AccessMask,
			CONVERT(INT,SystemGroup) AS SystemGroup
	FROM tblPageDefinitionGroup 
	ORDER BY GroupOrder
END
GO
/****** Object:  StoredProcedure [dbo].[netTabInfoUpdate]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTabInfoUpdate]
(
	@pkID int,
	@Name nvarchar(100),
	@DisplayName nvarchar(100),
	@GroupOrder int,
	@Access int
)
AS
BEGIN
	UPDATE tblPageDefinitionGroup	SET 
		Name = @Name,
		DisplayName = @DisplayName,
		GroupOrder = @GroupOrder,
		Access = @Access
	WHERE pkID = @pkID
END
GO
/****** Object:  StoredProcedure [dbo].[netTabListDependencies]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTabListDependencies]
(
	@TabID INT
)
AS
BEGIN
	SELECT tblPageDefinitionGroup.pkID as TabID,
		tblPageDefinition.Name as PropertyName,
		tblPageDefinitionGroup.Name as TabName
	FROM tblPageDefinition 
	INNER JOIN tblPageDefinitionGroup
	ON tblPageDefinitionGroup.pkID = tblPageDefinition.Advanced
	WHERE Advanced = @TabID
END
GO
/****** Object:  StoredProcedure [dbo].[netTaskDelete]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTaskDelete]
(
	@TaskID INT
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE FROM 
	    tblTask 
	WHERE 
	    pkID=@TaskID
	    
	RETURN @@ROWCOUNT   
END
GO
/****** Object:  StoredProcedure [dbo].[netTaskList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTaskList]
(
	@UserName NVARCHAR(255) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
	    pkID AS TaskID,
	    COALESCE(Subject, N'-') AS Subject,
	    [Description],
	    DueDate,
	    Status,
	    Activity,
	    Created,
	    Changed,
	    OwnerName,
	    AssignedToName,
	    AssignedIsRole,
	    State,
	    fkPlugInID,
            WorkflowInstanceId,
	    EventActivityName
	FROM 
	    tblTask
	WHERE
	    OwnerName=@UserName OR
	    AssignedToName=@UserName OR
	    AssignedIsRole=1 OR
	    @UserName IS NULL
	ORDER BY 
	    Status ASC,
	    DueDate DESC, 
	    Changed DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netTaskLoad]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTaskLoad]
(
	@TaskID INT
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
	    pkID AS TaskID,
	    COALESCE(Subject, N'-') AS Subject,
	    [Description],
	    DueDate,
	    Status,
	    Activity,
	    Created,
	    Changed,
	    OwnerName,
	    AssignedToName,
	    AssignedIsRole,
	    State,
	    fkPlugInID,
 	    WorkflowInstanceId,
	    EventActivityName
	FROM 
	    tblTask
	WHERE 
	    pkID=@TaskID
END
GO
/****** Object:  StoredProcedure [dbo].[netTaskSave]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTaskSave]
(
    @TaskID INT OUTPUT,
    @Subject NVARCHAR(255),
    @Description NVARCHAR(2000) = NULL,
    @DueDate DATETIME = NULL,
    @OwnerName NVARCHAR(255),
    @AssignedToName NVARCHAR(255),
    @AssignedIsRole BIT,
    @Status INT,
    @PlugInID INT = NULL,
    @Activity NVARCHAR(MAX) = NULL,
    @State NVARCHAR(MAX) = NULL,
    @WorkflowInstanceId NVARCHAR(36) = NULL,
    @EventActivityName NVARCHAR(255) = NULL,
	@CurrentDate DATETIME
)
AS
BEGIN
    -- Create new task
	IF @TaskID = 0
	BEGIN
		INSERT INTO tblTask
		    (Subject,
		    Description,
		    DueDate,
		    OwnerName,
		    AssignedToName,
		    AssignedIsRole,
		    Status,
		    Activity,
		    fkPlugInID,
		    State,
		    WorkflowInstanceId,
		    EventActivityName,
			Created,
			Changed) 
		VALUES
		    (@Subject,
		    @Description,
		    @DueDate,
		    @OwnerName,
		    @AssignedToName,
		    @AssignedIsRole,
		    @Status,
		    @Activity,
		    @PlugInID,
		    @State,
		    @WorkflowInstanceId,
			@EventActivityName,
			@CurrentDate,
			@CurrentDate)
		SET @TaskID= SCOPE_IDENTITY() 
		
		RETURN
	END
    -- Update existing task
	UPDATE tblTask SET
		Subject = @Subject,
		Description = @Description,
		DueDate = @DueDate,
		OwnerName = @OwnerName,
		AssignedToName = @AssignedToName,
		AssignedIsRole = @AssignedIsRole,
		Status = @Status,
		Activity = CASE WHEN @Activity IS NULL THEN Activity ELSE @Activity END,
		State = @State,
		fkPlugInID = @PlugInID,
		WorkflowInstanceId = @WorkflowInstanceId,
		EventActivityName = @EventActivityName,
		Changed = @CurrentDate
	WHERE pkID = @TaskID
END
GO
/****** Object:  StoredProcedure [dbo].[netTaskSaveActivity]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTaskSaveActivity]
(
    @TaskID INT,
    @Activity NVARCHAR(MAX) = NULL
)
AS
BEGIN
	UPDATE 
	    tblTask 
	SET
		Activity = @Activity
	WHERE 
	    pkID = @TaskID
END
GO
/****** Object:  StoredProcedure [dbo].[netTaskWorkflowList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netTaskWorkflowList]
(
	@WorkflowInstanceId NVARCHAR(36)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
	    pkID AS TaskID,
	    COALESCE(Subject, N'-') AS Subject,
	    [Description],
	    DueDate,
	    Status,
	    Activity,
	    Created,
	    Changed,
	    OwnerName,
	    AssignedToName,
	    AssignedIsRole,
	    State,
	    fkPlugInID,
        WorkflowInstanceId,
	    EventActivityName
	FROM 
	    tblTask
	WHERE
		WorkflowInstanceId=@WorkflowInstanceId
	ORDER BY 
	    Status ASC,
	    DueDate DESC, 
	    Changed DESC
END
GO
/****** Object:  StoredProcedure [dbo].[netUniqueSequenceNext]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netUniqueSequenceNext]
(
    @Name NVARCHAR (100),
    @Steps INT,
    @NextValue INT OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT OFF
	DECLARE @ErrorVal INT
	
	/* Assume that row exists and try to do an update to get the next value */
	UPDATE tblUniqueSequence SET @NextValue = LastValue = LastValue + @Steps WHERE Name = @Name
	
	/* If no rows were updated, the row did not exist */
	IF @@ROWCOUNT=0
	BEGIN
	
		/* Try to insert row. The reason for not starting with insert is that this operation is only
		needed ONCE for a sequence, the first update will succeed after this initial insert. */
		INSERT INTO tblUniqueSequence (Name, LastValue) VALUES (@Name, @Steps)
		SET @ErrorVal=@@ERROR	
		
		/* An extra safety precaution - parallell execution caused another instance of this proc to
		insert the relevant row between our first update and our insert. This causes a unique constraint
		violation. Note that SET XACT_ABORT OFF prevents error from propagating to calling code. */
		IF @ErrorVal <> 0
		BEGIN
		
			IF @ErrorVal = 2627
			BEGIN
				/* Unique constraint violation - do the update again since the row now exists */
				UPDATE tblUniqueSequence SET @NextValue = LastValue = LastValue + @Steps WHERE Name = @Name
			END
			ELSE
			BEGIN
				/* Some other error than unique key violation, very unlikely but raise an error to make 
				sure it gets noticed. */
				RAISERROR(50001, 14, 1)
			END
		END
		ELSE
		BEGIN
			/* No error from insert, the "next value" will be equal to the requested number of steps. */
			SET @NextValue = @Steps
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[netUnmappedPropertyList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netUnmappedPropertyList]
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT 
		tblProperty.LinkGuid as GuidID,
		tblProperty.fkPageID as PageID, 
		tblProperty.fkLanguageBranchID as LanguageBranchID,
		tblPageDefinition.Name as PropertyName,
		tblPageDefinition.fkPageTypeID as PageTypeID
		
	FROM
		tblProperty INNER JOIN tblPageDefinition on tblProperty.fkPageDefinitionID = tblPageDefinition.pkID
	WHERE
		tblProperty.LinkGuid IS NOT NULL AND
		tblProperty.PageLink IS NULL		
END
GO
/****** Object:  StoredProcedure [dbo].[netURLSegmentListPages]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netURLSegmentListPages]
(
	@URLSegment	NCHAR(255)
)
AS
BEGIN
	SET NOCOUNT ON
	IF (LEN(@URLSegment) = 0)
	BEGIN
		set @URLSegment = NULL
	END 
	SELECT DISTINCT fkPageID as "PageID"
	FROM tblPageLanguage
	WHERE URLSegment = @URLSegment
	OR (@URLSegment = NULL AND URLSegment = '' OR URLSegment IS NULL)
	
END
GO
/****** Object:  StoredProcedure [dbo].[netURLSegmentSet]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netURLSegmentSet]
(
	@URLSegment			NCHAR(255),
	@PageID				INT,
	@LanguageBranch		NCHAR(17) = NULL
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @LangBranchID NCHAR(17);
	SELECT @LangBranchID=pkID FROM tblLanguageBranch WHERE LanguageID=@LanguageBranch
	IF @LangBranchID IS NULL 
	BEGIN 
		if @LanguageBranch IS NOT NULL
			RAISERROR('Language branch %s is not defined',16,1, @LanguageBranch)
		else
			SET @LangBranchID = -1
	END
	UPDATE tblPageLanguage
	SET URLSegment = RTRIM(@URLSegment)
	WHERE fkPageID = @PageID
	AND (@LangBranchID=-1 OR fkLanguageBranchID=@LangBranchID)
	
	UPDATE tblWorkPage
	SET URLSegment = RTRIM(@URLSegment)
	WHERE fkPageID = @PageID
	AND (@LangBranchID=-1 OR fkLanguageBranchID=@LangBranchID)
END
GO
/****** Object:  StoredProcedure [dbo].[netVersionFilterList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netVersionFilterList]
(
    @StartIndex INT,
    @MaxRows INT,
	@ContentID INT = NULL,
	@ChangedBy NVARCHAR(255) = NULL,
	@ExcludeDeleted BIT = 0,
	@LanguageIds dbo.IDTable READONLY,
	@Statuses dbo.IDTable READONLY
)
AS
BEGIN	
	SET NOCOUNT ON
	DECLARE @StatusCount INT
	SELECT @StatusCount = COUNT(*) FROM @Statuses
	DECLARE @LanguageCount INT
	SELECT @LanguageCount = COUNT(*) FROM @LanguageIds;
	--Optimized for contentid with and without language, those are most used
	IF (@ContentID IS NOT NULL AND @ChangedBy IS NULL AND @ExcludeDeleted = 0 AND @StatusCount = 0)
		IF (@LanguageCount = 0)
		BEGIN
			WITH TempResult as
			(
				SELECT ROW_NUMBER() OVER(ORDER BY W.Saved DESC) as RowNumber,
					W.fkContentID AS ContentID,
					W.pkID AS WorkID,
					W.Status AS VersionStatus,
					W.ChangedByName AS SavedBy,
					W.Saved AS ItemCreated,
					W.Name,
					W.fkLanguageBranchID as LanguageBranchID,
					W.CommonDraft,
					W.fkMasterVersionID as MasterVersion,
					CASE WHEN C.fkMasterLanguageBranchID=W.fkLanguageBranchID THEN 1 ELSE 0 END AS IsMasterLanguageBranch,
					W.NewStatusByName As StatusChangedBy,
					W.DelayPublishUntil
				FROM
					tblWorkContent AS W
					INNER JOIN
					tblContent AS C ON C.pkID=W.fkContentID
				WHERE
					W.fkContentID=@ContentID
			)
			SELECT  ContentID, WorkID, VersionStatus, SavedBy, ItemCreated, Name, LanguageBranchID, CommonDraft, MasterVersion, IsMasterLanguageBranch, StatusChangedBy, DelayPublishUntil, (SELECT COUNT(*) FROM TempResult) AS 'TotalRows'
				FROM    TempResult
				WHERE RowNumber BETWEEN (@StartIndex +1) AND (@MaxRows + @StartIndex)
		END
		ELSE
		BEGIN
			WITH TempResult as
			(
				SELECT ROW_NUMBER() OVER(ORDER BY W.Saved DESC) as RowNumber,
					W.fkContentID AS ContentID,
					W.pkID AS WorkID,
					W.Status AS VersionStatus,
					W.ChangedByName AS SavedBy,
					W.Saved AS ItemCreated,
					W.Name,
					W.fkLanguageBranchID as LanguageBranchID,
					W.CommonDraft,
					W.fkMasterVersionID as MasterVersion,
					CASE WHEN C.fkMasterLanguageBranchID=W.fkLanguageBranchID THEN 1 ELSE 0 END AS IsMasterLanguageBranch,
					W.NewStatusByName As StatusChangedBy,
					W.DelayPublishUntil
				FROM
					tblWorkContent AS W
					INNER JOIN
					tblContent AS C ON C.pkID=W.fkContentID
				WHERE
					W.fkContentID=@ContentID AND
				    W.fkLanguageBranchID IN (SELECT ID FROM @LanguageIds)
		)
		SELECT  ContentID, WorkID, VersionStatus, SavedBy, ItemCreated, Name, LanguageBranchID, CommonDraft, MasterVersion, IsMasterLanguageBranch, StatusChangedBy, DelayPublishUntil, (SELECT COUNT(*) FROM TempResult) AS 'TotalRows'
				FROM    TempResult
				WHERE RowNumber BETWEEN (@StartIndex +1) AND (@MaxRows + @StartIndex)
		END
	ELSE
		DECLARE @SqlQuery NVARCHAR(MAX) = '
		WITH TempResult as
		(
			SELECT ROW_NUMBER() OVER(ORDER BY W.Saved DESC) as RowNumber,
				W.fkContentID AS ContentID,
				W.pkID AS WorkID,
				W.Status AS VersionStatus,
				W.ChangedByName AS SavedBy,
				W.Saved AS ItemCreated,
				W.Name,
				W.fkLanguageBranchID as LanguageBranchID,
				W.CommonDraft,
				W.fkMasterVersionID as MasterVersion,
				CASE WHEN C.fkMasterLanguageBranchID=W.fkLanguageBranchID THEN 1 ELSE 0 END AS IsMasterLanguageBranch,
				W.NewStatusByName As StatusChangedBy,
				W.DelayPublishUntil
			FROM
				tblWorkContent AS W
				INNER JOIN
				tblContent AS C ON C.pkID=W.fkContentID
			WHERE' + CHAR(13);
		DECLARE @IncludeAnd BIT = 0
		IF @ContentID IS NOT NULL
		BEGIN
			SET @SqlQuery += 'W.fkContentID=@ContentID' + CHAR(13);
			SET @IncludeAnd = 1
		END
		IF @ChangedBy IS NOT NULL
		BEGIN
			IF @IncludeAnd = 1
				SET @SqlQuery += 'AND W.ChangedByName=@ChangedBy' + CHAR(13);
			ELSE
				SET @SqlQuery += 'W.ChangedByName=@ChangedBy' + CHAR(13);
			SET @IncludeAnd = 1
		END
		IF @StatusCount > 0
		BEGIN
			IF @IncludeAnd = 1
				SET @SqlQuery += 'AND W.Status IN (SELECT ID FROM @Statuses)' + CHAR(13);
			ELSE
				SET @SqlQuery += 'W.Status IN (SELECT ID FROM @Statuses)' + CHAR(13);
			SET @IncludeAnd = 1
		END
		IF @LanguageCount > 0
		BEGIN
			IF @IncludeAnd = 1
				SET @SqlQuery += 'AND W.fkLanguageBranchID IN (SELECT ID FROM @LanguageIds)' + CHAR(13);
			ELSE
				SET @SqlQuery += 'W.fkLanguageBranchID IN (SELECT ID FROM @LanguageIds)' + CHAR(13);
			SET @IncludeAnd = 1
		END
		IF @ExcludeDeleted = 1
		BEGIN
			IF @IncludeAnd = 1
				SET @SqlQuery += 'AND C.Deleted = 0' + CHAR(13);
			ELSE
				SET @SqlQuery += 'C.Deleted = 0' + CHAR(13);
		END
		SET @SqlQuery += ')' + CHAR(13);
		SET @SqlQuery += 'SELECT  ContentID, WorkID, VersionStatus, SavedBy, ItemCreated, Name, LanguageBranchID, CommonDraft, MasterVersion, IsMasterLanguageBranch, StatusChangedBy, DelayPublishUntil, (SELECT COUNT(*) FROM TempResult) AS ''TotalRows''
			FROM    TempResult
			WHERE RowNumber BETWEEN (@StartIndex +1) AND (@MaxRows + @StartIndex)'
   		
		EXEC sp_executesql @SqlQuery, N'@StartIndex INT, @MaxRows INT, @ContentID INT, @ChangedBy NVARCHAR(255), @Statuses dbo.IDTable READONLY, @LanguageIds dbo.IDTable READONLY, @ExcludeDeleted BIT', 
			@StartIndex = @StartIndex, @MaxRows = @MaxRows, @ContentID = @ContentID, @ChangedBy = @ChangedBy, @Statuses = @Statuses, @LanguageIds = @LanguageIds, @ExcludeDeleted = @ExcludeDeleted
END
GO
/****** Object:  StoredProcedure [dbo].[netVersionObsoleteList]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[netVersionObsoleteList]
(
	@MaxVersions int,
    @MaxCount int = 100
)
AS
    DECLARE @PreviouslyPublished TABLE
    (
        ContentID int, 
        LanguageBranchID int,
        PreviouslyPublishedCount int,
		RowNumber int
    )
	DECLARE @ObsoletedVersions TABLE
    (
	    WorkID int,
        ContentID int,
        Name NVARCHAR(255),
        VersionStatus int,
        ItemCreated DATETIME,
        SavedBy NVARCHAR(255),
        StatusChangedBy NVARCHAR(255),
        MasterVersion int,
        LanguageBranchID int,
        IsMasterLanguageBranch bit,
        CommonDraft bit,
        DelayPublishUntil DATETIME
    )
    INSERT INTO @PreviouslyPublished SELECT fkContentID, fkLanguageBranchID, COUNT(pkID),
		ROW_NUMBER() OVER(ORDER BY fkContentID DESC) AS ROW
        FROM tblWorkContent WHERE Status = 5
        GROUP BY fkContentID, fkLanguageBranchID 
        HAVING COUNT(pkID) > @MaxVersions
	DECLARE @COUNTER INT = (SELECT MAX(RowNumber) FROM @PreviouslyPublished);
	DECLARE @CURRENTVERSIONS INT;
    DECLARE @CURRENTCONTENT INT;
    DECLARE @CURRENTLANGUAGE INT;
	WHILE (@COUNTER != 0 AND (SELECT COUNT(*) FROM @ObsoletedVersions) < @MaxCount)
	BEGIN
		SELECT @CURRENTVERSIONS = PreviouslyPublishedCount,
            @CURRENTCONTENT = ContentID,
            @CURRENTLANGUAGE = LanguageBranchID
        FROM @PreviouslyPublished WHERE RowNumber = @COUNTER
		INSERT INTO @ObsoletedVersions
		SELECT TOP(@CURRENTVERSIONS - @MaxVersions) 
            W.pkID AS WorkID, 
            W.fkContentID AS ContentID, 
            W.Name,
            W.Status, 
            W.Saved AS ItemCreated, 
            W.ChangedByName AS SavedBy, 
            W.NewStatusByName AS StatusChangedBy,
            W.fkMasterVersionID AS MasterVersion, 
            W.fkLanguageBranchID AS LanguageBranchID, 
            CASE WHEN C.fkMasterLanguageBranchID=W.fkLanguageBranchID THEN 1 ELSE 0 END AS IsMasterLanguageBranch,
            W.CommonDraft,
            W.DelayPublishUntil
		FROM tblWorkContent AS W
			INNER JOIN
			tblContent AS C ON C.pkID=W.fkContentID
		WHERE W.fkContentID = @CURRENTCONTENT AND W.Status = 5 AND W.fkLanguageBranchID = @CURRENTLANGUAGE
		ORDER BY W.pkID ASC
		SET @COUNTER = @COUNTER -1
	END
	
	SELECT * FROM @ObsoletedVersions
    SELECT SUM(PreviouslyPublishedCount - @MaxVersions) AS TotalCount FROM @PreviouslyPublished
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiParentRestoreStore]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiParentRestoreStore]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@ParentLink nvarchar(max) = NULL,
@SourceLink nvarchar(max) = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiParentRestoreStore')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01,String02)
		values(@Id, 'EPiParentRestoreStore', 1, @ItemType ,@ParentLink,@SourceLink)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01,String02)
		values(@Id, 'EPiParentRestoreStore', 1, @ItemType ,@ParentLink,@SourceLink)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		String01 = @ParentLink,
		String02 = @SourceLink
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Async.TaskInformation]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Async.TaskInformation]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@Completed datetime = NULL,
@CompletedStatus int = NULL,
@Created datetime = NULL,
@Exception nvarchar(max) = NULL,
@IsTrackable bit = NULL,
@ResultType nvarchar(450) = NULL,
@User nvarchar(450) = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Async.TaskInformation')

		select @Id = SCOPE_IDENTITY()
				insert into [tblTaskInformation] (pkId, StoreName, Row, ItemType,Indexed_DateTime01,Indexed_Integer01,Indexed_DateTime02,String01,Boolean01,Indexed_String01,Indexed_String02)
		values(@Id, 'EPiServer.Async.TaskInformation', 1, @ItemType ,@Completed,@CompletedStatus,@Created,@Exception,@IsTrackable,@ResultType,@User)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblTaskInformation] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblTaskInformation] (pkId, StoreName, Row, ItemType,Indexed_DateTime01,Indexed_Integer01,Indexed_DateTime02,String01,Boolean01,Indexed_String01,Indexed_String02)
		values(@Id, 'EPiServer.Async.TaskInformation', 1, @ItemType ,@Completed,@CompletedStatus,@Created,@Exception,@IsTrackable,@ResultType,@User)

		end
		else begin
				update [tblTaskInformation] set 
		ItemType = @ItemType,
		Indexed_DateTime01 = @Completed,
		Indexed_Integer01 = @CompletedStatus,
		Indexed_DateTime02 = @Created,
		String01 = @Exception,
		Boolean01 = @IsTrackable,
		Indexed_String01 = @ResultType,
		Indexed_String02 = @User
                from [tblTaskInformation]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@PublishDate datetime = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed')

		select @Id = SCOPE_IDENTITY()
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,DateTime01)
		values(@Id, 'EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed', 1, @ItemType ,@PublishDate)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,DateTime01)
		values(@Id, 'EPiServer.Cms.Shell.UI.Notifications.Feature.Internal.LastUpdatedFeed', 1, @ItemType ,@PublishDate)

		end
		else begin
				update [tblBigTable] set 
		ItemType = @ItemType,
		DateTime01 = @PublishDate
                from [tblBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Licensing.StoredLicense]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Licensing.StoredLicense]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@EntityId uniqueidentifier = NULL,
@LicenseData nvarchar(max) = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Licensing.StoredLicense')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Indexed_Guid01,String01)
		values(@Id, 'EPiServer.Licensing.StoredLicense', 1, @ItemType ,@EntityId,@LicenseData)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Indexed_Guid01,String01)
		values(@Id, 'EPiServer.Licensing.StoredLicense', 1, @ItemType ,@EntityId,@LicenseData)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		Indexed_Guid01 = @EntityId,
		String01 = @LicenseData
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.MirroringService.MirroringData]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.MirroringService.MirroringData]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@AdminMailaddress nvarchar(max) = NULL,
@ContentTypeChangingState int = NULL,
@ContinueOnError bit = NULL,
@DestinationRoot nvarchar(max) = NULL,
@DestinationUri nvarchar(max) = NULL,
@Enabled bit = NULL,
@FromPageGuid uniqueidentifier = NULL,
@ImpersonateUserName nvarchar(max) = NULL,
@IncludeRoot bit = NULL,
@InitialMirroringDone bit = NULL,
@LastChangeLoqSequenceRead bigint = NULL,
@LastExecutionUTC datetime = NULL,
@LastMailMessageUTC datetime = NULL,
@LastState int = NULL,
@LastStatus nvarchar(max) = NULL,
@Name nvarchar(max) = NULL,
@Params nvarchar(max) = NULL,
@SendMailMessage bit = NULL,
@TransferAction int = NULL,
@UseDefaultMirroringAddress bit = NULL,
@ValidationContext int = NULL,
@VisitorGroupChangingState int = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.MirroringService.MirroringData')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01,Integer01,Boolean01,String02,String03,Boolean02,Guid01,String04,Boolean03,Boolean04,Long01,DateTime01,DateTime02,Integer02,String05,String06,String07,Boolean05,Integer03,Integer04,Integer05)
		values(@Id, 'EPiServer.MirroringService.MirroringData', 1, @ItemType ,@AdminMailaddress,@ContentTypeChangingState,@ContinueOnError,@DestinationRoot,@DestinationUri,@Enabled,@FromPageGuid,@ImpersonateUserName,@IncludeRoot,@InitialMirroringDone,@LastChangeLoqSequenceRead,@LastExecutionUTC,@LastMailMessageUTC,@LastState,@LastStatus,@Name,@Params,@SendMailMessage,@TransferAction,@ValidationContext,@VisitorGroupChangingState)

				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Boolean01)
		values(@Id, 'EPiServer.MirroringService.MirroringData', 2, @ItemType ,@UseDefaultMirroringAddress)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01,Integer01,Boolean01,String02,String03,Boolean02,Guid01,String04,Boolean03,Boolean04,Long01,DateTime01,DateTime02,Integer02,String05,String06,String07,Boolean05,Integer03,Integer04,Integer05)
		values(@Id, 'EPiServer.MirroringService.MirroringData', 1, @ItemType ,@AdminMailaddress,@ContentTypeChangingState,@ContinueOnError,@DestinationRoot,@DestinationUri,@Enabled,@FromPageGuid,@ImpersonateUserName,@IncludeRoot,@InitialMirroringDone,@LastChangeLoqSequenceRead,@LastExecutionUTC,@LastMailMessageUTC,@LastState,@LastStatus,@Name,@Params,@SendMailMessage,@TransferAction,@ValidationContext,@VisitorGroupChangingState)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		String01 = @AdminMailaddress,
		Integer01 = @ContentTypeChangingState,
		Boolean01 = @ContinueOnError,
		String02 = @DestinationRoot,
		String03 = @DestinationUri,
		Boolean02 = @Enabled,
		Guid01 = @FromPageGuid,
		String04 = @ImpersonateUserName,
		Boolean03 = @IncludeRoot,
		Boolean04 = @InitialMirroringDone,
		Long01 = @LastChangeLoqSequenceRead,
		DateTime01 = @LastExecutionUTC,
		DateTime02 = @LastMailMessageUTC,
		Integer02 = @LastState,
		String05 = @LastStatus,
		String06 = @Name,
		String07 = @Params,
		Boolean05 = @SendMailMessage,
		Integer03 = @TransferAction,
		Integer04 = @ValidationContext,
		Integer05 = @VisitorGroupChangingState
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		if(@rows < 2) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Boolean01)
		values(@Id, 'EPiServer.MirroringService.MirroringData', 2, @ItemType ,@UseDefaultMirroringAddress)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		Boolean01 = @UseDefaultMirroringAddress
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=2
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Packaging.Storage.StorageUpdateEntity]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Packaging.Storage.StorageUpdateEntity]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@ServerId nvarchar(max) = NULL,
@UpdateDate datetime = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Packaging.Storage.StorageUpdateEntity')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01,DateTime01)
		values(@Id, 'EPiServer.Packaging.Storage.StorageUpdateEntity', 1, @ItemType ,@ServerId,@UpdateDate)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01,DateTime01)
		values(@Id, 'EPiServer.Packaging.Storage.StorageUpdateEntity', 1, @ItemType ,@ServerId,@UpdateDate)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		String01 = @ServerId,
		DateTime01 = @UpdateDate
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@DataTypeString nvarchar(450) = NULL,
@Editor nvarchar(max) = NULL,
@UIHint nvarchar(450) = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO')

		select @Id = SCOPE_IDENTITY()
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,Indexed_String01,String01,Indexed_String02)
		values(@Id, 'EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO', 1, @ItemType ,@DataTypeString,@Editor,@UIHint)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,Indexed_String01,String01,Indexed_String02)
		values(@Id, 'EPiServer.Shell.ObjectEditing.Internal.EditorDefinitionDDSO', 1, @ItemType ,@DataTypeString,@Editor,@UIHint)

		end
		else begin
				update [tblBigTable] set 
		ItemType = @ItemType,
		Indexed_String01 = @DataTypeString,
		String01 = @Editor,
		Indexed_String02 = @UIHint
                from [tblBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Shell.Profile.ProfileData]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Shell.Profile.ProfileData]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@UserName nvarchar(max) = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Shell.Profile.ProfileData')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01)
		values(@Id, 'EPiServer.Shell.Profile.ProfileData', 1, @ItemType ,@UserName)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,String01)
		values(@Id, 'EPiServer.Shell.Profile.ProfileData', 1, @ItemType ,@UserName)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		String01 = @UserName
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Shell.Search.SearchProviderSetting]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Shell.Search.SearchProviderSetting]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@FullName nvarchar(max) = NULL,
@IsEnabled bit = NULL,
@SortIndex int = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Shell.Search.SearchProviderSetting')

		select @Id = SCOPE_IDENTITY()
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,String01,Boolean01,Integer01)
		values(@Id, 'EPiServer.Shell.Search.SearchProviderSetting', 1, @ItemType ,@FullName,@IsEnabled,@SortIndex)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,String01,Boolean01,Integer01)
		values(@Id, 'EPiServer.Shell.Search.SearchProviderSetting', 1, @ItemType ,@FullName,@IsEnabled,@SortIndex)

		end
		else begin
				update [tblBigTable] set 
		ItemType = @ItemType,
		String01 = @FullName,
		Boolean01 = @IsEnabled,
		Integer01 = @SortIndex
                from [tblBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Shell.Storage.PersonalizedViewSettingsStorage]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Shell.Storage.PersonalizedViewSettingsStorage]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@UserName nvarchar(450) = NULL,
@ViewName nvarchar(450) = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Shell.Storage.PersonalizedViewSettingsStorage')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Indexed_String01,Indexed_String02)
		values(@Id, 'EPiServer.Shell.Storage.PersonalizedViewSettingsStorage', 1, @ItemType ,@UserName,@ViewName)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Indexed_String01,Indexed_String02)
		values(@Id, 'EPiServer.Shell.Storage.PersonalizedViewSettingsStorage', 1, @ItemType ,@UserName,@ViewName)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		Indexed_String01 = @UserName,
		Indexed_String02 = @ViewName
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Util.BlobCleanupJobState]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Util.BlobCleanupJobState]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@LastSequenceNumber bigint = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Util.BlobCleanupJobState')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Long01)
		values(@Id, 'EPiServer.Util.BlobCleanupJobState', 1, @ItemType ,@LastSequenceNumber)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Long01)
		values(@Id, 'EPiServer.Util.BlobCleanupJobState', 1, @ItemType ,@LastSequenceNumber)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		Long01 = @LastSequenceNumber
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_EPiServer.Util.ContentAssetsCleanupJobState]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_EPiServer.Util.ContentAssetsCleanupJobState]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@LastSequenceNumber bigint = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'EPiServer.Util.ContentAssetsCleanupJobState')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Long01)
		values(@Id, 'EPiServer.Util.ContentAssetsCleanupJobState', 1, @ItemType ,@LastSequenceNumber)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Long01)
		values(@Id, 'EPiServer.Util.ContentAssetsCleanupJobState', 1, @ItemType ,@LastSequenceNumber)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		Long01 = @LastSequenceNumber
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_InUseNotifications]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_InUseNotifications]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@AddedManually bit = NULL,
@ContentGuid uniqueidentifier = NULL,
@CreateTime datetime = NULL,
@LanguageBranch nvarchar(450) = NULL,
@Modified datetime = NULL,
@User nvarchar(450) = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'InUseNotifications')

		select @Id = SCOPE_IDENTITY()
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,Boolean01,Indexed_Guid01,DateTime01,Indexed_String01,DateTime02,Indexed_String02)
		values(@Id, 'InUseNotifications', 1, @ItemType ,@AddedManually,@ContentGuid,@CreateTime,@LanguageBranch,@Modified,@User)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblBigTable] (pkId, StoreName, Row, ItemType,Boolean01,Indexed_Guid01,DateTime01,Indexed_String01,DateTime02,Indexed_String02)
		values(@Id, 'InUseNotifications', 1, @ItemType ,@AddedManually,@ContentGuid,@CreateTime,@LanguageBranch,@Modified,@User)

		end
		else begin
				update [tblBigTable] set 
		ItemType = @ItemType,
		Boolean01 = @AddedManually,
		Indexed_Guid01 = @ContentGuid,
		DateTime01 = @CreateTime,
		Indexed_String01 = @LanguageBranch,
		DateTime02 = @Modified,
		Indexed_String02 = @User
                from [tblBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Save_VisitorGroup]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Save_VisitorGroup]
@Id bigint output,
@UniqueId uniqueidentifier,
@ItemType nvarchar(2048),
@CriteriaOperator int = NULL,
@EnableStatistics bit = NULL,
@IsSecurityRole bit = NULL,
@Name nvarchar(max) = NULL,
@Notes nvarchar(max) = NULL,
@PointsThreshold int = NULL
as
begin
declare @pkId bigint
	select @pkId = pkId from tblBigTableIdentity where [Guid] = @UniqueId
	if @pkId IS NULL
	begin
		begin transaction
		insert into [tblBigTableIdentity]([Guid], [StoreName]) values(@UniqueId, 'VisitorGroup')

		select @Id = SCOPE_IDENTITY()
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Integer01,Boolean01,Boolean02,String01,String02,Integer02)
		values(@Id, 'VisitorGroup', 1, @ItemType ,@CriteriaOperator,@EnableStatistics,@IsSecurityRole,@Name,@Notes,@PointsThreshold)

		commit transaction
	end
	else
	begin
		begin transaction
		select @Id = @pkId
		DECLARE @rows int
		select @rows = count(*) from [tblSystemBigTable] where pkId = @Id
		if(@rows < 1) begin
				insert into [tblSystemBigTable] (pkId, StoreName, Row, ItemType,Integer01,Boolean01,Boolean02,String01,String02,Integer02)
		values(@Id, 'VisitorGroup', 1, @ItemType ,@CriteriaOperator,@EnableStatistics,@IsSecurityRole,@Name,@Notes,@PointsThreshold)

		end
		else begin
				update [tblSystemBigTable] set 
		ItemType = @ItemType,
		Integer01 = @CriteriaOperator,
		Boolean01 = @EnableStatistics,
		Boolean02 = @IsSecurityRole,
		String01 = @Name,
		String02 = @Notes,
		Integer02 = @PointsThreshold
                from [tblSystemBigTable]
                where pkId=@pkId
                and Row=1
		end
		commit transaction
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DatabaseVersion]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DatabaseVersion]
AS
	RETURN 7066
GO
/****** Object:  StoredProcedure [dbo].[sp_FxDatabaseVersion]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_FxDatabaseVersion]
AS
	RETURN 7000 --Note used since 7.5.500
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDateTimeKind]    Script Date: 12/3/2020 3:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDateTimeKind]
AS
	-- 0 === Unspecified  
	-- 1 === Local time 
	-- 2 === UTC time 
	RETURN 2
GO
USE [master]
GO
ALTER DATABASE [EPiserver.Cms] SET  READ_WRITE 
GO
