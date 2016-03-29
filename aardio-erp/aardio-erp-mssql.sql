
/****** Object:  Table [dbo].[SystemUser]    Script Date: 05/12/2015 01:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemUser](
	[SystemUserId] [int] NOT NULL,
	[LoginName] [varchar](50) NULL,
	[NickName] [varchar](50) NULL,
	[PassWord] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[IsEnable] [char](1) NULL,
	[IsAdmin] [char](1) NULL,
	[Token] [varchar](50) NULL,
	[truser] [varchar](50) NULL,
	[trdate] [datetime] NULL,
 CONSTRAINT [PK_systemUser] PRIMARY KEY CLUSTERED 
(
	[SystemUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemPrimaryKey]    Script Date: 05/12/2015 01:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemPrimaryKey](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
	[PrimaryKey] [bigint] NULL,
 CONSTRAINT [PK_SystemPrimaryKey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemMenu]    Script Date: 05/12/2015 01:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemMenu](
	[MenuId] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
	[MenuName] [nvarchar](30) NULL,
	[MenuPath] [varchar](100) NULL,
	[ImagePath] [varchar](100) NULL,
	[MenuIdStr] [varchar](50) NULL,
	[SortIdStr] [varchar](50) NULL,
	[IsUse] [char](1) NULL,
	[truser] [nvarchar](50) NULL,
	[trdate] [datetime] NULL,
 CONSTRAINT [PK_SystemMenu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完整菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMenu', @level2type=N'COLUMN',@level2name=N'MenuIdStr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'同级排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMenu', @level2type=N'COLUMN',@level2name=N'SortIdStr'
GO
/****** Object:  Table [dbo].[errlog]    Script Date: 05/12/2015 01:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[errlog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[ver] [varchar](10) NULL,
	[err] [varchar](500) NULL,
	[dtime] [datetime] NULL,
 CONSTRAINT [PK_errlog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemUserToMenu]    Script Date: 05/12/2015 01:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUserToMenu](
	[SystemUserId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[truser] [nvarchar](50) NULL,
	[trdate] [datetime] NULL,
 CONSTRAINT [PK_SystemUserToMenu] PRIMARY KEY CLUSTERED 
(
	[SystemUserId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPrimaryKey]    Script Date: 05/12/2015 01:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<返回表主键值,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getPrimaryKey] @tablename varchar(50)
AS
set nocount on 
BEGIN
	DECLARE @result bigint

	select @result = PrimaryKey from SystemPrimaryKey where tableName = @TableName
    if @result is null
    begin
		set @result = 1
		insert into SystemPrimaryKey(tableName,PrimaryKey) values(@TableName,@result)
    end
    else
    begin
		set @result = @result+1
		update SystemPrimaryKey set PrimaryKey = @result where tableName = @TableName
    end
	SELECT @result as 'PrimaryKey'
END
GO
/****** Object:  Default [DF_errlog_dtime]    Script Date: 05/12/2015 01:04:47 ******/
ALTER TABLE [dbo].[errlog] ADD  CONSTRAINT [DF_errlog_dtime]  DEFAULT (getdate()) FOR [dtime]
GO
/****** Object:  Default [DF_SystemMenu_IsUse]    Script Date: 05/12/2015 01:04:47 ******/
ALTER TABLE [dbo].[SystemMenu] ADD  CONSTRAINT [DF_SystemMenu_IsUse]  DEFAULT ((1)) FOR [IsUse]
GO
/****** Object:  ForeignKey [FK_SystemUserToMenu_SystemMenu]    Script Date: 05/12/2015 01:04:47 ******/
ALTER TABLE [dbo].[SystemUserToMenu]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserToMenu_SystemMenu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[SystemMenu] ([MenuId])
GO
ALTER TABLE [dbo].[SystemUserToMenu] CHECK CONSTRAINT [FK_SystemUserToMenu_SystemMenu]
GO
/****** Object:  ForeignKey [FK_SystemUserToMenu_SystemUser]    Script Date: 05/12/2015 01:04:47 ******/
ALTER TABLE [dbo].[SystemUserToMenu]  WITH CHECK ADD  CONSTRAINT [FK_SystemUserToMenu_SystemUser] FOREIGN KEY([SystemUserId])
REFERENCES [dbo].[SystemUser] ([SystemUserId])
GO
ALTER TABLE [dbo].[SystemUserToMenu] CHECK CONSTRAINT [FK_SystemUserToMenu_SystemUser]
GO

