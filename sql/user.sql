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

 Date: 04/12/2023 17:39:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES ('0', '1');
INSERT INTO `user`
VALUES ('1213', '1');
INSERT INTO `user`
VALUES ('123', '1');
INSERT INTO `user`
VALUES ('1234', '1');
INSERT INTO `user`
VALUES ('2', '000');
INSERT INTO `user`
VALUES ('3', '1');
INSERT INTO `user`
VALUES ('5435', '2');
INSERT INTO `user`
VALUES ('hk', '1');

SET FOREIGN_KEY_CHECKS = 1;
