/*
Navicat MySQL Data Transfer

Source Server         : aishadingSaaS
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : aishadingsaas

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2023-06-15 16:46:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `shadesinfo`
-- ----------------------------
DROP TABLE IF EXISTS `shadesinfo`;
CREATE TABLE `shadesinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `task_type` varchar(255) DEFAULT NULL,
  `assetId` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `incident_angle_noffset` bigint DEFAULT '0',
  `incident_angle_poffset` bigint DEFAULT '0',
  `nightposition` bigint DEFAULT '0',
  `dni_value` bigint DEFAULT '0',
  `weeks` varchar(255) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  `postalCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  `windowType` varchar(255) DEFAULT NULL,
  `avgDegree` varchar(255) DEFAULT NULL,
  `winWidth` double(6,3) DEFAULT NULL,
  `winHeight` double(6,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5160 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of shadesinfo
-- ----------------------------
INSERT INTO `shadesinfo` VALUES ('5001', 'Task 1', 'Shades', '152304881', '1649156272173355050', 'Test_Group_01', 'Summer', '-30', '65', '0', '250', '0,1,2,3,4,5,6', '1', '2023-04-17 13:26:51', '2023-06-01 15:24:57', 'T2L2J9', 'America/Edmonton', '21a', 'East', '11.333', '43.222');
INSERT INTO `shadesinfo` VALUES ('5002', 'Task 2', 'Shades', '152304881', '1649156391039930370', 'Test_Group_02', 'Summer', '-50', '30', '100', '400', '1,2,3,4,5', '0', '2023-04-17 13:29:21', '2023-05-29 14:00:17', 'J5C1E9', 'America/Toronto', '1a', 'North-West', '3.233', '16.236');
INSERT INTO `shadesinfo` VALUES ('5003', 'Task 3', 'Shades', '152304881', '1649175992649912342', 'Test_Group_03', 'Winter', '-10', '80', '100', '400', '0,1,2,3,4,5,6', '0', '2023-04-17 13:29:24', '2023-05-29 15:21:08', 'T2E2P3', 'America/Edmonton', '5a', 'East', '11.333', '43.222');
INSERT INTO `shadesinfo` VALUES ('5158', 'Task 5', 'Shades', '152304881', '1651396073140256828', 'Zack_Test_Group', 'Winter', '-39', '28', '0', '250', '0,1,2,3,4,5,6', '0', '2023-06-01 18:58:49', '2023-06-01 18:59:47', 'T2L2J9', 'America/Edmonton', '21a', 'South-West', '123.560', '13.780');
INSERT INTO `shadesinfo` VALUES ('5159', 'Task 4', 'Shades', '152304881', '1651363627183120480', 'Test_Group_04', 'Summer', '-34', '54', '0', '400', '0,3,4,5', '0', '2023-06-01 19:00:55', '0000-00-00 00:00:00', 'T2L2J9', 'America/Edmonton', '29a', 'South-East', '457.650', '35.845');

-- ----------------------------
-- Table structure for `tasklog`
-- ----------------------------
DROP TABLE IF EXISTS `tasklog`;
CREATE TABLE `tasklog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupId` bigint DEFAULT NULL,
  `executiveTime` timestamp NULL DEFAULT NULL,
  `logs` varchar(255) DEFAULT NULL,
  `explanation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `deviceQuantity` bigint DEFAULT '0',
  `periodYear` varchar(255) DEFAULT NULL,
  `dayType` varchar(255) DEFAULT NULL,
  `periodDay` varchar(255) DEFAULT NULL,
  `positionValue` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of tasklog
-- ----------------------------
INSERT INTO `tasklog` VALUES ('295', '1649156272173355050', '2023-05-30 18:51:29', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('296', '1649156272173355050', '2023-05-30 18:55:55', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('297', '1649156272173355050', '2023-05-30 18:57:28', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('298', '1649156272173355050', '2023-05-30 19:01:54', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('299', '1649156272173355050', '2023-05-30 19:29:29', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('300', '1649156272173355050', '2023-05-30 19:33:35', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('301', '1649156272173355050', '2023-05-30 19:34:38', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('302', '1649156272173355050', '2023-05-30 19:36:35', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('303', '1649156272173355050', '2023-05-30 19:39:33', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('304', '1649156272173355050', '2023-05-30 19:41:09', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('305', '1649156272173355050', '2023-05-30 19:42:32', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('306', '1649156272173355050', '2023-05-30 19:45:03', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('307', '1649156272173355050', '2023-05-30 19:51:34', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('308', '1649156272173355050', '2023-05-30 19:53:42', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('309', '1649156272173355050', '2023-05-30 20:00:01', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('310', '1649156272173355050', '2023-05-30 20:00:35', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('311', '1649156272173355050', '2023-05-30 20:02:10', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('312', '1649156272173355050', '2023-05-31 13:26:08', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('313', '1649156272173355050', '2023-05-31 13:29:07', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('314', '1649156391039930370', '2023-05-31 13:29:09', '[{code=switch_1, value=false}]', 'explanation', '1', 'Summer', '1,2,3,4,5', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('315', '1649156272173355050', '2023-05-31 13:40:31', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('316', '1649156272173355050', '2023-05-31 13:40:51', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('317', '1649156272173355050', '2023-05-31 13:41:04', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('318', '1649156272173355050', '2023-05-31 13:41:33', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('319', '1649156391039930370', '2023-05-31 13:41:35', '[{code=switch_1, value=false}]', 'explanation', '1', 'Summer', '1,2,3,4,5', 'AfterNoon', '100');
INSERT INTO `tasklog` VALUES ('320', '1649156272173355050', '2023-06-06 18:17:05', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');
INSERT INTO `tasklog` VALUES ('321', '1649156272173355050', '2023-06-06 18:23:39', '[{code=switch_1, value=false}]', 'explanation', '2', 'Summer', '0,1,2,3,4,5,6', 'Night', '100');

-- ----------------------------
-- Table structure for `weatherforecast`
-- ----------------------------
DROP TABLE IF EXISTS `weatherforecast`;
CREATE TABLE `weatherforecast` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ghi` bigint DEFAULT '0',
  `ebh` bigint DEFAULT '0',
  `dni` bigint DEFAULT '0',
  `dhi` bigint DEFAULT '0',
  `air_temp` decimal(5,2) DEFAULT NULL,
  `zenith` bigint DEFAULT NULL,
  `azimuth` bigint DEFAULT NULL,
  `cloud_opacity` decimal(5,2) DEFAULT NULL,
  `period_end` timestamp NULL DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `lat` decimal(8,4) DEFAULT NULL,
  `lng` decimal(8,4) DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2408 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of weatherforecast
-- ----------------------------
INSERT INTO `weatherforecast` VALUES ('1832', '0', '0', '0', '0', '12.00', '-14', '337', '47.00', '2023-05-29 00:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1833', '0', '0', '0', '0', '11.00', '-16', '351', '52.00', '2023-05-29 01:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1834', '0', '0', '0', '0', '11.00', '-17', '6', '53.00', '2023-05-29 02:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1835', '0', '0', '0', '0', '10.00', '-14', '20', '42.00', '2023-05-29 03:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1836', '0', '0', '0', '0', '10.00', '-10', '34', '30.00', '2023-05-29 04:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1837', '0', '0', '0', '0', '10.00', '-4', '46', '23.00', '2023-05-29 05:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1838', '8', '0', '0', '8', '10.00', '3', '58', '18.00', '2023-05-29 06:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1839', '101', '40', '238', '61', '11.00', '11', '69', '13.00', '2023-05-29 07:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1840', '266', '201', '640', '65', '13.00', '20', '80', '0.00', '2023-05-29 08:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1841', '432', '355', '766', '76', '15.00', '30', '92', '0.00', '2023-05-29 09:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1842', '583', '489', '813', '95', '17.00', '39', '104', '1.00', '2023-05-29 10:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1843', '666', '482', '672', '184', '19.00', '48', '120', '8.00', '2023-05-29 11:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1844', '747', '529', '658', '218', '20.00', '55', '139', '9.00', '2023-05-29 12:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1845', '808', '589', '688', '219', '22.00', '59', '164', '8.00', '2023-05-29 13:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1846', '812', '577', '665', '235', '22.00', '60', '192', '9.00', '2023-05-29 14:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1847', '761', '500', '595', '261', '23.00', '56', '217', '12.00', '2023-05-29 15:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1848', '650', '353', '455', '296', '24.00', '49', '237', '17.00', '2023-05-29 16:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1849', '511', '203', '299', '308', '21.00', '40', '253', '23.00', '2023-05-29 17:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1850', '356', '67', '121', '288', '20.00', '31', '266', '32.00', '2023-05-29 18:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1851', '224', '2', '5', '221', '18.00', '22', '277', '40.00', '2023-05-29 19:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1852', '123', '0', '0', '123', '17.00', '12', '288', '42.00', '2023-05-29 20:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1853', '35', '0', '0', '35', '16.00', '4', '299', '49.00', '2023-05-29 21:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1854', '0', '0', '0', '0', '14.00', '-3', '311', '48.00', '2023-05-29 22:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1855', '0', '0', '0', '0', '12.00', '-9', '324', '45.00', '2023-05-29 23:00:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('1880', '0', '0', '0', '0', '14.00', '-21', '17', '0.00', '2023-05-29 02:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1881', '0', '0', '0', '0', '13.00', '-16', '31', '0.00', '2023-05-29 03:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1882', '0', '0', '0', '0', '12.00', '-10', '43', '8.00', '2023-05-29 04:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1883', '0', '0', '0', '0', '11.00', '-2', '55', '0.00', '2023-05-29 05:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1884', '46', '26', '272', '21', '10.00', '6', '65', '0.00', '2023-05-29 06:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1885', '203', '155', '640', '48', '11.00', '16', '75', '0.00', '2023-05-29 07:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1886', '386', '321', '780', '65', '13.00', '27', '85', '0.00', '2023-05-29 08:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1887', '566', '488', '855', '78', '15.00', '37', '96', '0.00', '2023-05-29 09:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1888', '726', '641', '903', '86', '16.00', '47', '109', '0.00', '2023-05-29 10:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1889', '785', '583', '714', '202', '17.00', '57', '126', '8.00', '2023-05-29 11:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1890', '897', '738', '833', '159', '18.00', '63', '151', '4.00', '2023-05-29 12:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1891', '966', '869', '951', '97', '19.00', '66', '184', '0.00', '2023-05-29 13:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1892', '947', '853', '952', '94', '20.00', '62', '216', '0.00', '2023-05-29 14:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1893', '874', '783', '938', '91', '20.00', '54', '238', '0.00', '2023-05-29 15:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1894', '755', '669', '910', '87', '21.00', '45', '254', '0.00', '2023-05-29 16:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1895', '601', '523', '868', '78', '20.00', '34', '266', '0.00', '2023-05-29 17:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1896', '424', '358', '800', '66', '20.00', '24', '277', '0.00', '2023-05-29 18:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1897', '240', '188', '673', '52', '18.00', '13', '286', '0.00', '2023-05-29 19:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1898', '61', '17', '143', '44', '17.00', '4', '297', '18.00', '2023-05-29 20:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1899', '0', '0', '0', '0', '15.00', '-4', '307', '20.00', '2023-05-29 21:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1900', '0', '0', '0', '0', '14.00', '-12', '319', '20.00', '2023-05-29 22:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1901', '0', '0', '0', '0', '13.00', '-18', '332', '20.00', '2023-05-29 23:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1902', '0', '0', '0', '0', '13.00', '-21', '347', '20.00', '2023-05-30 00:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('1903', '0', '0', '0', '0', '12.00', '-22', '2', '16.00', '2023-05-30 01:00:00', 'PT30M', '45.4034', '-73.5726', 'America/Toronto', 'J5C1E9');
INSERT INTO `weatherforecast` VALUES ('2360', '729', '382', '435', '347', '24.00', '61', '177', '19.00', '2023-06-09 13:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2361', '656', '243', '280', '413', '24.00', '59', '205', '26.00', '2023-06-09 14:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2362', '696', '393', '476', '302', '24.00', '54', '228', '17.00', '2023-06-09 15:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2363', '561', '227', '303', '335', '23.00', '46', '246', '24.00', '2023-06-09 16:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2364', '323', '0', '0', '323', '20.00', '37', '260', '47.00', '2023-06-09 17:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2365', '172', '0', '0', '172', '18.00', '27', '272', '62.00', '2023-06-09 18:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2366', '83', '0', '0', '83', '17.00', '18', '283', '72.00', '2023-06-09 19:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2367', '27', '0', '0', '27', '16.00', '9', '294', '82.00', '2023-06-09 20:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2368', '5', '0', '0', '5', '16.00', '1', '305', '84.00', '2023-06-09 21:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2369', '0', '0', '0', '0', '15.00', '-5', '317', '80.00', '2023-06-09 22:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2370', '0', '0', '0', '0', '15.00', '-10', '330', '77.00', '2023-06-09 23:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2371', '0', '0', '0', '0', '15.00', '-14', '344', '74.00', '2023-06-10 00:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2372', '0', '0', '0', '0', '14.00', '-15', '358', '71.00', '2023-06-10 01:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2373', '0', '0', '0', '0', '14.00', '-14', '12', '66.00', '2023-06-10 02:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2374', '0', '0', '0', '0', '14.00', '-11', '26', '62.00', '2023-06-10 03:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2375', '0', '0', '0', '0', '14.00', '-6', '39', '59.00', '2023-06-10 04:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2376', '0', '0', '0', '0', '14.00', '0', '51', '54.00', '2023-06-10 05:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2377', '32', '0', '0', '32', '13.00', '8', '63', '50.00', '2023-06-10 06:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2378', '120', '0', '0', '120', '14.00', '16', '73', '39.00', '2023-06-10 07:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2379', '236', '29', '71', '206', '16.00', '26', '84', '33.00', '2023-06-10 08:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2380', '373', '112', '205', '261', '18.00', '35', '96', '27.00', '2023-06-10 09:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2381', '493', '184', '273', '309', '19.00', '44', '110', '25.00', '2023-06-10 10:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2382', '595', '252', '325', '343', '21.00', '52', '127', '23.00', '2023-06-10 11:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2383', '651', '273', '322', '379', '22.00', '59', '149', '24.00', '2023-06-10 12:30:00', 'PT30M', '51.0870', '-114.1293', 'America/Edmonton', 'T2L2J9');
INSERT INTO `weatherforecast` VALUES ('2384', '741', '407', '464', '334', '24.00', '61', '177', '18.00', '2023-06-09 13:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2385', '705', '342', '393', '363', '25.00', '59', '205', '21.00', '2023-06-09 14:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2386', '744', '503', '609', '240', '24.00', '54', '228', '11.00', '2023-06-09 15:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2387', '571', '246', '328', '326', '23.00', '46', '246', '23.00', '2023-06-09 16:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2388', '329', '0', '0', '329', '20.00', '37', '260', '46.00', '2023-06-09 17:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2389', '178', '0', '0', '178', '18.00', '27', '272', '61.00', '2023-06-09 18:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2390', '87', '0', '0', '87', '17.00', '18', '283', '71.00', '2023-06-09 19:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2391', '28', '0', '0', '28', '16.00', '9', '294', '81.00', '2023-06-09 20:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2392', '6', '0', '0', '6', '16.00', '1', '306', '82.00', '2023-06-09 21:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2393', '0', '0', '0', '0', '16.00', '-5', '317', '79.00', '2023-06-09 22:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2394', '0', '0', '0', '0', '15.00', '-10', '330', '75.00', '2023-06-09 23:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2395', '0', '0', '0', '0', '15.00', '-14', '344', '73.00', '2023-06-10 00:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2396', '0', '0', '0', '0', '15.00', '-15', '358', '71.00', '2023-06-10 01:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2397', '0', '0', '0', '0', '14.00', '-14', '12', '67.00', '2023-06-10 02:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2398', '0', '0', '0', '0', '14.00', '-11', '26', '63.00', '2023-06-10 03:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2399', '0', '0', '0', '0', '14.00', '-6', '39', '60.00', '2023-06-10 04:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2400', '0', '0', '0', '0', '14.00', '0', '51', '56.00', '2023-06-10 05:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2401', '31', '0', '0', '31', '13.00', '8', '63', '51.00', '2023-06-10 06:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2402', '119', '0', '0', '119', '14.00', '16', '74', '40.00', '2023-06-10 07:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2403', '241', '37', '91', '204', '16.00', '26', '85', '32.00', '2023-06-10 08:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2404', '380', '125', '228', '255', '18.00', '35', '96', '26.00', '2023-06-10 09:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2405', '497', '191', '283', '306', '20.00', '44', '110', '24.00', '2023-06-10 10:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2406', '591', '243', '313', '347', '21.00', '52', '127', '24.00', '2023-06-10 11:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
INSERT INTO `weatherforecast` VALUES ('2407', '650', '269', '318', '380', '23.00', '59', '149', '24.00', '2023-06-10 12:30:00', 'PT30M', '51.0933', '-114.0314', 'America/Edmonton', 'T2E2P3');
