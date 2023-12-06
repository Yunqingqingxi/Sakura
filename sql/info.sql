/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : userdata

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 04/12/2023 17:39:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`
(
    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `sex`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `email`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `age`      int                                                           NULL DEFAULT NULL,
    PRIMARY KEY (`username`, `email`) USING BTREE,
    CONSTRAINT `info_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info`
VALUES ('0', 'hk', '女', '111', 22);
INSERT INTO `info`
VALUES ('0', 'hk', '男', '13312122@qq.com', 12);
INSERT INTO `info`
VALUES ('0', 'hk', '男', '13312422@qq.com', 12);
INSERT INTO `info`
VALUES ('1213', 'hk', '女', '1533142@qq.com', 11);
INSERT INTO `info`
VALUES ('2', '12', '男', '12', 21);
INSERT INTO `info`
VALUES ('3', NULL, NULL, '11', NULL);

SET FOREIGN_KEY_CHECKS = 1;
