/*
Navicat MySQL Data Transfer

Source Server         : 39.107.113.111(阿里云)
Source Server Version : 80011
Source Host           : 39.107.113.111:3306
Source Database       : ioe

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2022-04-16 09:40:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ioe
-- ----------------------------
DROP TABLE IF EXISTS `ioe`;
CREATE TABLE `ioe` (
  `id` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `expressdeliveryid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
