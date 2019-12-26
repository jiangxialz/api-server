/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql-master
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : api_server

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 26/12/2019 20:13:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_data_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_dict`;
CREATE TABLE `sys_data_dict`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id主键',
  `pid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级组',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态,ON/OFF',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `creater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE COMMENT 'code 唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_data_dict
-- ----------------------------
INSERT INTO `sys_data_dict` VALUES ('1209471027625590786', '0', '员工级别', 'staffLevel', 'ON', 0, '2019-12-24 21:48:59', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1209471146685104130', '1209471027625590786', '普通员工', 'T1', 'ON', 0, '2019-12-24 21:49:27', 'admin', '2019-12-26 18:48:35', 'admin');
INSERT INTO `sys_data_dict` VALUES ('1209471210069426177', '1209471027625590786', '部门主管', 'T2', 'ON', 1, '2019-12-24 21:49:42', 'admin', '2019-12-26 18:48:20', 'admin');
INSERT INTO `sys_data_dict` VALUES ('1210150989760299009', '1209471027625590786', '1', '1', 'ON', 2, '2019-12-26 18:50:54', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210151019296587777', '1209471027625590786', '2', '2', 'ON', 3, '2019-12-26 18:51:01', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210151041589313537', '1210150989760299009', '11', '11', 'ON', 0, '2019-12-26 18:51:06', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210151086178959361', '1210150989760299009', '12', '12', 'ON', 1, '2019-12-26 18:51:17', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210151110010994689', '1210151041589313537', '111', '111', 'ON', 0, '2019-12-26 18:51:23', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157440000065538', '0', 'a', 'a', 'ON', 0, '2019-12-26 19:16:32', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157462724804609', '0', 'b', 'b', 'ON', 0, '2019-12-26 19:16:37', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157481485926402', '0', 'c', 'c', 'ON', 0, '2019-12-26 19:16:42', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157505066303490', '0', 'd', 'd', 'ON', 0, '2019-12-26 19:16:48', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157530223738882', '0', 'e', 'e', 'ON', 0, '2019-12-26 19:16:54', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157550792605698', '0', 'f', 'f', 'ON', 0, '2019-12-26 19:16:58', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157574440091650', '0', 'g', 'g', 'ON', 0, '2019-12-26 19:17:04', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157600616742914', '0', 'h', 'h', 'ON', 0, '2019-12-26 19:17:10', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157628227846146', '0', 'i', 'i', 'ON', 0, '2019-12-26 19:17:17', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157654475800577', '0', 'j', 'j', 'ON', 0, '2019-12-26 19:17:23', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1210157820142419969', '1210157654475800577', 'fffff', 'fffff', 'ON', 0, '2019-12-26 19:18:03', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型，0用户可见',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `uri` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问uri',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `http_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'httpMethod',
  `class_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调用方法',
  `action_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `result` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法返回结果',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1210171513236357122', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 20:12:27');