insert  into systemmenu(MenuId,ParentId,MenuName,MenuPath,ImagePath,MenuIdStr,SortIdStr,IsUse,truser,trdate) values (1,0,'系统管理','','/layout/styles/images/System.png',',1,','09','1','超级管理员','2015-04-23 01:13:04'),(2,1,'权限管理','','',',1,2,','09,03','1','超级管理员','2015-04-23 01:21:14'),(3,2,'菜单权限管理','/res/System/LimitMenu.aardio','',',1,2,3,','09,03,01','1','超级管理员','2015-04-23 01:19:08'),(4,1,'菜单管理','/res/System/Menu.aardio','',',1,2,','09,02','1','超级管理员','2015-04-23 01:16:00'),(5,1,'用户管理','/res/System/User.aardio','',',1,6,','09,01','1','超级管理员','2015-05-05 00:38:52'),(6,1,'系统错误日志','/res/System/Error.aardio','',',1,6,','09,05','1','超级管理员','2015-05-10 00:22:57'),(7,1,'修改密码','/res/System/EditPwd.aardio','',',1,7,','09,04','1','超级管理员','2015-05-10 00:20:41'),(8,0,'Demo演示','','/layout/styles/images/Unknown.png',',8,','08','1','超级管理员','2015-05-10 11:12:33'),(9,8,'page整页控件 显示数据库表数据','/res/Demo/Demo.aardio','',',8,9,','08,01','1','超级管理员','2015-05-10 11:23:22'),(10,8,'page整页控件 增,删,改操作','','',',8,10,','08,01','1','超级管理员','2015-05-10 11:22:51'),(11,8,'toolbar工具条演示','','',',8,11,','08,01','1','超级管理员','2015-05-10 11:00:55'),(12,8,'pagectrl分页控件','','',',8,12,','08,01','1','超级管理员','2015-05-10 11:05:28'),(13,8,'listview排序,原地编辑','','',',8,13,','08,01','1','超级管理员','2015-05-10 11:01:14'),(14,8,'listview设置字体颜色,背景色','','',',8,14,','08,01','1','超级管理员','2015-05-10 11:02:14'),(15,8,'增加自定义右键菜单','','',',8,15,','08,01','1','超级管理员','2015-05-10 11:27:59'),(16,8,'treeview树形扩展控件','','',',8,16,','08,01','1','超级管理员','2015-05-10 11:07:40'),(17,8,'combobox下拉框多选控件','','',',8,17,','08,01','1','超级管理员','2015-05-10 11:08:24'),(18,8,'简易报表演示','','',',8,18,','08,01','1','超级管理员','2015-05-10 11:11:01'),(19,8,'自定义界面tab选项卡','','',',8,19,','08,01','1','超级管理员','2015-05-10 11:13:44'),(20,8,'自动升级功能','','',',8,20,','08,01','1','超级管理员','2015-05-10 11:31:33'),(21,8,'Htmlayout自动保存页面表单值','','',',8,21,','08,01','1','超级管理员','2015-05-10 11:28:33'),(22,8,'Htmlayout提示框msgbox演示','','',',8,22,','08,01','1','超级管理员','2015-05-10 11:30:22'),(23,8,'软件名称,版权等信息修改','','',',8,23,','08,01','1','超级管理员','2015-05-10 12:03:16'),(24,0,'资料管理','','/layout/styles/images/Documents.png',',24,','01','1','超级管理员','2015-05-10 12:05:31'),(25,0,'商品管理','','/layout/styles/images/GetInfo.png',',25,','02','1','超级管理员','2015-05-10 12:08:22'),(26,0,'订单管理','','/layout/styles/images/Network.png',',26,','03','1','超级管理员','2015-05-10 12:08:35'),(27,0,'售后管理','','/layout/styles/images/Iconfactory.png',',27,','04','1','超级管理员','2015-05-10 12:08:41'),(28,0,'仓库管理','','/layout/styles/images/Quartz.png',',28,','05','1','超级管理员','2015-05-10 12:08:50'),(29,0,'报表管理','','/layout/styles/images/Numbers.png',',29,','06','1','超级管理员','2015-05-10 12:09:04');

insert  into systemprimarykey(TableName,PrimaryKey) values ('SystemUser',1),('SystemMenu',29);

insert  into systemuser(SystemUserId,LoginName,NickName,PassWord,CreateTime,IsEnable,IsAdmin,truser,trdate) values (1,'admin','超级管理员','ZzZUUmCJjb0=',NULL,'1','1','超级管理员','2015-05-10 01:04:10');
