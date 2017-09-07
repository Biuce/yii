/*
Navicat MySQL Data Transfer

Source Server         : dm_shop
Source Server Version : 50629
Source Host           : 192.168.16.222:3306
Source Database       : yii2_shop

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-09-07 14:37:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shop_address
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `addressid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `address` text,
  `postcode` char(6) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`addressid`),
  KEY `shop_address_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_address
-- ----------------------------
INSERT INTO `shop_address` VALUES ('2', '蜡笔', '小新', '', '北京市朝阳区某某街道', '100000', 'test@test.com', '13888888888', '1', '0');

-- ----------------------------
-- Table structure for shop_admin
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin`;
CREATE TABLE `shop_admin` (
  `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` int(10) NOT NULL COMMENT '角色id',
  `adminuser` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号码',
  `adminpass` char(64) NOT NULL DEFAULT '',
  `codes` char(32) NOT NULL DEFAULT '0' COMMENT '做登陆密码验证',
  `adminemail` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '是否启用  1 启用 2 不启用',
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `shop_admin_adminuser_adminpass` (`adminuser`,`adminpass`),
  UNIQUE KEY `shop_admin_adminuser_adminemail` (`adminuser`,`adminemail`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Records of shop_admin
-- ----------------------------
INSERT INTO `shop_admin` VALUES ('1', '1', 'admin', '13922852654', '72afd63931bca700e531e68219300af7', '2xSw4T6k', 'admintest@admintest.com', '1457922174', '2130706433', '1495440834', '1');
INSERT INTO `shop_admin` VALUES ('15', '0', 'testuser', '', '$2y$13$rt8KZr3rwQsZN.ppMnMYIeZqe5FlsbHyaSDhRO2LBg8qvFVE1leJe', '0', 'testuser123@test.com', '1458028401', '2130706433', '1458028401', '1');
INSERT INTO `shop_admin` VALUES ('18', '0', 'ruler', '', '$2y$13$hFIhJxyDbw/da./ZlXNZqeAOdlF4tT0I0qlCA2xWZMnCCqsq8mDny', '0', 'test@tes123.com', '1483579038', '2130706433', '1476438209', '1');
INSERT INTO `shop_admin` VALUES ('19', '3', 'test11', '13922852656', '08290ced9eb2760efcc06c08bf6fa1d9', '3puO02sJ', 'test@test1.com', '1493099997', '3232239742', '1495076958', '1');
INSERT INTO `shop_admin` VALUES ('20', '2', 'test2', '13922852655', '8603806296551f854c0a32598d0970fd', 'gIp3YXBK', 'test2@test2.com', '1493177447', '2130706433', '1495004998', '1');

-- ----------------------------
-- Table structure for shop_admin_dolog
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin_dolog`;
CREATE TABLE `shop_admin_dolog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '操作ip',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `uid` int(11) NOT NULL COMMENT '管理员id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '操作用户用户名',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '操作控制器',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '操作动作',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '名称',
  `doing` varchar(255) NOT NULL DEFAULT '' COMMENT '具体操作描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8868 DEFAULT CHARSET=utf8mb4 COMMENT='管理员操作日志表';

-- ----------------------------
-- Records of shop_admin_dolog
-- ----------------------------
INSERT INTO `shop_admin_dolog` VALUES ('7120', '127.0.0.1', '1495013516', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7121', '127.0.0.1', '1495013881', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7122', '127.0.0.1', '1495014064', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7123', '127.0.0.1', '1495014081', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7124', '127.0.0.1', '1495014084', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7125', '127.0.0.1', '1495014087', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7126', '127.0.0.1', '1495014391', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7127', '127.0.0.1', '1495014430', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7128', '127.0.0.1', '1495015111', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7129', '127.0.0.1', '1495015122', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7130', '127.0.0.1', '1495015227', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"VEgxX0dkN08aBmY0AigGCRUJcCpyD1geIz1.bx0NASoVGFgRdhRGKw==\",\"Menu\":{\"title\":\"\\u7ba1\\u7406\\u5458\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"sort\":\"3\",\"url\":\"\\/admin\\/admindolog\\/index\",\"pid\":\"321\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7131', '127.0.0.1', '1495015228', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7132', '127.0.0.1', '1495015231', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7133', '127.0.0.1', '1495015262', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"RmE1SzNoZV8IL2IgdiRUGQcgdD4GAwoOMRR6e2kBUzoHMVwFAhgUOw==\",\"Menu\":{\"title\":\"\\u7ba1\\u7406\\u5458\\u767b\\u5f55\\u65e5\\u5fd7\",\"sort\":\"4\",\"url\":\"\\/admin\\/adminlogin\\/index\",\"pid\":\"321\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7134', '127.0.0.1', '1495015264', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7135', '127.0.0.1', '1495015266', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7136', '127.0.0.1', '1495015299', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7137', '127.0.0.1', '1495015336', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7138', '127.0.0.1', '1495015440', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7139', '127.0.0.1', '1495015468', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7140', '127.0.0.1', '1495015851', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7141', '127.0.0.1', '1495015951', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7142', '127.0.0.1', '1495015990', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7143', '127.0.0.1', '1495016010', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7144', '127.0.0.1', '1495016163', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7145', '127.0.0.1', '1495016185', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7146', '127.0.0.1', '1495016215', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7147', '127.0.0.1', '1495016257', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7148', '127.0.0.1', '1495016275', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7149', '127.0.0.1', '1495016310', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7150', '127.0.0.1', '1495016419', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7151', '127.0.0.1', '1495016422', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7152', '127.0.0.1', '1495016523', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7153', '127.0.0.1', '1495016558', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7154', '127.0.0.1', '1495016564', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7155', '127.0.0.1', '1495016572', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7156', '127.0.0.1', '1495016580', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7157', '127.0.0.1', '1495016662', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7158', '127.0.0.1', '1495016669', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7159', '127.0.0.1', '1495016690', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7160', '127.0.0.1', '1495016695', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7161', '127.0.0.1', '1495016702', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7162', '127.0.0.1', '1495016705', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7163', '127.0.0.1', '1495016707', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7164', '127.0.0.1', '1495016708', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7165', '127.0.0.1', '1495016708', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7166', '127.0.0.1', '1495016709', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7167', '127.0.0.1', '1495016710', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7168', '127.0.0.1', '1495016713', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7169', '127.0.0.1', '1495016716', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7170', '127.0.0.1', '1495016717', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7171', '127.0.0.1', '1495016718', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7172', '127.0.0.1', '1495016718', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7173', '127.0.0.1', '1495016718', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7174', '127.0.0.1', '1495016719', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7175', '127.0.0.1', '1495016720', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7176', '127.0.0.1', '1495016728', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7177', '127.0.0.1', '1495016730', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7178', '127.0.0.1', '1495016732', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7179', '127.0.0.1', '1495016732', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7180', '127.0.0.1', '1495016733', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7181', '127.0.0.1', '1495016734', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7182', '127.0.0.1', '1495016734', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7183', '127.0.0.1', '1495016735', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7184', '127.0.0.1', '1495016741', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7185', '127.0.0.1', '1495016755', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7186', '127.0.0.1', '1495016945', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7187', '127.0.0.1', '1495016951', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7188', '127.0.0.1', '1495016954', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7189', '127.0.0.1', '1495016988', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"ZmN5bjRvRWYoLS4FcSN0ICciOBsBBCo3ERY2Xm4GcwMnMxAgBR80Ag==\",\"Menu\":{\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\\u5220\\u9664\",\"sort\":\"1\",\"url\":\"\\/admin\\/admindolog\\/delete\",\"pid\":\"345\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7190', '127.0.0.1', '1495016989', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7191', '127.0.0.1', '1495016992', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7192', '127.0.0.1', '1495017026', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7193', '127.0.0.1', '1495017114', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7194', '127.0.0.1', '1495017118', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=7193', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7195', '127.0.0.1', '1495017146', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7196', '127.0.0.1', '1495017149', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=7195', '{\"id\":\"7195\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7197', '127.0.0.1', '1495017206', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7198', '127.0.0.1', '1495017210', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=7197', '{\"id\":\"7197\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7199', '127.0.0.1', '1495017247', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7200', '127.0.0.1', '1495017251', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=7199', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7205', '127.0.0.1', '1495017286', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7202', '127.0.0.1', '1495017279', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=7201', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7204', '127.0.0.1', '1495017286', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=7203', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7206', '127.0.0.1', '1495017639', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7207', '127.0.0.1', '1495017641', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7208', '127.0.0.1', '1495017689', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"OHJHc2U0eVN2PBAYIHhIFXkzBgZQXxYCTwcIQz9dTzZ5Ii49VEQINw==\",\"Menu\":{\"title\":\"\\u7ba1\\u7406\\u5458\\u767b\\u5f55\\u65e5\\u5fd7\\u5220\\u9664\",\"sort\":\"1\",\"url\":\"\\/admin\\/adminlogin\\/delete\",\"pid\":\"346\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7209', '127.0.0.1', '1495017690', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7210', '127.0.0.1', '1495017825', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7211', '127.0.0.1', '1495017853', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7212', '127.0.0.1', '1495017939', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7213', '127.0.0.1', '1495017954', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7214', '127.0.0.1', '1495017966', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7215', '127.0.0.1', '1495017967', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7216', '127.0.0.1', '1495017968', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7217', '127.0.0.1', '1495017975', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7218', '127.0.0.1', '1495017976', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7219', '127.0.0.1', '1495017985', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7220', '127.0.0.1', '1495017987', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7221', '127.0.0.1', '1495017994', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7222', '127.0.0.1', '1495018003', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7223', '127.0.0.1', '1495018008', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7224', '127.0.0.1', '1495018029', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7225', '127.0.0.1', '1495018036', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=1182', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7226', '127.0.0.1', '1495018037', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=1182', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7227', '127.0.0.1', '1495018042', '1', 'admin', 'admindolog', 'delete', '操作日志删除,id=1182', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7228', '127.0.0.1', '1495018088', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7229', '127.0.0.1', '1495018091', '1', 'admin', 'adminlogin', 'delete', '管理员登录日志删除,id=1182', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7230', '127.0.0.1', '1495018138', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7231', '127.0.0.1', '1495018140', '1', 'admin', 'adminlogin', 'delete', '管理员登录日志删除,id=1182', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7232', '127.0.0.1', '1495018140', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7233', '127.0.0.1', '1495071427', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7234', '127.0.0.1', '1495071435', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7235', '127.0.0.1', '1495071439', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7236', '127.0.0.1', '1495071465', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7237', '127.0.0.1', '1495071472', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7238', '127.0.0.1', '1495071474', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7239', '127.0.0.1', '1495072554', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7240', '127.0.0.1', '1495072558', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7241', '127.0.0.1', '1495073431', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7242', '127.0.0.1', '1495073468', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7243', '127.0.0.1', '1495073473', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7244', '127.0.0.1', '1495073475', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7245', '127.0.0.1', '1495073476', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7246', '127.0.0.1', '1495073514', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7247', '127.0.0.1', '1495073516', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7248', '127.0.0.1', '1495073519', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7249', '127.0.0.1', '1495073520', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7250', '127.0.0.1', '1495073521', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7251', '127.0.0.1', '1495073540', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7252', '127.0.0.1', '1495073567', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7253', '127.0.0.1', '1495073568', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7254', '127.0.0.1', '1495073603', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7255', '127.0.0.1', '1495073605', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7256', '127.0.0.1', '1495073620', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7257', '127.0.0.1', '1495073632', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7258', '127.0.0.1', '1495073680', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7259', '127.0.0.1', '1495073704', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7260', '127.0.0.1', '1495073738', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7261', '127.0.0.1', '1495073832', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7262', '127.0.0.1', '1495073835', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7263', '127.0.0.1', '1495073839', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7264', '127.0.0.1', '1495073841', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7265', '127.0.0.1', '1495073866', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7266', '127.0.0.1', '1495073934', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7267', '127.0.0.1', '1495073936', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7268', '127.0.0.1', '1495073973', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7269', '127.0.0.1', '1495073990', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7270', '127.0.0.1', '1495074008', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7271', '127.0.0.1', '1495074037', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7272', '127.0.0.1', '1495074103', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7273', '127.0.0.1', '1495074105', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7274', '127.0.0.1', '1495074106', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7275', '127.0.0.1', '1495074107', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7276', '127.0.0.1', '1495074108', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7277', '127.0.0.1', '1495074141', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7278', '127.0.0.1', '1495074145', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7279', '127.0.0.1', '1495074147', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7280', '127.0.0.1', '1495074150', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7281', '127.0.0.1', '1495074191', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7282', '127.0.0.1', '1495074196', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7283', '127.0.0.1', '1495074242', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7284', '127.0.0.1', '1495074247', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7285', '127.0.0.1', '1495074302', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7286', '127.0.0.1', '1495074308', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7287', '127.0.0.1', '1495074328', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7288', '127.0.0.1', '1495074330', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7289', '127.0.0.1', '1495074332', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7290', '127.0.0.1', '1495074550', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7291', '127.0.0.1', '1495074551', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7292', '127.0.0.1', '1495074972', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7293', '127.0.0.1', '1495074980', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '{\"_csrf-backend\":\"TzBWUkt2aFQsZmABByMgOA1WDBYtKQtsI3k5NRhFLAYaby8cCANYHw==\",\"Admin\":{\"adminuser\":\"test1\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852656\",\"adminemail\":\"test@test1.com\",\"group_id\":\"3\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7294', '127.0.0.1', '1495074983', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7295', '127.0.0.1', '1495075004', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7296', '127.0.0.1', '1495075133', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7297', '127.0.0.1', '1495075141', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '{\"_csrf-backend\":\"WmguT0Zub1A5PhgcCjsnPBgOdAsgMQxoNiFBKBVdKwIPN1cBBRtfGw==\",\"Admin\":{\"adminuser\":\"test11\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852656\",\"adminemail\":\"test@test1.com\",\"group_id\":\"3\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7298', '127.0.0.1', '1495075145', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7299', '127.0.0.1', '1495075148', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7300', '127.0.0.1', '1495076532', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7301', '127.0.0.1', '1495076535', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7302', '127.0.0.1', '1495076541', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '{\"_csrf-backend\":\"SDZ3bGc5OXgrYEE\\/K2xxFApQLSgBZlpAJH8YCzQKfSodaQ4iJEwJMw==\",\"Admin\":{\"adminuser\":\"test1\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852656\",\"adminemail\":\"test@test1.com\",\"group_id\":\"3\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7303', '127.0.0.1', '1495076629', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7304', '127.0.0.1', '1495076645', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7305', '127.0.0.1', '1495076646', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7306', '127.0.0.1', '1495076654', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '{\"_csrf-backend\":\"VW9xNTZpdmc2OUdmejw.CxcJK3FQNhVfOSYeUmVaMjUAMAh7dRxGLA==\",\"Admin\":{\"adminuser\":\"test11\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852656\",\"adminemail\":\"test@test1.com\",\"group_id\":\"3\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7307', '127.0.0.1', '1495076856', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7308', '127.0.0.1', '1495076858', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7309', '127.0.0.1', '1495076866', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '{\"_csrf-backend\":\"eWwwY1NPSWQaOgYwHxoBCDsKaic1ECpcFSVfBAB8DTYsM0ktEDp5Lw==\",\"Admin\":{\"adminuser\":\"test1\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852656\",\"adminemail\":\"test@test1.com\",\"group_id\":\"3\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7310', '127.0.0.1', '1495076872', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7311', '127.0.0.1', '1495076935', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7312', '127.0.0.1', '1495076938', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7313', '127.0.0.1', '1495076958', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '{\"_csrf-backend\":\"UFM2c1pERnYzBQAgFhEOGhI1bDc8GyVOPBpZFAl3AiQFDE89GTF2PQ==\",\"Admin\":{\"adminuser\":\"test11\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852656\",\"adminemail\":\"test@test1.com\",\"group_id\":\"3\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7314', '127.0.0.1', '1495077273', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7315', '127.0.0.1', '1495078146', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7316', '127.0.0.1', '1495078156', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7317', '127.0.0.1', '1495078161', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7318', '127.0.0.1', '1495078163', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7319', '127.0.0.1', '1495078168', '1', 'admin', 'rule', 'edit', '编辑角色,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7320', '127.0.0.1', '1495078176', '1', 'admin', 'rule', 'edit', '编辑角色,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7321', '127.0.0.1', '1495078197', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7322', '127.0.0.1', '1495078456', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7323', '127.0.0.1', '1495078458', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7324', '127.0.0.1', '1495078499', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7325', '127.0.0.1', '1495078500', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7326', '127.0.0.1', '1495078527', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7327', '127.0.0.1', '1495078528', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7328', '127.0.0.1', '1495078544', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7329', '127.0.0.1', '1495078545', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7330', '127.0.0.1', '1495078566', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7331', '127.0.0.1', '1495078567', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7332', '127.0.0.1', '1495078595', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7333', '127.0.0.1', '1495078596', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7334', '127.0.0.1', '1495078619', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7335', '127.0.0.1', '1495078621', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7336', '127.0.0.1', '1495078634', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7337', '127.0.0.1', '1495078636', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7338', '127.0.0.1', '1495078652', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7339', '127.0.0.1', '1495078653', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7340', '127.0.0.1', '1495078666', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7341', '127.0.0.1', '1495078667', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7342', '127.0.0.1', '1495078695', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7343', '127.0.0.1', '1495078696', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7344', '127.0.0.1', '1495078772', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7345', '127.0.0.1', '1495079918', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7346', '127.0.0.1', '1495079955', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7347', '127.0.0.1', '1495079979', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7348', '127.0.0.1', '1495080016', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7349', '127.0.0.1', '1495080039', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7350', '127.0.0.1', '1495080041', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7351', '127.0.0.1', '1495080042', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7352', '127.0.0.1', '1495080044', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7353', '127.0.0.1', '1495080046', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7354', '127.0.0.1', '1495080064', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7355', '127.0.0.1', '1495080107', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7356', '127.0.0.1', '1495080123', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7357', '127.0.0.1', '1495080187', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7358', '127.0.0.1', '1495080259', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7359', '127.0.0.1', '1495080346', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7360', '127.0.0.1', '1495080377', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7361', '127.0.0.1', '1495080382', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7362', '127.0.0.1', '1495080386', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7363', '127.0.0.1', '1495080398', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7364', '127.0.0.1', '1495080401', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7365', '127.0.0.1', '1495080419', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7366', '127.0.0.1', '1495080430', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7367', '127.0.0.1', '1495080448', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7368', '127.0.0.1', '1495080456', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7369', '127.0.0.1', '1495085510', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7370', '127.0.0.1', '1495085540', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7371', '127.0.0.1', '1495089771', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7372', '127.0.0.1', '1495089781', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7373', '127.0.0.1', '1495089784', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7374', '127.0.0.1', '1495089784', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7375', '127.0.0.1', '1495089792', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7376', '127.0.0.1', '1495089793', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7377', '127.0.0.1', '1495089794', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7378', '127.0.0.1', '1495089794', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7379', '127.0.0.1', '1495089794', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7380', '127.0.0.1', '1495089795', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7381', '127.0.0.1', '1495089795', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7382', '127.0.0.1', '1495089795', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7383', '127.0.0.1', '1495092265', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7384', '127.0.0.1', '1495092275', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7385', '127.0.0.1', '1495092681', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7386', '127.0.0.1', '1495092881', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7387', '127.0.0.1', '1495092947', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7388', '127.0.0.1', '1495093034', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7389', '127.0.0.1', '1495093069', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7390', '127.0.0.1', '1495093318', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7391', '127.0.0.1', '1495093320', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7392', '127.0.0.1', '1495093322', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7393', '127.0.0.1', '1495093370', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7394', '127.0.0.1', '1495093374', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7395', '127.0.0.1', '1495093376', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7396', '127.0.0.1', '1495093390', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7397', '127.0.0.1', '1495093883', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7398', '127.0.0.1', '1495094282', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7399', '127.0.0.1', '1495094321', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7400', '127.0.0.1', '1495094369', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7401', '127.0.0.1', '1495094426', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7402', '127.0.0.1', '1495094644', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7403', '127.0.0.1', '1495094862', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7404', '127.0.0.1', '1495094881', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7405', '127.0.0.1', '1495095398', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7406', '127.0.0.1', '1495095417', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7407', '127.0.0.1', '1495095510', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7408', '127.0.0.1', '1495095512', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7409', '127.0.0.1', '1495095545', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7410', '127.0.0.1', '1495095547', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7411', '127.0.0.1', '1495095549', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7412', '127.0.0.1', '1495095551', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7413', '127.0.0.1', '1495095554', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7414', '127.0.0.1', '1495095555', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7415', '127.0.0.1', '1495095556', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7416', '127.0.0.1', '1495095559', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7417', '127.0.0.1', '1495095570', '1', 'admin', 'menu', 'edit', '修改菜单,id=330', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7418', '127.0.0.1', '1495095659', '1', 'admin', 'menu', 'edit', '修改菜单,id=330', '{\"_csrf-backend\":\"eUtSU0d6dFEaHWQACy88PTstCBchJRdpFQI9NBRJMAMsFCsdBA9EGg==\",\"Menu\":{\"title\":\"\\u5907\\u4efd\\u6570\\u636e\\u5e93\",\"sort\":\"5\",\"url\":\"\\/config\\/database\\/index?type=export\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7419', '127.0.0.1', '1495095660', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7420', '127.0.0.1', '1495095705', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7421', '127.0.0.1', '1495095754', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"Y2FmRTAuTDcAN1AWfHsEWyEHPAFWcS8PDygJImMdCGU2Ph8Lc1t8fA==\",\"Menu\":{\"title\":\"\\u8fd8\\u539f\\u6570\\u636e\\u5e93\",\"sort\":\"6\",\"url\":\"\\/config\\/database\\/index?type=import\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7422', '127.0.0.1', '1495095755', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7423', '127.0.0.1', '1495095787', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7424', '127.0.0.1', '1495098750', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7425', '127.0.0.1', '1495098754', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7426', '127.0.0.1', '1495098756', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7427', '127.0.0.1', '1495098758', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7428', '127.0.0.1', '1495098759', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7429', '127.0.0.1', '1495098780', '1', 'admin', 'menu', 'edit', '修改菜单,id=330', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7430', '127.0.0.1', '1495098786', '1', 'admin', 'menu', 'edit', '修改菜单,id=330', '{\"_csrf-backend\":\"WGVHREZVQmQ7M3EXCgAKCBoDHQAgCiFcNCwoIxVmBjYNOj4KBSByLw==\",\"Menu\":{\"title\":\"\\u5907\\u4efd\\u6570\\u636e\\u5e93\",\"sort\":\"5\",\"url\":\"\\/config\\/database\\/index\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7431', '127.0.0.1', '1495098787', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7432', '127.0.0.1', '1495098790', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7433', '127.0.0.1', '1495098802', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7434', '127.0.0.1', '1495098813', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7435', '127.0.0.1', '1495098835', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7436', '127.0.0.1', '1495098932', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7437', '127.0.0.1', '1495098957', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7438', '127.0.0.1', '1495099345', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7439', '127.0.0.1', '1495099349', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7440', '127.0.0.1', '1495099362', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7441', '127.0.0.1', '1495099363', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7442', '127.0.0.1', '1495099382', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7443', '127.0.0.1', '1495099412', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7444', '127.0.0.1', '1495099418', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7445', '127.0.0.1', '1495099441', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7446', '127.0.0.1', '1495099458', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7447', '127.0.0.1', '1495099461', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7448', '127.0.0.1', '1495099478', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7449', '127.0.0.1', '1495099561', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7450', '127.0.0.1', '1495099615', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7451', '127.0.0.1', '1495099664', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7452', '127.0.0.1', '1495100298', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7453', '127.0.0.1', '1495100458', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7454', '127.0.0.1', '1495100472', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7455', '127.0.0.1', '1495100589', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7456', '127.0.0.1', '1495100785', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7457', '127.0.0.1', '1495100802', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7458', '127.0.0.1', '1495100829', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7459', '127.0.0.1', '1495100861', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7460', '127.0.0.1', '1495100985', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7461', '127.0.0.1', '1495101102', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7462', '127.0.0.1', '1495101103', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7463', '127.0.0.1', '1495101105', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7464', '127.0.0.1', '1495101106', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7465', '127.0.0.1', '1495101115', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7466', '127.0.0.1', '1495101116', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7467', '127.0.0.1', '1495101118', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7468', '127.0.0.1', '1495101121', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7469', '127.0.0.1', '1495101131', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7470', '127.0.0.1', '1495101134', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7471', '127.0.0.1', '1495101138', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7472', '127.0.0.1', '1495101139', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7473', '127.0.0.1', '1495101140', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7474', '127.0.0.1', '1495101140', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7475', '127.0.0.1', '1495101141', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7476', '127.0.0.1', '1495101141', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7477', '127.0.0.1', '1495101141', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7478', '127.0.0.1', '1495101145', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7479', '127.0.0.1', '1495101145', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7480', '127.0.0.1', '1495101158', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7481', '127.0.0.1', '1495101160', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7482', '127.0.0.1', '1495101162', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7483', '127.0.0.1', '1495101253', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7484', '127.0.0.1', '1495101255', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7485', '127.0.0.1', '1495101258', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7486', '127.0.0.1', '1495101261', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7487', '127.0.0.1', '1495101263', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7488', '127.0.0.1', '1495101264', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7489', '127.0.0.1', '1495101266', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7490', '127.0.0.1', '1495101268', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7491', '127.0.0.1', '1495101269', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7492', '127.0.0.1', '1495101334', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7493', '127.0.0.1', '1495101335', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7494', '127.0.0.1', '1495101337', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7495', '127.0.0.1', '1495101339', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7496', '127.0.0.1', '1495101341', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7497', '127.0.0.1', '1495101349', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7498', '127.0.0.1', '1495101351', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7499', '127.0.0.1', '1495101352', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7500', '127.0.0.1', '1495101447', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7501', '127.0.0.1', '1495101448', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7502', '127.0.0.1', '1495101452', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7503', '127.0.0.1', '1495101454', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7504', '127.0.0.1', '1495101455', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7505', '127.0.0.1', '1495101457', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7506', '127.0.0.1', '1495101461', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7507', '127.0.0.1', '1495101530', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7508', '127.0.0.1', '1495101531', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7509', '127.0.0.1', '1495101532', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7510', '127.0.0.1', '1495101534', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7511', '127.0.0.1', '1495101535', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7512', '127.0.0.1', '1495101546', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7513', '127.0.0.1', '1495101547', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7514', '127.0.0.1', '1495101549', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7515', '127.0.0.1', '1495101550', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7516', '127.0.0.1', '1495101552', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7517', '127.0.0.1', '1495101554', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7518', '127.0.0.1', '1495101555', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7519', '127.0.0.1', '1495101634', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7520', '127.0.0.1', '1495101636', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7521', '127.0.0.1', '1495101637', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7522', '127.0.0.1', '1495101639', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7523', '127.0.0.1', '1495101641', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7524', '127.0.0.1', '1495101715', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7525', '127.0.0.1', '1495101748', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7526', '127.0.0.1', '1495101766', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7527', '127.0.0.1', '1495101781', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7528', '127.0.0.1', '1495101807', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7529', '127.0.0.1', '1495101943', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7530', '127.0.0.1', '1495101944', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7531', '127.0.0.1', '1495101946', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7532', '127.0.0.1', '1495102019', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7533', '127.0.0.1', '1495102055', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7534', '127.0.0.1', '1495102340', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7535', '127.0.0.1', '1495102399', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7536', '127.0.0.1', '1495102437', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7537', '127.0.0.1', '1495102469', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7538', '127.0.0.1', '1495102498', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7539', '127.0.0.1', '1495102532', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7540', '127.0.0.1', '1495102614', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7541', '127.0.0.1', '1495102641', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7542', '127.0.0.1', '1495102785', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7543', '127.0.0.1', '1495102805', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7544', '127.0.0.1', '1495102843', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7545', '127.0.0.1', '1495102855', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7546', '127.0.0.1', '1495103030', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7547', '127.0.0.1', '1495103106', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7548', '127.0.0.1', '1495103451', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7549', '127.0.0.1', '1495103504', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7550', '127.0.0.1', '1495103670', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7551', '127.0.0.1', '1495103704', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7552', '127.0.0.1', '1495156156', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7553', '127.0.0.1', '1495156165', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7554', '127.0.0.1', '1495156196', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7555', '127.0.0.1', '1495156559', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7556', '127.0.0.1', '1495156945', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7557', '127.0.0.1', '1495156967', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7558', '127.0.0.1', '1495156982', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7559', '127.0.0.1', '1495157041', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7560', '127.0.0.1', '1495157127', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7561', '127.0.0.1', '1495157234', '1', 'admin', 'database', 'optimize', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7562', '127.0.0.1', '1495157236', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7563', '127.0.0.1', '1495157238', '1', 'admin', 'database', 'repair', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7564', '127.0.0.1', '1495157239', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7565', '127.0.0.1', '1495157284', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7566', '127.0.0.1', '1495157311', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7567', '127.0.0.1', '1495157315', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7568', '127.0.0.1', '1495157421', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7569', '127.0.0.1', '1495157459', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7570', '127.0.0.1', '1495157554', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7571', '127.0.0.1', '1495157982', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7572', '127.0.0.1', '1495157985', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7573', '127.0.0.1', '1495158596', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7574', '127.0.0.1', '1495158599', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7575', '127.0.0.1', '1495158641', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7576', '127.0.0.1', '1495158645', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7577', '127.0.0.1', '1495158683', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7578', '127.0.0.1', '1495158791', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7579', '127.0.0.1', '1495159008', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7580', '127.0.0.1', '1495159016', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7581', '127.0.0.1', '1495163749', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7582', '127.0.0.1', '1495163751', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7583', '127.0.0.1', '1495163756', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7584', '127.0.0.1', '1495163758', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7585', '127.0.0.1', '1495163760', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7586', '127.0.0.1', '1495163863', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7587', '127.0.0.1', '1495163878', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7588', '127.0.0.1', '1495164153', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7589', '127.0.0.1', '1495164156', '1', 'admin', 'database', 'index', '备份数据库', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7590', '127.0.0.1', '1495164159', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7591', '127.0.0.1', '1495164164', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7592', '127.0.0.1', '1495164167', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7593', '127.0.0.1', '1495164169', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7594', '127.0.0.1', '1495164170', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7595', '127.0.0.1', '1495164173', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7596', '127.0.0.1', '1495164180', '1', 'admin', 'menu', 'edit', '修改菜单,id=330', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7597', '127.0.0.1', '1495164200', '1', 'admin', 'menu', 'edit', '修改菜单,id=330', '{\"_csrf-backend\":\"S2Z1VDI5bXMeChBkClJaJg0uAWNzUggSOyoaJG1cHEYAAEYmS39UMA==\",\"Menu\":{\"title\":\"\\u5907\\u4efd\\u6570\\u636e\\u5e93\",\"sort\":\"5\",\"url\":\"\\/config\\/database\\/index?type=export\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7598', '127.0.0.1', '1495164202', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7599', '127.0.0.1', '1495164208', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7600', '127.0.0.1', '1495164212', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7601', '127.0.0.1', '1495164309', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7602', '127.0.0.1', '1495164312', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7603', '127.0.0.1', '1495164336', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7604', '127.0.0.1', '1495164592', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7605', '127.0.0.1', '1495164641', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7606', '127.0.0.1', '1495164696', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7607', '127.0.0.1', '1495164730', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7608', '127.0.0.1', '1495164772', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7609', '127.0.0.1', '1495164786', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7610', '127.0.0.1', '1495164947', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7611', '127.0.0.1', '1495164953', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7612', '127.0.0.1', '1495164956', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7613', '127.0.0.1', '1495164956', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7614', '127.0.0.1', '1495164957', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7615', '127.0.0.1', '1495164958', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7616', '127.0.0.1', '1495165630', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7617', '127.0.0.1', '1495165649', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7618', '127.0.0.1', '1495165701', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7619', '127.0.0.1', '1495165713', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7620', '127.0.0.1', '1495165723', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7621', '127.0.0.1', '1495165745', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7622', '127.0.0.1', '1495165748', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7623', '127.0.0.1', '1495165778', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7624', '127.0.0.1', '1495165781', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7625', '127.0.0.1', '1495165861', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7626', '127.0.0.1', '1495165960', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7627', '127.0.0.1', '1495165964', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7628', '127.0.0.1', '1495165964', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7629', '127.0.0.1', '1495166098', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7630', '127.0.0.1', '1495166101', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7631', '127.0.0.1', '1495166102', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7632', '127.0.0.1', '1495166109', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7633', '127.0.0.1', '1495166175', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7634', '127.0.0.1', '1495166177', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7635', '127.0.0.1', '1495166178', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7636', '127.0.0.1', '1495166180', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7637', '127.0.0.1', '1495166180', '1', 'admin', 'database', 'import', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7638', '127.0.0.1', '1495166196', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7639', '127.0.0.1', '1495166209', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7640', '127.0.0.1', '1495166223', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7641', '127.0.0.1', '1495172325', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7642', '127.0.0.1', '1495172354', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7643', '127.0.0.1', '1495172461', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7644', '127.0.0.1', '1495172564', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7645', '127.0.0.1', '1495172603', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7646', '127.0.0.1', '1495172611', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7647', '127.0.0.1', '1495172689', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7648', '127.0.0.1', '1495172697', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7649', '127.0.0.1', '1495172719', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7650', '127.0.0.1', '1495172726', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7651', '127.0.0.1', '1495172733', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7652', '127.0.0.1', '1495174951', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7653', '127.0.0.1', '1495174968', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7654', '127.0.0.1', '1495174985', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7655', '127.0.0.1', '1495175003', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7656', '127.0.0.1', '1495175063', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7657', '127.0.0.1', '1495175263', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7658', '127.0.0.1', '1495175279', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7659', '127.0.0.1', '1495175281', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7660', '127.0.0.1', '1495175283', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7661', '127.0.0.1', '1495175285', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7662', '127.0.0.1', '1495175285', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7663', '127.0.0.1', '1495175287', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7664', '127.0.0.1', '1495175293', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7665', '127.0.0.1', '1495175294', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7666', '127.0.0.1', '1495175413', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7667', '127.0.0.1', '1495175415', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7668', '127.0.0.1', '1495175416', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7669', '127.0.0.1', '1495175501', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7670', '127.0.0.1', '1495175550', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7671', '127.0.0.1', '1495175551', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7672', '127.0.0.1', '1495175553', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7673', '127.0.0.1', '1495175753', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7674', '127.0.0.1', '1495175848', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7675', '127.0.0.1', '1495175849', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7676', '127.0.0.1', '1495175858', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7677', '127.0.0.1', '1495175860', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7678', '127.0.0.1', '1495175879', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7679', '127.0.0.1', '1495175908', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7680', '127.0.0.1', '1495175910', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7681', '127.0.0.1', '1495175912', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7682', '127.0.0.1', '1495175915', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7683', '127.0.0.1', '1495175915', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7684', '127.0.0.1', '1495175916', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7685', '127.0.0.1', '1495175933', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7686', '127.0.0.1', '1495175939', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7687', '127.0.0.1', '1495176085', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7688', '127.0.0.1', '1495176104', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7689', '127.0.0.1', '1495176128', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7690', '127.0.0.1', '1495176162', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7691', '127.0.0.1', '1495176179', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7692', '127.0.0.1', '1495176353', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7693', '127.0.0.1', '1495176358', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7694', '127.0.0.1', '1495176371', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7695', '127.0.0.1', '1495176372', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7696', '127.0.0.1', '1495176374', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7697', '127.0.0.1', '1495176496', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7698', '127.0.0.1', '1495176564', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7699', '127.0.0.1', '1495176566', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7700', '127.0.0.1', '1495176568', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7701', '127.0.0.1', '1495176613', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7702', '127.0.0.1', '1495176648', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7703', '127.0.0.1', '1495176681', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7704', '127.0.0.1', '1495176703', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7705', '127.0.0.1', '1495176895', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7706', '127.0.0.1', '1495176897', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7707', '127.0.0.1', '1495176934', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7708', '127.0.0.1', '1495176979', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7709', '127.0.0.1', '1495177074', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7710', '127.0.0.1', '1495177208', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7711', '127.0.0.1', '1495177235', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7712', '127.0.0.1', '1495177305', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7713', '127.0.0.1', '1495177365', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7714', '127.0.0.1', '1495177398', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7715', '127.0.0.1', '1495177432', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7716', '127.0.0.1', '1495177524', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7717', '127.0.0.1', '1495177536', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7718', '127.0.0.1', '1495177543', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7719', '127.0.0.1', '1495177548', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7720', '127.0.0.1', '1495177562', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7721', '127.0.0.1', '1495177659', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7722', '127.0.0.1', '1495177663', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7723', '127.0.0.1', '1495177776', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7724', '127.0.0.1', '1495177825', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7725', '127.0.0.1', '1495177958', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7726', '127.0.0.1', '1495177960', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7727', '127.0.0.1', '1495177962', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7728', '127.0.0.1', '1495177963', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7729', '127.0.0.1', '1495177978', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7730', '127.0.0.1', '1495178217', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7731', '127.0.0.1', '1495178219', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7732', '127.0.0.1', '1495178224', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7733', '127.0.0.1', '1495178273', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7734', '127.0.0.1', '1495178280', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7735', '127.0.0.1', '1495178296', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7736', '127.0.0.1', '1495178301', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7737', '127.0.0.1', '1495178312', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7738', '127.0.0.1', '1495178349', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7739', '127.0.0.1', '1495178401', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7740', '127.0.0.1', '1495178533', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7741', '127.0.0.1', '1495178541', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7742', '127.0.0.1', '1495178549', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7743', '127.0.0.1', '1495178581', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7744', '127.0.0.1', '1495178666', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7745', '127.0.0.1', '1495178669', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7746', '127.0.0.1', '1495178675', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7747', '127.0.0.1', '1495178720', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7748', '127.0.0.1', '1495178962', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7749', '127.0.0.1', '1495179184', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7750', '127.0.0.1', '1495179198', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7751', '127.0.0.1', '1495179231', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7752', '127.0.0.1', '1495179234', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7753', '127.0.0.1', '1495179238', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7754', '127.0.0.1', '1495179254', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7755', '127.0.0.1', '1495179274', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7756', '127.0.0.1', '1495179275', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7757', '127.0.0.1', '1495179277', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7758', '127.0.0.1', '1495179278', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7759', '127.0.0.1', '1495179279', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7760', '127.0.0.1', '1495179280', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7761', '127.0.0.1', '1495179281', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7762', '127.0.0.1', '1495179282', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7763', '127.0.0.1', '1495179283', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7764', '127.0.0.1', '1495179283', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7765', '127.0.0.1', '1495179284', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7766', '127.0.0.1', '1495179285', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7767', '127.0.0.1', '1495179297', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7768', '127.0.0.1', '1495179298', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7769', '127.0.0.1', '1495179299', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7770', '127.0.0.1', '1495179300', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7771', '127.0.0.1', '1495179301', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7772', '127.0.0.1', '1495179502', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7773', '127.0.0.1', '1495179503', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7774', '127.0.0.1', '1495179504', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7775', '127.0.0.1', '1495179505', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7776', '127.0.0.1', '1495179541', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7777', '127.0.0.1', '1495179588', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7778', '127.0.0.1', '1495179602', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7779', '127.0.0.1', '1495179663', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7780', '127.0.0.1', '1495179674', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7781', '127.0.0.1', '1495179870', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7782', '127.0.0.1', '1495179886', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7783', '127.0.0.1', '1495179888', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7784', '127.0.0.1', '1495179904', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7785', '127.0.0.1', '1495180008', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7786', '127.0.0.1', '1495180010', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7787', '127.0.0.1', '1495180011', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7788', '127.0.0.1', '1495180011', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7789', '127.0.0.1', '1495180012', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7790', '127.0.0.1', '1495180012', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7791', '127.0.0.1', '1495180027', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7792', '127.0.0.1', '1495180074', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7793', '127.0.0.1', '1495180199', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7794', '127.0.0.1', '1495180226', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7795', '127.0.0.1', '1495180413', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7796', '127.0.0.1', '1495180432', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7797', '127.0.0.1', '1495180451', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7798', '127.0.0.1', '1495180481', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7799', '127.0.0.1', '1495180500', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7800', '127.0.0.1', '1495180510', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7801', '127.0.0.1', '1495180521', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7802', '127.0.0.1', '1495180541', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7803', '127.0.0.1', '1495180542', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7804', '127.0.0.1', '1495180551', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7805', '127.0.0.1', '1495180575', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7806', '127.0.0.1', '1495180578', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7807', '127.0.0.1', '1495180579', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7808', '127.0.0.1', '1495180592', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7809', '127.0.0.1', '1495180605', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7810', '127.0.0.1', '1495180626', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7811', '127.0.0.1', '1495180657', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7812', '127.0.0.1', '1495180717', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7813', '127.0.0.1', '1495180846', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7814', '127.0.0.1', '1495180848', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7815', '127.0.0.1', '1495180848', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7816', '127.0.0.1', '1495180849', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7817', '127.0.0.1', '1495180852', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7818', '127.0.0.1', '1495180853', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7819', '127.0.0.1', '1495180854', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7820', '127.0.0.1', '1495180855', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7821', '127.0.0.1', '1495180882', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7822', '127.0.0.1', '1495180885', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7823', '127.0.0.1', '1495180898', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7824', '127.0.0.1', '1495180900', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7825', '127.0.0.1', '1495180957', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7826', '127.0.0.1', '1495180960', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7827', '127.0.0.1', '1495180962', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7828', '127.0.0.1', '1495180978', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7829', '127.0.0.1', '1495180981', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7830', '127.0.0.1', '1495181003', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7831', '127.0.0.1', '1495181005', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7832', '127.0.0.1', '1495181007', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7833', '127.0.0.1', '1495181008', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7834', '127.0.0.1', '1495181016', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7835', '127.0.0.1', '1495181017', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7836', '127.0.0.1', '1495181019', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7837', '127.0.0.1', '1495181021', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7838', '127.0.0.1', '1495181021', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7839', '127.0.0.1', '1495181022', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7840', '127.0.0.1', '1495181051', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7841', '127.0.0.1', '1495181141', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7842', '127.0.0.1', '1495181142', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7843', '127.0.0.1', '1495181143', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7844', '127.0.0.1', '1495181145', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7845', '127.0.0.1', '1495181146', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7846', '127.0.0.1', '1495181185', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7847', '127.0.0.1', '1495181186', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7848', '127.0.0.1', '1495181187', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7849', '127.0.0.1', '1495181189', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7850', '127.0.0.1', '1495181190', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7851', '127.0.0.1', '1495181190', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7852', '127.0.0.1', '1495181198', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7853', '127.0.0.1', '1495181199', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7854', '127.0.0.1', '1495181223', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7855', '127.0.0.1', '1495181335', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7856', '127.0.0.1', '1495181447', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7857', '127.0.0.1', '1495181464', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7858', '127.0.0.1', '1495181505', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7859', '127.0.0.1', '1495181513', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7860', '127.0.0.1', '1495181524', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7861', '127.0.0.1', '1495181564', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7862', '127.0.0.1', '1495182177', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7863', '127.0.0.1', '1495182184', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7864', '127.0.0.1', '1495182190', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7865', '127.0.0.1', '1495182217', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7866', '127.0.0.1', '1495182227', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7867', '127.0.0.1', '1495182374', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7868', '127.0.0.1', '1495182375', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7869', '127.0.0.1', '1495182383', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7870', '127.0.0.1', '1495182465', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7871', '127.0.0.1', '1495182521', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7872', '127.0.0.1', '1495182529', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7873', '127.0.0.1', '1495182542', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7874', '127.0.0.1', '1495182543', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7875', '127.0.0.1', '1495182545', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7876', '127.0.0.1', '1495182757', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7877', '127.0.0.1', '1495182773', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7878', '127.0.0.1', '1495182904', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7879', '127.0.0.1', '1495182906', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"X2tRbjB4VGMKBzReCBNjNhkjJVlxEzECLyc.Hm8dJVYUDWIcST5tIA==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\",\"email_test\":\"\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7880', '127.0.0.1', '1495182926', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"X2tRbjB4VGMKBzReCBNjNhkjJVlxEzECLyc.Hm8dJVYUDWIcST5tIA==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\",\"email_test\":\"\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7881', '127.0.0.1', '1495182955', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7882', '127.0.0.1', '1495183041', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"cVM3SndSVm0kP1J6TzlhODcbQ302OTMMAR9YOig3J1g6NQQ4DhRvLg==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\",\"email_test\":\"1122\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7883', '127.0.0.1', '1495183051', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7884', '127.0.0.1', '1495183054', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7885', '127.0.0.1', '1495183076', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"c1huamtCNkcmNAtaUykBEjUQGl0qKVMmAxQBGjQnR3I4Pl0YEgQPBA==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\",\"email_test\":\"\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7886', '127.0.0.1', '1495183121', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"c1huamtCNkcmNAtaUykBEjUQGl0qKVMmAxQBGjQnR3I4Pl0YEgQPBA==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\",\"email_test\":\"\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7887', '127.0.0.1', '1495183301', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"c1huamtCNkcmNAtaUykBEjUQGl0qKVMmAxQBGjQnR3I4Pl0YEgQPBA==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\",\"email_test\":\"\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7888', '127.0.0.1', '1495183313', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"c1huamtCNkcmNAtaUykBEjUQGl0qKVMmAxQBGjQnR3I4Pl0YEgQPBA==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\",\"email_test\":\"\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7889', '127.0.0.1', '1495183316', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7890', '127.0.0.1', '1495183318', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7891', '127.0.0.1', '1495183319', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7892', '127.0.0.1', '1495183321', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"TXlfQXdxQlIYFTpxTxp1BwsxK3Y2GiczPTUwMSgUM2cGH2wzDjd7EQ==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7893', '127.0.0.1', '1495183329', '1', 'admin', 'config', 'index', '系统管理,id=3', '{\"_csrf-backend\":\"TXlfQXdxQlIYFTpxTxp1BwsxK3Y2GiczPTUwMSgUM2cGH2wzDjd7EQ==\",\"email_host\":\"smtp.exmail.qq.com\",\"email_port\":\"465\",\"email_addr\":\"Harvey@sykjshop.com\",\"email_id\":\"Harvey@sykjshop.com\",\"email_pass\":\"shengyun1234\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7894', '127.0.0.1', '1495183331', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7895', '127.0.0.1', '1495183379', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7896', '127.0.0.1', '1495183394', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7897', '127.0.0.1', '1495183480', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7898', '127.0.0.1', '1495183500', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7899', '127.0.0.1', '1495183548', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7900', '127.0.0.1', '1495184101', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7901', '127.0.0.1', '1495184105', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7902', '127.0.0.1', '1495184106', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7903', '127.0.0.1', '1495184132', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7904', '127.0.0.1', '1495184224', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7905', '127.0.0.1', '1495184241', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7906', '127.0.0.1', '1495184247', '1', 'admin', 'config', 'index', '系统管理,id=4', '{\"_csrf-backend\":\"RS0wTUIzT1EQQVV9elh4BANlRHoDWCowNWFfPR1WPmQOSwM\\/O3V2Eg==\",\"hot_search\":\"\\u6bcd\\u5a74,\\u6570\\u7801,\\u670d\\u88c5,\\u5bb6\\u5c45,\\u98df\\u54c1,\\u5bb6\\u7535,\\u73e0\\u5b9d,\\u9762\\u819c,\\u5316\\u5986\"}');
INSERT INTO `shop_admin_dolog` VALUES ('7907', '127.0.0.1', '1495184248', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7908', '127.0.0.1', '1495184889', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7909', '127.0.0.1', '1495184895', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7910', '127.0.0.1', '1495184899', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7911', '127.0.0.1', '1495184900', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7912', '127.0.0.1', '1495184900', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7913', '127.0.0.1', '1495184901', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7914', '127.0.0.1', '1495184903', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7915', '127.0.0.1', '1495184903', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7916', '127.0.0.1', '1495184917', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7917', '127.0.0.1', '1495184919', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7918', '127.0.0.1', '1495184920', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7919', '127.0.0.1', '1495184923', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7920', '127.0.0.1', '1495184924', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7921', '127.0.0.1', '1495184927', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7922', '127.0.0.1', '1495184937', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7923', '127.0.0.1', '1495184945', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7924', '127.0.0.1', '1495184947', '1', 'admin', 'menu', 'edit', '修改菜单,id=331', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7925', '127.0.0.1', '1495184948', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7926', '127.0.0.1', '1495184950', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7927', '127.0.0.1', '1495184954', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7928', '127.0.0.1', '1495184957', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7929', '127.0.0.1', '1495185029', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7930', '127.0.0.1', '1495185034', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7931', '127.0.0.1', '1495185041', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7932', '127.0.0.1', '1495185042', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7933', '127.0.0.1', '1495185098', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"QkpjQ25RSEcXJgZzVjp\\/EgQCF3QvOi0mMgYMMzE0OXIJLFAxFxdxBA==\",\"Menu\":{\"title\":\"\\u652f\\u4ed8\\u65b9\\u5f0f\\u7ba1\\u7406\",\"sort\":\"8\",\"url\":\"\\/config\\/payment\\/index\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7934', '127.0.0.1', '1495185100', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7935', '127.0.0.1', '1495185102', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7936', '127.0.0.1', '1495185127', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"eVpQekxGekQsNjVKdC1NET8SJE0NLR8lCRY\\/ChMjC3EyPGMINQBDBw==\",\"Menu\":{\"title\":\"SEO\\u7ba1\\u7406\",\"sort\":\"9\",\"url\":\"\\/config\\/seo\\/index\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('7937', '127.0.0.1', '1495185128', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7938', '127.0.0.1', '1495185134', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7939', '127.0.0.1', '1495185138', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7940', '127.0.0.1', '1495185994', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7941', '127.0.0.1', '1495186100', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7942', '127.0.0.1', '1495186149', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7943', '127.0.0.1', '1495186333', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7944', '127.0.0.1', '1495186363', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7945', '127.0.0.1', '1495186375', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7946', '127.0.0.1', '1495186389', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7947', '127.0.0.1', '1495186555', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7948', '127.0.0.1', '1495186589', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7949', '127.0.0.1', '1495186614', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7950', '127.0.0.1', '1495186639', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7951', '127.0.0.1', '1495186648', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7952', '127.0.0.1', '1495186661', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7953', '127.0.0.1', '1495186667', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7954', '127.0.0.1', '1495186706', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7955', '127.0.0.1', '1495186733', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7956', '127.0.0.1', '1495186962', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7957', '127.0.0.1', '1495187050', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7958', '127.0.0.1', '1495187105', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7959', '127.0.0.1', '1495187135', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7960', '127.0.0.1', '1495187512', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7961', '127.0.0.1', '1495187525', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7962', '127.0.0.1', '1495187528', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7963', '127.0.0.1', '1495187568', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7964', '127.0.0.1', '1495187572', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7965', '127.0.0.1', '1495187615', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7966', '127.0.0.1', '1495187672', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7967', '127.0.0.1', '1495187690', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7968', '127.0.0.1', '1495187716', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7969', '127.0.0.1', '1495187720', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7970', '127.0.0.1', '1495187741', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7971', '127.0.0.1', '1495187749', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7972', '127.0.0.1', '1495187751', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7973', '127.0.0.1', '1495187769', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7974', '127.0.0.1', '1495187774', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7975', '127.0.0.1', '1495187787', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7976', '127.0.0.1', '1495187789', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7977', '127.0.0.1', '1495187793', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7978', '127.0.0.1', '1495187793', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7979', '127.0.0.1', '1495187797', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7980', '127.0.0.1', '1495187799', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7981', '127.0.0.1', '1495187824', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7982', '127.0.0.1', '1495187831', '1', 'admin', 'payment', 'change', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7983', '127.0.0.1', '1495187831', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7984', '127.0.0.1', '1495187837', '1', 'admin', 'payment', 'change', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7985', '127.0.0.1', '1495187838', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7986', '127.0.0.1', '1495187842', '1', 'admin', 'payment', 'change', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7987', '127.0.0.1', '1495187842', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7988', '127.0.0.1', '1495187846', '1', 'admin', 'payment', 'change', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7989', '127.0.0.1', '1495187846', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7990', '127.0.0.1', '1495187853', '1', 'admin', 'payment', 'change', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7991', '127.0.0.1', '1495187854', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7992', '127.0.0.1', '1495187875', '1', 'admin', 'payment', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7993', '127.0.0.1', '1495187963', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7994', '127.0.0.1', '1495187964', '1', 'admin', 'payment', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7995', '127.0.0.1', '1495188202', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7996', '127.0.0.1', '1495188218', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7997', '127.0.0.1', '1495188219', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7998', '127.0.0.1', '1495188224', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('7999', '127.0.0.1', '1495188244', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8000', '127.0.0.1', '1495188245', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8001', '127.0.0.1', '1495189523', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8002', '127.0.0.1', '1495189526', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8003', '127.0.0.1', '1495189532', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8004', '127.0.0.1', '1495189533', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8005', '127.0.0.1', '1495189534', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8006', '127.0.0.1', '1495189537', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8007', '127.0.0.1', '1495189886', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8008', '127.0.0.1', '1495189888', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8009', '127.0.0.1', '1495189889', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8010', '127.0.0.1', '1495189890', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8011', '127.0.0.1', '1495189891', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8012', '127.0.0.1', '1495189892', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8013', '127.0.0.1', '1495189892', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8014', '127.0.0.1', '1495189894', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8015', '127.0.0.1', '1495189905', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8016', '127.0.0.1', '1495189938', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8017', '127.0.0.1', '1495189939', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8018', '127.0.0.1', '1495189940', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8019', '127.0.0.1', '1495189940', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8020', '127.0.0.1', '1495189941', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8021', '127.0.0.1', '1495189943', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8022', '127.0.0.1', '1495414996', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8023', '127.0.0.1', '1495415142', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8024', '127.0.0.1', '1495415148', '1', 'admin', 'admin', 'edit', '编辑管理员,id=19', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8025', '127.0.0.1', '1495415368', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8026', '127.0.0.1', '1495415370', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8027', '127.0.0.1', '1495415386', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8028', '127.0.0.1', '1495415388', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8029', '127.0.0.1', '1495415395', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8030', '127.0.0.1', '1495415397', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8031', '127.0.0.1', '1495415410', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"NjM0RkJUOEZefXdzD2RWdXRUfBkEBko.RAFEKXMlbw5hf3MWOxAMLQ==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8032', '127.0.0.1', '1495415411', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"NjM0RkJUOEZefXdzD2RWdXRUfBkEBko.RAFEKXMlbw5hf3MWOxAMLQ==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8033', '127.0.0.1', '1495415414', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8034', '127.0.0.1', '1495415416', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8035', '127.0.0.1', '1495415443', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8036', '127.0.0.1', '1495415453', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8037', '127.0.0.1', '1495415466', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8038', '127.0.0.1', '1495415984', '1', 'admin', 'payment', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8039', '127.0.0.1', '1495416050', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8040', '127.0.0.1', '1495416051', '1', 'admin', 'payment', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8041', '127.0.0.1', '1495416595', '1', 'admin', 'payment', 'change', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8042', '127.0.0.1', '1495416595', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8043', '127.0.0.1', '1495416601', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8044', '127.0.0.1', '1495416606', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8045', '127.0.0.1', '1495416656', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8046', '127.0.0.1', '1495416657', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8047', '127.0.0.1', '1495416884', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8048', '127.0.0.1', '1495416886', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8049', '127.0.0.1', '1495416978', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8050', '127.0.0.1', '1495416979', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8051', '127.0.0.1', '1495417626', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8052', '127.0.0.1', '1495417629', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8053', '127.0.0.1', '1495417662', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8054', '127.0.0.1', '1495417667', '1', 'admin', 'payment', 'edit', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8055', '127.0.0.1', '1495417669', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8056', '127.0.0.1', '1495417844', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8057', '127.0.0.1', '1495417846', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8058', '127.0.0.1', '1495417849', '1', 'admin', 'payment', 'edit', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8059', '127.0.0.1', '1495417853', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8060', '127.0.0.1', '1495417878', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8061', '127.0.0.1', '1495417931', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8062', '127.0.0.1', '1495417933', '1', 'admin', 'payment', 'edit', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8063', '127.0.0.1', '1495418096', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8064', '127.0.0.1', '1495418097', '1', 'admin', 'payment', 'edit', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8065', '127.0.0.1', '1495418126', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8066', '127.0.0.1', '1495418134', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8067', '127.0.0.1', '1495418138', '1', 'admin', 'payment', 'change', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8068', '127.0.0.1', '1495418138', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8069', '127.0.0.1', '1495418140', '1', 'admin', 'payment', 'change', ',id=5', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8070', '127.0.0.1', '1495418140', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8071', '127.0.0.1', '1495418141', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8072', '127.0.0.1', '1495418240', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8073', '127.0.0.1', '1495418242', '1', 'admin', 'payment', 'edit', ',id=6', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8074', '127.0.0.1', '1495418383', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8075', '127.0.0.1', '1495418386', '1', 'admin', 'payment', 'edit', ',id=6', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8076', '127.0.0.1', '1495418414', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8077', '127.0.0.1', '1495418431', '1', 'admin', 'payment', 'change', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8078', '127.0.0.1', '1495418431', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8079', '127.0.0.1', '1495418432', '1', 'admin', 'payment', 'edit', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8080', '127.0.0.1', '1495418592', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8081', '127.0.0.1', '1495418594', '1', 'admin', 'payment', 'edit', ',id=8', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8082', '127.0.0.1', '1495418662', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8083', '127.0.0.1', '1495418663', '1', 'admin', 'payment', 'edit', ',id=8', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8084', '127.0.0.1', '1495418666', '1', 'admin', 'payment', 'edit', ',id=9', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8085', '127.0.0.1', '1495418716', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8086', '127.0.0.1', '1495418718', '1', 'admin', 'payment', 'edit', ',id=10', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8087', '127.0.0.1', '1495418745', '1', 'admin', 'payment', 'edit', ',id=11', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8088', '127.0.0.1', '1495418802', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8089', '127.0.0.1', '1495418804', '1', 'admin', 'payment', 'edit', ',id=11', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8090', '127.0.0.1', '1495418880', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8091', '127.0.0.1', '1495418881', '1', 'admin', 'payment', 'edit', ',id=11', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8092', '127.0.0.1', '1495418886', '1', 'admin', 'payment', 'edit', ',id=10', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8093', '127.0.0.1', '1495418919', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8094', '127.0.0.1', '1495419066', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8095', '127.0.0.1', '1495419068', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8096', '127.0.0.1', '1495419069', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8097', '127.0.0.1', '1495419072', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8098', '127.0.0.1', '1495419078', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8099', '127.0.0.1', '1495419081', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8100', '127.0.0.1', '1495419082', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8101', '127.0.0.1', '1495419083', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8102', '127.0.0.1', '1495419118', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8103', '127.0.0.1', '1495419162', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8104', '127.0.0.1', '1495419179', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8105', '127.0.0.1', '1495419217', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8106', '127.0.0.1', '1495419219', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8107', '127.0.0.1', '1495419221', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8108', '127.0.0.1', '1495419224', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8109', '127.0.0.1', '1495419273', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8110', '127.0.0.1', '1495419278', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8111', '127.0.0.1', '1495419280', '1', 'admin', 'payment', 'edit', ',id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8112', '127.0.0.1', '1495419302', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8113', '127.0.0.1', '1495419327', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8114', '127.0.0.1', '1495419637', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8115', '127.0.0.1', '1495419639', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8116', '127.0.0.1', '1495419673', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8117', '127.0.0.1', '1495419674', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8118', '127.0.0.1', '1495419790', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8119', '127.0.0.1', '1495419844', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8120', '127.0.0.1', '1495419857', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8121', '127.0.0.1', '1495419859', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8122', '127.0.0.1', '1495419861', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8123', '127.0.0.1', '1495419863', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8124', '127.0.0.1', '1495419883', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8125', '127.0.0.1', '1495419884', '1', 'admin', 'payment', 'edit', ',id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8126', '127.0.0.1', '1495419887', '1', 'admin', 'payment', 'edit', ',id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8127', '127.0.0.1', '1495419891', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8128', '127.0.0.1', '1495419892', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8129', '127.0.0.1', '1495419895', '1', 'admin', 'payment', 'edit', ',id=6', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8130', '127.0.0.1', '1495419897', '1', 'admin', 'payment', 'edit', ',id=6', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8131', '127.0.0.1', '1495419900', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8132', '127.0.0.1', '1495419901', '1', 'admin', 'payment', 'edit', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8133', '127.0.0.1', '1495420257', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8134', '127.0.0.1', '1495420269', '1', 'admin', 'payment', 'edit', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8135', '127.0.0.1', '1495420270', '1', 'admin', 'payment', 'edit', ',id=7', '{\"_csrf-backend\":\"b3B5Qy5ZcW0HPjp2Y2kfXi0XMRxoCwMVHUIJLB8oJiU4PD4TVx1FBg==\",\"alipay_service\":\"create_direct_pay_by_user\",\"alipay_account\":\"3160529319@qq.com\",\"alipay_key\":\"6wjrqugym1ygyj22dr3fllmp1v2mg9ns\",\"alipay_partner\":\"2088911718232754\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8136', '127.0.0.1', '1495420298', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8137', '127.0.0.1', '1495420300', '1', 'admin', 'payment', 'edit', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8138', '127.0.0.1', '1495420302', '1', 'admin', 'payment', 'edit', ',id=7', '{\"_csrf-backend\":\"Z09odjh1MWoPAStDdUVfWSUoICl.J0MSFX0YGQkEZiIwAy8mQTEFAQ==\",\"alipay_service\":\"create_direct_pay_by_user\",\"alipay_account\":\"3160529319@qq.com\",\"alipay_key\":\"6wjrqugym1ygyj22dr3fllmp1v2mg9ns\",\"alipay_partner\":\"2088911718232754\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8139', '127.0.0.1', '1495420394', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8140', '127.0.0.1', '1495420395', '1', 'admin', 'payment', 'edit', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8141', '127.0.0.1', '1495420396', '1', 'admin', 'payment', 'edit', ',id=7', '{\"_csrf-backend\":\"Z3ZkdEhlQ0sPOCdBBVUteCURLCsONzEzFUQUG3kUFAMwOiMkMSF3IA==\",\"alipay_service\":\"create_direct_pay_by_user\",\"alipay_account\":\"3160529319@qq.com\",\"alipay_key\":\"6wjrqugym1ygyj22dr3fllmp1v2mg9ns\",\"alipay_partner\":\"2088911718232754\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8142', '127.0.0.1', '1495420441', '1', 'admin', 'payment', 'edit', ',id=8', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8143', '127.0.0.1', '1495420442', '1', 'admin', 'payment', 'edit', ',id=8', '{\"_csrf-backend\":\"NWJwbmpyU3BdLDNbJ0I9Q3cFODEsICEIR1AAAVsDBDhiLjc.EzZnGw==\",\"qupay_mchid\":\"00000000000329\",\"qupay_key\":\"SBXcQSbPH2hP\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8144', '127.0.0.1', '1495420480', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8145', '127.0.0.1', '1495420481', '1', 'admin', 'payment', 'edit', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8146', '127.0.0.1', '1495420482', '1', 'admin', 'payment', 'edit', ',id=7', '{\"_csrf-backend\":\"OTdVUDVNbVZReRZleH0DZXtQHQ9zHx8uSwUlPwQ8Oh5uexIATAlZPQ==\",\"alipay_service\":\"create_direct_pay_by_user\",\"alipay_account\":\"3160529319@qq.com\",\"alipay_key\":\"6wjrqugym1ygyj22dr3fllmp1v2mg9ns\",\"alipay_partner\":\"2088911718232754\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8147', '127.0.0.1', '1495420558', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8148', '127.0.0.1', '1495420560', '1', 'admin', 'payment', 'edit', ',id=8', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8149', '127.0.0.1', '1495420563', '1', 'admin', 'payment', 'edit', ',id=9', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8150', '127.0.0.1', '1495420566', '1', 'admin', 'payment', 'edit', ',id=7', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8151', '127.0.0.1', '1495420568', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8152', '127.0.0.1', '1495420569', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8153', '127.0.0.1', '1495420575', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"ZURmWUY1aGsNCiVsCwUGWCcjLgYAZxoTF3YWNndEPyMyCCEJP3FcAA==\",\"chinabank_account\":\"123\",\"chinabank_key\":\"123\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8154', '127.0.0.1', '1495420579', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8155', '127.0.0.1', '1495420581', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8156', '127.0.0.1', '1495420612', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8157', '127.0.0.1', '1495420658', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8158', '127.0.0.1', '1495420661', '1', 'admin', 'payment', 'edit', ',id=6', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8159', '127.0.0.1', '1495420750', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8160', '127.0.0.1', '1495420752', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8161', '127.0.0.1', '1495420760', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8162', '127.0.0.1', '1495420762', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8163', '127.0.0.1', '1495420779', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"UE1EemVybnQ4AwdPKEIARxIqDCUjIBwMIn80FVQDOTwHAQMqHDZaHw==\",\"chinabank_account\":\"123\",\"chinabank_key\":\"123\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8164', '127.0.0.1', '1495420795', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8165', '127.0.0.1', '1495420796', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8166', '127.0.0.1', '1495420799', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"NVFwRzlEa3ldHzNydHQFSnc2OBh\\/FhkBR2MAKAg1PDFiHTcXQABfEg==\",\"chinabank_account\":\"111\",\"chinabank_key\":\"111\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8167', '127.0.0.1', '1495420829', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"NVFwRzlEa3ldHzNydHQFSnc2OBh\\/FhkBR2MAKAg1PDFiHTcXQABfEg==\",\"chinabank_account\":\"111\",\"chinabank_key\":\"111\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8168', '127.0.0.1', '1495421203', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"NVFwRzlEa3ldHzNydHQFSnc2OBh\\/FhkBR2MAKAg1PDFiHTcXQABfEg==\",\"chinabank_account\":\"111\",\"chinabank_key\":\"111\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8169', '127.0.0.1', '1495421217', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"NVFwRzlEa3ldHzNydHQFSnc2OBh\\/FhkBR2MAKAg1PDFiHTcXQABfEg==\",\"chinabank_account\":\"111\",\"chinabank_key\":\"111\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8170', '127.0.0.1', '1495421247', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"NVFwRzlEa3ldHzNydHQFSnc2OBh\\/FhkBR2MAKAg1PDFiHTcXQABfEg==\",\"chinabank_account\":\"111\",\"chinabank_key\":\"111\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8171', '127.0.0.1', '1495421262', '1', 'admin', 'payment', 'edit', ',id=4', '{\"_csrf-backend\":\"NVFwRzlEa3ldHzNydHQFSnc2OBh\\/FhkBR2MAKAg1PDFiHTcXQABfEg==\",\"chinabank_account\":\"111\",\"chinabank_key\":\"111\"}');
INSERT INTO `shop_admin_dolog` VALUES ('8172', '127.0.0.1', '1495421267', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8173', '127.0.0.1', '1495421269', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8174', '127.0.0.1', '1495421273', '1', 'admin', 'payment', 'edit', ',id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8175', '127.0.0.1', '1495421276', '1', 'admin', 'payment', 'edit', ',id=6', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8176', '127.0.0.1', '1495421284', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8177', '127.0.0.1', '1495421426', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8178', '127.0.0.1', '1495421438', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8179', '127.0.0.1', '1495421441', '1', 'admin', 'payment', 'delete', ',id=12', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8180', '127.0.0.1', '1495421441', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8181', '127.0.0.1', '1495421445', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8182', '127.0.0.1', '1495421475', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8183', '127.0.0.1', '1495421476', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8184', '127.0.0.1', '1495421477', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8185', '127.0.0.1', '1495421480', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8186', '127.0.0.1', '1495422570', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8187', '127.0.0.1', '1495422629', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8188', '127.0.0.1', '1495422896', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8189', '127.0.0.1', '1495422925', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8190', '127.0.0.1', '1495422938', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8191', '127.0.0.1', '1495423499', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8192', '127.0.0.1', '1495423508', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8193', '127.0.0.1', '1495423512', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8194', '127.0.0.1', '1495423548', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8195', '127.0.0.1', '1495423571', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8196', '127.0.0.1', '1495423594', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8197', '127.0.0.1', '1495423598', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8198', '127.0.0.1', '1495423645', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8199', '127.0.0.1', '1495423661', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8200', '127.0.0.1', '1495423663', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8201', '127.0.0.1', '1495423717', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8202', '127.0.0.1', '1495423731', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8203', '127.0.0.1', '1495423744', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8204', '127.0.0.1', '1495423751', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8205', '127.0.0.1', '1495423798', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8206', '127.0.0.1', '1495423828', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8207', '127.0.0.1', '1495423829', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8208', '127.0.0.1', '1495423830', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8209', '127.0.0.1', '1495423831', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8210', '127.0.0.1', '1495423832', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8211', '127.0.0.1', '1495423833', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8212', '127.0.0.1', '1495423834', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8213', '127.0.0.1', '1495423834', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8214', '127.0.0.1', '1495423835', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8215', '127.0.0.1', '1495423836', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8216', '127.0.0.1', '1495423836', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8217', '127.0.0.1', '1495423837', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8218', '127.0.0.1', '1495423837', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8219', '127.0.0.1', '1495423843', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8220', '127.0.0.1', '1495423846', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8221', '127.0.0.1', '1495423848', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8222', '127.0.0.1', '1495423937', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8223', '127.0.0.1', '1495423938', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8224', '127.0.0.1', '1495423939', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8225', '127.0.0.1', '1495423940', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8226', '127.0.0.1', '1495423941', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8227', '127.0.0.1', '1495423944', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8228', '127.0.0.1', '1495423945', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8229', '127.0.0.1', '1495423946', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8230', '127.0.0.1', '1495423948', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8231', '127.0.0.1', '1495423955', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8232', '127.0.0.1', '1495423959', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8233', '127.0.0.1', '1495423982', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8234', '127.0.0.1', '1495424011', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8235', '127.0.0.1', '1495424043', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8236', '127.0.0.1', '1495424071', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8237', '127.0.0.1', '1495424360', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8238', '127.0.0.1', '1495424361', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8239', '127.0.0.1', '1495424362', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8240', '127.0.0.1', '1495424363', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8241', '127.0.0.1', '1495424364', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8242', '127.0.0.1', '1495424365', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8243', '127.0.0.1', '1495424395', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8244', '127.0.0.1', '1495424395', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8245', '127.0.0.1', '1495424398', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8246', '127.0.0.1', '1495424399', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8247', '127.0.0.1', '1495424400', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8248', '127.0.0.1', '1495424401', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8249', '127.0.0.1', '1495424402', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8250', '127.0.0.1', '1495424403', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8251', '127.0.0.1', '1495424404', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8252', '127.0.0.1', '1495424406', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8253', '127.0.0.1', '1495424407', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8254', '127.0.0.1', '1495424411', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8255', '127.0.0.1', '1495424426', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8256', '127.0.0.1', '1495424458', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8257', '127.0.0.1', '1495425171', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8258', '127.0.0.1', '1495425175', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8259', '127.0.0.1', '1495425176', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8260', '127.0.0.1', '1495425178', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8261', '127.0.0.1', '1495425182', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8262', '127.0.0.1', '1495425187', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8263', '127.0.0.1', '1495425188', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8264', '127.0.0.1', '1495425197', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8265', '127.0.0.1', '1495425198', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8266', '127.0.0.1', '1495425202', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8267', '127.0.0.1', '1495425223', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8268', '127.0.0.1', '1495425228', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8269', '127.0.0.1', '1495425231', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8270', '127.0.0.1', '1495425231', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8271', '127.0.0.1', '1495425234', '1', 'admin', 'seo', 'index', 'SEO管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8272', '127.0.0.1', '1495425277', '1', 'admin', 'payment', 'index', '支付方式管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8273', '127.0.0.1', '1495425282', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8274', '127.0.0.1', '1495432696', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8275', '127.0.0.1', '1495432829', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8276', '127.0.0.1', '1495432839', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8277', '127.0.0.1', '1495432841', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8278', '127.0.0.1', '1495432868', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8279', '127.0.0.1', '1495432871', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8280', '127.0.0.1', '1495432884', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8281', '127.0.0.1', '1495432886', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8282', '127.0.0.1', '1495432902', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8283', '127.0.0.1', '1495432911', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8284', '127.0.0.1', '1495432914', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8285', '127.0.0.1', '1495432967', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8286', '127.0.0.1', '1495432983', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8287', '127.0.0.1', '1495433028', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8288', '127.0.0.1', '1495433062', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8289', '127.0.0.1', '1495433140', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8290', '127.0.0.1', '1495433286', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8291', '127.0.0.1', '1495433287', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8292', '127.0.0.1', '1495433287', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8293', '127.0.0.1', '1495433328', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8294', '127.0.0.1', '1495433328', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8295', '127.0.0.1', '1495433328', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8296', '127.0.0.1', '1495433382', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8297', '127.0.0.1', '1495433383', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8298', '127.0.0.1', '1495433383', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8299', '127.0.0.1', '1495433571', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8300', '127.0.0.1', '1495433571', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8301', '127.0.0.1', '1495433571', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8302', '127.0.0.1', '1495433586', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8303', '127.0.0.1', '1495433586', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8304', '127.0.0.1', '1495433586', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8305', '127.0.0.1', '1495433718', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8306', '127.0.0.1', '1495433718', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8307', '127.0.0.1', '1495433718', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8308', '127.0.0.1', '1495433823', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8309', '127.0.0.1', '1495433823', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8310', '127.0.0.1', '1495433823', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8311', '127.0.0.1', '1495434100', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8312', '127.0.0.1', '1495434100', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8313', '127.0.0.1', '1495434100', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8314', '127.0.0.1', '1495434130', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8315', '127.0.0.1', '1495434130', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8316', '127.0.0.1', '1495434131', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8317', '127.0.0.1', '1495434147', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8318', '127.0.0.1', '1495434255', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8319', '127.0.0.1', '1495434259', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8320', '127.0.0.1', '1495434259', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8321', '127.0.0.1', '1495434259', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8322', '127.0.0.1', '1495434263', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8323', '127.0.0.1', '1495434263', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8324', '127.0.0.1', '1495434263', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8325', '127.0.0.1', '1495434379', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8326', '127.0.0.1', '1495434379', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8327', '127.0.0.1', '1495434379', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8328', '127.0.0.1', '1495434407', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8329', '127.0.0.1', '1495434408', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8330', '127.0.0.1', '1495434408', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8331', '127.0.0.1', '1495434427', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8332', '127.0.0.1', '1495434739', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8333', '127.0.0.1', '1495434739', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8334', '127.0.0.1', '1495434739', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8335', '127.0.0.1', '1495434963', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8336', '127.0.0.1', '1495434963', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8337', '127.0.0.1', '1495434963', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8338', '127.0.0.1', '1495435294', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8339', '127.0.0.1', '1495435294', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8340', '127.0.0.1', '1495435294', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8341', '127.0.0.1', '1495435351', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8342', '127.0.0.1', '1495435351', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8343', '127.0.0.1', '1495435351', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8344', '127.0.0.1', '1495435366', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8345', '127.0.0.1', '1495435366', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8346', '127.0.0.1', '1495435366', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8347', '127.0.0.1', '1495435456', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8348', '127.0.0.1', '1495435456', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8349', '127.0.0.1', '1495435456', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8350', '127.0.0.1', '1495435489', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8351', '127.0.0.1', '1495435489', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8352', '127.0.0.1', '1495435490', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8353', '127.0.0.1', '1495435853', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8354', '127.0.0.1', '1495435853', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8355', '127.0.0.1', '1495435854', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8356', '127.0.0.1', '1495435858', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8357', '127.0.0.1', '1495435858', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8358', '127.0.0.1', '1495435858', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8359', '127.0.0.1', '1495435861', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8360', '127.0.0.1', '1495435911', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8361', '127.0.0.1', '1495435925', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8362', '127.0.0.1', '1495435925', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8363', '127.0.0.1', '1495435925', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8364', '127.0.0.1', '1495435928', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8365', '127.0.0.1', '1495435928', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8366', '127.0.0.1', '1495435928', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8367', '127.0.0.1', '1495436734', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8368', '127.0.0.1', '1495436734', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8369', '127.0.0.1', '1495436734', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8370', '127.0.0.1', '1495436767', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8371', '127.0.0.1', '1495436767', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8372', '127.0.0.1', '1495436767', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8373', '127.0.0.1', '1495436770', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8374', '127.0.0.1', '1495436770', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8375', '127.0.0.1', '1495436770', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8376', '127.0.0.1', '1495436793', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8377', '127.0.0.1', '1495436794', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8378', '127.0.0.1', '1495436794', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8379', '127.0.0.1', '1495436853', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8380', '127.0.0.1', '1495436853', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8381', '127.0.0.1', '1495436853', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8382', '127.0.0.1', '1495436966', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8383', '127.0.0.1', '1495436966', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8384', '127.0.0.1', '1495436966', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8385', '127.0.0.1', '1495436970', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8386', '127.0.0.1', '1495436970', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8387', '127.0.0.1', '1495436971', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8388', '127.0.0.1', '1495437157', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8389', '127.0.0.1', '1495437157', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8390', '127.0.0.1', '1495437157', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8391', '127.0.0.1', '1495437173', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8392', '127.0.0.1', '1495437173', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8393', '127.0.0.1', '1495437173', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8394', '127.0.0.1', '1495437297', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8395', '127.0.0.1', '1495437297', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8396', '127.0.0.1', '1495437297', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8397', '127.0.0.1', '1495437322', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8398', '127.0.0.1', '1495437322', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8399', '127.0.0.1', '1495437322', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8400', '127.0.0.1', '1495437333', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8401', '127.0.0.1', '1495437333', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8402', '127.0.0.1', '1495437333', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8403', '127.0.0.1', '1495437521', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8404', '127.0.0.1', '1495437521', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8405', '127.0.0.1', '1495437522', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8406', '127.0.0.1', '1495437533', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8407', '127.0.0.1', '1495437533', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8408', '127.0.0.1', '1495437533', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8409', '127.0.0.1', '1495437552', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8410', '127.0.0.1', '1495437552', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8411', '127.0.0.1', '1495437552', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8412', '127.0.0.1', '1495437578', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8413', '127.0.0.1', '1495437578', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8414', '127.0.0.1', '1495437578', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8415', '127.0.0.1', '1495437594', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8416', '127.0.0.1', '1495437594', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8417', '127.0.0.1', '1495437594', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8418', '127.0.0.1', '1495437642', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8419', '127.0.0.1', '1495437643', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8420', '127.0.0.1', '1495437643', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8421', '127.0.0.1', '1495437671', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8422', '127.0.0.1', '1495437671', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8423', '127.0.0.1', '1495437671', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8424', '127.0.0.1', '1495438140', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8425', '127.0.0.1', '1495438140', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8426', '127.0.0.1', '1495438140', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8427', '127.0.0.1', '1495438176', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8428', '127.0.0.1', '1495438176', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8429', '127.0.0.1', '1495438176', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8430', '127.0.0.1', '1495438177', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8431', '127.0.0.1', '1495438178', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8432', '127.0.0.1', '1495438178', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8433', '127.0.0.1', '1495438181', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8434', '127.0.0.1', '1495438181', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8435', '127.0.0.1', '1495438181', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8436', '127.0.0.1', '1495438200', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8437', '127.0.0.1', '1495438200', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8438', '127.0.0.1', '1495438200', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8439', '127.0.0.1', '1495438209', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8440', '127.0.0.1', '1495438209', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8441', '127.0.0.1', '1495438209', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8442', '127.0.0.1', '1495438236', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8443', '127.0.0.1', '1495438236', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8444', '127.0.0.1', '1495438236', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8445', '127.0.0.1', '1495438508', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8446', '127.0.0.1', '1495438508', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8447', '127.0.0.1', '1495438509', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8448', '127.0.0.1', '1495438532', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8449', '127.0.0.1', '1495438532', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8450', '127.0.0.1', '1495438532', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8451', '127.0.0.1', '1495438547', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8452', '127.0.0.1', '1495438547', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8453', '127.0.0.1', '1495438547', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8454', '127.0.0.1', '1495438564', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8455', '127.0.0.1', '1495438565', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8456', '127.0.0.1', '1495438565', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8457', '127.0.0.1', '1495438591', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8458', '127.0.0.1', '1495438592', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8459', '127.0.0.1', '1495438592', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8460', '127.0.0.1', '1495438626', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8461', '127.0.0.1', '1495438626', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8462', '127.0.0.1', '1495438626', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8463', '127.0.0.1', '1495438642', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8464', '127.0.0.1', '1495438642', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8465', '127.0.0.1', '1495438642', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8466', '127.0.0.1', '1495438656', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8467', '127.0.0.1', '1495438657', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8468', '127.0.0.1', '1495438657', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8469', '127.0.0.1', '1495438686', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8470', '127.0.0.1', '1495438686', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8471', '127.0.0.1', '1495438686', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8472', '127.0.0.1', '1495438689', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8473', '127.0.0.1', '1495438689', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8474', '127.0.0.1', '1495438690', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8475', '127.0.0.1', '1495438850', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8476', '127.0.0.1', '1495438850', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8477', '127.0.0.1', '1495438850', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8478', '127.0.0.1', '1495438854', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8479', '127.0.0.1', '1495438854', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8480', '127.0.0.1', '1495438854', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8481', '127.0.0.1', '1495438903', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8482', '127.0.0.1', '1495438903', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8483', '127.0.0.1', '1495438903', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8484', '127.0.0.1', '1495438947', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8485', '127.0.0.1', '1495438947', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8486', '127.0.0.1', '1495438947', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8487', '127.0.0.1', '1495438955', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8488', '127.0.0.1', '1495438955', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8489', '127.0.0.1', '1495438955', '1', 'admin', 'goods', 'add', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8490', '127.0.0.1', '1495439034', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8491', '127.0.0.1', '1495439083', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8492', '127.0.0.1', '1495439131', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8493', '127.0.0.1', '1495439226', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8494', '127.0.0.1', '1495439679', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8495', '127.0.0.1', '1495439684', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8496', '127.0.0.1', '1495439686', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8497', '127.0.0.1', '1495439694', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8498', '127.0.0.1', '1495439697', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8499', '127.0.0.1', '1495439700', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8500', '127.0.0.1', '1495439730', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8501', '127.0.0.1', '1495439731', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8502', '127.0.0.1', '1495439736', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8503', '127.0.0.1', '1495439950', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8504', '127.0.0.1', '1495439954', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8505', '127.0.0.1', '1495439956', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8506', '127.0.0.1', '1495439958', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8507', '127.0.0.1', '1495439964', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"aUtQbmhCRU0BBRNbJXIrfissGDEuEDc1G3kgAVkzEgU.Bxc.EQZxJg==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8508', '127.0.0.1', '1495439968', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8509', '127.0.0.1', '1495439977', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"VDZCeDd6akc8eAFNekoEdBZRCidxKBg\\/JgQyFwYLPQ8DegUoTj5eLA==\",\"Admin\":{\"adminuser\":\"admin111\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8510', '127.0.0.1', '1495439979', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8511', '127.0.0.1', '1495439999', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8512', '127.0.0.1', '1495440001', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8513', '127.0.0.1', '1495440011', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"Z2kucUguaEgPJ21EBR4GeyUOZi4OfBowFVteHnlfPwAwJWkhMWpcIw==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8514', '127.0.0.1', '1495440014', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8515', '127.0.0.1', '1495440051', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8516', '127.0.0.1', '1495440053', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8517', '127.0.0.1', '1495440064', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"NTU5eGN0M3dde3pNLkRdRHdScSclJkEPRwdJF1IFZD9ieX4oGjAHHA==\",\"Admin\":{\"adminuser\":\"admin12\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8518', '127.0.0.1', '1495440064', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"NTU5eGN0M3dde3pNLkRdRHdScSclJkEPRwdJF1IFZD9ieX4oGjAHHA==\",\"Admin\":{\"adminuser\":\"admin12\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8519', '127.0.0.1', '1495440067', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8520', '127.0.0.1', '1495440071', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8521', '127.0.0.1', '1495440094', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8522', '127.0.0.1', '1495440095', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8523', '127.0.0.1', '1495440137', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8524', '127.0.0.1', '1495440138', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8525', '127.0.0.1', '1495440146', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"NzhLNGhjYmZfdggBJVMMVXVfA2suMRAeRQo7W1kSNS5gdAxkESdWDQ==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8526', '127.0.0.1', '1495440146', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"NzhLNGhjYmZfdggBJVMMVXVfA2suMRAeRQo7W1kSNS5gdAxkESdWDQ==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8527', '127.0.0.1', '1495440235', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8528', '127.0.0.1', '1495440237', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8529', '127.0.0.1', '1495440245', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"QmVKcmFDZmUqKwlHLHMIVgACAi0nERQdMFc6HVAyMS0VKQ0iGAdSDg==\",\"Admin\":{\"adminuser\":\"admin21\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8530', '127.0.0.1', '1495440245', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"QmVKcmFDZmUqKwlHLHMIVgACAi0nERQdMFc6HVAyMS0VKQ0iGAdSDg==\",\"Admin\":{\"adminuser\":\"admin21\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8531', '127.0.0.1', '1495440253', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"QmVKcmFDZmUqKwlHLHMIVgACAi0nERQdMFc6HVAyMS0VKQ0iGAdSDg==\",\"Admin\":{\"adminuser\":\"admin21\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8532', '127.0.0.1', '1495440255', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"QmVKcmFDZmUqKwlHLHMIVgACAi0nERQdMFc6HVAyMS0VKQ0iGAdSDg==\",\"Admin\":{\"adminuser\":\"admin21\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8533', '127.0.0.1', '1495440271', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"QmVKcmFDZmUqKwlHLHMIVgACAi0nERQdMFc6HVAyMS0VKQ0iGAdSDg==\",\"Admin\":{\"adminuser\":\"admin21\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8534', '127.0.0.1', '1495440274', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8535', '127.0.0.1', '1495440276', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8536', '127.0.0.1', '1495440279', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8537', '127.0.0.1', '1495440288', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"Ny1XQmZGbjRfYxR3K3YAB3VKHx0gFBxMRR8nLVc3OXxgYRASHwJaXw==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8538', '127.0.0.1', '1495440294', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8539', '127.0.0.1', '1495440295', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8540', '127.0.0.1', '1495440304', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"RzgxbzFHa2IvdnJafHcFUQVfeTB3FRkaNQpBAAA2PCoQdHY\\/SANfCQ==\",\"Admin\":{\"adminuser\":\"admin11\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8541', '127.0.0.1', '1495440304', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"RzgxbzFHa2IvdnJafHcFUQVfeTB3FRkaNQpBAAA2PCoQdHY\\/SANfCQ==\",\"Admin\":{\"adminuser\":\"admin11\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8542', '127.0.0.1', '1495440352', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8543', '127.0.0.1', '1495440353', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8544', '127.0.0.1', '1495440362', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"R2d0Zi1nTi0vKTdTYFcgHgUAPDlrNTxVNVUECRwWGWUQKzM2VCN6Rg==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8545', '127.0.0.1', '1495440394', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8546', '127.0.0.1', '1495440406', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8547', '127.0.0.1', '1495440407', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8548', '127.0.0.1', '1495440417', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"M1E5OUQyeG5bH3oMCQIWXXE2cWYCYAoWQWNJVnVDLyZkHX5pPXZMBQ==\",\"Admin\":{\"adminuser\":\"admin12\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8549', '127.0.0.1', '1495440424', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8550', '127.0.0.1', '1495440426', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8551', '127.0.0.1', '1495440435', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"eEpQb2NnajgQBBNaLlcECzotGDAlNRhACnggAFIWPXAvBhc\\/GiNeUw==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8552', '127.0.0.1', '1495440480', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8553', '127.0.0.1', '1495440481', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8554', '127.0.0.1', '1495440481', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8555', '127.0.0.1', '1495440482', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8556', '127.0.0.1', '1495440482', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8557', '127.0.0.1', '1495440483', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8558', '127.0.0.1', '1495440483', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8559', '127.0.0.1', '1495440484', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8560', '127.0.0.1', '1495440484', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8561', '127.0.0.1', '1495440485', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8562', '127.0.0.1', '1495440485', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8563', '127.0.0.1', '1495440486', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8564', '127.0.0.1', '1495440486', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8565', '127.0.0.1', '1495440487', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8566', '127.0.0.1', '1495440487', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8567', '127.0.0.1', '1495440488', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8568', '127.0.0.1', '1495440488', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8569', '127.0.0.1', '1495440488', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8570', '127.0.0.1', '1495440489', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8571', '127.0.0.1', '1495440489', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8572', '127.0.0.1', '1495440490', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8573', '127.0.0.1', '1495440490', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8574', '127.0.0.1', '1495440491', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8575', '127.0.0.1', '1495440491', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8576', '127.0.0.1', '1495440493', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8577', '127.0.0.1', '1495440530', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8578', '127.0.0.1', '1495440531', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8579', '127.0.0.1', '1495440539', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"dDAwVTJNV0QcfnNgf305dzZXeAp0HyU8BgJAOgM8AAwjfHcFSwljLw==\",\"Admin\":{\"adminuser\":\"admin22\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8580', '127.0.0.1', '1495440546', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8581', '127.0.0.1', '1495440717', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8582', '127.0.0.1', '1495440718', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8583', '127.0.0.1', '1495440729', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"Q3hpMTBZbnUrNioEfWkARgEfIW52CxwNMUoZXgEoOT0UNC5hSR1aHg==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8584', '127.0.0.1', '1495440733', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8585', '127.0.0.1', '1495440771', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8586', '127.0.0.1', '1495440773', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8587', '127.0.0.1', '1495440781', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"MmVJNHNkWWNaKwoBPlQ3UHACAWs1NisbQFc5W0IVDitlKQ5kCiBtCA==\",\"Admin\":{\"adminuser\":\"admin12\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8588', '127.0.0.1', '1495440824', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8589', '127.0.0.1', '1495440825', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8590', '127.0.0.1', '1495440834', '1', 'admin', 'admin', 'edit', '编辑管理员,id=1', '{\"_csrf-backend\":\"Sy1UQVJId2gjYxd0H3gZWwlKHB4UGgUQOR8kLmM5ICAcYRMRKwxDAw==\",\"Admin\":{\"adminuser\":\"admin\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852654\",\"adminemail\":\"admintest@admintest.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8591', '127.0.0.1', '1495440840', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8592', '127.0.0.1', '1495440889', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8593', '127.0.0.1', '1495440889', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8594', '127.0.0.1', '1495440918', '1', 'admin', 'admin', 'add', '添加管理员', '{\"_csrf-backend\":\"Qk9FekZCVVIqAQZPC3I7YQAoDSUAECcqMH01FXczAhoVAwIqPwZhOQ==\",\"Admin\":{\"adminuser\":\"hhhg\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8595', '127.0.0.1', '1495440920', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8596', '127.0.0.1', '1495440925', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8597', '127.0.0.1', '1495440931', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8598', '127.0.0.1', '1495440946', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"cEUuMkNVbjIYC20HDmUAATIiZm0FBxxKAndeXXIkOXonCWliOhFaWQ==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8599', '127.0.0.1', '1495440949', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8600', '127.0.0.1', '1495440990', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8601', '127.0.0.1', '1495440991', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8602', '127.0.0.1', '1495441000', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"a28tbXk0aEQDIW5YNAQGdykIZTI\\/Zho8GV1dAkhFPww8I2o9AHBcLw==\",\"Admin\":{\"adminuser\":\"hhhhe\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8603', '127.0.0.1', '1495441016', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8604', '127.0.0.1', '1495441017', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8605', '127.0.0.1', '1495441025', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"NXFjN1V4NTZdPyACGEhbBXcWK2gTKkdOR0MTWGQJYn5iPSRnLDwBXQ==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8606', '127.0.0.1', '1495441033', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8607', '127.0.0.1', '1495441066', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8608', '127.0.0.1', '1495441068', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8609', '127.0.0.1', '1495441078', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"d1lDZi01LTkfFwBTYAVDCjU.CzlrZ19BBWszCRxEenEgFQQ2VHEZUg==\",\"Admin\":{\"adminuser\":\"hhhhq\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8610', '127.0.0.1', '1495441115', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8611', '127.0.0.1', '1495441116', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8612', '127.0.0.1', '1495441125', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"cnZpdnpibkQaOCpDN1IAdzARISk8MBw8AEQZGUsTOQwlOi4mAyZaLw==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8613', '127.0.0.1', '1495441125', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"cnZpdnpibkQaOCpDN1IAdzARISk8MBw8AEQZGUsTOQwlOi4mAyZaLw==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8614', '127.0.0.1', '1495441153', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8615', '127.0.0.1', '1495441154', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8616', '127.0.0.1', '1495441163', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"SXBWaEUuYzEhPhVdCB4NAgsXHjcDfBFJO0ImB3RfNHkePBE4PGpXWg==\",\"Admin\":{\"adminuser\":\"hhhhe\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8617', '127.0.0.1', '1495441164', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"SXBWaEUuYzEhPhVdCB4NAgsXHjcDfBFJO0ImB3RfNHkePBE4PGpXWg==\",\"Admin\":{\"adminuser\":\"hhhhe\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8618', '127.0.0.1', '1495441207', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8619', '127.0.0.1', '1495441210', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8620', '127.0.0.1', '1495441218', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"TklqNFhja2QmBykBFVMFVwwuImseMRkcPHsaW2kSPCwZBS1kISdfDw==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8621', '127.0.0.1', '1495441222', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8622', '127.0.0.1', '1495441255', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8623', '127.0.0.1', '1495441256', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8624', '127.0.0.1', '1495441264', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"TnZkN290QmsmOCcCIkQsWAwRLGgpJjATPEQUWF4FFSMZOiNnFjB2AA==\",\"Admin\":{\"adminuser\":\"hhhhq\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8625', '127.0.0.1', '1495441275', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8626', '127.0.0.1', '1495441286', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8627', '127.0.0.1', '1495441287', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8628', '127.0.0.1', '1495441295', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"NDE0c1pJTzVcf3dGF3khBnZWfCwcGz1NRgNEHGs4GH1jfXMjIw17Xg==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8629', '127.0.0.1', '1495441296', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"NDE0c1pJTzVcf3dGF3khBnZWfCwcGz1NRgNEHGs4GH1jfXMjIw17Xg==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8630', '127.0.0.1', '1495441351', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8631', '127.0.0.1', '1495441352', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8632', '127.0.0.1', '1495441361', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"OC5uSmdxTWNQYC1\\/KkEjUHpJJhUhIz8bShweJVYAGitvYikaHjV5CA==\",\"Admin\":{\"adminuser\":\"hhhhw\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8633', '127.0.0.1', '1495441366', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8634', '127.0.0.1', '1495441378', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8635', '127.0.0.1', '1495441382', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8636', '127.0.0.1', '1495441391', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"aThzS20xVWEBdjB.IAE7UitfOxQrYycZGwoDJFxAAik.dDQbFHVhCg==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8637', '127.0.0.1', '1495441396', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8638', '127.0.0.1', '1495441433', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8639', '127.0.0.1', '1495441435', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8640', '127.0.0.1', '1495441444', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"VUVBdW05TG49CwJAIAkiXRciCSoraz4WJ3cxGlxIGyYCCQYlFH14BQ==\",\"Admin\":{\"adminuser\":\"hhhhw\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8641', '127.0.0.1', '1495441447', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8642', '127.0.0.1', '1495441457', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8643', '127.0.0.1', '1495441459', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8644', '127.0.0.1', '1495441469', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"X2dzTUhaZDg3KTB4BWoKCx0AOxIOCBZALVUDInkrM3AIKzQdMR5QUw==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8645', '127.0.0.1', '1495441469', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8646', '127.0.0.1', '1495441469', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"X2dzTUhaZDg3KTB4BWoKCx0AOxIOCBZALVUDInkrM3AIKzQdMR5QUw==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8647', '127.0.0.1', '1495441536', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8648', '127.0.0.1', '1495441537', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8649', '127.0.0.1', '1495441547', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"V2c2UUxmVWE\\/KXVkAVY7UhUAfg4KNCcZJVVGPn0XAikAK3EBNSJhCg==\",\"Admin\":{\"adminuser\":\"hhhhe\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8650', '127.0.0.1', '1495441563', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8651', '127.0.0.1', '1495441564', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8652', '127.0.0.1', '1495441572', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"RFFWZTd0X00sHxVQekQxfgY2HjpxJi01NmMmCgYFCAUTHRE1TjBrJg==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8653', '127.0.0.1', '1495441576', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8654', '127.0.0.1', '1495441601', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8655', '127.0.0.1', '1495441604', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8656', '127.0.0.1', '1495441612', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"ZnM5T05zT2sOPXp6A0MhWCQUcRAIIT0TFEFJIH8CGCMxP34fNzd7AA==\",\"Admin\":{\"adminuser\":\"hhhhf\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8657', '127.0.0.1', '1495441612', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8658', '127.0.0.1', '1495441617', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8659', '127.0.0.1', '1495441627', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"d1BJa09wMVQfHgpeAkBfZzU3ATQJIkMsBWI5BH4BZhwgHA47NjQFPw==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8660', '127.0.0.1', '1495441627', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8661', '127.0.0.1', '1495441656', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8662', '127.0.0.1', '1495441657', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8663', '127.0.0.1', '1495441666', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"VU4wb3BCSUw9AHNaPXInfxcpeDA2EDs0J3xAAEEzHgQCAnc\\/CQZ9Jw==\",\"Admin\":{\"adminuser\":\"hhhha\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8664', '127.0.0.1', '1495441666', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"VU4wb3BCSUw9AHNaPXInfxcpeDA2EDs0J3xAAEEzHgQCAnc\\/CQZ9Jw==\",\"Admin\":{\"adminuser\":\"hhhha\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8665', '127.0.0.1', '1495441730', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8666', '127.0.0.1', '1495441738', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8667', '127.0.0.1', '1495441747', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"VWwwQlZxZHc9InN3G0EKRBcLeB0QIxYPJ15ALWcAMz8CIHcSLzVQHA==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8668', '127.0.0.1', '1495441747', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8669', '127.0.0.1', '1495441945', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8670', '127.0.0.1', '1495441946', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8671', '127.0.0.1', '1495441955', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"anFwTXpQaE4CPzN4N2AGfSgWOBI8Aho2GEMAIkshPwY9PTcdAxRcJQ==\",\"Admin\":{\"adminuser\":\"hhhhsd\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8672', '127.0.0.1', '1495441955', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8673', '127.0.0.1', '1495441955', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"anFwTXpQaE4CPzN4N2AGfSgWOBI8Aho2GEMAIkshPwY9PTcdAxRcJQ==\",\"Admin\":{\"adminuser\":\"hhhhsd\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8674', '127.0.0.1', '1495441966', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8675', '127.0.0.1', '1495441967', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8676', '127.0.0.1', '1495441976', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"UDZmU0tCTUM4eCVmBnIjcBJRLgwNED87IgQWPHozGgsHeiEDMgZ5KA==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8677', '127.0.0.1', '1495441976', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8678', '127.0.0.1', '1495441976', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"UDZmU0tCTUM4eCVmBnIjcBJRLgwNED87IgQWPHozGgsHeiEDMgZ5KA==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8679', '127.0.0.1', '1495442204', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8680', '127.0.0.1', '1495442205', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8681', '127.0.0.1', '1495442213', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"enI2RVNNUVgSPHVwHn0\\/azgVfhoVHyMgCEBGKmI8BhAtPnEVKgllMw==\",\"Admin\":{\"adminuser\":\"hhhhasd\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8682', '127.0.0.1', '1495442213', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8683', '127.0.0.1', '1495442213', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"enI2RVNNUVgSPHVwHn0\\/azgVfhoVHyMgCEBGKmI8BhAtPnEVKgllMw==\",\"Admin\":{\"adminuser\":\"hhhhasd\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8684', '127.0.0.1', '1495442277', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8685', '127.0.0.1', '1495442279', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8686', '127.0.0.1', '1495442287', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"WldPMktxQ0IyGQwHBkEtcRgwB20NIzE6KGU\\/XXoAFAoNGwhiMjV3KQ==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8687', '127.0.0.1', '1495442288', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8688', '127.0.0.1', '1495442288', '1', 'admin', 'admin', 'edit', '编辑管理员,id=22', '{\"_csrf-backend\":\"WldPMktxQ0IyGQwHBkEtcRgwB20NIzE6KGU\\/XXoAFAoNGwhiMjV3KQ==\",\"Admin\":{\"adminuser\":\"hhhh\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"2\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8689', '127.0.0.1', '1495442307', '1', 'admin', 'admin', 'delete', '删除管理员,id=22', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8690', '127.0.0.1', '1495442307', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8691', '127.0.0.1', '1495442309', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8692', '127.0.0.1', '1495442324', '1', 'admin', 'admin', 'add', '添加管理员', '{\"_csrf-backend\":\"QWpwNk50SzApJDMDA0QlAwMNOGkIJjlIM1gAWX8FHHgWJjdmNzB\\/Ww==\",\"Admin\":{\"adminuser\":\"sdafas\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8693', '127.0.0.1', '1495442324', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8694', '127.0.0.1', '1495442324', '1', 'admin', 'admin', 'add', '添加管理员', '{\"_csrf-backend\":\"QWpwNk50SzApJDMDA0QlAwMNOGkIJjlIM1gAWX8FHHgWJjdmNzB\\/Ww==\",\"Admin\":{\"adminuser\":\"sdafas\",\"adminpass\":\"123456\",\"repass\":\"123456\",\"mobile\":\"13922852657\",\"adminemail\":\"731184842@qq.com\",\"group_id\":\"1\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8695', '127.0.0.1', '1495442330', '1', 'admin', 'admin', 'delete', '删除管理员,id=23', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8696', '127.0.0.1', '1495442330', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8697', '127.0.0.1', '1495442970', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8698', '127.0.0.1', '1495442972', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8699', '127.0.0.1', '1495442977', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8700', '127.0.0.1', '1495442978', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8701', '127.0.0.1', '1495443443', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8702', '127.0.0.1', '1495443448', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8703', '127.0.0.1', '1495443488', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8704', '127.0.0.1', '1495443489', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8705', '127.0.0.1', '1495443505', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8706', '127.0.0.1', '1495443508', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8707', '127.0.0.1', '1495443511', '1', 'admin', 'rule', 'edit', '编辑角色,id=29', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8708', '127.0.0.1', '1495443519', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8709', '127.0.0.1', '1495443523', '1', 'admin', 'rule', 'delete', '删除角色,id=29', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8710', '127.0.0.1', '1495443523', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8711', '127.0.0.1', '1495443544', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8712', '127.0.0.1', '1495443545', '1', 'admin', 'rule', 'add', '添加角色', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8713', '127.0.0.1', '1495443552', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8714', '127.0.0.1', '1495443553', '1', 'admin', 'admin', 'add', '添加管理员', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8715', '127.0.0.1', '1495443558', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8716', '127.0.0.1', '1495443569', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8717', '127.0.0.1', '1495443580', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8718', '127.0.0.1', '1495443582', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8719', '127.0.0.1', '1495443584', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8720', '127.0.0.1', '1495523094', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8721', '127.0.0.1', '1495523398', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8722', '127.0.0.1', '1495526570', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8723', '127.0.0.1', '1495783258', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8724', '127.0.0.1', '1496213065', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8725', '127.0.0.1', '1496222516', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8726', '127.0.0.1', '1496222526', '1', 'admin', 'admindolog', 'index', '管理员操作日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8727', '127.0.0.1', '1496222533', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8728', '127.0.0.1', '1496222540', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8729', '127.0.0.1', '1496222573', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8730', '127.0.0.1', '1496222577', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8731', '127.0.0.1', '1496222622', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8732', '127.0.0.1', '1496222630', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8733', '127.0.0.1', '1496222641', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8734', '127.0.0.1', '1496222712', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8735', '127.0.0.1', '1496222716', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8736', '127.0.0.1', '1496222745', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8737', '127.0.0.1', '1496222752', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8738', '127.0.0.1', '1496222755', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8739', '127.0.0.1', '1496222763', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8740', '127.0.0.1', '1496222765', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8741', '127.0.0.1', '1496222818', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8742', '127.0.0.1', '1496222823', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8743', '127.0.0.1', '1496222824', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8744', '127.0.0.1', '1496222826', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8745', '127.0.0.1', '1496222828', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8746', '127.0.0.1', '1496222829', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8747', '127.0.0.1', '1496222831', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8748', '127.0.0.1', '1496222832', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8749', '127.0.0.1', '1496222833', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8750', '127.0.0.1', '1496222835', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8751', '127.0.0.1', '1496222836', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8752', '127.0.0.1', '1496222838', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8753', '127.0.0.1', '1496222839', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8754', '127.0.0.1', '1496222842', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8755', '127.0.0.1', '1496222857', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8756', '127.0.0.1', '1496222859', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8757', '127.0.0.1', '1496222910', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8758', '127.0.0.1', '1496223470', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8759', '127.0.0.1', '1496223479', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8760', '127.0.0.1', '1496223499', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8761', '127.0.0.1', '1496223531', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8762', '127.0.0.1', '1496223569', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8763', '127.0.0.1', '1496223615', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8764', '127.0.0.1', '1496223660', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8765', '127.0.0.1', '1496223766', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8766', '127.0.0.1', '1496223777', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8767', '127.0.0.1', '1496223798', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8768', '127.0.0.1', '1496223809', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8769', '127.0.0.1', '1496225097', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8770', '127.0.0.1', '1496225099', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8771', '127.0.0.1', '1496225108', '1', 'admin', 'adminlogin', 'index', '管理员登录日志', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8772', '127.0.0.1', '1496285880', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8773', '127.0.0.1', '1496285979', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8774', '127.0.0.1', '1496285998', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8775', '127.0.0.1', '1496286052', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8776', '127.0.0.1', '1496286103', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8777', '127.0.0.1', '1496286113', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8778', '127.0.0.1', '1496286142', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8779', '127.0.0.1', '1496286219', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8780', '127.0.0.1', '1496286264', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8781', '127.0.0.1', '1496286266', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8782', '127.0.0.1', '1496286272', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8783', '127.0.0.1', '1496286320', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8784', '127.0.0.1', '1496286374', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8785', '127.0.0.1', '1496286397', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8786', '127.0.0.1', '1496286436', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8787', '127.0.0.1', '1496286448', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8788', '127.0.0.1', '1496286450', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8789', '127.0.0.1', '1496286539', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8790', '127.0.0.1', '1496286585', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8791', '127.0.0.1', '1496286605', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8792', '127.0.0.1', '1496286635', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8793', '127.0.0.1', '1496286790', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8794', '127.0.0.1', '1496286882', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8795', '127.0.0.1', '1496286884', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8796', '127.0.0.1', '1496286915', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8797', '127.0.0.1', '1496286926', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8798', '127.0.0.1', '1496287062', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8799', '127.0.0.1', '1496287117', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8800', '127.0.0.1', '1496287164', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8801', '127.0.0.1', '1496287205', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8802', '127.0.0.1', '1496287250', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8803', '127.0.0.1', '1496287358', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8804', '127.0.0.1', '1496287374', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8805', '127.0.0.1', '1496287389', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8806', '127.0.0.1', '1496287408', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8807', '127.0.0.1', '1496287416', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8808', '127.0.0.1', '1496287431', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8809', '127.0.0.1', '1496287465', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8810', '127.0.0.1', '1496287475', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8811', '127.0.0.1', '1496287547', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8812', '127.0.0.1', '1496287559', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8813', '127.0.0.1', '1496287560', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8814', '127.0.0.1', '1496287561', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8815', '127.0.0.1', '1496287578', '1', 'admin', 'index', 'test', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8816', '127.0.0.1', '1496288244', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8817', '127.0.0.1', '1496312146', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8818', '127.0.0.1', '1496365522', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8819', '127.0.0.1', '1501471463', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8820', '127.0.0.1', '1501471520', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8821', '127.0.0.1', '1501471532', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8822', '127.0.0.1', '1501471535', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8823', '127.0.0.1', '1501471550', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8824', '127.0.0.1', '1501471552', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8825', '127.0.0.1', '1501471554', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8826', '127.0.0.1', '1501471555', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8827', '127.0.0.1', '1501472193', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8828', '127.0.0.1', '1501472198', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8829', '127.0.0.1', '1501472199', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8830', '127.0.0.1', '1501472202', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8831', '127.0.0.1', '1501472207', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8832', '127.0.0.1', '1501472210', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8833', '127.0.0.1', '1501472216', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8834', '127.0.0.1', '1501472231', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8835', '127.0.0.1', '1501472232', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8836', '127.0.0.1', '1501472239', '1', 'admin', 'menu', 'edit', '修改菜单,id=351', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8837', '127.0.0.1', '1501472243', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8838', '127.0.0.1', '1501472244', '1', 'admin', 'menu', 'add', '添加菜单', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8839', '127.0.0.1', '1501472284', '1', 'admin', 'menu', 'add', '添加菜单', '{\"_csrf-backend\":\"dSsAkFqeAZuGEvZq4bAJ790sXGKJRTlBhkcGaST7wyAohCkPbzS9GJ4tDqD5mGqSkIlsWn2n5Jfs_nqoVQ0cBQ==\",\"Menu\":{\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"sort\":\"10\",\"url\":\"\\/config\\/article\\/index\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8840', '127.0.0.1', '1501472286', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8841', '127.0.0.1', '1501472289', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8842', '127.0.0.1', '1501472304', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8843', '127.0.0.1', '1501472307', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8844', '127.0.0.1', '1501472309', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8845', '127.0.0.1', '1501472310', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8846', '127.0.0.1', '1501472312', '1', 'admin', 'menu', 'edit', '修改菜单,id=352', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8847', '127.0.0.1', '1501472327', '1', 'admin', 'menu', 'edit', '修改菜单,id=352', '{\"_csrf-backend\":\"45c62H1BtPaTM477RsHenvnmyhlT-YNp3NzHyyfPgMi-OBNHSOsIdYsMdjFe6b3jtEP6IacbXr-2ZbsKVjlf7Q==\",\"Menu\":{\"title\":\"\\u5730\\u5740\\u7ba1\\u7406\",\"sort\":\"10\",\"url\":\"\\/config\\/address\\/index\",\"pid\":\"325\"}}');
INSERT INTO `shop_admin_dolog` VALUES ('8848', '127.0.0.1', '1501472328', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8849', '127.0.0.1', '1501550317', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8850', '127.0.0.1', '1503282297', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8851', '127.0.0.1', '1503282310', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8852', '127.0.0.1', '1503282328', '1', 'admin', 'goods', 'index', '产品管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8853', '127.0.0.1', '1503282352', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8854', '127.0.0.1', '1503282371', '1', 'admin', 'rule', 'index', '角色管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8855', '127.0.0.1', '1503282377', '1', 'admin', 'admin', 'index', '管理员管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8856', '127.0.0.1', '1503282730', '1', 'admin', 'config', 'index', '系统管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8857', '127.0.0.1', '1503282733', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8858', '127.0.0.1', '1503282734', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8859', '127.0.0.1', '1503282735', '1', 'admin', 'config', 'index', '系统管理,id=4', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8860', '127.0.0.1', '1503282736', '1', 'admin', 'config', 'index', '系统管理,id=3', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8861', '127.0.0.1', '1503282737', '1', 'admin', 'config', 'index', '系统管理,id=2', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8862', '127.0.0.1', '1503282738', '1', 'admin', 'config', 'index', '系统管理,id=1', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8863', '127.0.0.1', '1503282787', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8864', '127.0.0.1', '1503282802', '1', 'admin', 'database', 'index', '', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8865', '127.0.0.1', '1503282807', '1', 'admin', 'menu', 'index', '菜单管理', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8866', '127.0.0.1', '1503282852', '1', 'admin', 'index', 'index', '首页', '[]');
INSERT INTO `shop_admin_dolog` VALUES ('8867', '127.0.0.1', '1504765574', '1', 'admin', 'index', 'index', '首页', '[]');

-- ----------------------------
-- Table structure for shop_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin_group`;
CREATE TABLE `shop_admin_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '权组名字',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是超级管理员组，1为是，0为不是',
  `create_user` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `power` text COMMENT '权限',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1为可用，0为不可用',
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='权限组表';

-- ----------------------------
-- Records of shop_admin_group
-- ----------------------------
INSERT INTO `shop_admin_group` VALUES ('1', '超级管理员', '1427972699', '1', '', '', '1', '拥有至高无上的权利');
INSERT INTO `shop_admin_group` VALUES ('2', '新闻录入管理员', '1432798650', '0', 'admin', '1,321,325,2,322,323,331,341,342,337,338,334', '1', '具有添加、审核、发布、删除内容的权限');
INSERT INTO `shop_admin_group` VALUES ('3', '会员管理', '1438072222', '0', 'admin', '1,19,43,2,28,27,26,23,22,29,25,21,20,24,54,53,52,51,50,49,47,46,45,86,85,84,83,82,81,44,48', '1', '只对所在栏目具有添加、审核、发布、删除内容的权限');
INSERT INTO `shop_admin_group` VALUES ('4', '自定义', '1438072282', '0', 'admin', '227,181,233,232,230,228,231,229,235,236,237,238,239,234', '1', '只对所在栏目具有添加、删除草稿等权利。');
INSERT INTO `shop_admin_group` VALUES ('26', 'C罗', '1461739727', '0', 'admin', '10,135,154,150,158,60,227,233,11,13,14,15,17,18,126,131,132,133,250,12,16,19,130,134,270,271,272,273,274,275,276,277,136,137,138,139,140,141,142,143,144,145,249,146,147,244,246,149,248,188,166,167,168,169,170,171,172,173,174,175,199,200,201,202,223,224,225,240,241,242,245,155,156,157,165,243,153,151,222,152,226,159,160,161,162,164,261,176,177,178,198,203,204,205,206,207,208,209,210,211,212,213,214,216,217,218,215,219,220,221,254,255,256,257,258,259,260,262,263,264,265,266,267,268,269,61,62,63,64,67,68,69,71,72,73,70,66,74,75,232,230,228,231,229,235,236,237,238,239,234,251,252,253', '1', '只对所在栏目具有添加、删除草稿等权利。');
INSERT INTO `shop_admin_group` VALUES ('30', '哈哈哈哈', '1495443505', '0', 'admin', '1,321,2,322,323,345,346,341,342,343,337,338,339,340,347,348', '1', '还好');

-- ----------------------------
-- Table structure for shop_admin_login
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin_login`;
CREATE TABLE `shop_admin_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '管理员id',
  `account` varchar(30) NOT NULL DEFAULT '' COMMENT '登录账号',
  `login_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '登陆ip',
  `login_time` int(11) NOT NULL DEFAULT '0' COMMENT '登陆时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=1199 DEFAULT CHARSET=utf8mb4 COMMENT='管理员登录日志表';

-- ----------------------------
-- Records of shop_admin_login
-- ----------------------------
INSERT INTO `shop_admin_login` VALUES ('1162', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1163', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1164', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1165', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1166', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1167', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1168', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1169', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1170', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1171', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1172', '20', 'test2', '2130706433', '1493177447');
INSERT INTO `shop_admin_login` VALUES ('1173', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1174', '20', 'test2', '2130706433', '1493177447');
INSERT INTO `shop_admin_login` VALUES ('1175', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1176', '20', 'test2', '2130706433', '1493177447');
INSERT INTO `shop_admin_login` VALUES ('1177', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1178', '20', 'test2', '2130706433', '1493177447');
INSERT INTO `shop_admin_login` VALUES ('1179', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1180', '20', 'test2', '2130706433', '1493177447');
INSERT INTO `shop_admin_login` VALUES ('1181', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1183', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1184', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1185', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1186', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1187', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1188', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1189', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1190', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1191', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1192', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1193', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1194', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1195', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1196', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1197', '1', 'admin', '2130706433', '1457922174');
INSERT INTO `shop_admin_login` VALUES ('1198', '1', 'admin', '2130706433', '1457922174');

-- ----------------------------
-- Table structure for shop_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_assignment`;
CREATE TABLE `shop_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shop_auth_assignment
-- ----------------------------
INSERT INTO `shop_auth_assignment` VALUES ('admin', '12', '1480370458');
INSERT INTO `shop_auth_assignment` VALUES ('category', '15', '1480370643');
INSERT INTO `shop_auth_assignment` VALUES ('category/*', '16', '1480378369');
INSERT INTO `shop_auth_assignment` VALUES ('default', '19', '1480432021');
INSERT INTO `shop_auth_assignment` VALUES ('default/*', '16', '1480378369');
INSERT INTO `shop_auth_assignment` VALUES ('testrule', '18', '1480391980');

-- ----------------------------
-- Table structure for shop_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_item`;
CREATE TABLE `shop_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shop_auth_item
-- ----------------------------
INSERT INTO `shop_auth_item` VALUES ('admin', '1', '超级管理员', null, null, '1480370333', '1480370333');
INSERT INTO `shop_auth_item` VALUES ('category', '1', '分类管理员', null, null, '1480370572', '1480370572');
INSERT INTO `shop_auth_item` VALUES ('category/*', '2', 'category/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('category/add', '2', 'category/add', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('category/del', '2', 'category/del', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('category/delete', '2', 'category/delete', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('category/list', '2', 'category/list', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('category/mod', '2', 'category/mod', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('category/rename', '2', 'category/rename', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('category/tree', '2', 'category/tree', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('common/*', '2', 'common/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('default', '1', '游客', null, null, '1480431968', '1480431968');
INSERT INTO `shop_auth_item` VALUES ('default/*', '2', 'default/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('default/index', '2', 'default/index', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/*', '2', 'manage/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/assign', '2', 'manage/assign', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/changeemail', '2', 'manage/changeemail', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/changepass', '2', 'manage/changepass', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/del', '2', 'manage/del', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/mailchangepass', '2', 'manage/mailchangepass', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/managers', '2', 'manage/managers', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('manage/reg', '2', 'manage/reg', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('order/*', '2', 'order/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('order/detail', '2', 'order/detail', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('order/list', '2', 'order/list', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('order/send', '2', 'order/send', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/*', '2', 'product/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/add', '2', 'product/add', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/del', '2', 'product/del', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/list', '2', 'product/list', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/mod', '2', 'product/mod', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/off', '2', 'product/off', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/on', '2', 'product/on', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('product/removepic', '2', 'product/removepic', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('public/*', '2', 'public/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('public/login', '2', 'public/login', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('public/logout', '2', 'public/logout', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('public/seekpassword', '2', 'public/seekpassword', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('rbac/*', '2', 'rbac/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('rbac/assignitem', '2', 'rbac/assignitem', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('rbac/createrole', '2', 'rbac/createrole', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('rbac/roles', '2', 'rbac/roles', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('testrule', '1', '测试规则', 'isAuthor', null, '1480391834', '1480391834');
INSERT INTO `shop_auth_item` VALUES ('user/*', '2', 'user/*', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('user/del', '2', 'user/del', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('user/reg', '2', 'user/reg', null, null, '1480370372', '1480370372');
INSERT INTO `shop_auth_item` VALUES ('user/users', '2', 'user/users', null, null, '1480370372', '1480370372');

-- ----------------------------
-- Table structure for shop_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_item_child`;
CREATE TABLE `shop_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shop_auth_item_child
-- ----------------------------
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'category/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'common/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'default/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'manage/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'order/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'product/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'public/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'rbac/*');
INSERT INTO `shop_auth_item_child` VALUES ('admin', 'user/*');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/*');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/add');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/del');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/delete');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/list');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/mod');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/rename');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'category/tree');
INSERT INTO `shop_auth_item_child` VALUES ('category', 'default/*');
INSERT INTO `shop_auth_item_child` VALUES ('default', 'default/*');
INSERT INTO `shop_auth_item_child` VALUES ('testrule', 'category/*');
INSERT INTO `shop_auth_item_child` VALUES ('testrule', 'default/*');

-- ----------------------------
-- Table structure for shop_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `shop_auth_rule`;
CREATE TABLE `shop_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shop_auth_rule
-- ----------------------------
INSERT INTO `shop_auth_rule` VALUES ('isAuthor', 'O:21:\"app\\models\\AuthorRule\":3:{s:4:\"name\";s:8:\"isAuthor\";s:9:\"createdAt\";i:1480391749;s:9:\"updatedAt\";i:1480391749;}', '1480391749', '1480391749');

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `cartid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartid`),
  KEY `shop_cart_productid` (`productid`),
  KEY `shop_cart_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for shop_category
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `cateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `adminid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cateid`),
  KEY `shop_category_parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_category
-- ----------------------------
INSERT INTO `shop_category` VALUES ('7', '家用电器', '0', '1467541004', '0');
INSERT INTO `shop_category` VALUES ('8', '手机', '0', '1467541036', '0');
INSERT INTO `shop_category` VALUES ('9', '电脑', '0', '1467541047', '0');
INSERT INTO `shop_category` VALUES ('10', '办公', '0', '1467541057', '0');
INSERT INTO `shop_category` VALUES ('11', '家居', '0', '1467541066', '0');
INSERT INTO `shop_category` VALUES ('12', '男装', '0', '1467541082', '0');
INSERT INTO `shop_category` VALUES ('13', '女装', '0', '1467541091', '0');
INSERT INTO `shop_category` VALUES ('14', '个护化妆', '0', '1467541099', '0');
INSERT INTO `shop_category` VALUES ('15', '汽车用品', '0', '1467541111', '0');
INSERT INTO `shop_category` VALUES ('16', '玩具乐器', '0', '1467541131', '0');
INSERT INTO `shop_category` VALUES ('17', '食品222', '0', '1467541144', '0');
INSERT INTO `shop_category` VALUES ('18', '平板电视', '7', '1467541223', '0');
INSERT INTO `shop_category` VALUES ('19', '空调', '7', '1467541235', '0');
INSERT INTO `shop_category` VALUES ('20', '冰箱', '7', '1467541243', '0');
INSERT INTO `shop_category` VALUES ('21', '洗衣机', '7', '1467541254', '0');
INSERT INTO `shop_category` VALUES ('22', '家庭影院', '7', '1467541263', '0');
INSERT INTO `shop_category` VALUES ('23', 'DVD', '7', '1467541273', '0');
INSERT INTO `shop_category` VALUES ('24', '迷你音响', '7', '1467541282', '0');
INSERT INTO `shop_category` VALUES ('25', '冷柜/冰吧', '7', '1467541294', '0');
INSERT INTO `shop_category` VALUES ('26', '酒柜', '7', '1467541302', '0');
INSERT INTO `shop_category` VALUES ('27', '家电配件', '7', '1467541310', '0');
INSERT INTO `shop_category` VALUES ('28', '油烟机', '7', '1467541343', '0');
INSERT INTO `shop_category` VALUES ('29', '燃气灶', '7', '1467541353', '0');
INSERT INTO `shop_category` VALUES ('30', '烟灶套装', '7', '1467541361', '0');
INSERT INTO `shop_category` VALUES ('31', '消毒柜', '7', '1467541368', '0');
INSERT INTO `shop_category` VALUES ('32', '洗碗机', '7', '1467541376', '0');
INSERT INTO `shop_category` VALUES ('33', '电热水器', '7', '1467541385', '0');
INSERT INTO `shop_category` VALUES ('34', '嵌入式厨电', '7', '1467541471', '0');
INSERT INTO `shop_category` VALUES ('35', '移动电源', '8', '1467557001', '0');
INSERT INTO `shop_category` VALUES ('36', '蓝牙耳机', '8', '1467557013', '0');
INSERT INTO `shop_category` VALUES ('37', '充电器', '8', '1467557023', '0');
INSERT INTO `shop_category` VALUES ('38', '数据线', '8', '1467557031', '0');
INSERT INTO `shop_category` VALUES ('39', '手机耳机', '8', '1467557039', '0');
INSERT INTO `shop_category` VALUES ('40', '手机支架', '8', '1467557048', '0');
INSERT INTO `shop_category` VALUES ('41', '贴膜', '8', '1467557055', '0');
INSERT INTO `shop_category` VALUES ('42', '手机存储卡', '8', '1467557062', '0');
INSERT INTO `shop_category` VALUES ('43', 'CPU', '9', '1467557083', '0');
INSERT INTO `shop_category` VALUES ('44', '键盘', '9', '1467557088', '0');
INSERT INTO `shop_category` VALUES ('47', '显卡', '9', '1467557102', '0');
INSERT INTO `shop_category` VALUES ('48', '硬盘', '9', '1467557108', '0');
INSERT INTO `shop_category` VALUES ('49', '打印纸', '10', '1467557130', '0');
INSERT INTO `shop_category` VALUES ('50', '圆珠笔', '10', '1467557142', '0');
INSERT INTO `shop_category` VALUES ('51', '中性笔', '10', '1467557147', '0');
INSERT INTO `shop_category` VALUES ('52', '投影机', '10', '1467557168', '0');
INSERT INTO `shop_category` VALUES ('53', '打印机', '10', '1467557173', '0');
INSERT INTO `shop_category` VALUES ('54', '沙发', '11', '1467557187', '0');
INSERT INTO `shop_category` VALUES ('55', '壁柜', '11', '1467557192', '0');
INSERT INTO `shop_category` VALUES ('57', '写字台', '11', '1467557205', '0');
INSERT INTO `shop_category` VALUES ('58', '椅子', '11', '1467557209', '0');
INSERT INTO `shop_category` VALUES ('59', '空调', '11', '1467557217', '0');
INSERT INTO `shop_category` VALUES ('60', '衬衫', '12', '1467557244', '0');
INSERT INTO `shop_category` VALUES ('64', '短裤', '12', '1467557273', '0');
INSERT INTO `shop_category` VALUES ('65', '棉服', '12', '1467557278', '0');
INSERT INTO `shop_category` VALUES ('66', '连衣裙', '13', '1467557293', '0');
INSERT INTO `shop_category` VALUES ('67', '雪纺衫', '13', '1467557298', '0');
INSERT INTO `shop_category` VALUES ('68', '吊带', '13', '1467557307', '0');
INSERT INTO `shop_category` VALUES ('69', '背心', '13', '1467557311', '0');
INSERT INTO `shop_category` VALUES ('71', '洁面', '14', '1467557354', '0');
INSERT INTO `shop_category` VALUES ('72', '爽肤水', '14', '1467557359', '0');
INSERT INTO `shop_category` VALUES ('73', '行车记录仪', '15', '1467557377', '0');
INSERT INTO `shop_category` VALUES ('74', '导航仪', '15', '1467557381', '0');
INSERT INTO `shop_category` VALUES ('75', '车蜡', '15', '1467557391', '0');
INSERT INTO `shop_category` VALUES ('76', '钢琴', '16', '1467557414', '0');
INSERT INTO `shop_category` VALUES ('78', '打击乐器', '16', '1467557425', '0');
INSERT INTO `shop_category` VALUES ('81', '猪牛羊肉', '17', '1467557473', '0');
INSERT INTO `shop_category` VALUES ('88', '测试分类', '0', '1480390320', '12');

-- ----------------------------
-- Table structure for shop_menu
-- ----------------------------
DROP TABLE IF EXISTS `shop_menu`;
CREATE TABLE `shop_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `group` varchar(50) NOT NULL DEFAULT '' COMMENT '分组',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=353 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of shop_menu
-- ----------------------------
INSERT INTO `shop_menu` VALUES ('1', '首页', '0', '1', '/index/index/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('2', '控制台', '1', '1', '/index/index/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('302', '资讯管理', '0', '2', '/content/content/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('303', '资讯管理', '302', '1', '/content/content/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('304', '图片管理', '0', '3', '/picture/picture/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('305', '图片管理', '304', '1', '/picture/picture/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('306', '产品管理', '0', '4', '/goods/goods/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('307', '品牌管理', '306', '1', '/goods/brand/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('308', '分类管理', '306', '2', '/goods/goodsclass/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('309', '产品管理', '306', '3', '/goods/goods/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('310', '评论管理', '0', '5', '/comment/comment/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('311', '评论列表', '310', '1', '/comment/comment/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('312', '意见反馈', '310', '2', '/comment/feedback/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('313', '会员管理', '0', '6', '/members/members/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('314', '会员列表', '313', '1', '/members/members/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('315', '删除的会员', '313', '2', '/members/membersdel/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('316', '等级管理', '313', '3', '/members/membersgrade/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('317', '积分管理', '313', '4', '/members/integral/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('318', '浏览记录', '313', '5', '/members/browse/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('319', '下载记录', '313', '6', '/members/download/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('320', '分享记录', '313', '7', '/members/share/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('321', '管理员管理', '0', '7', '/admin/admin/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('322', '角色管理', '321', '1', '/admin/rule/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('323', '管理员列表', '321', '2', '/admin/admin/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('324', '系统统计', '0', '8', '/statistics/statistics/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('325', '系统管理', '0', '9', '/config/config/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('326', '系统设置', '325', '1', '/config/config/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('327', '栏目管理', '325', '2', '/config/column/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('328', '数据字典', '325', '3', '/config/datadictionary/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('329', '屏蔽词', '325', '4', '/config/blockword/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('330', '备份数据库', '325', '5', '/config/database/index?type=export', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('331', '菜单管理', '325', '7', '/menu/menu/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('333', '添加菜单', '331', '1', '/menu/menu/add', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('334', '显示隐藏菜单', '331', '2', '/menu/menu/change', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('335', '修改菜单', '331', '3', '/menu/menu/edit', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('336', '删除菜单', '331', '4', '/menu/menu/delete', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('337', '添加管理员', '323', '1', '/admin/admin/add', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('338', '编辑管理员', '323', '2', '/admin/admin/edit', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('339', '删除管理员', '323', '3', '/admin/admin/delete', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('340', '显示隐藏管理员', '323', '4', '/admin/admin/change', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('341', '添加角色', '322', '1', '/admin/rule/add', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('342', '编辑角色', '322', '2', '/admin/rule/edit', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('343', '删除角色', '322', '3', '/admin/rule/delete', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('345', '管理员操作日志', '321', '3', '/admin/admindolog/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('346', '管理员登录日志', '321', '4', '/admin/adminlogin/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('347', '操作日志删除', '345', '1', '/admin/admindolog/delete', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('348', '管理员登录日志删除', '346', '1', '/admin/adminlogin/delete', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('349', '还原数据库', '325', '6', '/config/database/index?type=import', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('350', '支付方式管理', '325', '8', '/config/payment/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('351', 'SEO管理', '325', '9', '/config/seo/index', '0', '', '1');
INSERT INTO `shop_menu` VALUES ('352', '地址管理', '325', '10', '/config/address/index', '0', '', '1');

-- ----------------------------
-- Table structure for shop_migration
-- ----------------------------
DROP TABLE IF EXISTS `shop_migration`;
CREATE TABLE `shop_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of shop_migration
-- ----------------------------
INSERT INTO `shop_migration` VALUES ('m000000_000000_base', '1480304961');
INSERT INTO `shop_migration` VALUES ('m140506_102106_rbac_init', '1480306877');

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `orderid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `expressid` int(10) unsigned NOT NULL DEFAULT '0',
  `expressno` varchar(50) NOT NULL DEFAULT '',
  `tradeno` varchar(100) NOT NULL DEFAULT '',
  `tradeext` text,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderid`),
  KEY `shop_order_userid` (`userid`),
  KEY `shop_order_addressid` (`addressid`),
  KEY `shop_order_expressid` (`expressid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('1', '1', '2', '6710.00', '100', '2', '', '', null, '1468308342', '2016-11-26 02:42:17');
INSERT INTO `shop_order` VALUES ('2', '1', '2', '2894.00', '100', '3', '', '', null, '1468308474', '2016-07-12 07:28:05');
INSERT INTO `shop_order` VALUES ('3', '1', '0', '0.00', '0', '0', '', '', null, '1480128001', '2016-11-26 02:40:01');
INSERT INTO `shop_order` VALUES ('4', '1', '0', '0.00', '0', '0', '', '', null, '1480128041', '2016-11-26 02:40:41');
INSERT INTO `shop_order` VALUES ('5', '1', '0', '0.00', '0', '0', '', '', null, '1480128079', '2016-11-26 02:41:19');
INSERT INTO `shop_order` VALUES ('6', '1', '0', '0.00', '0', '0', '', '', null, '1480128109', '2016-11-26 02:41:49');
INSERT INTO `shop_order` VALUES ('7', '1', '0', '0.00', '0', '0', '', '', null, '1480128193', '2016-11-26 02:43:13');
INSERT INTO `shop_order` VALUES ('8', '1', '2', '1518.00', '100', '2', '', '', null, '1480128231', '2016-11-26 02:57:22');
INSERT INTO `shop_order` VALUES ('9', '1', '0', '0.00', '0', '0', '', '', null, '1480193198', '2016-11-26 20:46:38');
INSERT INTO `shop_order` VALUES ('10', '1', '0', '0.00', '0', '0', '', '', null, '1480194095', '2016-11-26 21:01:35');
INSERT INTO `shop_order` VALUES ('11', '12', '0', '0.00', '0', '0', '', '', null, '1481656816', '2016-12-13 19:20:16');
INSERT INTO `shop_order` VALUES ('12', '12', '0', '0.00', '0', '0', '', '', null, '1481656865', '2016-12-13 19:21:05');
INSERT INTO `shop_order` VALUES ('13', '12', '0', '0.00', '0', '0', '', '', null, '1481661237', '2016-12-13 20:33:57');
INSERT INTO `shop_order` VALUES ('14', '12', '0', '0.00', '0', '0', '', '', null, '1481661280', '2016-12-13 20:34:40');

-- ----------------------------
-- Table structure for shop_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_detail`;
CREATE TABLE `shop_order_detail` (
  `detailid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`detailid`),
  KEY `shop_order_detail_productid` (`productid`),
  KEY `shop_order_detail_orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order_detail
-- ----------------------------
INSERT INTO `shop_order_detail` VALUES ('1', '7', '6690.00', '1', '1', '1468308342');
INSERT INTO `shop_order_detail` VALUES ('2', '8', '1396.00', '1', '2', '1468308474');
INSERT INTO `shop_order_detail` VALUES ('3', '10', '1498.00', '1', '2', '1468308474');
INSERT INTO `shop_order_detail` VALUES ('4', '8', '1396.00', '1', '3', '1480128001');
INSERT INTO `shop_order_detail` VALUES ('5', '8', '1396.00', '1', '4', '1480128041');
INSERT INTO `shop_order_detail` VALUES ('6', '7', '6690.00', '6', '5', '1480128079');
INSERT INTO `shop_order_detail` VALUES ('7', '12', '688.00', '1', '6', '1480128109');
INSERT INTO `shop_order_detail` VALUES ('8', '10', '1498.00', '1', '7', '1480128193');
INSERT INTO `shop_order_detail` VALUES ('9', '11', '1498.00', '1', '8', '1480128231');
INSERT INTO `shop_order_detail` VALUES ('10', '7', '6690.00', '3', '9', '1480193198');
INSERT INTO `shop_order_detail` VALUES ('11', '7', '6690.00', '1', '10', '1480194095');
INSERT INTO `shop_order_detail` VALUES ('12', '27', '92.00', '1', '11', '1481656816');
INSERT INTO `shop_order_detail` VALUES ('13', '26', '90.00', '1', '11', '1481656816');
INSERT INTO `shop_order_detail` VALUES ('14', '8', '1396.00', '1', '11', '1481656816');
INSERT INTO `shop_order_detail` VALUES ('15', '7', '6690.00', '1', '11', '1481656816');
INSERT INTO `shop_order_detail` VALUES ('16', '7', '6690.00', '1', '12', '1481656865');
INSERT INTO `shop_order_detail` VALUES ('17', '8', '1396.00', '1', '13', '1481661237');
INSERT INTO `shop_order_detail` VALUES ('18', '26', '90.00', '1', '14', '1481661280');

-- ----------------------------
-- Table structure for shop_payment
-- ----------------------------
DROP TABLE IF EXISTS `shop_payment`;
CREATE TABLE `shop_payment` (
  `payment_id` tinyint(1) unsigned NOT NULL COMMENT '支付索引id',
  `payment_code` char(10) NOT NULL COMMENT '支付代码名称',
  `payment_name` char(10) NOT NULL COMMENT '支付名称',
  `payment_config` text COMMENT '支付接口配置信息',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付方式表';

-- ----------------------------
-- Records of shop_payment
-- ----------------------------
INSERT INTO `shop_payment` VALUES ('1', 'offline', '货到付款', 'a:1:{s:0:\"\";s:0:\"\";}', '1');
INSERT INTO `shop_payment` VALUES ('2', 'alipay', '支付宝', 'a:4:{s:14:\"alipay_service\";s:25:\"create_direct_pay_by_user\";s:14:\"alipay_account\";s:22:\"zhoudeyin@damingjt.com\";s:10:\"alipay_key\";s:32:\"dk07kd3q2cbgzfmpuvm2hbvpmyqvposu\";s:14:\"alipay_partner\";s:16:\"2088421445665746\";}', '1');
INSERT INTO `shop_payment` VALUES ('3', 'tenpay', '财付通', 'a:2:{s:14:\"tenpay_account\";s:0:\"\";s:10:\"tenpay_key\";s:0:\"\";}', '1');
INSERT INTO `shop_payment` VALUES ('4', 'chinabank', '网银在线', 'a:2:{s:17:\"chinabank_account\";s:3:\"111\";s:13:\"chinabank_key\";s:3:\"111\";}', '1');
INSERT INTO `shop_payment` VALUES ('5', 'predeposit', '站内余额支付', 'a:1:{s:0:\"\";s:0:\"\";}', '1');
INSERT INTO `shop_payment` VALUES ('6', 'wxpay', '微信支付', 'a:4:{s:12:\"weixin_appid\";s:18:\"wxe5c92aded4895231\";s:12:\"weixin_mchid\";s:10:\"1316009001\";s:10:\"weixin_key\";s:32:\"7af60777da89c187085bcb152fa7c53d\";s:16:\"weixin_appsecret\";s:32:\"742b16733d666d30da4dbf7b5bdd2b81\";}', '1');
INSERT INTO `shop_payment` VALUES ('7', 'alipayapi', '支付宝(网银支付)', 'a:4:{s:14:\"alipay_service\";s:25:\"create_direct_pay_by_user\";s:14:\"alipay_account\";s:17:\"3160529319@qq.com\";s:10:\"alipay_key\";s:32:\"6wjrqugym1ygyj22dr3fllmp1v2mg9ns\";s:14:\"alipay_partner\";s:16:\"2088911718232754\";}', '1');
INSERT INTO `shop_payment` VALUES ('8', 'qupay', '快捷支付', 'a:2:{s:11:\"qupay_mchid\";s:14:\"00000000000329\";s:9:\"qupay_key\";s:12:\"SBXcQSbPH2hP\";}', '1');
INSERT INTO `shop_payment` VALUES ('9', 'hrwxpay', '华融微信支付', 'a:2:{s:13:\"hrwxpay_mchid\";s:15:\"850440089992820\";s:11:\"hrwxpay_key\";s:15:\"***************\";}', '1');
INSERT INTO `shop_payment` VALUES ('10', 'hrapay', '华融代理支付', 'a:2:{s:12:\"hrapay_mchid\";s:14:\"00000000000329\";s:10:\"hrapay_key\";s:12:\"SBXcQSbPH2hP\";}', '1');
INSERT INTO `shop_payment` VALUES ('11', 'wg', '网关支付', 'a:2:{s:8:\"wg_mchid\";s:14:\"00000000000329\";s:6:\"wg_key\";s:12:\"SBXcQSbPH2hP\";}', '1');

-- ----------------------------
-- Table structure for shop_product
-- ----------------------------
DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE `shop_product` (
  `productid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `descr` text,
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cover` varchar(200) NOT NULL DEFAULT '',
  `pics` text,
  `issale` enum('0','1') NOT NULL DEFAULT '0',
  `ishot` enum('0','1') NOT NULL DEFAULT '0',
  `istui` enum('0','1') NOT NULL DEFAULT '0',
  `saleprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ison` enum('0','1') NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`productid`),
  KEY `shop_product_cateid` (`cateid`),
  KEY `shop_product_ison` (`ison`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_product
-- ----------------------------
INSERT INTO `shop_product` VALUES ('7', '20', '22222222222222222222Heilan Home/海澜之家2016夏季热卖男装圆领休闲印花潮流短袖T恤', '<span><img alt=\"\"><img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t2941/22/706006802/406075/2b1e6c4/5763937dN29718543.jpg\"></span>', '108', '6690.00', 'http://o7zgluxwg.bkt.clouddn.com/584f344d79c54', '{\"5779288c0a72b\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/5779288c0a72b\",\"577928b3757a0\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/577928b3757a0\"}', '0', '1', '0', '6690.00', '1', '0', '0');
INSERT INTO `shop_product` VALUES ('8', '20', '美的(Midea) BCD-206TM(E) 206升 三门冰箱 节能保鲜 闪白银', '&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt=\"\"><img alt=\"\" src=\"http://img11.360buyimg.com/cms/jfs/t2056/173/1898915458/101187/470cf666/56e26684Nb3eee304.jpg\">', '95', '1396.00', 'http://o7zgluxwg.bkt.clouddn.com/57792cf85ecfd', '{\"57792a5460862\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/57792a5460862\",\"57792a561af7c\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/57792a561af7c\"}', '0', '1', '1', '1396.00', '1', '0', '0');
INSERT INTO `shop_product` VALUES ('9', '20', '风冷无霜 电脑控温 纤薄设计 节能静音', '<img alt=\"\"><img alt=\"\" src=\"http://img14.360buyimg.com/cms/jfs/t1942/44/2725816430/124244/653162f6/56f0f1cdN4790e3df.jpg\">', '100', '3699.00', 'http://o7zgluxwg.bkt.clouddn.com/584ead8ae098f', '{\"57792c3b02c73\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/57792c3b02c73\",\"584ead8b1d370\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584ead8b1d370\"}', '0', '1', '1', '3699.00', '1', '0', '0');
INSERT INTO `shop_product` VALUES ('10', '20', '美的(Midea) BCD-216TM（E）216升 三门冰箱 三温区 省电节能 悦动白', '<img src=\"http://img10.360buyimg.com/cms/jfs/t2347/106/1920014229/122925/5034d0d7/56e23b6cNbd4ebf19.jpg\" alt=\"\"><br>', '198', '1498.00', 'http://o7zgluxwg.bkt.clouddn.com/5783058723468', '[]', '1', '1', '1', '1498.00', '1', '0', '0');
INSERT INTO `shop_product` VALUES ('11', '20', '美的(Midea) BCD-303WTZM(E ) 303升 多门冰箱 风冷智能 WIFI远程操控 太空银 ', '<img src=\"http://img11.360buyimg.com/cms/jfs/t2629/257/1719908740/241985/827f171c/5746e372N471d7aec.jpg\" alt=\"\"><br>', '199', '1498.00', 'http://o7zgluxwg.bkt.clouddn.com/5783096f1499d', '[]', '1', '1', '1', '1498.00', '1', '0', '0');
INSERT INTO `shop_product` VALUES ('12', '20', '海尔（Haier）BC-93TMPF 93升 单门冰箱 一级节能 ', '<img src=\"http://img20.360buyimg.com/vc/jfs/t2644/268/1090705966/61725/c38b957/573463b5N9923a2d6.jpg\" alt=\"\"><br>', '199', '688.00', 'http://o7zgluxwg.bkt.clouddn.com/57830af934641', '[]', '1', '1', '1', '688.00', '1', '0', '0');
INSERT INTO `shop_product` VALUES ('25', '7', '一级节能的冰箱，很厉害', '一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害一级节能的冰箱，很厉害', '100', '100.00', 'http://o7zgluxwg.bkt.clouddn.com/584f340345843', '{\"584f34037e48c\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584f34037e48c\"}', '1', '1', '1', '90.00', '1', '0', '0');
INSERT INTO `shop_product` VALUES ('26', '7', '测试商品2222222', '测试商品22222', '98', '100.00', 'http://o7zgluxwg.bkt.clouddn.com/584f36a5eca35', '{\"584f3684bd2a8\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584f3684bd2a8\"}', '1', '1', '1', '90.00', '1', '1481586308', '1481586342');
INSERT INTO `shop_product` VALUES ('27', '7', '测试导入22222222', '测试导入', '99', '100.00', 'http://o7zgluxwg.bkt.clouddn.com/584f38e980226', '{\"584f38bfc318a\":\"http:\\/\\/o7zgluxwg.bkt.clouddn.com\\/584f38bfc318a\"}', '1', '0', '1', '92.00', '1', '1481586879', '1481586921');

-- ----------------------------
-- Table structure for shop_profile
-- ----------------------------
DROP TABLE IF EXISTS `shop_profile`;
CREATE TABLE `shop_profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '生日',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `company` varchar(100) NOT NULL DEFAULT '' COMMENT '公司',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户的ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_profile_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_profile
-- ----------------------------

-- ----------------------------
-- Table structure for shop_seo
-- ----------------------------
DROP TABLE IF EXISTS `shop_seo`;
CREATE TABLE `shop_seo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` text NOT NULL COMMENT '描述',
  `type` varchar(20) NOT NULL COMMENT '类型',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='SEO信息存放表';

-- ----------------------------
-- Records of shop_seo
-- ----------------------------
INSERT INTO `shop_seo` VALUES ('1', '{sitename}量子商城-网站商城; 量子；量子积分；量子商城；量子电商；中盾；量子直播；量子电商；量子社交；量子云；量子积分；{sitename}量子直播{sitename}中盾电商', '{sitename}量子商城-网站商城; 量子；量子积分；量子商城；量子电商；中盾；量子直播；量子电商；量子社交；量子云；量子积分；{sitename}量子直播{sitename}中盾电商', '{sitename}量子商城-网站商城; 量子；量子积分；量子商城；量子电商；中盾；量子直播；量子电商；量子社交；量子云；量子积分；{sitename}量子直播{sitename}中盾电商，资讯,画报，资讯频道,量子资讯，量子商城，量子新闻，量子媒体，量子商城是中国唯一个集在量子云直播，量子云文化交易所，量子社交，量子传媒，量子影视，量子积分，量子消费贷为一体的综合性消费金融平台。', 'index');
INSERT INTO `shop_seo` VALUES ('2', '量子商城{sitename} - 量子演示-抢购{name}量子抢购；量子电商；中盾电商', '量子商城,{sitename}量子闪购；量子商城；抢购；{name}量子商城；中盾电商', '量子商城,{sitename}量子闪购；量子商城；抢购；{name}量子商城；量子直播；中盾电商', 'group');
INSERT INTO `shop_seo` VALUES ('3', '量子商城{sitename} - {name}量子商城；量子；量子团购；量子划算；量子人群；中盾电商', '量子商城,{name},{sitename}量子团购；量子直播；量子团；量子购；中盾电商', '量子商城{name}量子团购；量子直播；量子团；量子购{sitename}量子购；中盾电商', 'group_content');
INSERT INTO `shop_seo` VALUES ('4', '{sitename} - 量子品牌{name}量子电商；量子直播；量子云；量子社交', '量子商城网络商城,{sitename}量子品牌；{name}量子文化', '量子商城sitename}量子电商；{name}量子品牌；量子云{sitename}量子云', 'brand');
INSERT INTO `shop_seo` VALUES ('5', '{sitename} 量子品牌；量子产品；量子电商；{name}量子商城', '量子商城,{sitename},{name}量子商城；量子云', '{sitename} 量子品牌；量子产品；量子电商；{name}量子商城', 'brand_list');
INSERT INTO `shop_seo` VALUES ('7', '{sitename} - {name}', '网店技术交流中心,{sitename},{name}', '网店技术交流中心,{sitename},{name}', 'coupon_content');
INSERT INTO `shop_seo` VALUES ('8', '{sitename} - 量子积分；量子电商；{name}量子商城；{key}量子电商；量子元素；{description}量子云', '量子商城,{sitename}；量子电商{name}量子电商', '量子商城,{sitename}；量子电商{name}量子电商', 'point');
INSERT INTO `shop_seo` VALUES ('9', '{sitename} - {name}量子积分；积分商城', '量子商城,{sitename},{key}；量子积分', '量子商城,{sitename},{description}；量子文化', 'point_content');
INSERT INTO `shop_seo` VALUES ('10', '量子文化{sitename} 量子媒体- {article_class}量子报道；', '量子商城,{sitename}；{name}量子报道；{description}量子媒体', '量子商城,{sitename}；{name}量子文章；{key}量子文章', 'article');
INSERT INTO `shop_seo` VALUES ('11', '{sitename}量子文章 ；{name}量子报道；', '量子商城,{sitename},量子商城{key}量子文化', '量子商城,{sitename},{description}量子商城', 'article_content');
INSERT INTO `shop_seo` VALUES ('12', '{sitename}量子入驻；{shopname}量子积分；量子商家{key}量子入驻', '量子商城,{sitename},量子商城{key}量子招商', '量子商城,{sitename},量子入驻{description}量子招商', 'shop');
INSERT INTO `shop_seo` VALUES ('13', '{name}量子优品；{sitename}量子产品；{key}量子优惠；{description}量子特价', '量子商城交流中心,{sitename}量子特价；{key}量子服务', '量子交流中心,{sitename}量子云{description}量子售后；量子服务{key}量子电商', 'product');
INSERT INTO `shop_seo` VALUES ('14', '{sitename}量子商城-网站商城; 量子；量子积分；量子商城；量子电商；中盾；量子直播；量子电商；量子社交；量子云；量子积分；{sitename}量子直播{sitename}中盾电商服务name}量子商城-{sitename}量子社区', '{sitename}量子商城-网站商城; 量子；量子积分；量子商城；量子电商；中盾；量子直播；量子电商；量子社交；量子云；量子积分；{sitename}量子直播{sitename}中盾电商量子商城,{sitename}量子云,{name}量子社区', '{sitename}量子商城-网站商城; 量子；量子积分；量子商城；量子电商；中盾；量子直播；量子电商；量子社交；量子云；量子积分；{sitename}量子直播{sitename}中盾电商量子商城,{sitename}量子云,{name}量子社区', 'sns');

-- ----------------------------
-- Table structure for shop_setting
-- ----------------------------
DROP TABLE IF EXISTS `shop_setting`;
CREATE TABLE `shop_setting` (
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '值',
  `type` tinyint(11) NOT NULL DEFAULT '0' COMMENT '配置类型',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of shop_setting
-- ----------------------------
INSERT INTO `shop_setting` VALUES ('captcha_status_goodsqa', '1', '0');
INSERT INTO `shop_setting` VALUES ('captcha_status_login', '1', '0');
INSERT INTO `shop_setting` VALUES ('captcha_status_register', '1', '0');
INSERT INTO `shop_setting` VALUES ('circle_contentleast', '10', '0');
INSERT INTO `shop_setting` VALUES ('circle_createsum', '10', '0');
INSERT INTO `shop_setting` VALUES ('circle_exprelease', '100', '0');
INSERT INTO `shop_setting` VALUES ('circle_expreleasemax', '300', '0');
INSERT INTO `shop_setting` VALUES ('circle_expreplied', '2', '0');
INSERT INTO `shop_setting` VALUES ('circle_exprepliedmax', '200', '0');
INSERT INTO `shop_setting` VALUES ('circle_expreply', '5', '0');
INSERT INTO `shop_setting` VALUES ('circle_intervaltime', '1', '0');
INSERT INTO `shop_setting` VALUES ('circle_iscreate', '0', '0');
INSERT INTO `shop_setting` VALUES ('circle_istalk', '0', '0');
INSERT INTO `shop_setting` VALUES ('circle_isuse', '0', '0');
INSERT INTO `shop_setting` VALUES ('circle_joinsum', '50', '0');
INSERT INTO `shop_setting` VALUES ('circle_loginpic', 'a:4:{i:1;a:2:{s:3:\"pic\";s:5:\"1.jpg\";s:3:\"url\";s:23:\"http://www.zdmall888.com\";}i:2;a:2:{s:3:\"pic\";s:5:\"2.jpg\";s:3:\"url\";s:23:\"http://www.zdmall888.com\";}i:3;a:2:{s:3:\"pic\";s:5:\"3.jpg\";s:3:\"url\";s:23:\"http://www.zdmall888.com\";}i:4;a:2:{s:3:\"pic\";s:5:\"4.jpg\";s:3:\"url\";s:23:\"http://www.zdmall888.com\";}}', '0');
INSERT INTO `shop_setting` VALUES ('circle_logo', '05267552179379374.jpg', '0');
INSERT INTO `shop_setting` VALUES ('circle_managesum', '4', '0');
INSERT INTO `shop_setting` VALUES ('circle_name', '量子社区', '0');
INSERT INTO `shop_setting` VALUES ('circle_seodescription', '发现精彩：圈子是买家们自己创建的私属领地，我们排斥广告分子，我们热爱真实分享！', '0');
INSERT INTO `shop_setting` VALUES ('circle_seokeywords', '圈子,帮派,讨论小组,购物,生活,分享,show,秀,商品,电子商务,社区,消费者社区,论坛,资讯,热门话题,朋友', '0');
INSERT INTO `shop_setting` VALUES ('circle_seotitle', '发现精彩 - 量子社区；量子社交；量子圈子', '0');
INSERT INTO `shop_setting` VALUES ('circle_wordfilter', '', '0');
INSERT INTO `shop_setting` VALUES ('closed_reason', '', '0');
INSERT INTO `shop_setting` VALUES ('cms_attitude_flag', '1', '0');
INSERT INTO `shop_setting` VALUES ('cms_comment_flag', '1', '0');
INSERT INTO `shop_setting` VALUES ('cms_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('cms_logo', '05267552047562750.jpg', '0');
INSERT INTO `shop_setting` VALUES ('cms_seo_description', '近几年，车企试水电子商务已不是什么新鲜事，且有愈演愈烈之势。众多汽车媒体争相吹捧，看起来很美的汽车电商，投入与收成到底是不是真的成正比?\r\n低价车最热销\r\n瓜子二手车2016年10月20日联合百度发布的二手车电商用户购车趋势报告显示，在二手车电商交易中，车辆成交均价在7.8万元左右。其中，5万-10万元的二手车最受欢迎，5万元以下的车型紧随其后。经测算，10万元以下的二手车交易在整体交易中占比接近75%。据了解，二手车检索量在近两年来呈现逐年上涨的趋势，涨幅高达400%。报告分析认为，涨幅明显的原因主要来自于二手车电商平台的崛起，为用户提供了更多的选择，也反映出用户在买卖二手车时由传统线下逐渐向线上转变的过程。\r\n在铺天盖地的广告攻势下，消费者对于B2C模式的二手车电商认知度越来越高。根据白皮书数据显示，2016年上半年，在二手车整体行业成交量增长较低的情况下，二手车电商行业成交量达到66.31万辆，增长率为14.9%，相较于2015年下半年11.8%的增长率提高了3.1个百分点。此外，从行业渗透率方面来看，2016年上半年二手车电商行业2C模式渗透率达到8.4%，较2015年下半年6.5%的渗透率有所提升。\r\n盈利能力受限\r\n消费者聚焦低价车，从一定程度上限制了二手车电商的盈利能力。据了解，二手车保值率是衡量二手车价值的关键指标。合资品牌车的第一年保值率约为70%，之后每年以约5%的折旧递减;自主品牌车的第一年保值率约为65%，之后每年约5%折旧递减。在价格基数较小的情况下，盈利空间难免受限。\r\n掘金车后市场\r\n在二手车交易盈利能力有限的情况下，二手车电商企业将目光瞄准了车后市场。艾瑞咨询数据显示，在中国二手车用户购买二手车付款方式选择中，36.3%的消费者选择贷款方式。分析认为，二手车作为后市场中重要的一环，近年来已经呈现爆发性发展的征兆，二手车交易量的爆发也将为二手车后市场服务提供新的业务模式和新的盈利点。数据显示，2014年中国消费信贷规模达到15.4万亿元，同比增长18.4%，预计2014-2019年中国消费信贷规模将维持19.5%的复合增长率，并在2019年将达到37.4万亿元。\r\n据悉，目前中国购车人群中有56.5%的初次购车用户，43.5%为置换车用户;综合考虑中国汽车销量历史数据，预计到2020年，中国购车人群中有36.5%为初次购车用户，63.5%为置换车用户。就此而言，二手车电商的发展前景依旧广阔。', '0');
INSERT INTO `shop_setting` VALUES ('cms_seo_keywords', '二手车电商行情', '0');
INSERT INTO `shop_setting` VALUES ('cms_seo_title', '二手车电商的“尴尬”：低价车限制盈利', '0');
INSERT INTO `shop_setting` VALUES ('cms_submit_flag', '1', '0');
INSERT INTO `shop_setting` VALUES ('cms_submit_verify_flag', '1', '0');
INSERT INTO `shop_setting` VALUES ('complain_time_limit', '2592000', '0');
INSERT INTO `shop_setting` VALUES ('consult_prompt', '因厂家更改商品包装、场地、附配件等不做提前通知，且每位咨询者购买、提问时间等不同。为此，客服给到的回复仅对提问者3天内有效，其他网友仅供参考！给您带来的不变还请谅解，谢谢！', '0');
INSERT INTO `shop_setting` VALUES ('default_goods_image', '05259704483394766.png', '0');
INSERT INTO `shop_setting` VALUES ('default_store_avatar', '05018734152643458.png', '0');
INSERT INTO `shop_setting` VALUES ('default_store_logo', '05259703995096043.png', '0');
INSERT INTO `shop_setting` VALUES ('default_user_portrait', '05259703100576613.png', '0');
INSERT INTO `shop_setting` VALUES ('delivery_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('email_addr', 'Harvey@sykjshop.com', '3');
INSERT INTO `shop_setting` VALUES ('email_host', 'smtp.exmail.qq.com', '3');
INSERT INTO `shop_setting` VALUES ('email_id', 'Harvey@sykjshop.com', '3');
INSERT INTO `shop_setting` VALUES ('email_pass', 'shengyun1234', '3');
INSERT INTO `shop_setting` VALUES ('email_port', '465', '3');
INSERT INTO `shop_setting` VALUES ('email_type', '1', '3');
INSERT INTO `shop_setting` VALUES ('enabled_subdomain', '1', '0');
INSERT INTO `shop_setting` VALUES ('exppoints_rule', 'a:4:{s:9:\"exp_login\";i:0;s:12:\"exp_comments\";i:0;s:13:\"exp_orderrate\";i:0;s:12:\"exp_ordermax\";i:0;}', '0');
INSERT INTO `shop_setting` VALUES ('flea_app_open', '1', '0');
INSERT INTO `shop_setting` VALUES ('flea_hot_search', '', '0');
INSERT INTO `shop_setting` VALUES ('flea_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('flea_loginpic', 'a:4:{i:1;a:2:{s:3:\"pic\";s:5:\"flea_1.jpg\";s:3:\"url\";s:22:\"http://www.shopjl.com/\";}i:2;a:2:{s:3:\"pic\";s:5:\"flea_2.jpg\";s:3:\"url\";s:22:\"http://www.shopjl.com/\";}i:3;a:2:{s:3:\"pic\";s:5:\"flea_3.jpg\";s:3:\"url\";s:22:\"http://www.shopjl.com/\";}i:4;a:2:{s:3:\"pic\";s:5:\"flea_4.jpg\";s:3:\"url\";s:22:\"http://www.shopjl.com/\";}i:5;a:2:{s:3:\"pic\";s:5:\"flea_5.jpg\";s:3:\"url\";s:22:\"http://www.shopjl.com/\";}}', '0');
INSERT INTO `shop_setting` VALUES ('flea_site_description', '货源直销 新品预订 热品团购 物超所值', '0');
INSERT INTO `shop_setting` VALUES ('flea_site_keywords', '货源直销 新品预订 热品团购 物超所值', '0');
INSERT INTO `shop_setting` VALUES ('flea_site_name', '货源直销 新品预订 热品团购 物超所值', '0');
INSERT INTO `shop_setting` VALUES ('flea_site_title', '货源直销 新品预订 热品团购 物超所值', '0');
INSERT INTO `shop_setting` VALUES ('goods_verify', '1', '0');
INSERT INTO `shop_setting` VALUES ('groupbuy_allow', '1', '0');
INSERT INTO `shop_setting` VALUES ('groupbuy_price', '10', '0');
INSERT INTO `shop_setting` VALUES ('groupbuy_review_day', '2', '0');
INSERT INTO `shop_setting` VALUES ('guest_comment', '1', '0');
INSERT INTO `shop_setting` VALUES ('hot_search', '母婴,数码,服装,家居,食品,家电,珠宝,面膜,化妆', '4');
INSERT INTO `shop_setting` VALUES ('icp_number', '粤ICP备16029233号-1', '1');
INSERT INTO `shop_setting` VALUES ('image_allow_ext', 'gif,jpg,jpeg,bmp,png,swf', '0');
INSERT INTO `shop_setting` VALUES ('image_dir_type', '1', '0');
INSERT INTO `shop_setting` VALUES ('image_max_filesize', '1024', '0');
INSERT INTO `shop_setting` VALUES ('live_link1', 'http://www.zdmall888.com', '0');
INSERT INTO `shop_setting` VALUES ('live_link2', 'http://www.zdmall888.com', '0');
INSERT INTO `shop_setting` VALUES ('live_link3', 'http://www.zdmall888.com', '0');
INSERT INTO `shop_setting` VALUES ('live_link4', 'http://www.zdmall888.com', '0');
INSERT INTO `shop_setting` VALUES ('live_pic1', '05260533259145999.png', '0');
INSERT INTO `shop_setting` VALUES ('live_pic2', '04835329096997380.jpg', '0');
INSERT INTO `shop_setting` VALUES ('live_pic3', '04835329097002531.jpg', '0');
INSERT INTO `shop_setting` VALUES ('live_pic4', '04835329097014969.jpg', '0');
INSERT INTO `shop_setting` VALUES ('login_pic', 'a:4:{i:0;s:5:\"1.jpg\";i:1;s:5:\"2.jpg\";i:2;s:5:\"3.jpg\";i:3;s:5:\"4.jpg\";}', '0');
INSERT INTO `shop_setting` VALUES ('malbum_max_sum', '200', '0');
INSERT INTO `shop_setting` VALUES ('md5_key', '56506d9bf6eb098eb421025acdc7f2d9', '0');
INSERT INTO `shop_setting` VALUES ('member_grade', 'a:4:{i:0;a:3:{s:5:\"level\";i:0;s:10:\"level_name\";s:2:\"V0\";s:9:\"exppoints\";i:0;}i:1;a:3:{s:5:\"level\";i:1;s:10:\"level_name\";s:2:\"V1\";s:9:\"exppoints\";i:1000;}i:2;a:3:{s:5:\"level\";i:2;s:10:\"level_name\";s:2:\"V2\";s:9:\"exppoints\";i:10000;}i:3;a:3:{s:5:\"level\";i:3;s:10:\"level_name\";s:2:\"SJ\";s:9:\"exppoints\";i:20000;}}', '0');
INSERT INTO `shop_setting` VALUES ('member_logo', '05267550791650997.jpg', '1');
INSERT INTO `shop_setting` VALUES ('microshop_goods_default_class', null, '0');
INSERT INTO `shop_setting` VALUES ('microshop_header_pic', null, '0');
INSERT INTO `shop_setting` VALUES ('microshop_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('microshop_logo', null, '0');
INSERT INTO `shop_setting` VALUES ('microshop_personal_limit', '50', '0');
INSERT INTO `shop_setting` VALUES ('microshop_seo_description', '中盾科技专业B2B2C，B2C商城开发', '0');
INSERT INTO `shop_setting` VALUES ('microshop_seo_keywords', '中盾科技专业B2B2C，B2C商城开发', '0');
INSERT INTO `shop_setting` VALUES ('microshop_store_banner', null, '0');
INSERT INTO `shop_setting` VALUES ('microshop_style', '中盾科技微商城', '0');
INSERT INTO `shop_setting` VALUES ('mobile_apk', 'http://www.zdmall888.com/an.apk', '0');
INSERT INTO `shop_setting` VALUES ('mobile_apk_version', '3.0.2', '0');
INSERT INTO `shop_setting` VALUES ('mobile_app', 'mb_app.png', '0');
INSERT INTO `shop_setting` VALUES ('mobile_ios', 'http://www.zdmall888.com/ping.api', '0');
INSERT INTO `shop_setting` VALUES ('mobile_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('pointprod_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('pointshop_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('points_comments', '0', '0');
INSERT INTO `shop_setting` VALUES ('points_invite', '100', '0');
INSERT INTO `shop_setting` VALUES ('points_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('points_login', '0', '0');
INSERT INTO `shop_setting` VALUES ('points_ordermax', '9999999', '0');
INSERT INTO `shop_setting` VALUES ('points_orderrate', '0', '0');
INSERT INTO `shop_setting` VALUES ('points_rebate', '5', '0');
INSERT INTO `shop_setting` VALUES ('points_reg', '20', '0');
INSERT INTO `shop_setting` VALUES ('promotion_allow', '1', '0');
INSERT INTO `shop_setting` VALUES ('promotion_booth_goods_sum', '10', '0');
INSERT INTO `shop_setting` VALUES ('promotion_booth_price', '200', '0');
INSERT INTO `shop_setting` VALUES ('promotion_bundling_goods_sum', '5', '0');
INSERT INTO `shop_setting` VALUES ('promotion_bundling_price', '20', '0');
INSERT INTO `shop_setting` VALUES ('promotion_bundling_sum', '50', '0');
INSERT INTO `shop_setting` VALUES ('promotion_mansong_price', '20', '0');
INSERT INTO `shop_setting` VALUES ('promotion_voucher_buyertimes_limit', '5', '0');
INSERT INTO `shop_setting` VALUES ('promotion_voucher_default_styleimg', 'default_voucher.jpg', '0');
INSERT INTO `shop_setting` VALUES ('promotion_voucher_price', '1', '0');
INSERT INTO `shop_setting` VALUES ('promotion_voucher_storetimes_limit', '20', '0');
INSERT INTO `shop_setting` VALUES ('promotion_xianshi_price', '30', '0');
INSERT INTO `shop_setting` VALUES ('qq_appcode', '', '0');
INSERT INTO `shop_setting` VALUES ('qq_appid', '101344085', '0');
INSERT INTO `shop_setting` VALUES ('qq_appkey', 'c0b798fa9dd86edba6a67ded921d2deb', '0');
INSERT INTO `shop_setting` VALUES ('qq_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('seller_center_logo', '05295981097386501.jpg', '1');
INSERT INTO `shop_setting` VALUES ('share_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('share_qqweibo_appid', '101218982', '0');
INSERT INTO `shop_setting` VALUES ('share_qqweibo_appkey', 'c7bd85afcc01292cd71d52b5b9cae690', '0');
INSERT INTO `shop_setting` VALUES ('share_qqweibo_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('share_sinaweibo_appcode', null, '0');
INSERT INTO `shop_setting` VALUES ('share_sinaweibo_appid', null, '0');
INSERT INTO `shop_setting` VALUES ('share_sinaweibo_appkey', null, '0');
INSERT INTO `shop_setting` VALUES ('share_sinaweibo_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('sina_appcode', '', '0');
INSERT INTO `shop_setting` VALUES ('sina_isuse', '1', '0');
INSERT INTO `shop_setting` VALUES ('sina_wb_akey', '2390242019', '0');
INSERT INTO `shop_setting` VALUES ('sina_wb_skey', '53f325441fb5ca1d9701383ae483ffab', '0');
INSERT INTO `shop_setting` VALUES ('site_bank_account', '', '1');
INSERT INTO `shop_setting` VALUES ('site_email', 'greatMing@sykjshop123.com', '1');
INSERT INTO `shop_setting` VALUES ('site_logo', '05267550791650470.jpg', '1');
INSERT INTO `shop_setting` VALUES ('site_logowx', '05295981097386501.jpg', '1');
INSERT INTO `shop_setting` VALUES ('site_name', '量子系统', '1');
INSERT INTO `shop_setting` VALUES ('site_phone', '400-996-5566, 400-123-1234', '1');
INSERT INTO `shop_setting` VALUES ('site_qq', '2354845290', '1');
INSERT INTO `shop_setting` VALUES ('site_status', '1', '1');
INSERT INTO `shop_setting` VALUES ('site_tel400', '400-31886666', '1');
INSERT INTO `shop_setting` VALUES ('statistics_code', '<script type=\"text/javascript\">var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");document.write(unescape(\"%3Cspan id=\'cnzz_stat_icon_1257176973\'%3E%3C/span%3E%3Cscript src=\'\" + cnzz_protocol + \"s4.cnzz.com/z_stat.php%3Fid%3D1257176973%26show%3Dpic1\' type=\'text/javascript\'%3E%3C/script%3E\"));</script>', '1');
INSERT INTO `shop_setting` VALUES ('stat_orderpricerange', 'a:1:{i:0;a:2:{s:1:\"s\";s:1:\"0\";s:1:\"e\";s:7:\"1000000\";}}', '0');
INSERT INTO `shop_setting` VALUES ('stat_pricerange', 'a:2:{i:0;a:2:{s:1:\"s\";s:1:\"0\";s:1:\"e\";s:1:\"0\";}i:1;a:2:{s:1:\"s\";s:1:\"0\";s:1:\"e\";s:7:\"1000000\";}}', '0');
INSERT INTO `shop_setting` VALUES ('store_joinin_pic', 'a:2:{s:8:\"show_txt\";s:222:\"中盾商城，协助您开通店铺、运营店铺、组织营销活动及分析运营数据，悉心为您解答各类疑问，引导您按相关规则展开运营；我们将竭尽全力，为您的店铺保驾护航。\";s:3:\"pic\";a:3:{i:1;s:18:\"store_joinin_1.jpg\";i:2;s:18:\"store_joinin_2.jpg\";i:3;s:0:\"\";}}', '0');
INSERT INTO `shop_setting` VALUES ('subdomain_edit', '1', '0');
INSERT INTO `shop_setting` VALUES ('subdomain_length', '3-12', '0');
INSERT INTO `shop_setting` VALUES ('subdomain_reserved', 'www,ucenter', '0');
INSERT INTO `shop_setting` VALUES ('subdomain_times', '3', '0');
INSERT INTO `shop_setting` VALUES ('taobao_api_isuse', '0', '0');
INSERT INTO `shop_setting` VALUES ('taobao_app_key', '', '0');
INSERT INTO `shop_setting` VALUES ('taobao_secret_key', '', '0');
INSERT INTO `shop_setting` VALUES ('time_zone', 'Asia/Shanghai', '0');
INSERT INTO `shop_setting` VALUES ('upload_config', 'storage.yii2_advanced.com', '1');
INSERT INTO `shop_setting` VALUES ('voucher_allow', '1', '0');

-- ----------------------------
-- Table structure for shop_user
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `userpass` char(64) NOT NULL DEFAULT '',
  `useremail` varchar(100) NOT NULL DEFAULT '',
  `avatar` varchar(64) NOT NULL DEFAULT '' COMMENT '用户头像',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '通行秘钥',
  `channel_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '来源 1：Android 2：IOS 3：PC',
  `openid` char(32) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `last_access_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `imei` varchar(100) NOT NULL DEFAULT '' COMMENT '设备号',
  `zf_pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '支付密码',
  `last_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `shop_user_username_userpass` (`username`,`userpass`),
  UNIQUE KEY `shop_user_useremail_userpass` (`useremail`,`userpass`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user
-- ----------------------------
INSERT INTO `shop_user` VALUES ('8', 'imooc_584ff2d3690df', '', '$2y$13$IIHLV1c6b5L2TVdmqmVkVux5zfHRAlekvoc90EYvQbGkaj2RSUD1y', '86267659@qq.com', '', 'fd048348efa2513c9e80943bf8441d06', '1', '0', '1481634515', '0', '', '', '');
INSERT INTO `shop_user` VALUES ('9', 'imooc_584ff2e9cf596', '', '$2y$13$fOfENY.LLav0Lyv0x99JveKkun8QuUjmLPobtpepIGC.xpPsxvWs.', '86267659222222@qq.com', '', '', '1', '0', '1481634537', '0', '', '', '');
INSERT INTO `shop_user` VALUES ('10', 'imooc_585009f93169f', '', '$2y$13$MbfHFopQnzfkcciH49ax/OSbifK1W5lXBOre7dFF1ovd3astSyuVq', 'zhangsan@163.com', '', '', '1', '0', '1481640441', '0', '', '', '');
INSERT INTO `shop_user` VALUES ('11', 'imooc_5850119de9ecd', '', '$2y$13$szqUH0mYsgsWOPjBp5yFUesmyzKf.grbsbwyGaObOEjx5ozdEr0Km', 'zhangsan123@imooc.com', '', '', '1', '0', '1481642398', '0', '', '', '');
INSERT INTO `shop_user` VALUES ('12', 'zhangsan', '', '$2y$13$Pk5nMHtAmzMxYVnyGb7ywO8RKAc70C3DpYU.1NRUSeXbBJe5IysHW', 'zhangsan@zhangsan.com', '', '', '1', '0', '1481652118', '0', '', '', '');
