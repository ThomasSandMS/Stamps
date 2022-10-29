USE MASTER
GO
CREATE DATABASE STAMPS
  CONTAINMENT = NONE
  ON PRIMARY 
  ( 
    NAME = N'STAMPS'
  , FILENAME = N'D:\MS_SQL\Stamm\MSSQL15.STAMPS\MSSQL\DATA\Stamp_data.mdf' 
  , SIZE = 8192KB 
  , MAXSIZE = UNLIMITED
  , FILEGROWTH = 65536KB 
  )
  LOG ON 
  ( 
    NAME = N'STAMPS_log'
  , FILENAME = N'D:\MS_SQL\Stamm\MSSQL15.STAMPS\MSSQL\DATA\Stamp_log_01.ldf' 
  , SIZE = 8192KB 
  , MAXSIZE = 2048GB 
  , FILEGROWTH = 65536KB 
  )
  WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
  BEGIN
    EXEC [STAMPS].[dbo].[sp_fulltext_database] @action = 'enable'
  END
GO

ALTER DATABASE [STAMPS] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [STAMPS] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [STAMPS] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [STAMPS] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [STAMPS] SET ARITHABORT OFF 
GO

ALTER DATABASE [STAMPS] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [STAMPS] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [STAMPS] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [STAMPS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [STAMPS] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [STAMPS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [STAMPS] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [STAMPS] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [STAMPS] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [STAMPS] SET DISABLE_BROKER 
GO

ALTER DATABASE [STAMPS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [STAMPS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [STAMPS] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [STAMPS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [STAMPS] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [STAMPS] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [STAMPS] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [STAMPS] SET RECOVERY SIMPLE  
GO

ALTER DATABASE [STAMPS] SET MULTI_USER 
GO

ALTER DATABASE [STAMPS] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [STAMPS] SET DB_CHAINING OFF 
GO

ALTER DATABASE [STAMPS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [STAMPS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [STAMPS] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [STAMPS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [STAMPS] SET QUERY_STORE = OFF
GO

ALTER DATABASE [STAMPS] SET READ_WRITE 
GO
