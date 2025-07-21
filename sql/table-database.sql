/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : table-database

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 21/07/2025 16:45:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer`  (
  `id` bigint(0) NOT NULL,
  `passenger_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `certificate` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `certificate_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES (1, '1', '1', '1', '1', '1');
INSERT INTO `buyer` VALUES (2, '2', '2', '22', '2', '2');

-- ----------------------------
-- Table structure for certificate
-- ----------------------------
DROP TABLE IF EXISTS `certificate`;
CREATE TABLE `certificate`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '乘客类型编号',
  `certificate` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证件编号',
  `discount` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '折扣',
  `certificate_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '证件类型',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `certificate_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger` (`certificate_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1469986299246145538 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of certificate
-- ----------------------------
INSERT INTO `certificate` VALUES (123456, '123456', '12', '12');
INSERT INTO `certificate` VALUES (1469941621075243009, '121121212', NULL, '省份证');
INSERT INTO `certificate` VALUES (1469986299246145537, '121121212', NULL, '省份证');

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '航班编号',
  `plane_id` bigint(0) NOT NULL COMMENT '飞机编号',
  `begin_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出发城市',
  `end_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目的城市',
  `begin_time` bigint(0) NOT NULL COMMENT '起飞时间',
  `end_time` bigint(0) NOT NULL COMMENT '抵达时间',
  `economy_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '经济舱价格',
  `business_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商务舱价格',
  `first_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头等舱价格',
  `flight_name` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '航班名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `plane_id`(`plane_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1471855563360759810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES (1, 122, '254', '1', 1, 1, '1', '1', '1', '1');
INSERT INTO `flight` VALUES (2, 22, '1', '1', 1, 1, '2', '22', '2', '2');
INSERT INTO `flight` VALUES (3, 3, '1', '1', 1, 1, '3', '3', '3', '33');
INSERT INTO `flight` VALUES (4, 4, '1', '1', 1, 1, '44', '4', '4', '4');
INSERT INTO `flight` VALUES (6, 6, '1', '1', 1, 1, '6', '6', '6', '6');
INSERT INTO `flight` VALUES (7, 7, '1', '1', 1, 1, '7', '77', '7', '7');
INSERT INTO `flight` VALUES (8, 88, '1', '1', 1, 1, '88', '8', '8', '8');
INSERT INTO `flight` VALUES (33, 33, '1', '1', 1, 1, '33', '3', '3', '3');
INSERT INTO `flight` VALUES (34, 1, '1', '1', 1, 1, '0', '00', '0', '0');
INSERT INTO `flight` VALUES (1471855563360759810, 1, '1', '2', 12, 1, '100', '200', '300', 'b0001');

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
  INDEX `flight_id`(`flight_id`) USING BTREE,
  CONSTRAINT `flight_discount_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1471855949932982274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight_discount
-- ----------------------------
INSERT INTO `flight_discount` VALUES (1471855949932982274, 100, 1639752778880, 1);

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '乘客编号',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客昵称',
  `user_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客登录密码',
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客电话',
  `certificate_id` bigint(0) NULL DEFAULT NULL COMMENT '乘客类型编号',
  `real_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客姓名',
  `gender` int(0) NULL DEFAULT NULL COMMENT '性别',
  `user_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '乘客头像',
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客邮箱',
  `role` int(0) NULL DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `certificate_id`(`certificate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1469986299111927810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES (1, '555', '8a8688d9a0d8210061875e24b09c5ff0', '123456789', 123456, '777', 2, '12', '123456789', 1);
INSERT INTO `passenger` VALUES (2, '56', '90542df11b039c78462022704cd25ac1', '56+', 56, '45', 45, '45', '45', NULL);
INSERT INTO `passenger` VALUES (1469941617493307393, 'test01', '398d37bbd7f9e114587d7fbec82c86bd', '1212', 1469941621075243009, '何勇强', 0, NULL, '1212', NULL);
INSERT INTO `passenger` VALUES (1469986299111927809, 'test0hjgjhg1', '90542df11b039c78462022704cd25ac1', '1212', 1469986299246145537, '何勇强', 0, NULL, '1212', NULL);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '支付编号',
  `user_id` bigint(0) NOT NULL COMMENT '用户编号',
  `ticket_id` bigint(0) NOT NULL COMMENT '机票编号',
  `buyer_id` bigint(0) NOT NULL COMMENT '乘客编号',
  `ispay` tinyint(0) NOT NULL COMMENT '是否支付',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticket_id`(`ticket_id`) USING BTREE,
  INDEX `buyer_id`(`buyer_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `pay_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `passenger` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1470782455269711873 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (1, 1, 1, 1, 1);
INSERT INTO `pay` VALUES (2, 2, 2, 1, 1);
INSERT INTO `pay` VALUES (1470782455269711873, 1, 1470782455248740354, 1, 1);

-- ----------------------------
-- Table structure for plane
-- ----------------------------
DROP TABLE IF EXISTS `plane`;
CREATE TABLE `plane`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '飞机编号',
  `plane_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '飞机名字',
  `plane_model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '飞机型号',
  `economy_seat` int(0) NOT NULL COMMENT '经济舱座位数',
  `business_seat` int(0) NOT NULL COMMENT '商务舱座位数',
  `first_seat` int(0) NOT NULL COMMENT '头等舱座位数',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `plane_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flight` (`plane_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `plane_ibfk_2` FOREIGN KEY (`id`) REFERENCES `recommend` (`plane_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plane
-- ----------------------------
INSERT INTO `plane` VALUES (1, '1', '1', 1, 1, 1);

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '推荐航班编号',
  `plane_id` bigint(0) NOT NULL COMMENT '飞机编号',
  `begin_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出发城市',
  `end_city` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目的城市',
  `begin_time` bigint(0) NOT NULL COMMENT '起飞时间',
  `end_time` bigint(0) NOT NULL COMMENT '抵达时间',
  `economy_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '经济舱价格',
  `business_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商务舱价格',
  `first_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头等舱价格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `plane_id`(`plane_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (1, 1, '1', '1', 11, 1, '1', '1', '1');

-- ----------------------------
-- Table structure for salesman
-- ----------------------------
DROP TABLE IF EXISTS `salesman`;
CREATE TABLE `salesman`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '业务员编号',
  `salesman_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务员名称',
  `salesman_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务员密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salesman
-- ----------------------------
INSERT INTO `salesman` VALUES (1, '1', '1');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '机票编号',
  `flight_id` bigint(0) NOT NULL COMMENT '航班编号',
  `plane_id` bigint(0) NOT NULL COMMENT '飞机编号',
  `ticket_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机票价格',
  `sell` tinyint(0) NOT NULL COMMENT '机票售卖信息',
  `seat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机舱座位',
  `grade` int(0) NOT NULL COMMENT '机舱等级',
  `flight_day` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '起飞日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `plane_id`(`plane_id`) USING BTREE,
  INDEX `flight_id`(`flight_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1470782455248740354 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (1, 1, 1, '1', 0, '1', 1, '11');
INSERT INTO `ticket` VALUES (2, 1, 1, '1', 1, '1', 1, '1');
INSERT INTO `ticket` VALUES (3, 3, 3, '3', 3, '3', 3, '3');
INSERT INTO `ticket` VALUES (5, 5, 5, '55', 5, '5', 5, '5');
INSERT INTO `ticket` VALUES (7, 7, 7, '7', 7, '7', 7, '7');
INSERT INTO `ticket` VALUES (1470782455248740354, 1, 11, '888', 1, '2', 2, '8888');

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
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客理由',
  `passenger_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客姓名',
  `passenger_telephone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '乘客电话',
  `ticket_price` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机票价格',
  `time` bigint(0) NOT NULL COMMENT '申诉时间',
  `iswatch` tinyint(1) NOT NULL COMMENT '是否处理',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ticket_id`(`ticket_id`) USING BTREE,
  INDEX `flight_id`(`flight_id`) USING BTREE,
  CONSTRAINT `ticket_return_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_return_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `passenger` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_return_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1470790371871723522 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_return
-- ----------------------------
INSERT INTO `ticket_return` VALUES (1, 1, 1, 1, 1, '1', '1', '11', '1', 1, 1);
INSERT INTO `ticket_return` VALUES (1470789985941241858, 1, 1, 1, 1, '222', '777', '123456789', '1', 1639498633254, 0);
INSERT INTO `ticket_return` VALUES (1470790371871723522, 1, 1, 1, 1, '222', '777', '123456789', '1', 1639498725268, 0);

SET FOREIGN_KEY_CHECKS = 1;