INSERT INTO `sys_log` VALUES ('1210170956098568193', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 20:10:14');
INSERT INTO `sys_log` VALUES ('1210168310939779074', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:59:44');
INSERT INTO `sys_log` VALUES ('1210168179574177793', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:59:13');
INSERT INTO `sys_log` VALUES ('1210162669844168706', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:37:19');
INSERT INTO `sys_log` VALUES ('1210166773324709889', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:53:37');
INSERT INTO `sys_log` VALUES ('1210161644601081858', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:33:14');
INSERT INTO `sys_log` VALUES ('1210156958787567618', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:14:37');
INSERT INTO `sys_log` VALUES ('1210156853854470145', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:14:12');
INSERT INTO `sys_log` VALUES ('1210156549968756738', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:13:00');
INSERT INTO `sys_log` VALUES ('1210156020177829890', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 19:10:53');
INSERT INTO `sys_log` VALUES ('1210150182381944833', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 18:47:42');
INSERT INTO `sys_log` VALUES ('1210149177581895682', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 18:43:42');
INSERT INTO `sys_log` VALUES ('1210148891098349570', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 18:42:34');
INSERT INTO `sys_log` VALUES ('1210147008380141570', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 18:35:05');
INSERT INTO `sys_log` VALUES ('1210146556888481794', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 18:33:17');
INSERT INTO `sys_log` VALUES ('1210110871242539010', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:11:29');
INSERT INTO `sys_log` VALUES ('1210110423597056001', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:09:42');
INSERT INTO `sys_log` VALUES ('1210110177261387777', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:08:44');
INSERT INTO `sys_log` VALUES ('1210110105693978625', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:08:27');
INSERT INTO `sys_log` VALUES ('1210109915071250433', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:07:41');
INSERT INTO `sys_log` VALUES ('1210109914542768130', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzQzNDA2MSwiaWF0IjoxNTc3MzQ3NjYxfQ.z7NZ95q4bFhjuh4DNa62-aNuekkLJzMeBi2ZmwQOftg\"},\"timestamps\":1577347661040}', '2019-12-26 16:07:41');
INSERT INTO `sys_log` VALUES ('1210109877293154306', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:07:32');
INSERT INTO `sys_log` VALUES ('1210109664352534529', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:06:41');
INSERT INTO `sys_log` VALUES ('1210109086205476866', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 16:04:24');
INSERT INTO `sys_log` VALUES ('1210105789709025281', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:51:18');
INSERT INTO `sys_log` VALUES ('1210104062368808961', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:44:26');
INSERT INTO `sys_log` VALUES ('1210104031595200514', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:44:18');
INSERT INTO `sys_log` VALUES ('1210103954231263233', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:44:00');
INSERT INTO `sys_log` VALUES ('1210103715273375745', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:43:03');
INSERT INTO `sys_log` VALUES ('1210103632884662274', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:42:43');
INSERT INTO `sys_log` VALUES ('1210103387173945345', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:41:45');
INSERT INTO `sys_log` VALUES ('1210102636909428737', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:38:46');
INSERT INTO `sys_log` VALUES ('1210102636771016706', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzQzMjMyNSwiaWF0IjoxNTc3MzQ1OTI1fQ.DGXACErrxUYw5Vulk-Koj6u9Y0o7n4Sflda9SjlyZLQ\"},\"timestamps\":1577345925884}', '2019-12-26 15:38:46');
INSERT INTO `sys_log` VALUES ('1210100306440880130', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-26 15:29:30');
INSERT INTO `sys_log` VALUES ('1210100306289885186', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzQzMTc3MCwiaWF0IjoxNTc3MzQ1MzcwfQ.hwVdYgtYlgGgeC5qIIVp5vSf3RNJv1xJZrrgRDsg5CA\"},\"timestamps\":1577345370238}', '2019-12-26 15:29:30');
INSERT INTO `sys_log` VALUES ('1209755746292465666', NULL, 'admin', '127.0.0.1', '/v1/sys/user/add-user-roles/1111', '[\"1111\",[\"9\",\"a\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.addUserRoles()', '增加用户相关角色', '{\"status\":true,\"code\":1001,\"msg\":\"添加成功\",\"timestamps\":1577263220748}', '2019-12-25 16:40:21');
INSERT INTO `sys_log` VALUES ('1209755436861882370', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-25 16:39:07');
INSERT INTO `sys_log` VALUES ('1209755464032583681', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/1111', '[\"1111\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577263153451}', '2019-12-25 16:39:13');
INSERT INTO `sys_log` VALUES ('1209755389441081345', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-25 16:38:56');
INSERT INTO `sys_log` VALUES ('1209753641708158978', NULL, 'admin', '127.0.0.1', '/v1/sys/user/reset-pwd/1111', '[\"1111\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.resetPassword()', '重置用户密码', '{\"status\":true,\"code\":1005,\"msg\":\"重置密码成功, 新密码: 123456\",\"timestamps\":1577262718975}', '2019-12-25 16:31:59');
INSERT INTO `sys_log` VALUES ('1209753485692633090', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/1111', '[\"1111\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262681780}', '2019-12-25 16:31:22');
INSERT INTO `sys_log` VALUES ('1209753414934724609', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/1111', '[\"1111\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262664905}', '2019-12-25 16:31:05');
INSERT INTO `sys_log` VALUES ('1209753411570892801', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/wukong', '[\"wukong\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262664106}', '2019-12-25 16:31:04');
INSERT INTO `sys_log` VALUES ('1209753401714278402', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/2', '[\"2\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262661758}', '2019-12-25 16:31:02');
INSERT INTO `sys_log` VALUES ('1209753387323621378', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/admin', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262658248}', '2019-12-25 16:30:58');
INSERT INTO `sys_log` VALUES ('1209753398136537090', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/admin', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262660903}', '2019-12-25 16:31:01');
INSERT INTO `sys_log` VALUES ('1209753387323621377', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/admin', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262658314}', '2019-12-25 16:30:58');
INSERT INTO `sys_log` VALUES ('1209752981021392897', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/1111', '[\"1111\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262561456}', '2019-12-25 16:29:21');
INSERT INTO `sys_log` VALUES ('1209752704566427650', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/1111', '[\"1111\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262495543}', '2019-12-25 16:28:16');
INSERT INTO `sys_log` VALUES ('1209752580184342529', NULL, 'admin', '127.0.0.1', '/v1/sys/user/toggle-state/1111', '[\"1111\"]', 'GET', 'com.qinyou.apiserver.sys.controller.UserController.toggleState()', '切换状态，0变1 或 1变0', '{\"status\":true,\"code\":1004,\"msg\":\"切换成功\",\"timestamps\":1577262465889}', '2019-12-25 16:27:46');
INSERT INTO `sys_log` VALUES ('1209752529710088194', NULL, 'admin', '127.0.0.1', '/v1/sys/user/update/1111', '[\"1111\",{\"id\":\"1111\",\"state\":\"0\",\"phone\":\"15238002471\",\"email\":\"15238002477@163.com2\",\"intro\":\"111\",\"avatar\":\"upload-file/2019_12_25/1577262349422_018c19596f4522a8012193a30545f6.jpg@1280w_1l_2o_100sh.png\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.update()', '修改用户', '{\"status\":true,\"code\":1002,\"msg\":\"修改成功\",\"timestamps\":1577262453844}', '2019-12-25 16:27:34');
INSERT INTO `sys_log` VALUES ('1209752096765640706', NULL, 'admin', '127.0.0.1', '/v1/sys/user/update/1111', '[\"1111\",{\"id\":\"1111\",\"state\":\"0\",\"phone\":\"15238002471\",\"email\":\"15238002477@163.com2\",\"intro\":\"111\",\"avatar\":\"upload-file/2019_12_25/1577262349422_018c19596f4522a8012193a30545f6.jpg@1280w_1l_2o_100sh.png\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.update()', '修改用户', '{\"status\":true,\"code\":1002,\"msg\":\"修改成功\",\"timestamps\":1577262350629}', '2019-12-25 16:25:51');
INSERT INTO `sys_log` VALUES ('1209751956747190274', NULL, 'admin', '127.0.0.1', '/v1/sys/user/add', '[{\"id\":\"1111\",\"state\":\"0\",\"phone\":\"15238002471\",\"email\":\"15238002477@163.com2\",\"intro\":\"111\",\"avatar\":\"upload-file/2019_12_25/1577261953665_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.add()', '添加用户', '{\"status\":true,\"code\":1001,\"msg\":\"添加成功\",\"timestamps\":1577262317234}', '2019-12-25 16:25:17');
INSERT INTO `sys_log` VALUES ('1209750287695216642', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-25 16:18:39');
INSERT INTO `sys_log` VALUES ('1209475310358102017', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 22:06:00');
INSERT INTO `sys_log` VALUES ('1209476422972735490', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 22:10:25');
INSERT INTO `sys_log` VALUES ('1209475052173524993', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 22:04:58');
INSERT INTO `sys_log` VALUES ('1209474034320801793', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 22:00:55');
INSERT INTO `sys_log` VALUES ('1209473621144109058', NULL, 'admin', '127.0.0.1', '/v1/sys/resource/add', '[{\"id\":\"sysDict:update\",\"name\":\"编辑\",\"state\":\"ON\",\"type\":\"btn\",\"sort\":1}]', 'POST', 'com.qinyou.apiserver.sys.controller.ResourceController.add()', '添加资源', '{\"status\":true,\"code\":1001,\"msg\":\"Add success\",\"timestamps\":1577195956869}', '2019-12-24 21:59:17');
INSERT INTO `sys_log` VALUES ('1209474005027782658', NULL, 'admin', '127.0.0.1', '/v1/sys/role/add-role-resources/admin', '[\"admin\",[\"sysDict\",\"sysDict:update\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.RoleController.addRoleResources()', '增加角色相关资源', '{\"status\":true,\"code\":1001,\"msg\":\"Add success\",\"timestamps\":1577196048380}', '2019-12-24 22:00:48');
INSERT INTO `sys_log` VALUES ('1209473539090939906', NULL, 'admin', '127.0.0.1', '/v1/sys/resource/remove/sysDict:edit', '[\"sysDict:edit\"]', 'GET', 'com.qinyou.apiserver.sys.controller.ResourceController.remove()', '删除资源', '{\"status\":true,\"code\":1003,\"msg\":\"Delete success\",\"timestamps\":1577195937308}', '2019-12-24 21:58:57');
INSERT INTO `sys_log` VALUES ('1209472783524823042', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:55:57');
INSERT INTO `sys_log` VALUES ('1209473424028598273', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:58:30');
INSERT INTO `sys_log` VALUES ('1209470867222822914', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:48:20');
INSERT INTO `sys_log` VALUES ('1209470626708848641', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:47:23');
INSERT INTO `sys_log` VALUES ('1209468016786407425', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:37:01');
INSERT INTO `sys_log` VALUES ('1209467601462231041', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:35:22');
INSERT INTO `sys_log` VALUES ('1209467679950241794', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:35:40');
INSERT INTO `sys_log` VALUES ('1209467382217572354', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:34:29');
INSERT INTO `sys_log` VALUES ('1209467212318900225', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:33:49');
INSERT INTO `sys_log` VALUES ('1209466718338940929', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:31:51');
INSERT INTO `sys_log` VALUES ('1209467001395740674', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:32:59');
INSERT INTO `sys_log` VALUES ('1209466559831998466', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:31:13');
INSERT INTO `sys_log` VALUES ('1209461706812555266', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:56');
INSERT INTO `sys_log` VALUES ('1209461689221644290', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:52');
INSERT INTO `sys_log` VALUES ('1209461697941602305', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:54');
INSERT INTO `sys_log` VALUES ('1209461680472326145', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:50');
INSERT INTO `sys_log` VALUES ('1209461663137267714', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:46');
INSERT INTO `sys_log` VALUES ('1209461671890780162', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:48');
INSERT INTO `sys_log` VALUES ('1209461645873512449', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:42');
INSERT INTO `sys_log` VALUES ('1209461654547333122', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:44');
INSERT INTO `sys_log` VALUES ('1209461628421013506', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:38');
INSERT INTO `sys_log` VALUES ('1209461637124194306', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:40');
INSERT INTO `sys_log` VALUES ('1209461619306790913', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:35');
INSERT INTO `sys_log` VALUES ('1209461610188374017', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:33');
INSERT INTO `sys_log` VALUES ('1209461601501970433', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:31');
INSERT INTO `sys_log` VALUES ('1209461584334684162', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:27');
INSERT INTO `sys_log` VALUES ('1209461592903647233', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:29');
INSERT INTO `sys_log` VALUES ('1209461566953488385', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:23');
INSERT INTO `sys_log` VALUES ('1209461575560200194', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:25');
INSERT INTO `sys_log` VALUES ('1209461558451634177', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:21');
INSERT INTO `sys_log` VALUES ('1209461558334193666', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"Login success\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzI3OTQ4MCwiaWF0IjoxNTc3MTkzMDgwfQ.H5wde4kCsGZ3xKFwe4jFJrQf1l1zderxS761Z-5Ftho\"},\"timestamps\":1577193080871}', '2019-12-24 21:11:21');
INSERT INTO `sys_log` VALUES ('1209461504420610049', NULL, 'admin', '127.0.0.1', '/v1/sys/role/add-role-resources/admin', '[\"admin\",[\"sysDict\",\"sysDict:add\",\"sysDict:edit\",\"sysDict:remove\",\"sysDict:toggle\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.RoleController.addRoleResources()', '增加角色相关资源', '{\"status\":true,\"code\":1001,\"msg\":\"Add success\",\"timestamps\":1577193068019}', '2019-12-24 21:11:08');
INSERT INTO `sys_log` VALUES ('1209461527652859905', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:11:14');
INSERT INTO `sys_log` VALUES ('1209461455141732354', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:10:56');
INSERT INTO `sys_log` VALUES ('1209461445993955330', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:10:54');
INSERT INTO `sys_log` VALUES ('1209461437198499841', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:10:52');
INSERT INTO `sys_log` VALUES ('1209461412368220161', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:10:46');
INSERT INTO `sys_log` VALUES ('1209461428256243713', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:10:50');
INSERT INTO `sys_log` VALUES ('1209461402922647554', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:10:44');
INSERT INTO `sys_log` VALUES ('1209458893218906113', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:00:45');
INSERT INTO `sys_log` VALUES ('1209461211062599681', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:09:58');
INSERT INTO `sys_log` VALUES ('1209458867432325122', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 21:00:39');
INSERT INTO `sys_log` VALUES ('1209448427524456450', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:19:10');
INSERT INTO `sys_log` VALUES ('1209446517467774978', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:11:35');
INSERT INTO `sys_log` VALUES ('1209446516746354689', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzI3NTg5NCwiaWF0IjoxNTc3MTg5NDk0fQ.7fShAkwzOkJcRpnx99YFhcgGylKaqjswEKPBEsL0fpk\"},\"timestamps\":1577189494679}', '2019-12-24 20:11:35');
INSERT INTO `sys_log` VALUES ('1209445940562231297', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:09:17');
INSERT INTO `sys_log` VALUES ('1209445940428013569', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzI3NTc1NywiaWF0IjoxNTc3MTg5MzU3fQ.t4TURFpIdLinunry138T73Qpq8diGs9LOAP_d0Dac0Y\"},\"timestamps\":1577189357274}', '2019-12-24 20:09:17');
INSERT INTO `sys_log` VALUES ('1209445864808906753', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:08:59');
INSERT INTO `sys_log` VALUES ('1209445840255451138', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:08:53');
INSERT INTO `sys_log` VALUES ('1209445497006194690', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:07:32');
INSERT INTO `sys_log` VALUES ('1209445320858009602', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:06:50');
INSERT INTO `sys_log` VALUES ('1209444829239443458', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 20:04:52');
INSERT INTO `sys_log` VALUES ('1209424856525832194', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:45:30');
INSERT INTO `sys_log` VALUES ('1209424856379031554', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"Login success\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzI3MDczMCwiaWF0IjoxNTc3MTg0MzMwfQ.kttsrAYF7iEdqr3GtIkQ80wZdoHlH_xwlAPk2r9x6mA\"},\"timestamps\":1577184330443}', '2019-12-24 18:45:30');
INSERT INTO `sys_log` VALUES ('1209424341297528834', '0', 'admin', '127.0.0.1', '/v1/account/change-password', '[\"admin\",{\"oldPwd\":\"123456\",\"newPwd\":\"654321\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.changePwd()', '用户修改密码', '{\"status\":true,\"code\":1008,\"msg\":\"Change password success\",\"timestamps\":1577184207639}', '2019-12-24 18:43:28');
INSERT INTO `sys_log` VALUES ('1209424221214605313', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:59');
INSERT INTO `sys_log` VALUES ('1209424221139107842', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184178991}', '2019-12-24 18:42:59');
INSERT INTO `sys_log` VALUES ('1209424204303171586', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:55');
INSERT INTO `sys_log` VALUES ('1209424204223479810', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184174958}', '2019-12-24 18:42:55');
INSERT INTO `sys_log` VALUES ('1209424196078141441', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:53');
INSERT INTO `sys_log` VALUES ('1209424179690995713', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:49');
INSERT INTO `sys_log` VALUES ('1209424195985866753', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184172996}', '2019-12-24 18:42:53');
INSERT INTO `sys_log` VALUES ('1209424179615498242', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184169093}', '2019-12-24 18:42:49');
INSERT INTO `sys_log` VALUES ('1209424178705334273', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:49');
INSERT INTO `sys_log` VALUES ('1209424177082138625', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:48');
INSERT INTO `sys_log` VALUES ('1209424178621448193', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184168854}', '2019-12-24 18:42:49');
INSERT INTO `sys_log` VALUES ('1209424176985669633', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184168465}', '2019-12-24 18:42:48');
INSERT INTO `sys_log` VALUES ('1209424174255177730', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:48');
INSERT INTO `sys_log` VALUES ('1209424174154514433', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184167790}', '2019-12-24 18:42:48');
INSERT INTO `sys_log` VALUES ('1209423897183649793', NULL, 'admin', '127.0.0.1', '/v1/sys/log/batch-remove', '[[\"1209423869119561730\",\"1209422928018407426\",\"1209422953356197889\",\"1209396609398341634\",\"1209404702094000130\",\"1209393690456358913\",\"1209393794219245570\",\"1209391866080919554\",\"1209391809172602881\",\"1209157896525316098\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.LogController.remove()', '批量删除操作日志', '{\"status\":true,\"code\":1003,\"msg\":\"Delete success\",\"timestamps\":1577184101755}', '2019-12-24 18:41:42');
INSERT INTO `sys_log` VALUES ('1209424038561054722', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:15');
INSERT INTO `sys_log` VALUES ('1209424115165822977', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184153726}', '2019-12-24 18:42:34');
INSERT INTO `sys_log` VALUES ('1209424115287457794', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:34');
INSERT INTO `sys_log` VALUES ('1209424147084476418', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184161336}', '2019-12-24 18:42:41');
INSERT INTO `sys_log` VALUES ('1209424147159973890', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:41');
INSERT INTO `sys_log` VALUES ('1209424164713136129', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184165539}', '2019-12-24 18:42:46');
INSERT INTO `sys_log` VALUES ('1209424164805410817', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:46');
INSERT INTO `sys_log` VALUES ('1209424167934361601', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184166308}', '2019-12-24 18:42:46');
INSERT INTO `sys_log` VALUES ('1209424168064385025', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:46');
INSERT INTO `sys_log` VALUES ('1209424170203480066', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184166848}', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424170278977538', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424171092672514', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184167060}', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424171197530113', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424171847647234', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184167241}', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424171965087745', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424172678119425', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184167439}', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424172791365634', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:47');
INSERT INTO `sys_log` VALUES ('1209424173332430850', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"闯神\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"Handsome boy\",\"avatar\":\"upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"Update user info success\",\"timestamps\":1577184167594}', '2019-12-24 18:42:48');
INSERT INTO `sys_log` VALUES ('1209424173433094146', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 18:42:48');
INSERT INTO `sys_log` VALUES ('1209155337882435586', NULL, 'admin', '127.0.0.1', '/v1/sys/log/batch-remove', '[[\"1209155273801859074\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.LogController.remove()', '批量删除操作日志', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577120072226}', '2019-12-24 00:54:32');
INSERT INTO `sys_log` VALUES ('1209155760697638913', NULL, 'admin', '127.0.0.1', '/v1/sys/log/batch-remove', '[[\"1209155274108043265\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.LogController.remove()', '批量删除操作日志', '{\"status\":true,\"code\":1003,\"msg\":\"Delete success\",\"timestamps\":1577120173035}', '2019-12-24 00:56:13');
INSERT INTO `sys_log` VALUES ('1209155355221688322', NULL, 'admin', '127.0.0.1', '/v1/sys/log/batch-remove', '[[\"1209149115502428161\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.LogController.remove()', '批量删除操作日志', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577120076376}', '2019-12-24 00:54:36');
INSERT INTO `sys_log` VALUES ('1209155728145645569', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-24 00:56:05');
INSERT INTO `sys_log` VALUES ('1209155780754800641', NULL, 'admin', '127.0.0.1', '/v1/sys/log/batch-remove', '[[\"1209143253039841282\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.LogController.remove()', '批量删除操作日志', '{\"status\":true,\"code\":1003,\"msg\":\"Delete success\",\"timestamps\":1577120177817}', '2019-12-24 00:56:18');
INSERT INTO `sys_log` VALUES ('1209122515440369665', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzE5ODY0NiwiaWF0IjoxNTc3MTEyMjQ2fQ.PnE3vVCzgEIsL1UQ2AENXy1MjwIXIXE_nLlOJ82ikiY\"},\"timestamps\":1577112246724}', '2019-12-23 22:44:07');
INSERT INTO `sys_log` VALUES ('1209114479200043010', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"string\",\"phone\":\"15238002477\",\"email\":\"string\",\"intro\":\"string\",\"avatar\":\"string\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1577110330739}', '2019-12-23 22:12:11');
INSERT INTO `sys_log` VALUES ('1209097368385880066', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"string\",\"phone\":\"\",\"email\":\"string\",\"intro\":\"string\",\"avatar\":\"string\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1577106251195}', '2019-12-23 21:04:11');
INSERT INTO `sys_log` VALUES ('1209096960540147714', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"string\",\"phone\":\"\",\"email\":\"string\",\"intro\":\"string\",\"avatar\":\"string\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1577106153967}', '2019-12-23 21:02:34');
INSERT INTO `sys_log` VALUES ('1209088350523228161', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-23 20:28:21');
INSERT INTO `sys_log` VALUES ('1209088350414176258', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzE5MDUwMSwiaWF0IjoxNTc3MTA0MTAxfQ.9RBt5TbYETISo2PITXV7Fr5aebYEy081xZXsy-4K53o\"},\"timestamps\":1577104101171}', '2019-12-23 20:28:21');
INSERT INTO `sys_log` VALUES ('1209086322799542274', NULL, 'admin', '127.0.0.1', '/v1/sys/log/batch-remove', '[[\"1208734764312297474\",\"1209067920236216322\",\"1209086250800119810\",\"1209086251068555265\",\"1208719827389120514\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.LogController.remove()', '批量删除操作日志', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577103617750}', '2019-12-23 20:20:18');
INSERT INTO `sys_log` VALUES ('1209088180876214274', NULL, '游客', '127.0.0.1', '/v1/account/send-phone-code/15238002477', '[\"15238002477\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.sendVerificationCodeByPhone()', '通过邮箱发送验证码, 用于重置账号密码', '{\"status\":true,\"code\":1006,\"msg\":\"发送验证码成功\",\"timestamps\":1577104060750}', '2019-12-23 20:27:41');
INSERT INTO `sys_log` VALUES ('1209088006183452673', NULL, 'admin', '127.0.0.1', '/v1/sys/user/del-user-roles/admin', '[\"admin\",[\"8\",\"9\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.deleteUserRoles()', '删除用户相关角色', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577104019099}', '2019-12-23 20:26:59');
INSERT INTO `sys_log` VALUES ('1209087991285284865', NULL, 'admin', '127.0.0.1', '/v1/sys/user/del-user-roles/admin', '[\"admin\",[\"2\",\"4\",\"6\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.deleteUserRoles()', '删除用户相关角色', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577104015547}', '2019-12-23 20:26:56');
INSERT INTO `sys_log` VALUES ('1209087973107171330', NULL, 'admin', '127.0.0.1', '/v1/sys/user/add-user-roles/admin', '[\"admin\",[\"8\",\"9\",\"a\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.addUserRoles()', '增加用户相关角色', '{\"status\":true,\"code\":1001,\"msg\":\"添加成功\",\"timestamps\":1577104011213}', '2019-12-23 20:26:51');
INSERT INTO `sys_log` VALUES ('1208718731853692929', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-22 19:59:37');
INSERT INTO `sys_log` VALUES ('1208717499718172674', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-22 19:54:43');
INSERT INTO `sys_log` VALUES ('1208717499600732162', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzEwMjA4MywiaWF0IjoxNTc3MDE1NjgzfQ.zWrNTXpKwMkNSeXe_BacYVPKTakwlZ91F_Nu9zbGDpU\"},\"timestamps\":1577015683446}', '2019-12-22 19:54:43');
INSERT INTO `sys_log` VALUES ('1208712253562421250', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-22 19:33:53');
INSERT INTO `sys_log` VALUES ('1208705241076203522', NULL, 'admin', '127.0.0.1', '/v1/sys/log/batch-remove', '[[\"1208705207899258882\",\"1208699363962912770\",\"1208698210885828610\",\"1208698209199718402\",\"1207637376562626562\",\"1207630521933234177\",\"1207626808652988418\",\"1207626792181956609\"]]', 'POST', 'com.qinyou.apiserver.sys.controller.LogController.remove()', '批量删除操作日志', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577012760787}', '2019-12-22 19:06:01');
INSERT INTO `sys_log` VALUES ('1208705344528711682', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NzA5OTE4NSwiaWF0IjoxNTc3MDEyNzg1fQ.To1ELI4B1_hqT1CZ7dko5t76Snc3NBPdwRJBg1Mpmqw\"},\"timestamps\":1577012785451}', '2019-12-22 19:06:25');
INSERT INTO `sys_log` VALUES ('1208705345325629442', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-22 19:06:26');
INSERT INTO `sys_log` VALUES ('1208705509473910785', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-22 19:07:05');
INSERT INTO `sys_log` VALUES ('1208706599242170370', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-22 19:11:25');
INSERT INTO `sys_log` VALUES ('1208707289234538498', NULL, 'admin', '127.0.0.1', '/v1/sys/role/remove/1', '[\"1\"]', 'GET', 'com.qinyou.apiserver.sys.controller.RoleController.remove()', '删除角色', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577013249107}', '2019-12-22 19:14:09');
INSERT INTO `sys_log` VALUES ('1208707299762241538', NULL, 'admin', '127.0.0.1', '/v1/sys/role/remove/3', '[\"3\"]', 'GET', 'com.qinyou.apiserver.sys.controller.RoleController.remove()', '删除角色', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577013251616}', '2019-12-22 19:14:12');
INSERT INTO `sys_log` VALUES ('1208707306762534914', NULL, 'admin', '127.0.0.1', '/v1/sys/role/remove/5', '[\"5\"]', 'GET', 'com.qinyou.apiserver.sys.controller.RoleController.remove()', '删除角色', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577013253285}', '2019-12-22 19:14:13');
INSERT INTO `sys_log` VALUES ('1208707318049406978', NULL, 'admin', '127.0.0.1', '/v1/sys/role/remove/7', '[\"7\"]', 'GET', 'com.qinyou.apiserver.sys.controller.RoleController.remove()', '删除角色', '{\"status\":true,\"code\":1003,\"msg\":\"删除成功\",\"timestamps\":1577013255976}', '2019-12-22 19:14:16');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键，存资源编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `state` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态ON开启OFF禁用',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型，btn或menu',
  `sort` int(255) NOT NULL COMMENT '排序号',
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `creater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `level`(`type`) USING BTREE COMMENT '提高检索'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('sysDict', '数据字典', 'ON', 'menu', 3, NULL, NULL, '2019-12-12 11:31:50', 'admin', '2019-12-19 12:55:54', 'admin');
INSERT INTO `sys_resource` VALUES ('sysDict:add', '新增', 'ON', 'btn', 0, NULL, NULL, '2019-12-12 11:32:18', 'admin', '2019-12-19 12:55:54', 'admin');
INSERT INTO `sys_resource` VALUES ('sysDict:remove', '删除', 'ON', 'btn', 2, NULL, NULL, '2019-12-12 11:32:46', 'admin', '2019-12-19 12:55:54', 'admin');
INSERT INTO `sys_resource` VALUES ('sysDict:toggle', '切换状态', 'ON', 'btn', 3, NULL, NULL, '2019-12-12 11:33:06', 'admin', '2019-12-19 12:55:54', 'admin');
INSERT INTO `sys_resource` VALUES ('sysDict:update', '编辑', 'ON', 'btn', 1, NULL, NULL, '2019-12-24 21:59:17', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysLog', '操作日志', 'ON', 'menu', 4, NULL, NULL, '2019-12-19 17:18:18', 'admin', '2019-12-19 17:18:27', 'admin');
INSERT INTO `sys_resource` VALUES ('sysLog:remove', '批量删除', 'ON', 'btn', 0, NULL, NULL, '2019-12-19 17:18:47', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysResource', '资源管理', 'ON', 'menu', 0, NULL, 'string', '2019-12-10 18:00:44', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysResource:add', '新增', 'ON', 'btn', 0, NULL, 'string', '2019-12-10 18:01:29', 'admin', '2019-12-10 21:40:12', 'admin');
INSERT INTO `sys_resource` VALUES ('sysResource:remove', '删除', 'ON', 'btn', 2, NULL, 'string', '2019-12-10 18:01:51', 'admin', '2019-12-10 21:34:15', 'admin');
INSERT INTO `sys_resource` VALUES ('sysResource:roles', '查看角色', 'ON', 'btn', 4, NULL, 'string', '2019-12-10 18:02:39', 'admin', '2019-12-10 21:38:37', 'admin');
INSERT INTO `sys_resource` VALUES ('sysResource:toggle', '切换状态', 'ON', 'btn', 3, NULL, 'string', '2019-12-10 18:02:06', 'admin', '2019-12-10 21:37:07', 'admin');
INSERT INTO `sys_resource` VALUES ('sysResource:update', '修改', 'ON', 'btn', 1, NULL, 'string', '2019-12-10 18:01:41', 'admin', '2019-12-10 21:34:04', 'admin');
INSERT INTO `sys_resource` VALUES ('sysResource:users', '查看用户', 'ON', 'btn', 5, NULL, 'string', '2019-12-10 18:02:53', 'admin', '2019-12-10 21:36:50', 'admin');
INSERT INTO `sys_resource` VALUES ('sysRole', '角色管理', 'ON', 'menu', 1, NULL, '角色管理', '2019-12-10 21:39:11', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysRole:add', '新增', 'ON', 'btn', 0, NULL, NULL, '2019-12-10 21:39:58', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysRole:configResources', '配置菜单', 'ON', 'btn', 4, NULL, NULL, '2019-12-10 21:44:58', 'admin', '2019-12-10 21:45:12', 'admin');
INSERT INTO `sys_resource` VALUES ('sysRole:remove', '删除', 'ON', 'btn', 2, NULL, NULL, '2019-12-10 21:43:14', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysRole:toggle', '切换状态', 'ON', 'btn', 3, NULL, NULL, '2019-12-10 21:43:36', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysRole:update', '编辑', 'ON', 'btn', 1, NULL, NULL, '2019-12-10 21:40:29', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysRole:users', '查看用户', 'ON', 'btn', 5, NULL, NULL, '2019-12-10 21:43:53', 'admin', '2019-12-10 21:45:05', 'admin');
INSERT INTO `sys_resource` VALUES ('sysUser', '用户管理', 'ON', 'menu', 2, NULL, NULL, '2019-12-10 21:45:44', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysUser:add', '新增', 'ON', 'btn', 0, NULL, NULL, '2019-12-10 21:46:03', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysUser:configRoles', '配置角色', 'ON', 'btn', 5, NULL, NULL, '2019-12-10 21:47:06', 'admin', '2019-12-10 22:59:18', 'admin');
INSERT INTO `sys_resource` VALUES ('sysUser:remove', '删除', 'ON', 'btn', 2, NULL, NULL, '2019-12-10 21:46:30', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysUser:resetPwd', '重置密码', 'ON', 'btn', 4, NULL, NULL, '2019-12-10 22:23:31', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysUser:toggle', '切换状态', 'ON', 'btn', 3, NULL, NULL, '2019-12-10 21:46:40', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysUser:update', '编辑', 'ON', 'btn', 1, NULL, NULL, '2019-12-10 21:46:18', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键,存权限编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明信息',
  `state` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态ON/OFF',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `creater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4', '4', '4', 'ON', '2019-12-18 21:36:26', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('9', '9', '9', 'ON', '2019-12-18 21:36:48', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('a', 'a', 'a', 'ON', '2019-12-18 21:37:01', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('admin', '管理员', '管理员分配所有权限', 'ON', '2019-12-10 18:17:01', 'chuang', '2019-12-11 18:44:00', 'admin');
INSERT INTO `sys_role` VALUES ('b', 'b', 'b', 'ON', '2019-12-18 21:37:07', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('PermissionAdmin', '权限', '管理用户权限', 'ON', '2019-12-12 09:01:46', 'admin', '2019-12-18 21:42:26', 'admin');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人用户名',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `resource_id`) USING BTREE COMMENT '角色id、资源id 唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色资源 中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1204344254571216898', 'admin', 'sysResource', 'chuang', '2019-12-10 18:17:01');
INSERT INTO `sys_role_resource` VALUES ('1204344254638325762', 'admin', 'sysResource:add', 'chuang', '2019-12-10 18:17:01');
INSERT INTO `sys_role_resource` VALUES ('1204344254680268801', 'admin', 'sysResource:update', 'chuang', '2019-12-10 18:17:01');
INSERT INTO `sys_role_resource` VALUES ('1204344254709628929', 'admin', 'sysResource:remove', 'chuang', '2019-12-10 18:17:01');
INSERT INTO `sys_role_resource` VALUES ('1204344254776737794', 'admin', 'sysResource:toggle', 'chuang', '2019-12-10 18:17:01');
INSERT INTO `sys_role_resource` VALUES ('1204397808153526273', 'admin', 'sysRole', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808216440834', 'admin', 'sysRole:add', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808245800962', 'admin', 'sysRole:configResources', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808279355393', 'admin', 'sysRole:remove', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808321298433', 'admin', 'sysRole:toggle', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808350658561', 'admin', 'sysRole:update', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808380018689', 'admin', 'sysRole:users', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1205033676853739521', 'admin', 'sysResource:roles', 'admin', '2019-12-12 15:56:32');
INSERT INTO `sys_role_resource` VALUES ('1205033676895682562', 'admin', 'sysResource:users', 'admin', '2019-12-12 15:56:32');
INSERT INTO `sys_role_resource` VALUES ('1205058985502179329', 'PermissionAdmin', 'sysRole:toggle', 'admin', '2019-12-12 17:37:06');
INSERT INTO `sys_role_resource` VALUES ('1205059183074869249', 'PermissionAdmin', 'sysResource', 'admin', '2019-12-12 17:37:53');
INSERT INTO `sys_role_resource` VALUES ('1205059204201578497', 'PermissionAdmin', 'sysResource:add', 'admin', '2019-12-12 17:37:58');
INSERT INTO `sys_role_resource` VALUES ('1205059204222550017', 'PermissionAdmin', 'sysResource:update', 'admin', '2019-12-12 17:37:58');
INSERT INTO `sys_role_resource` VALUES ('1205059204247715842', 'PermissionAdmin', 'sysResource:remove', 'admin', '2019-12-12 17:37:58');
INSERT INTO `sys_role_resource` VALUES ('1205059231787515905', 'PermissionAdmin', 'sysResource:toggle', 'admin', '2019-12-12 17:38:04');
INSERT INTO `sys_role_resource` VALUES ('1205059231804293121', 'PermissionAdmin', 'sysResource:roles', 'admin', '2019-12-12 17:38:04');
INSERT INTO `sys_role_resource` VALUES ('1205059231829458945', 'PermissionAdmin', 'sysResource:users', 'admin', '2019-12-12 17:38:04');
INSERT INTO `sys_role_resource` VALUES ('1205059514353582081', 'PermissionAdmin', 'sysUser', 'admin', '2019-12-12 17:39:12');
INSERT INTO `sys_role_resource` VALUES ('1205059514408108033', 'PermissionAdmin', 'sysRole', 'admin', '2019-12-12 17:39:12');
INSERT INTO `sys_role_resource` VALUES ('1205059571391922178', 'PermissionAdmin', 'sysRole:add', 'admin', '2019-12-12 17:39:25');
INSERT INTO `sys_role_resource` VALUES ('1205059571417088001', 'PermissionAdmin', 'sysRole:update', 'admin', '2019-12-12 17:39:25');
INSERT INTO `sys_role_resource` VALUES ('1205059571442253826', 'PermissionAdmin', 'sysRole:remove', 'admin', '2019-12-12 17:39:25');
INSERT INTO `sys_role_resource` VALUES ('1205059571467419649', 'PermissionAdmin', 'sysRole:configResources', 'admin', '2019-12-12 17:39:25');
INSERT INTO `sys_role_resource` VALUES ('1205059571492585473', 'PermissionAdmin', 'sysRole:users', 'admin', '2019-12-12 17:39:25');
INSERT INTO `sys_role_resource` VALUES ('1205059602555600897', 'PermissionAdmin', 'sysUser:add', 'admin', '2019-12-12 17:39:33');
INSERT INTO `sys_role_resource` VALUES ('1205059602580766721', 'PermissionAdmin', 'sysUser:update', 'admin', '2019-12-12 17:39:33');
INSERT INTO `sys_role_resource` VALUES ('1205059602593349634', 'PermissionAdmin', 'sysUser:remove', 'admin', '2019-12-12 17:39:33');
INSERT INTO `sys_role_resource` VALUES ('1205059602605932546', 'PermissionAdmin', 'sysUser:toggle', 'admin', '2019-12-12 17:39:33');
INSERT INTO `sys_role_resource` VALUES ('1205059602618515457', 'PermissionAdmin', 'sysUser:resetPwd', 'admin', '2019-12-12 17:39:33');
INSERT INTO `sys_role_resource` VALUES ('1205059602635292673', 'PermissionAdmin', 'sysUser:configRoles', 'admin', '2019-12-12 17:39:33');
INSERT INTO `sys_role_resource` VALUES ('1205059752988508161', 'PermissionAdmin', 'sysDict', 'admin', '2019-12-12 17:40:09');
INSERT INTO `sys_role_resource` VALUES ('1205059753005285378', 'PermissionAdmin', 'sysDict:add', 'admin', '2019-12-12 17:40:09');
INSERT INTO `sys_role_resource` VALUES ('1205059753030451201', 'PermissionAdmin', 'sysDict:remove', 'admin', '2019-12-12 17:40:09');
INSERT INTO `sys_role_resource` VALUES ('1205059753047228417', 'PermissionAdmin', 'sysDict:toggle', 'admin', '2019-12-12 17:40:09');
INSERT INTO `sys_role_resource` VALUES ('1207527102555881473', 'admin', 'sysUser', 'admin', '2019-12-19 13:04:31');
INSERT INTO `sys_role_resource` VALUES ('1207527102568464385', 'admin', 'sysUser:update', 'admin', '2019-12-19 13:04:31');
INSERT INTO `sys_role_resource` VALUES ('1207527102581047298', 'admin', 'sysUser:remove', 'admin', '2019-12-19 13:04:31');
INSERT INTO `sys_role_resource` VALUES ('1207527102597824513', 'admin', 'sysUser:toggle', 'admin', '2019-12-19 13:04:31');
INSERT INTO `sys_role_resource` VALUES ('1207527102614601730', 'admin', 'sysUser:resetPwd', 'admin', '2019-12-19 13:04:31');
INSERT INTO `sys_role_resource` VALUES ('1207527575065198594', 'admin', 'sysUser:add', 'admin', '2019-12-19 13:06:23');
INSERT INTO `sys_role_resource` VALUES ('1207596412657729538', 'admin', 'sysLog', 'admin', '2019-12-19 17:39:55');
INSERT INTO `sys_role_resource` VALUES ('1207596412729032705', 'admin', 'sysLog:remove', 'admin', '2019-12-19 17:39:56');
INSERT INTO `sys_role_resource` VALUES ('1207597319629832193', 'admin', 'sysUser:configRoles', 'admin', '2019-12-19 17:43:32');
INSERT INTO `sys_role_resource` VALUES ('1209461504332529665', 'admin', 'sysDict', 'admin', '2019-12-24 21:11:08');
INSERT INTO `sys_role_resource` VALUES ('1209461504349306881', 'admin', 'sysDict:add', 'admin', '2019-12-24 21:11:08');
INSERT INTO `sys_role_resource` VALUES ('1209461504378667009', 'admin', 'sysDict:remove', 'admin', '2019-12-24 21:11:08');
INSERT INTO `sys_role_resource` VALUES ('1209461504399638530', 'admin', 'sysDict:toggle', 'admin', '2019-12-24 21:11:08');
INSERT INTO `sys_role_resource` VALUES ('1209474004897759233', 'admin', 'sysDict:update', 'admin', '2019-12-24 22:00:48');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键,存用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称或真实姓名',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `state` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态，0正常，1禁用',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍信息',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `creater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE COMMENT '手机号唯一',
  UNIQUE INDEX `email`(`email`) USING BTREE COMMENT '邮箱唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1111', NULL, '$2a$10$oLLwX/A52BVj.HTfI0wdu.KMqGcPtx0F64FIwBk.Nc8gZPdFUFqmG', '0', '15238002471', '15238002477@163.com2', '111', 'upload-file/2019_12_25/1577262349422_018c19596f4522a8012193a30545f6.jpg@1280w_1l_2o_100sh.png', '2019-12-25 16:25:17', 'admin', '2019-12-25 16:39:13', 'admin');
INSERT INTO `sys_user` VALUES ('2', NULL, '$2a$10$OhxyLUYDNzeB9cH2qT7CeuRioAdpeYlFD/Y0oajNWP9VJE3GOci.6', '0', '15238002476', '2', '2', 'upload-file/2019_12_19/1576727573177_1612340394247.jpg', '2019-12-10 22:26:55', 'admin', '2019-12-24 18:14:14', 'admin');
INSERT INTO `sys_user` VALUES ('admin', '闯神', '$2a$10$UZj878/b2Wrgv3YHnzzX3.JkJrVY9O2V2PIzqjo2BrFerfNb7esTO', '0', '15238002477', '916432779@qq.com', 'Handsome boy', 'upload-file/2019_12_24/1577117408507_585971a4b967152d2c6470cb4d4bf082.jpeg', '2019-12-10 17:53:00', 'chuang', '2019-12-24 18:42:59', 'admin');
INSERT INTO `sys_user` VALUES ('wukong', NULL, '$2a$10$k0FGo/Yw1cigRIcBNvx/ROrMDjXtG5kt4e/upNHKRqzO7Cexqnkwe', '0', '11111', '222222', '超级赛亚人悟空', 'upload-file/2019_12_19/1576727579297_743575_code-together.png', '2019-12-18 21:34:19', 'admin', '2019-12-24 18:14:20', 'admin');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id',
  `creater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人用户名',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `role_id`) USING BTREE COMMENT '用户id，角色id唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1204678930347327490', 'admin', 'admin', 'admin', '2019-12-11 16:26:54');
INSERT INTO `sys_user_role` VALUES ('1206857424682614785', '2', 'PermissionAdmin', 'admin', '2019-12-17 16:43:27');
INSERT INTO `sys_user_role` VALUES ('1207294901075574785', '2', '4', 'admin', '2019-12-18 21:41:50');
INSERT INTO `sys_user_role` VALUES ('1209087973082005506', 'admin', 'a', 'admin', '2019-12-23 20:26:51');
INSERT INTO `sys_user_role` VALUES ('1209755746237939713', '1111', '9', 'admin', '2019-12-25 16:40:21');
INSERT INTO `sys_user_role` VALUES ('1209755746263105538', '1111', 'a', 'admin', '2019-12-25 16:40:21');

-- ----------------------------
-- Table structure for sys_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_verification_code`;
CREATE TABLE `sys_verification_code`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `state` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态,0未用，1已用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `purpose` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用途',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `check_code`(`code`) USING BTREE COMMENT '提高检索',
  INDEX `account`(`account`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `purpose`(`purpose`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验证码\r\n用途：0重置密码验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_verification_code
-- ----------------------------
INSERT INTO `sys_verification_code` VALUES ('1207272662850600962', '916432779@qq.com', '620575', '0', '2019-12-18 20:13:28', '0');
INSERT INTO `sys_verification_code` VALUES ('1207273103625814017', '916432779@qq.com', '226907', '0', '2019-12-18 20:15:13', '0');
INSERT INTO `sys_verification_code` VALUES ('1207273522531926018', '916432779@qq.com', '415794', '0', '2019-12-18 20:16:52', '0');
INSERT INTO `sys_verification_code` VALUES ('1207275075523313665', '916432779@qq.com', '011526', '1', '2019-12-18 20:23:03', '0');
INSERT INTO `sys_verification_code` VALUES ('1207276446184112129', '15238002477', '269516', '1', '2019-12-18 20:28:30', '0');
INSERT INTO `sys_verification_code` VALUES ('1207276802121138177', '15238002477', '392591', '1', '2019-12-18 20:29:54', '0');
INSERT INTO `sys_verification_code` VALUES ('1207277137359273985', '15238002477', '970140', '1', '2019-12-18 20:31:14', '0');
INSERT INTO `sys_verification_code` VALUES ('1209088180851048449', '15238002477', '538205', '0', '2019-12-23 20:27:41', '0');

SET FOREIGN_KEY_CHECKS = 1;
