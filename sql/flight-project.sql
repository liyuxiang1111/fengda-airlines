/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : flight-project

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 22/07/2025 15:02:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户编号',
  `flight_id` bigint(0) NOT NULL COMMENT '航班编号',
  `action_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行为类型',
  `action_count` int(0) NULL DEFAULT NULL COMMENT '行为次数',
  `action_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行为时间',
  `weight` double NOT NULL COMMENT '权重',
  PRIMARY KEY (`user_id`, `flight_id`, `action_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer`  (
  `id` bigint(0) NOT NULL,
  `passenger_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `certificate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `certificate_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for certificate
-- ----------------------------
DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '乘客类型编号',
  `certificate` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '证件编号',
  `discount` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '折扣',
  `certificate_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '证件类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1524682592585207811 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `city_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `airport_count` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '航班编号',
  `plane_id` bigint(0) NOT NULL COMMENT '飞机编号',
  `begin_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '出发城市',
  `end_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目的城市',
  `begin_time` bigint(0) NOT NULL COMMENT '起飞时间',
  `end_time` bigint(0) NOT NULL COMMENT '抵达时间',
  `economy_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '经济舱价格',
  `business_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商务舱价格',
  `first_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头等舱价格',
  `flight_name` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '航班名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `search_city`(`begin_city`, `end_city`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1471855563360759811 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flight_discount
-- ----------------------------
DROP TABLE IF EXISTS `flight_discount`;
CREATE TABLE `flight_discount`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `discount` int(0) NOT NULL COMMENT '折扣',
  `discount_time` bigint(0) NOT NULL COMMENT '折扣开始时间',
  `flight_id` bigint(0) NOT NULL COMMENT '航班编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `flight_id`(`flight_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1471855949932982275 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '乘客编号',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '乘客昵称',
  `user_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乘客登录密码',
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乘客电话',
  `certificate_id` bigint(0) NULL DEFAULT NULL COMMENT '乘客类型编号',
  `real_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乘客姓名',
  `gender` int(0) NULL DEFAULT NULL COMMENT '性别',
  `user_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '乘客头像',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乘客邮箱',
  `role` int(0) NULL DEFAULT NULL COMMENT '身份',
  `is_delete` int(0) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `certificate_id`(`certificate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1524681714373447683 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '支付编号',
  `user_id` bigint(0) NOT NULL COMMENT '用户编号',
  `ticket_id` bigint(0) NOT NULL COMMENT '机票编号',
  `ispay` tinyint(0) NOT NULL COMMENT '是否支付',
  `is_delete` int(0) NULL DEFAULT NULL COMMENT '是否删除',
  `pay_time` bigint(0) NULL DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticket_id`(`ticket_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `ispay`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1524958833599021058 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plane
-- ----------------------------
DROP TABLE IF EXISTS `plane`;
CREATE TABLE `plane`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '飞机编号',
  `plane_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飞机名字',
  `plane_model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飞机型号',
  `economy_seat` int(0) NOT NULL COMMENT '经济舱座位数',
  `business_seat` int(0) NOT NULL COMMENT '商务舱座位数',
  `first_seat` int(0) NOT NULL COMMENT '头等舱座位数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '推荐航班编号',
  `plane_id` bigint(0) NOT NULL COMMENT '飞机编号',
  `begin_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '出发城市',
  `end_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目的城市',
  `begin_time` bigint(0) NOT NULL COMMENT '起飞时间',
  `end_time` bigint(0) NOT NULL COMMENT '抵达时间',
  `economy_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '经济舱价格',
  `business_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商务舱价格',
  `first_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头等舱价格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `plane_id`(`plane_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for salesman
-- ----------------------------
DROP TABLE IF EXISTS `salesman`;
CREATE TABLE `salesman`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '业务员编号',
  `salesman_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务员名称',
  `salesman_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务员密码',
  `login_time` bigint(0) NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '机票编号',
  `flight_id` bigint(0) NOT NULL COMMENT '航班编号',
  `plane_id` bigint(0) NOT NULL COMMENT '飞机编号',
  `ticket_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机票价格',
  `sell` tinyint(0) NOT NULL COMMENT '机票售卖信息',
  `seat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机舱座位',
  `grade` int(0) NOT NULL COMMENT '机舱等级',
  `flight_day` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '起飞日期',
  `detail_id` bigint(0) NOT NULL COMMENT '登机者编号',
  `is_delete` int(0) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticket_search`(`id`, `sell`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1524958833523523587 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ticket_return
-- ----------------------------
DROP TABLE IF EXISTS `ticket_return`;
CREATE TABLE `ticket_return`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '退票编号',
  `flight_id` bigint(0) NOT NULL COMMENT '航班编号',
  `user_id` bigint(0) NOT NULL COMMENT '乘客编号',
  `ticket_id` bigint(0) NOT NULL COMMENT '机票编号',
  `seat` int(0) NOT NULL COMMENT '座位',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乘客理由',
  `passenger_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乘客姓名',
  `passenger_telephone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '乘客电话',
  `ticket_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '机票价格',
  `time` bigint(0) NOT NULL COMMENT '申诉时间',
  `iswatch` tinyint(1) NOT NULL COMMENT '是否处理',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ticket_id`(`ticket_id`) USING BTREE,
  INDEX `flight_id`(`flight_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1524957661853089795 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
