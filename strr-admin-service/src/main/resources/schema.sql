/*
 Navicat Premium Data Transfer
 Source Server         : mysql-local
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : strr_admin
 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001
 Date: 29/07/2023 16:46:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `color` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `parent_id` int NULL DEFAULT NULL COMMENT '父菜单',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮类型',
  `creator` int NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updator` int NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_authority
-- ----------------------------
INSERT INTO `sys_authority` VALUES (1, NULL, '/home', 'Home', '后台管理', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (2, '', '/admin', 'Admin', '系统管理', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_authority` VALUES (3, '/admin/user', '/user', 'User', '用户管理', NULL, NULL, 2, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_authority` VALUES (4, '/admin/role', '/role', 'Role', '角色管理', NULL, NULL, 2, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_authority` VALUES (5, '/admin/authority', '/authority', 'Authority', '权限管理', NULL, NULL, 2, 0, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_authority` VALUES (6, NULL, NULL, 'show', '查看', 'primary', 'el-icon-view', 3, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (7, NULL, NULL, 'add', '添加', 'success', 'el-icon-plus', 3, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (8, NULL, NULL, 'edit', '修改', 'warning', 'el-icon-edit', 3, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (9, NULL, NULL, 'del', '删除', 'danger', 'el-icon-delete', 3, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (10, NULL, NULL, 'alloc', '权限', 'primary', 'el-icon-view', 4, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (11, NULL, NULL, 'add', '添加', 'success', 'el-icon-plus', 4, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (12, NULL, NULL, 'edit', '修改', 'warning', 'el-icon-edit', 4, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (13, NULL, NULL, 'del', '删除', 'danger', 'el-icon-delete', 4, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (14, NULL, NULL, 'show', '查看', 'primary', 'el-icon-view', 5, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (15, NULL, NULL, 'add', '添加', 'success', 'el-icon-plus', 5, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (16, NULL, NULL, 'edit', '修改', 'warning', 'el-icon-edit', 5, 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_authority` VALUES (17, NULL, NULL, 'del', '删除', 'danger', 'el-icon-delete', 5, 3, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_rel_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_rel_role_authority`;
CREATE TABLE `sys_rel_role_authority`  (
  `rid` int NULL DEFAULT NULL COMMENT '角色id',
  `aid` int NULL DEFAULT NULL COMMENT '权限id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_rel_role_authority
-- ----------------------------
INSERT INTO `sys_rel_role_authority` VALUES (1, 1);
INSERT INTO `sys_rel_role_authority` VALUES (1, 2);
INSERT INTO `sys_rel_role_authority` VALUES (1, 3);
INSERT INTO `sys_rel_role_authority` VALUES (1, 4);
INSERT INTO `sys_rel_role_authority` VALUES (1, 5);
INSERT INTO `sys_rel_role_authority` VALUES (1, 6);
INSERT INTO `sys_rel_role_authority` VALUES (1, 7);
INSERT INTO `sys_rel_role_authority` VALUES (1, 8);
INSERT INTO `sys_rel_role_authority` VALUES (1, 9);
INSERT INTO `sys_rel_role_authority` VALUES (1, 10);
INSERT INTO `sys_rel_role_authority` VALUES (1, 11);
INSERT INTO `sys_rel_role_authority` VALUES (1, 12);
INSERT INTO `sys_rel_role_authority` VALUES (1, 13);
INSERT INTO `sys_rel_role_authority` VALUES (1, 14);
INSERT INTO `sys_rel_role_authority` VALUES (1, 15);
INSERT INTO `sys_rel_role_authority` VALUES (1, 16);
INSERT INTO `sys_rel_role_authority` VALUES (1, 17);

-- ----------------------------
-- Table structure for sys_rel_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_rel_user_role`;
CREATE TABLE `sys_rel_user_role`  (
  `uid` int NULL DEFAULT NULL COMMENT '用户id',
  `rid` int NULL DEFAULT NULL COMMENT '角色id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_rel_user_role
-- ----------------------------
INSERT INTO `sys_rel_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `seq` tinyint NULL DEFAULT NULL COMMENT '排序',
  `creator` int NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updator` int NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ROLE_ADMIN', '管理员', NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `creator` int NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updator` int NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$HLpbo23NoKfxTKuv5UAaB.KMCNvXoCPXDXUKlnZUBQlmhrihU.b2S', '管理员', 'admin@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;