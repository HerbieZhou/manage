/*
 Navicat Premium Data Transfer

 Source Server         : Alicoud
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 101.37.76.65:3306
 Source Schema         : housemanger

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 12/04/2021 18:49:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Store
-- ----------------------------
DROP TABLE IF EXISTS `Store`;
CREATE TABLE `Store`  (
  `storeid` int(255) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `housename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `goodsnumber` int(255) NOT NULL,
  PRIMARY KEY (`storeid`) USING BTREE,
  INDEX `goodsname`(`goodsname`) USING BTREE,
  INDEX `housename`(`housename`) USING BTREE,
  CONSTRAINT `goodsname` FOREIGN KEY (`goodsname`) REFERENCES `goods` (`goodsname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `housename` FOREIGN KEY (`housename`) REFERENCES `houses` (`housename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Store
-- ----------------------------
INSERT INTO `Store` VALUES (1, '可比克', '余岗A', 1384);
INSERT INTO `Store` VALUES (2, '好吃点', '余岗B', 962);
INSERT INTO `Store` VALUES (3, '可比克', '北区13', 1370);
INSERT INTO `Store` VALUES (4, '好吃点', '北区14', 1326);
INSERT INTO `Store` VALUES (12, '可比克', '北区14', 1683);
INSERT INTO `Store` VALUES (13, '可比克', '余岗B', 400);
INSERT INTO `Store` VALUES (14, '好吃点', '余岗A', 111);
INSERT INTO `Store` VALUES (15, '好吃点', '北区13', 181);

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User`  (
  `Username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `powerid` int(10) NOT NULL,
  PRIMARY KEY (`Username`) USING BTREE,
  INDEX `pwer`(`powerid`) USING BTREE,
  CONSTRAINT `pwer` FOREIGN KEY (`powerid`) REFERENCES `power` (`powerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('111', '111', 1);
INSERT INTO `User` VALUES ('123', '123', 2);
INSERT INTO `User` VALUES ('123123', '123', 3);
INSERT INTO `User` VALUES ('admin', 'admin', 1);
INSERT INTO `User` VALUES ('cz', '111', 2);
INSERT INTO `User` VALUES ('czqczq', '123', 4);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goodsname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `goodsclass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`goodsname`) USING BTREE,
  INDEX `goodsname`(`goodsname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('可比克', '薯片');
INSERT INTO `goods` VALUES ('好吃点', '饼干');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `Hname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Haddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Hname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('123', '123');
INSERT INTO `house` VALUES ('newhouse1', 'newhouse1');
INSERT INTO `house` VALUES ('newhouse2', 'newhouse2');
INSERT INTO `house` VALUES ('newhouse3', 'newhouse3');

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses`  (
  `housename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `houseaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`housename`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of houses
-- ----------------------------
INSERT INTO `houses` VALUES ('余岗A', '湖北省襄阳市樊城区长虹北路');
INSERT INTO `houses` VALUES ('余岗B', '湖北省襄阳市樊城区长虹北路');
INSERT INTO `houses` VALUES ('北区13', '武汉科技大学北区14');
INSERT INTO `houses` VALUES ('北区14', '武汉科技大学北区14');

-- ----------------------------
-- Table structure for inOutList
-- ----------------------------
DROP TABLE IF EXISTS `inOutList`;
CREATE TABLE `inOutList`  (
  `ListId` int(10) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `housename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inOutWay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inOutTime` datetime NULL,
  `inOutNumber` int(50) NOT NULL,
  PRIMARY KEY (`ListId`) USING BTREE,
  INDEX `listHouse`(`housename`) USING BTREE,
  INDEX `listGoods`(`goodsname`) USING BTREE,
  CONSTRAINT `listHouse` FOREIGN KEY (`housename`) REFERENCES `houses` (`housename`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `listGoods` FOREIGN KEY (`goodsname`) REFERENCES `goods` (`goodsname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inOutList
-- ----------------------------
INSERT INTO `inOutList` VALUES (1, '好吃点', '北区14', '出库', '2021-03-18 20:11:27', 11);
INSERT INTO `inOutList` VALUES (2, '好吃点', '北区14', '入库', '2021-03-18 20:11:53', 11);
INSERT INTO `inOutList` VALUES (3, '可比克', '北区14', '入库', '2021-03-18 20:12:04', 11);
INSERT INTO `inOutList` VALUES (4, '可比克', '北区14', '入库', '2021-03-18 20:12:17', 11);
INSERT INTO `inOutList` VALUES (5, '可比克', '北区14', '入库', '2021-03-18 20:12:19', 11);
INSERT INTO `inOutList` VALUES (6, '可比克', '余岗B', '入库', '2021-03-18 20:12:22', 11);
INSERT INTO `inOutList` VALUES (7, '可比克', '余岗B', '出库', '2021-03-18 20:12:26', 11);
INSERT INTO `inOutList` VALUES (8, '可比克', '北区13', '出库', '2021-03-18 20:12:32', 11);
INSERT INTO `inOutList` VALUES (9, '可比克', '北区14', '出库', '2021-03-18 20:12:35', 11);
INSERT INTO `inOutList` VALUES (10, '可比克', '余岗A', '出库', '2021-03-18 20:12:39', 11);
INSERT INTO `inOutList` VALUES (11, '好吃点', '余岗A', '入库', '2021-03-18 20:12:45', 11);
INSERT INTO `inOutList` VALUES (12, '好吃点', '余岗A', '入库', '2021-03-18 20:12:49', 100);
INSERT INTO `inOutList` VALUES (13, '好吃点', '北区14', '出库', '2021-03-18 20:25:16', 1);
INSERT INTO `inOutList` VALUES (14, '好吃点', '北区14', '出库', '2021-03-18 20:25:55', 1);
INSERT INTO `inOutList` VALUES (15, '好吃点', '北区14', '出库', '2021-03-19 09:55:30', 11);
INSERT INTO `inOutList` VALUES (16, '好吃点', '北区14', '出库', '2021-03-20 20:32:20', 11);
INSERT INTO `inOutList` VALUES (17, '好吃点', '北区14', '入库', '2021-03-20 20:32:28', 200);
INSERT INTO `inOutList` VALUES (18, '可比克', '北区14', '入库', '2021-03-20 20:32:32', 200);
INSERT INTO `inOutList` VALUES (19, '可比克', '余岗B', '入库', '2021-03-20 20:32:35', 200);
INSERT INTO `inOutList` VALUES (20, '可比克', '余岗A', '入库', '2021-03-20 20:32:38', 200);
INSERT INTO `inOutList` VALUES (21, '可比克', '北区13', '入库', '2021-03-20 20:32:42', 200);
INSERT INTO `inOutList` VALUES (22, '好吃点', '北区13', '入库', '2021-03-20 20:32:45', 200);
INSERT INTO `inOutList` VALUES (23, '可比克', '北区13', '入库', '2021-03-20 20:32:48', 200);
INSERT INTO `inOutList` VALUES (24, '可比克', '余岗B', '入库', '2021-03-20 20:32:51', 200);
INSERT INTO `inOutList` VALUES (25, '可比克', '余岗A', '入库', '2021-03-20 20:32:54', 200);
INSERT INTO `inOutList` VALUES (26, '可比克', '北区14', '入库', '2021-03-20 20:32:58', 200);
INSERT INTO `inOutList` VALUES (27, '好吃点', '北区14', '入库', '2021-03-20 20:33:02', 200);
INSERT INTO `inOutList` VALUES (28, '可比克', '北区14', '入库', '2021-03-20 20:33:05', 200);
INSERT INTO `inOutList` VALUES (29, '可比克', '北区14', '出库', '2021-03-20 20:33:14', 19);
INSERT INTO `inOutList` VALUES (30, '好吃点', '北区14', '出库', '2021-03-20 20:33:17', 19);
INSERT INTO `inOutList` VALUES (31, '好吃点', '余岗B', '出库', '2021-03-20 20:33:20', 19);
INSERT INTO `inOutList` VALUES (32, '好吃点', '余岗B', '出库', '2021-03-20 20:33:27', 19);
INSERT INTO `inOutList` VALUES (33, '好吃点', '北区13', '出库', '2021-03-20 20:33:31', 19);
INSERT INTO `inOutList` VALUES (34, '可比克', '北区13', '出库', '2021-03-20 20:33:34', 19);
INSERT INTO `inOutList` VALUES (35, '可比克', '北区14', '出库', '2021-03-20 20:33:38', 19);
INSERT INTO `inOutList` VALUES (36, '好吃点', '北区14', '出库', '2021-03-20 20:33:40', 19);
INSERT INTO `inOutList` VALUES (37, '好吃点', '北区14', '出库', '2021-03-20 20:36:46', 1);
INSERT INTO `inOutList` VALUES (38, '可比克', '北区14', '出库', '2021-03-20 20:36:51', 1);
INSERT INTO `inOutList` VALUES (39, '可比克', '余岗A', '出库', '2021-03-20 20:36:54', 1);
INSERT INTO `inOutList` VALUES (40, '可比克', '余岗A', '出库', '2021-03-20 20:36:56', 1);
INSERT INTO `inOutList` VALUES (41, '可比克', '余岗A', '出库', '2021-03-20 20:36:59', 1);
INSERT INTO `inOutList` VALUES (42, '可比克', '余岗A', '出库', '2021-03-20 20:37:04', 1);
INSERT INTO `inOutList` VALUES (43, '可比克', '余岗A', '出库', '2021-03-20 20:37:06', 1);

-- ----------------------------
-- Table structure for inhouse
-- ----------------------------
DROP TABLE IF EXISTS `inhouse`;
CREATE TABLE `inhouse`  (
  `Hname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Hname`, `Sname`) USING BTREE,
  INDEX `Sname`(`Sname`) USING BTREE,
  CONSTRAINT `Hname` FOREIGN KEY (`Hname`) REFERENCES `house` (`Hname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`Hname`) REFER `housemange/house`(`Hname`) ON UPDATE CASC' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inhouse
-- ----------------------------
INSERT INTO `inhouse` VALUES ('123', 'newstore1', '191');
INSERT INTO `inhouse` VALUES ('123', 'newstore2', '1');

-- ----------------------------
-- Table structure for inlist
-- ----------------------------
DROP TABLE IF EXISTS `inlist`;
CREATE TABLE `inlist`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Hname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sumprice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Inumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inlist
-- ----------------------------
INSERT INTO `inlist` VALUES (1, '123', 'newstore1', '100', '10', '2020/09/04 17:36:53');
INSERT INTO `inlist` VALUES (2, '123', 'newstore1', '100', '10', '2020/09/06 10:19:15');
INSERT INTO `inlist` VALUES (3, '123', 'newstore1', '1', '1', '2020/09/06 10:38:46');
INSERT INTO `inlist` VALUES (4, '123', 'newstore1', '1', '1', '2020/09/06 10:40:02');
INSERT INTO `inlist` VALUES (5, '123', 'newstore2', '1', '1', '2020/09/06 10:40:16');
INSERT INTO `inlist` VALUES (6, '123', 'newstore2', '1', '1', '2020/09/06 10:41:53');
INSERT INTO `inlist` VALUES (7, '123', 'newstore1', '100', '100', '2020/09/06 10:55:58');
INSERT INTO `inlist` VALUES (8, '123', 'newstore1', '12300', '100', '2020/10/06 17:25:16');

-- ----------------------------
-- Table structure for outlist
-- ----------------------------
DROP TABLE IF EXISTS `outlist`;
CREATE TABLE `outlist`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Hname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Onumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of outlist
-- ----------------------------
INSERT INTO `outlist` VALUES (1, '123', 'newstore1', '10', '100', '2020/09/04 17:48:31');
INSERT INTO `outlist` VALUES (2, '123', 'newstore1', '10', '100', '2020/09/04 17:48:32');
INSERT INTO `outlist` VALUES (3, '123', 'newstore1', '10', '10', '2020/09/06 10:59:58');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power`  (
  `powerid` int(11) NOT NULL,
  `power` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`powerid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES (1, '管理员');
INSERT INTO `power` VALUES (2, '系统管理员');
INSERT INTO `power` VALUES (3, '仓库管理员');
INSERT INTO `power` VALUES (4, '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
