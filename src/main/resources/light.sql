/*
Navicat MySQL Data Transfer

Source Server         : my_db
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : viroyal_light_db

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-01-08 00:09:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`area_name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称' ,
`area_id`  int(11) NULL DEFAULT NULL COMMENT '区域所属id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
BEGIN;
INSERT INTO `sys_area` VALUES ('1', '黔西区', '1001'), ('2', '六枝特区', '1005'), ('3', '水城县', '2001'), ('4', '红花岗区', '2002'), ('5', '闵行区', '3005'), ('6', '徐汇区', '3006');
COMMIT;

-- ----------------------------
-- Table structure for sys_area_street
-- ----------------------------
DROP TABLE IF EXISTS `sys_area_street`;
CREATE TABLE `sys_area_street` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`area_id`  bigint(10) NULL DEFAULT NULL COMMENT '区域id' ,
`street_id`  bigint(10) NULL DEFAULT NULL COMMENT '街道id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of sys_area_street
-- ----------------------------
BEGIN;
INSERT INTO `sys_area_street` VALUES ('1', '1', '1'), ('2', '2', '2'), ('3', '3', '3'), ('4', '4', '4'), ('5', '5', '5'), ('6', '6', '6'), ('8', '6', '7');
COMMIT;

-- ----------------------------
-- Table structure for sys_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_city`;
CREATE TABLE `sys_city` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`city_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of sys_city
-- ----------------------------
BEGIN;
INSERT INTO `sys_city` VALUES ('1', '毕节市'), ('2', '六盘水市'), ('3', '遵义市'), ('4', '上海市');
COMMIT;

-- ----------------------------
-- Table structure for sys_city_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_city_area`;
CREATE TABLE `sys_city_area` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`city_id`  bigint(10) NULL DEFAULT NULL COMMENT '对应sys_city中的city_id' ,
`area_id`  bigint(10) NULL DEFAULT NULL COMMENT '对应sys_area中的area_id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of sys_city_area
-- ----------------------------
BEGIN;
INSERT INTO `sys_city_area` VALUES ('1', '1', '1'), ('2', '2', '2'), ('3', '2', '3'), ('4', '3', '4'), ('5', '4', '5'), ('6', '4', '6');
COMMIT;

-- ----------------------------
-- Table structure for sys_light
-- ----------------------------
DROP TABLE IF EXISTS `sys_light`;
CREATE TABLE `sys_light` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`status`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1:开灯，0:关灯' ,
`voltage`  bigint(20) NULL DEFAULT NULL COMMENT '电压' ,
`current`  bigint(20) NULL DEFAULT NULL COMMENT '电流' ,
`traffic_flow`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '车流量,暂时用1表示车流量多，0表示车流量少，具体按照路灯获取的信息' ,
`temperature`  bigint(20) NULL DEFAULT NULL COMMENT '温度' ,
`humidity`  bigint(20) NULL DEFAULT NULL COMMENT '湿度' ,
`autoreport`  bigint(16) NULL DEFAULT NULL COMMENT '路灯自动上报周期' ,
`datetime`  datetime NULL DEFAULT NULL ,
`info_id`  bigint(10) NULL DEFAULT NULL COMMENT '对应light_info的code' ,
`lightness`  int(11) NULL DEFAULT NULL COMMENT '亮度' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of sys_light
-- ----------------------------
BEGIN;
INSERT INTO `sys_light` VALUES ('1', '1', '110', '800', '1', '6', '65', '10000', '2017-12-01 17:40:40', '1', '0'), ('2', '1', '100', '600', '1', '16', '85', '20000', '2016-12-01 12:00:06', '2', '0'), ('3', '1', '110', '100', '0', '60', '120', '10000', '2017-12-31 22:00:36', '3', '8'), ('4', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '4', '0'), ('5', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '5', '0'), ('6', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '6', '0'), ('7', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '7', '0'), ('8', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '8', '0'), ('9', '1', '140', '800', '0', '24', '85', '20000', '2017-06-01 23:13:22', '9', '0'), ('10', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '10', '0'), ('11', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '11', '0'), ('12', '1', '140', '800', '1', '24', '85', '20000', '2017-06-01 23:13:22', '12', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_light_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_light_group`;
CREATE TABLE `sys_light_group` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`group_id`  int(10) NULL DEFAULT NULL COMMENT '组id' ,
`group_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名' ,
`create_user_id`  bigint(10) NULL DEFAULT NULL COMMENT '由谁创建的组' ,
`responsible_id`  bigint(10) NULL DEFAULT NULL COMMENT '谁负责的组' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of sys_light_group
-- ----------------------------
BEGIN;
INSERT INTO `sys_light_group` VALUES ('1', '1', 'xx组路灯1', '1', '2', '2017-12-31 17:20:40'), ('2', '1', 'xx组路灯2', '1', '3', '2017-12-31 13:30:43'), ('3', '1', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('4', '1', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('5', '2', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('6', '2', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('7', '2', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('8', '2', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('9', '3', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('10', '3', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('11', '3', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30'), ('12', '3', 'xx组路灯3', '1', '4', '2017-12-31 07:55:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_light_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_light_info`;
CREATE TABLE `sys_light_info` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路灯编码' ,
`info`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路灯信息' ,
`status`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1:正在使用，0:刚注册信息并没有投入使用' ,
`longitude`  float NULL DEFAULT NULL COMMENT '经度' ,
`latitude`  float NULL DEFAULT NULL COMMENT '纬度' ,
`strategy_id`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '引用策略表的id，根据四季的不同，车流量的不同，来指派亮度以及打开时间' ,
`street_id`  bigint(10) NULL DEFAULT NULL COMMENT '所属街道id' ,
`group_id`  bigint(10) NULL DEFAULT NULL COMMENT '所属集合id' ,
`voltage_threshold`  int(11) NULL DEFAULT NULL COMMENT '电压报警阀值' ,
`current_threshold`  int(11) NULL DEFAULT NULL COMMENT '电流报警阀值' ,
`temperature_threshold`  int(11) NULL DEFAULT NULL COMMENT '温度报警阀值' ,
`humidity_threshold`  int(11) NULL DEFAULT NULL COMMENT '湿度报警阀值' ,
`lightness_threshold`  int(11) NULL DEFAULT NULL COMMENT '亮度报警阀值' ,
`voltage_overload`  int(11) NULL DEFAULT NULL COMMENT '电压过载阀值' ,
`current_overload`  int(11) NULL DEFAULT NULL COMMENT '电流过载阀值' ,
`temperature_overload`  int(11) NULL DEFAULT NULL COMMENT '温度过载阀值' ,
`humidity_overload`  int(11) NULL DEFAULT NULL COMMENT '师傅过载阀值' ,
`lightness_overload`  int(11) NULL DEFAULT NULL COMMENT '亮度过载阀值' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of sys_light_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_light_info` VALUES ('1', '1001', 'xx1路灯', '0', '0', '1', '4', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('2', '1002', 'xx2路灯', '1', '0', '0', '4', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('3', '1003', 'xx3路灯', '1', '0', '0', '4', '2', '1', '160', '0', '0', '0', '0', '0', '90', '0', '0', '0'), ('4', '1004', 'xx4路灯', '0', '0', '0', '4', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('5', '1005', 'xx5路灯', '0', '0', '0', '4', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('6', '1006', 'xx6路灯', '0', '0', '0', '4', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('7', '1007', 'xx7路灯', '0', '0', '0', '4', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('8', '1008', 'xx8路灯', '1', '0', '0', '4', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('9', '1009', 'xx9路灯', '1', '0', '0', '4', '5', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('10', '1010', 'xx10路灯', '1', '0', '0', '4', '3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('11', '1011', 'xx11路灯', '1', '0', '0', '4', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'), ('12', '1012', 'xx12路灯', '0', '0', '0', '4', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_light_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_light_record`;
CREATE TABLE `sys_light_record` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`r_date`  datetime NULL DEFAULT NULL COMMENT '记录时间' ,
`r_status`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录状态' ,
`r_operation`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录操作' ,
`r_userid`  bigint(20) NULL DEFAULT NULL COMMENT '谁进行了操作' ,
`code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应sys_light_info里的code' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of sys_light_record
-- ----------------------------
BEGIN;
INSERT INTO `sys_light_record` VALUES ('1', '2016-06-16 11:15:33', '更新路灯', '对路灯位置进行了修改', '1', '1008'), ('2', '2017-12-22 11:01:56', '指派路灯', '对路灯指派了维修人员', '2', '1001');
COMMIT;

-- ----------------------------
-- Table structure for sys_light_strategy
-- ----------------------------
DROP TABLE IF EXISTS `sys_light_strategy`;
CREATE TABLE `sys_light_strategy` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`smooth_level`  int(10) NULL DEFAULT NULL COMMENT '车流量少时的亮度' ,
`traffic_level`  int(10) NULL DEFAULT NULL COMMENT '车流量多时的亮度' ,
`open_time`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开时间' ,
`close_time`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关闭时间' ,
`type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '冬季，夏季' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of sys_light_strategy
-- ----------------------------
BEGIN;
INSERT INTO `sys_light_strategy` VALUES ('1', '200', '255', '18:00:00', '07:00:00', '春季'), ('2', '180', '255', '19:45:00', '05:30:00', '夏季'), ('3', '180', '255', '19:00:00', '06:00:00', '秋季'), ('4', '220', '255', '17:45:00', '07:25:00', '冬季');
COMMIT;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`url`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址' ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url描述' ,
`perms`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=27

;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('1', '/user/user.jsp', '用户列表', 'sys:user:list,sys:user:info'), ('2', '/user/edit.jsp', '用户添加', 'sys:user:save,sys:role:select'), ('3', '/user/edit.jsp', '用户删除', 'sys:user:delete'), ('4', '/user/edit.jsp', '用户更新', 'sys:user:update,sys:role:select'), ('5', '', '用户Session踢出', 'sys:user:kickout'), ('6', '', '用户激活&禁止', 'sys:user:status'), ('7', '/role/role.jsp', '角色列表', 'sys:role:list,sys:role:info'), ('8', '/role/edit.jsp', '角色删除', 'sys:role:delete'), ('9', '/role/edit.jsp', '角色添加', 'sys:role:save'), ('10', '/role/edit.jsp', '角色更新', 'sys:role:update'), ('11', '/permission/permission.jsp', '权限列表', 'sys:permission:list,sys:permission:info'), ('12', '/permission/edit.jsp', '权限添加', 'sys:permission:save'), ('13', '/permission/edit.jsp', '权限删除', 'sys:permission:delete'), ('14', '/permission/edit.jsp', '权限更新', 'sys:permission:update'), ('15', '/city/city.jsp', '城市列表', 'sys:city:list,sys:city:info'), ('16', '/city/edit.jsp', '城市添加', 'sys:city:save'), ('17', '/city/edit.jsp', '城市删除', 'sys:city:delete'), ('18', '/city/edit.jsp', '城市更新', 'sys:city:update'), ('19', '/area/area.jsp', '区列表', 'sys:area:list,sys:area:info'), ('20', '/area/edit.jsp', '区添加', 'sys:area:save'), ('21', '/area/edit.jsp', '区删除', 'sys:area:delete'), ('22', '/area/edit.jsp', '区更新', 'sys:area:update'), ('23', '/street/street.jsp', '街道列表', 'sys:street:list,sys:street:info'), ('24', '/street/edit.jsp', '街道添加', 'sys:street:save'), ('25', '/street/edit.jsp', '街道删除', 'sys:street:delete'), ('26', '/street/edit.jsp', '街道更新', 'sys:street:update');
COMMIT;

-- ----------------------------
-- Table structure for sys_permission_init
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_init`;
CREATE TABLE `sys_permission_init` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址' ,
`permission_init`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需要具备的权限' ,
`sort`  int(50) NULL DEFAULT NULL COMMENT '排序' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=15

;

-- ----------------------------
-- Records of sys_permission_init
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission_init` VALUES ('1', '/static/**', 'anon', '1'), ('2', '/ajaxLogin', 'anon', '2'), ('3', '/logout', 'logout', '3'), ('4', '/**', 'kickout,perms[sys:user:list],authc', '3'), ('5', '/getGifCode', 'anon', '2'), ('6', '/kickout', 'anon', '2'), ('7', '/userLogin', 'anon', '2'), ('12', '/favicon.ico', 'anon', '2'), ('13', '/login', 'anon', '2'), ('14', '/403', 'anon', '2');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`name`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称' ,
`type`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色类型' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', 'admin', '100004'), ('2', 'user', '100001'), ('3', 'worker', '100002');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`rid`  bigint(20) NULL DEFAULT NULL COMMENT '角色ID' ,
`pid`  bigint(20) NULL DEFAULT NULL COMMENT '权限ID' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=20

;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES ('1', '1', '1'), ('2', '1', '2'), ('3', '1', '3'), ('4', '1', '4'), ('5', '1', '5'), ('6', '1', '6'), ('7', '1', '7'), ('8', '1', '8'), ('9', '1', '9'), ('10', '1', '10'), ('11', '1', '11'), ('12', '1', '12'), ('13', '1', '13'), ('14', '1', '14'), ('15', '2', '2'), ('16', '2', '3'), ('17', '2', '4'), ('18', '2', '5'), ('19', '3', '6');
COMMIT;

-- ----------------------------
-- Table structure for sys_street
-- ----------------------------
DROP TABLE IF EXISTS `sys_street`;
CREATE TABLE `sys_street` (
`id`  bigint(10) NOT NULL AUTO_INCREMENT ,
`street_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道名称' ,
`street_id`  int(11) NULL DEFAULT NULL COMMENT '街道所属id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of sys_street
-- ----------------------------
BEGIN;
INSERT INTO `sys_street` VALUES ('1', '莲城街道', '10011'), ('2', '九龙街道', '10021'), ('3', '尖山街道', '20011'), ('4', '老城街道', '20021'), ('5', '莲花路', '60021'), ('6', '曙建路', '60033'), ('7', '桂林路', '60030');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`nickname`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称' ,
`username`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pswd`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码' ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱|登录帐号' ,
`create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间' ,
`last_login_time`  datetime NULL DEFAULT NULL COMMENT '最后登录时间' ,
`status`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1:有效，0:禁止登录' ,
`create_name_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`last_update_time`  datetime NULL DEFAULT NULL ,
`last_update_name_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=28

;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', 'l9a0lajfwQ3VRSh4jUUJSQ==', '15255257895', 'admin@qq.com', '2016-06-16 11:15:33', '2018-01-07 19:29:44', '1', null, null, null), ('2', '张三', 'zhang', 'eC/MmhASeJBCbfh7W0YU1A==', '13316998986', '123@123.com', '2017-12-24 19:37:40', null, '1', '1', null, null), ('3', '李四', 'lisi', 'bR28UodwBWRDm+buWIaZbg==', '15575590909', '321@123.com', '2017-12-24 19:38:06', null, '1', '1', null, null), ('4', '王五', 'wangwu', 'Yb7Dc8/cPeCL8NwOjnYSRA==', '13317979888', '456@123.com', '2017-12-24 19:38:30', null, '1', '1', null, null), ('20', '罗总', 'luo', '7NjQPajcVm2j1j8LIfaQew==', '15575889999', '123@123.com', '2017-12-25 10:33:48', '2018-01-03 18:07:51', '1', '1', null, null), ('21', '权哥', 'quan', '7NjQPajcVm1dzbZMJvVcRA==', '15475878981', '132@123.com', '2017-12-25 10:34:26', null, '1', '1', null, null), ('22', '老司机', 'laosiji', '7NjQPajcVm1PC6tJMaodpQxtrQrzzUma', '15585858585', '123@123.com', '2017-12-25 10:34:55', '2017-12-25 10:36:52', '1', '1', null, null), ('25', '赵总', 'zxb', '7NjQPajcVm3rcjWOTacgxQ==', '13816214814', '460837364@qq.com', '2017-12-26 11:11:50', '2018-01-03 10:43:37', '1', '20', null, null), ('26', '哈哈哈哈哈', 'sunyy', '8AetwF4m3o3Y4JDqkLIeLA==', '13145678961', '2222@11.COM', '2017-12-27 13:59:21', '2018-01-03 16:17:03', '1', '1', '2018-01-03 15:09:37', '1'), ('27', '武因生', '武因生', '7NjQPajcVm05iEcgH3wDZ/3531yNGT4C', '15821361405', 'wys484112@163.com', '2017-12-28 00:00:00', '2017-12-28 19:45:58', '1', null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_light
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_light`;
CREATE TABLE `sys_user_light` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`user_id`  bigint(20) NULL DEFAULT NULL COMMENT '用户ID' ,
`light_id`  bigint(20) NULL DEFAULT NULL COMMENT '路灯ID' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of sys_user_light
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_light` VALUES ('1', '2', '1'), ('2', '2', '2'), ('3', '2', '3'), ('4', '2', '4'), ('5', '2', '5'), ('6', '3', '6'), ('7', '3', '7'), ('8', '3', '8'), ('9', '3', '9'), ('10', '4', '10'), ('11', '4', '11'), ('12', '4', '12');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
`id`  bigint(20) NOT NULL AUTO_INCREMENT ,
`uid`  bigint(20) NULL DEFAULT NULL COMMENT '用户ID' ,
`rid`  bigint(20) NULL DEFAULT NULL COMMENT '角色ID' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=21

;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1', '1'), ('2', '2', '3'), ('3', '3', '3'), ('4', '4', '3'), ('13', '20', '1'), ('14', '21', '1'), ('15', '22', '1'), ('18', '25', '1'), ('19', '26', '1'), ('20', '27', '3');
COMMIT;

-- ----------------------------
-- Auto increment value for sys_area
-- ----------------------------
ALTER TABLE `sys_area` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for sys_area_street
-- ----------------------------
ALTER TABLE `sys_area_street` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for sys_city
-- ----------------------------
ALTER TABLE `sys_city` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for sys_city_area
-- ----------------------------
ALTER TABLE `sys_city_area` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for sys_light
-- ----------------------------
ALTER TABLE `sys_light` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for sys_light_group
-- ----------------------------
ALTER TABLE `sys_light_group` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for sys_light_info
-- ----------------------------
ALTER TABLE `sys_light_info` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for sys_light_record
-- ----------------------------
ALTER TABLE `sys_light_record` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for sys_light_strategy
-- ----------------------------
ALTER TABLE `sys_light_strategy` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for sys_permission
-- ----------------------------
ALTER TABLE `sys_permission` AUTO_INCREMENT=27;

-- ----------------------------
-- Auto increment value for sys_permission_init
-- ----------------------------
ALTER TABLE `sys_permission_init` AUTO_INCREMENT=15;

-- ----------------------------
-- Auto increment value for sys_role
-- ----------------------------
ALTER TABLE `sys_role` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for sys_role_permission
-- ----------------------------
ALTER TABLE `sys_role_permission` AUTO_INCREMENT=20;

-- ----------------------------
-- Auto increment value for sys_street
-- ----------------------------
ALTER TABLE `sys_street` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for sys_user
-- ----------------------------
ALTER TABLE `sys_user` AUTO_INCREMENT=28;

-- ----------------------------
-- Auto increment value for sys_user_light
-- ----------------------------
ALTER TABLE `sys_user_light` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for sys_user_role
-- ----------------------------
ALTER TABLE `sys_user_role` AUTO_INCREMENT=21;
