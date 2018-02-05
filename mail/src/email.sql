/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : email

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2018-02-05 14:35:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment` (
  `id` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件';

-- ----------------------------
-- Records of t_attachment
-- ----------------------------
INSERT INTO `t_attachment` VALUES ('0cd627a1-01ae-11e8-b5f5-4ccc6ae02670', '3.jpg', 'image/3.jpg', '2018-01-25 17:00:55');

-- ----------------------------
-- Table structure for t_email
-- ----------------------------
DROP TABLE IF EXISTS `t_email`;
CREATE TABLE `t_email` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `send_time` datetime DEFAULT NULL,
  `post_id` varchar(255) DEFAULT NULL COMMENT '发送人id',
  `state` int(1) DEFAULT NULL COMMENT '删除状态，0未删除1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件，发件';

-- ----------------------------
-- Records of t_email
-- ----------------------------
INSERT INTO `t_email` VALUES ('08476bbb-027b-11e8-b5f5-4ccc6ae02670', 't2', 'c2', '2018-01-26 17:27:03', '6aede746-0197-11e8-b5f5-4ccc6ae02670', '0');
INSERT INTO `t_email` VALUES ('08c230f5-027b-11e8-b5f5-4ccc6ae02670', 't1', 'c1', '2018-01-26 17:27:07', '6aede746-0197-11e8-b5f5-4ccc6ae02670', '0');
INSERT INTO `t_email` VALUES ('111792d8-01ae-11e8-b5f5-4ccc6ae02670', '主题', '内容', '2018-01-25 17:01:17', '6aede746-0197-11e8-b5f5-4ccc6ae02670', '0');

-- ----------------------------
-- Table structure for t_email_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_email_attach`;
CREATE TABLE `t_email_attach` (
  `id` varchar(255) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `attach_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件附件';

-- ----------------------------
-- Records of t_email_attach
-- ----------------------------
INSERT INTO `t_email_attach` VALUES ('7610adfd-01ae-11e8-b5f5-4ccc6ae02670', '111792d8-01ae-11e8-b5f5-4ccc6ae02670', '0cd627a1-01ae-11e8-b5f5-4ccc6ae02670');

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` varchar(55) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '分组所属用户',
  `p_id` varchar(55) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组';

-- ----------------------------
-- Records of t_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_group_user
-- ----------------------------
DROP TABLE IF EXISTS `t_group_user`;
CREATE TABLE `t_group_user` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '删除状态0未删除1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组用户';

-- ----------------------------
-- Records of t_group_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(55) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('26a59286-01ae-11e8-b5f5-4ccc6ae02670', 'test@qq.com', '123456a', 'test', null, 'image/2.jpg');
INSERT INTO `t_user` VALUES ('6aede746-0197-11e8-b5f5-4ccc6ae02670', 'admin@qq.com', '123456a', 'admin', null, 'image/3.jpg');

-- ----------------------------
-- Table structure for t_user_email
-- ----------------------------
DROP TABLE IF EXISTS `t_user_email`;
CREATE TABLE `t_user_email` (
  `id` varchar(255) NOT NULL,
  `receive_id` varchar(255) DEFAULT NULL COMMENT '接收人id',
  `read_state` int(11) DEFAULT NULL COMMENT '阅读状态，0未读1已读',
  `state` int(11) DEFAULT NULL COMMENT '删除状态,0未删除1删除至垃圾箱2删除',
  `email_id` varchar(255) DEFAULT NULL COMMENT '邮件id,t_email的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件，收件';

-- ----------------------------
-- Records of t_user_email
-- ----------------------------
INSERT INTO `t_user_email` VALUES ('14bce2c4-01ae-11e8-b5f5-4ccc6ae02670', '26a59286-01ae-11e8-b5f5-4ccc6ae02670', '0', '0', '111792d8-01ae-11e8-b5f5-4ccc6ae02670');
INSERT INTO `t_user_email` VALUES ('716192a8-027b-11e8-b5f5-4ccc6ae02670', '26a59286-01ae-11e8-b5f5-4ccc6ae02670', '0', '0', '08c230f5-027b-11e8-b5f5-4ccc6ae02670');
INSERT INTO `t_user_email` VALUES ('71864042-027b-11e8-b5f5-4ccc6ae02670', '26a59286-01ae-11e8-b5f5-4ccc6ae02670', '0', '0', '08476bbb-027b-11e8-b5f5-4ccc6ae02670');
