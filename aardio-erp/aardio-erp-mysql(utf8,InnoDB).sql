/*
SQLyog Ultimate v9.20 
MySQL - 5.0.51a-community-nt : Database - erpsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `demo` */

DROP TABLE IF EXISTS `demo`;

CREATE TABLE `demo` (
  `Id` int(11) NOT NULL auto_increment,
  `SaleTime` datetime default NULL,
  `ProductNo` varchar(50) default NULL,
  `ProdcntName` varchar(100) default NULL,
  `SaleNum` int(11) default NULL,
  `SalePrice` decimal(10,2) default NULL,
  `SaleTotal` decimal(10,2) default NULL,
  `Remark` varchar(100) default NULL,
  `truser` varchar(50) default NULL,
  `trdate` datetime default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo` */

/*Table structure for table `errlog` */

DROP TABLE IF EXISTS `errlog`;

CREATE TABLE `errlog` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) default NULL,
  `ver` varchar(10) default NULL,
  `err` varchar(500) default NULL,
  `dtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Data for the table `errlog` */

/*Table structure for table `systemmenu` */

DROP TABLE IF EXISTS `systemmenu`;

CREATE TABLE `systemmenu` (
  `MenuId` int(11) NOT NULL auto_increment,
  `ParentId` int(11) NOT NULL,
  `MenuName` varchar(30) default NULL,
  `MenuPath` varchar(100) default NULL,
  `ImagePath` varchar(100) default NULL,
  `MenuIdStr` varchar(100) default NULL,
  `SortIdStr` varchar(100) default NULL,
  `IsUse` char(1) default NULL,
  `truser` varchar(50) default NULL,
  `trdate` datetime default NULL,
  PRIMARY KEY  (`MenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `systemmenu` */

insert  into `systemmenu`(`MenuId`,`ParentId`,`MenuName`,`MenuPath`,`ImagePath`,`MenuIdStr`,`SortIdStr`,`IsUse`,`truser`,`trdate`) values (1,0,'系统管理','','/layout/styles/images/System.png',',1,','09','1','超级管理员','2015-04-23 01:13:04'),(2,1,'权限管理','','',',1,2,','09,03','1','超级管理员','2015-04-23 01:21:14'),(3,2,'菜单权限管理','/res/System/LimitMenu.aarido','',',1,2,3,','09,03,01','1','超级管理员','2015-04-23 01:19:08'),(4,1,'菜单管理','/res/System/Menu.aarido','',',1,2,','09,02','1','超级管理员','2015-04-23 01:16:00'),(5,1,'用户管理','/res/System/User.aarido','',',1,6,','09,01','1','超级管理员','2015-05-05 00:38:52'),(6,1,'系统错误日志','/res/System/Error.aarido','',',1,6,','09,05','1','超级管理员','2015-05-10 00:22:57'),(7,1,'修改密码','/res/System/EditPwd.aarido','',',1,7,','09,04','1','超级管理员','2015-05-10 00:20:41'),(8,0,'Demo演示','','/layout/styles/images/Unknown.png',',8,','08','1','超级管理员','2015-05-10 11:12:33'),(9,8,'page整页控件 显示数据库表数据','/res/Demo/Demo.aarido','',',8,9,','08,01','1','超级管理员','2015-05-10 11:23:22'),(10,8,'page整页控件 增,删,改操作','','',',8,10,','08,01','1','超级管理员','2015-05-10 11:22:51'),(11,8,'toolbar工具条演示','','',',8,11,','08,01','1','超级管理员','2015-05-10 11:00:55'),(12,8,'pagectrl分页控件','','',',8,12,','08,01','1','超级管理员','2015-05-10 11:05:28'),(13,8,'listview排序,原地编辑','','',',8,13,','08,01','1','超级管理员','2015-05-10 11:01:14'),(14,8,'listview设置字体颜色,背景色','','',',8,14,','08,01','1','超级管理员','2015-05-10 11:02:14'),(15,8,'增加自定义右键菜单','','',',8,15,','08,01','1','超级管理员','2015-05-10 11:27:59'),(16,8,'treeview树形扩展控件','','',',8,16,','08,01','1','超级管理员','2015-05-10 11:07:40'),(17,8,'combobox下拉框多选控件','','',',8,17,','08,01','1','超级管理员','2015-05-10 11:08:24'),(18,8,'简易报表演示','','',',8,18,','08,01','1','超级管理员','2015-05-10 11:11:01'),(19,8,'自定义界面tab选项卡','','',',8,19,','08,01','1','超级管理员','2015-05-10 11:13:44'),(20,8,'自动升级功能','','',',8,20,','08,01','1','超级管理员','2015-05-10 11:31:33'),(21,8,'Htmlayout自动保存页面表单值','','',',8,21,','08,01','1','超级管理员','2015-05-10 11:28:33'),(22,8,'Htmlayout提示框msgbox演示','','',',8,22,','08,01','1','超级管理员','2015-05-10 11:30:22'),(23,8,'软件名称,版权等信息修改','','',',8,23,','08,01','1','超级管理员','2015-05-10 12:03:16'),(24,0,'资料管理','','/layout/styles/images/Documents.png',',24,','01','1','超级管理员','2015-05-10 12:05:31'),(25,0,'商品管理','','/layout/styles/images/GetInfo.png',',25,','02','1','超级管理员','2015-05-10 12:08:22'),(26,0,'订单管理','','/layout/styles/images/Network.png',',26,','03','1','超级管理员','2015-05-10 12:08:35'),(27,0,'售后管理','','/layout/styles/images/Iconfactory.png',',27,','04','1','超级管理员','2015-05-10 12:08:41'),(28,0,'仓库管理','','/layout/styles/images/Quartz.png',',28,','05','1','超级管理员','2015-05-10 12:08:50'),(29,0,'报表管理','','/layout/styles/images/Numbers.png',',29,','06','1','超级管理员','2015-05-10 12:09:04');

/*Table structure for table `systemprimarykey` */

DROP TABLE IF EXISTS `systemprimarykey`;

CREATE TABLE `systemprimarykey` (
  `id` int(11) NOT NULL auto_increment,
  `TableName` varchar(50) default NULL,
  `PrimaryKey` bigint(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `systemprimarykey` */

insert  into `systemprimarykey`(`id`,`TableName`,`PrimaryKey`) values (1,'SystemUser',1),(2,'SystemMenu',29);

/*Table structure for table `systemuser` */

DROP TABLE IF EXISTS `systemuser`;

CREATE TABLE `systemuser` (
  `SystemUserId` int(11) NOT NULL,
  `LoginName` varchar(50) NOT NULL,
  `NickName` varchar(50) default NULL,
  `PassWord` varchar(50) default NULL,
  `CreateTime` datetime default NULL,
  `IsEnable` char(1) default NULL,
  `IsAdmin` char(1) default NULL,
  `truser` varchar(50) default NULL,
  `trdate` datetime default NULL,
  PRIMARY KEY  (`SystemUserId`),
  UNIQUE KEY `LoginName` (`LoginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `systemuser` */

insert  into `systemuser`(`SystemUserId`,`LoginName`,`NickName`,`PassWord`,`CreateTime`,`IsEnable`,`IsAdmin`,`truser`,`trdate`) values (1,'admin','超级管理员','ZzZUUmCJjb0=',NULL,'1','1','超级管理员','2015-05-10 01:04:10');

/*Table structure for table `systemusertomenu` */

DROP TABLE IF EXISTS `systemusertomenu`;

CREATE TABLE `systemusertomenu` (
  `SystemUserId` int(11) NOT NULL,
  `MenuId` int(11) NOT NULL,
  `truser` varchar(50) default NULL,
  `trdate` varchar(50) default NULL,
  PRIMARY KEY  (`SystemUserId`,`MenuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `systemusertomenu` */

/* Procedure structure for procedure `sp_getPrimaryKey` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getPrimaryKey` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getPrimaryKey`(tabname VARCHAR(50))
BEGIN
	DECLARE result BIGINT;
	SELECT PrimaryKey INTO result FROM SystemPrimaryKey WHERE tableName = tabname;
	IF result IS NULL THEN
		SET result = 1;
		INSERT INTO SystemPrimaryKey(tableName,PrimaryKey) VALUES(tabname,result);
	ELSE
		SET result = result+1;
		UPDATE SystemPrimaryKey SET PrimaryKey = result WHERE tableName = tabname;
	END IF;
	SELECT result AS 'PrimaryKey';
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
