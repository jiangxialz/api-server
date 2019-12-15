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

 Date: 15/12/2019 16:38:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_data_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_dict`;
CREATE TABLE `sys_data_dict`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型，group组，item组值',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态,ON/OFF',
  `group_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组编码',
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
INSERT INTO `sys_data_dict` VALUES ('1190959218346164225', 'group', '性别', 'gender', 'ON', NULL, '2019-11-03 11:49:39', 'admin', '2019-11-03 13:23:41', 'admin');
INSERT INTO `sys_data_dict` VALUES ('1190959502699003906', 'item', '男', 'male', 'ON', 'gender', '2019-11-03 11:50:47', 'admin', '2019-11-03 12:41:10', 'admin');
INSERT INTO `sys_data_dict` VALUES ('1190959550463737857', 'item', '女', 'female', 'ON', 'gender', '2019-11-03 11:50:58', 'admin', '2019-11-03 12:41:17', 'admin');
INSERT INTO `sys_data_dict` VALUES ('1190959604389904385', 'group', 'http 方法', 'httpMethod', 'ON', NULL, '2019-11-03 11:51:11', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1190960287105155074', 'item', 'GET', 'GET', 'ON', 'httpMethod', '2019-11-03 11:53:54', 'admin', '2019-11-03 13:04:19', 'admin');
INSERT INTO `sys_data_dict` VALUES ('1190960322442166274', 'item', 'POST', 'POST', 'ON', 'httpMethod', '2019-11-03 11:54:03', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1190960495243296769', 'group', '货币', 'money', 'ON', NULL, '2019-11-03 11:54:44', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1190962836105330689', 'item', '人民币', 'RMB', 'ON', 'money', '2019-11-03 12:04:02', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1190962881307344898', 'item', '美元', '美元', 'ON', 'money', '2019-11-03 12:04:13', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1190962972646703105', 'item', '英镑', '英镑', 'ON', 'money', '2019-11-03 12:04:34', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1190991222689234945', 'group', '分公司', 'company', 'ON', NULL, '2019-11-03 13:56:50', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1190991343875260418', 'item', '南国思念', 'god', 'ON', 'company', '2019-11-03 13:57:19', 'admin', NULL, NULL);
INSERT INTO `sys_data_dict` VALUES ('1194068441569427458', 'item', 'd', 'd', 'OFF', 'gender', '2019-11-12 01:44:36', 'admin', NULL, NULL);

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
INSERT INTO `sys_log` VALUES ('1206111545596051458', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NjQ4MDc3NSwiaWF0IjoxNTc2Mzk0Mzc1fQ.xTxDbklRyfqAQwFny7I257RDYYWNG_dhqtCDkQwljRE\"},\"timestamps\":1576394375579}', '2019-12-15 15:19:36');
INSERT INTO `sys_log` VALUES ('1206111548792111105', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NjQ4MDc3NiwiaWF0IjoxNTc2Mzk0Mzc2fQ.XEMJxKz8NmZmfmoz-cqWFg7-BP1mI-ZWYTpeP07PZGE\"},\"timestamps\":1576394376357}', '2019-12-15 15:19:36');
INSERT INTO `sys_log` VALUES ('1206111557394628609', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NjQ4MDc3OCwiaWF0IjoxNTc2Mzk0Mzc4fQ.BKB4gGx8N1QoqX-iVttOGUtmpdLerYHQPB5-OXgDEXQ\"},\"timestamps\":1576394378408}', '2019-12-15 15:19:38');
INSERT INTO `sys_log` VALUES ('1206111941420908545', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 15:21:10');
INSERT INTO `sys_log` VALUES ('1206118711849648130', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 15:48:04');
INSERT INTO `sys_log` VALUES ('1206118743650861058', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"张闯\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"handsome boy2, 超级管理员啦啦啦啦啦啦\",\"avatar\":\"static/upload/2019_12_15/1576396090839_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1576396091745}', '2019-12-15 15:48:12');
INSERT INTO `sys_log` VALUES ('1206118743831216130', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 15:48:12');
INSERT INTO `sys_log` VALUES ('1206119019455709185', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"张闯2\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"handsome boy2, 超级管理员啦啦啦啦啦啦\",\"avatar\":\"static/upload/2019_12_15/1576396090839_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1576396157503}', '2019-12-15 15:49:18');
INSERT INTO `sys_log` VALUES ('1206119020915326977', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 15:49:18');
INSERT INTO `sys_log` VALUES ('1206119071477661697', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"张闯\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"handsome boy2, 超级管理员啦啦啦啦啦啦\",\"avatar\":\"static/upload/2019_12_15/1576396090839_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1576396169906}', '2019-12-15 15:49:30');
INSERT INTO `sys_log` VALUES ('1206119072488488962', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 15:49:30');
INSERT INTO `sys_log` VALUES ('1206120092190900226', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 15:53:33');
INSERT INTO `sys_log` VALUES ('1206120136172371970', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"张闯\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"handsome boy2, 超级管理员啦啦啦啦啦啦\",\"avatar\":\"static/upload/2019_12_15/1576396422821_743575_code-together.png\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1576396423749}', '2019-12-15 15:53:44');
INSERT INTO `sys_log` VALUES ('1206120137179004930', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 15:53:44');
INSERT INTO `sys_log` VALUES ('1206123149561692162', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NjQ4MzU0MiwiaWF0IjoxNTc2Mzk3MTQyfQ.Xtc5VXJMB2IamKDp7vZdXJJ_kaGPQDsNF4YvWLgk_Ro\"},\"timestamps\":1576397142196}', '2019-12-15 16:05:42');
INSERT INTO `sys_log` VALUES ('1206123149742047234', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:05:42');
INSERT INTO `sys_log` VALUES ('1206126319805399041', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:18:18');
INSERT INTO `sys_log` VALUES ('1206126463288344578', '0', 'admin', '127.0.0.1', '/v1/account/update-user-info', '[\"admin\",{\"nickname\":\"张闯\",\"phone\":\"15238002477\",\"email\":\"916432779@qq.com\",\"intro\":\"handsome boy2, 超级管理员啦啦啦啦啦啦\",\"avatar\":\"static/upload/2019_12_15/1576397930922_743575_code-together.png\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.updateUserInfo()', '修改用户信息', '{\"status\":true,\"code\":1007,\"msg\":\"更新用户信息成功\",\"timestamps\":1576397932250}', '2019-12-15 16:18:52');
INSERT INTO `sys_log` VALUES ('1206126463519031298', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:18:52');
INSERT INTO `sys_log` VALUES ('1206126866092523522', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:20:28');
INSERT INTO `sys_log` VALUES ('1206127013631361026', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NjQ4NDQ2MywiaWF0IjoxNTc2Mzk4MDYzfQ.Q4t0oA2CfCPanQkVxK5nbWQmQu7p4bAiAvbh_DLQh9Q\"},\"timestamps\":1576398063462}', '2019-12-15 16:21:03');
INSERT INTO `sys_log` VALUES ('1206127013966905346', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:21:04');
INSERT INTO `sys_log` VALUES ('1206127243030429697', NULL, 'admin', '127.0.0.1', '/v1/sys/user/update/2', '[\"2\",{\"id\":\"2\",\"state\":\"0\",\"phone\":\"15238002476\",\"email\":\"2\",\"intro\":\"2\",\"avatar\":\"static/upload/2019_12_15/1576398083884_585971a4b967152d2c6470cb4d4bf082.jpeg\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.UserController.update()', '修改用户', '{\"status\":true,\"code\":1002,\"msg\":\"修改成功\",\"timestamps\":1576398118154}', '2019-12-15 16:21:58');
INSERT INTO `sys_log` VALUES ('1206127725614465026', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:23:53');
INSERT INTO `sys_log` VALUES ('1206127732946108418', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:23:55');
INSERT INTO `sys_log` VALUES ('1206127804622569474', '0', 'admin', '127.0.0.1', '/v1/account/login', '[{\"username\":\"admin\",\"password\":\"123456\"}]', 'POST', 'com.qinyou.apiserver.sys.controller.AccountController.getToken()', '用户登录', '{\"status\":true,\"code\":1000,\"msg\":\"登录成功\",\"data\":{\"expireIdle\":24,\"token\":\"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3NjQ4NDY1MiwiaWF0IjoxNTc2Mzk4MjUyfQ.XaaQta-5CUT8SmJwgLFyjPQL72DM9-zumfOiRxSgIqw\"},\"timestamps\":1576398252050}', '2019-12-15 16:24:12');
INSERT INTO `sys_log` VALUES ('1206127804974891009', NULL, 'admin', '127.0.0.1', '/v1/account/user-info', '[\"admin\"]', 'GET', 'com.qinyou.apiserver.sys.controller.AccountController.getUserInfo()', '获得用户信息、用户角色权限', '数据过大，不给予记录', '2019-12-15 16:24:12');

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
INSERT INTO `sys_resource` VALUES ('sysDict', '数据字典', 'ON', 'menu', 3, NULL, NULL, '2019-12-12 11:31:50', 'admin', '2019-12-12 11:32:01', 'admin');
INSERT INTO `sys_resource` VALUES ('sysDict:add', '新增', 'ON', 'btn', 0, NULL, NULL, '2019-12-12 11:32:18', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysDict:edit', '编辑', 'ON', 'btn', 1, NULL, NULL, '2019-12-12 11:32:32', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysDict:remove', '删除', 'ON', 'btn', 2, NULL, NULL, '2019-12-12 11:32:46', 'admin', NULL, NULL);
INSERT INTO `sys_resource` VALUES ('sysDict:toggle', '切换状态', 'ON', 'btn', 3, NULL, NULL, '2019-12-12 11:33:06', 'admin', NULL, NULL);
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
INSERT INTO `sys_role` VALUES ('1', '1', '1', 'ON', '2019-12-12 09:08:47', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('2', '2', '2', 'ON', '2019-12-12 09:08:52', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('3', '3', '3', 'ON', '2019-12-12 09:08:58', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('4', '4', '4', 'ON', '2019-12-12 09:09:03', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('5', '5', '5', 'ON', '2019-12-12 09:09:07', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES ('admin', '管理员', '管理员分配所有权限', 'ON', '2019-12-10 18:17:01', 'chuang', '2019-12-11 18:44:00', 'admin');
INSERT INTO `sys_role` VALUES ('PermissionAdmin', '权限管理员', '管理用户权限，分配权限相关权限', 'ON', '2019-12-12 09:01:46', 'admin', NULL, NULL);

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
INSERT INTO `sys_role_resource` VALUES ('1204397808413573122', 'admin', 'sysUser', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808447127554', 'admin', 'sysUser:add', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808468099074', 'admin', 'sysUser:configRoles', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808493264897', 'admin', 'sysUser:remove', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808518430721', 'admin', 'sysUser:toggle', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204397808539402241', 'admin', 'sysUser:update', 'chuang', '2019-12-10 21:49:49');
INSERT INTO `sys_role_resource` VALUES ('1204412141705101314', 'admin', 'sysUser:resetPwd', 'chuang', '2019-12-10 22:46:46');
INSERT INTO `sys_role_resource` VALUES ('1205033676853739521', 'admin', 'sysResource:roles', 'admin', '2019-12-12 15:56:32');
INSERT INTO `sys_role_resource` VALUES ('1205033676895682562', 'admin', 'sysResource:users', 'admin', '2019-12-12 15:56:32');
INSERT INTO `sys_role_resource` VALUES ('1205033816159158274', 'admin', 'sysDict', 'admin', '2019-12-12 15:57:05');
INSERT INTO `sys_role_resource` VALUES ('1205035789306560514', 'admin', 'sysDict:add', 'admin', '2019-12-12 16:04:55');
INSERT INTO `sys_role_resource` VALUES ('1205035789327532034', 'admin', 'sysDict:edit', 'admin', '2019-12-12 16:04:55');
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
INSERT INTO `sys_role_resource` VALUES ('1205059753022062593', 'PermissionAdmin', 'sysDict:edit', 'admin', '2019-12-12 17:40:09');
INSERT INTO `sys_role_resource` VALUES ('1205059753030451201', 'PermissionAdmin', 'sysDict:remove', 'admin', '2019-12-12 17:40:09');
INSERT INTO `sys_role_resource` VALUES ('1205059753047228417', 'PermissionAdmin', 'sysDict:toggle', 'admin', '2019-12-12 17:40:09');

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
INSERT INTO `sys_user` VALUES ('2', NULL, '$2a$10$n4PmkAjxP7CvPV3o8JeSgukOSDFTmjCDUtK/No42GI9WhUCQvKe9G', '0', '15238002476', '2', '2', 'static/upload/2019_12_15/1576398083884_585971a4b967152d2c6470cb4d4bf082.jpeg', '2019-12-10 22:26:55', 'admin', '2019-12-15 16:21:58', 'admin');
INSERT INTO `sys_user` VALUES ('admin', '张闯', '$2a$10$2vcA6mz4wgD/MOXMp4YTNOITyoTaak8gH.KX/MXV0xDyq1VqX7cG.', '0', '15238002477', '916432779@qq.com', 'handsome boy2, 超级管理员啦啦啦啦啦啦', 'static/upload/2019_12_15/1576397930922_743575_code-together.png', '2019-12-10 17:53:00', 'chuang', '2019-12-15 16:18:52', 'admin');

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
INSERT INTO `sys_user_role` VALUES ('1204931240759656450', 'admin', '5', 'admin', '2019-12-12 09:09:29');
INSERT INTO `sys_user_role` VALUES ('1205066278960627714', 'admin', '2', 'admin', '2019-12-12 18:06:05');
INSERT INTO `sys_user_role` VALUES ('1205066309184782337', 'admin', '3', 'admin', '2019-12-12 18:06:12');

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
INSERT INTO `sys_verification_code` VALUES ('1197429388648382466', '916432779@qq.com', '405712', '1', '2019-11-21 16:22:25', '0');
INSERT INTO `sys_verification_code` VALUES ('1197439603582173186', '916432779@qq.com', '078932', '1', '2019-11-21 17:02:47', '0');
INSERT INTO `sys_verification_code` VALUES ('1197450856576843778', '916432779@qq.com', '208986', '0', '2019-11-21 17:45:06', '0');
INSERT INTO `sys_verification_code` VALUES ('1197457499322580993', '916432779@qq.com', '757850', '1', '2019-11-21 18:11:30', '0');
INSERT INTO `sys_verification_code` VALUES ('1198973352744583169', '15238002477', '067949', '0', '2019-11-25 22:34:58', '0');
INSERT INTO `sys_verification_code` VALUES ('1198973716688535553', '15238002477', '388666', '0', '2019-11-25 22:36:25', '0');
INSERT INTO `sys_verification_code` VALUES ('1201057661194338305', '15238002477', '754290', '0', '2019-12-01 16:37:16', '0');

SET FOREIGN_KEY_CHECKS = 1;
