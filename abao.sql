/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : abao

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-10-06 07:30:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ab_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_access`;
CREATE TABLE `ab_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表';

-- ----------------------------
-- Records of ab_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for ab_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_action`;
CREATE TABLE `ab_admin_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of ab_admin_action
-- ----------------------------
INSERT INTO `ab_admin_action` VALUES ('1', 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', '1', '1480156399', '1480163853');
INSERT INTO `ab_admin_action` VALUES ('2', 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', '1', '1480164578', '1480297748');
INSERT INTO `ab_admin_action` VALUES ('3', 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', '1', '1480168582', '1480168616');
INSERT INTO `ab_admin_action` VALUES ('4', 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', '1', '1480169185', '1480169185');
INSERT INTO `ab_admin_action` VALUES ('5', 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', '1', '1480169214', '1480170581');
INSERT INTO `ab_admin_action` VALUES ('6', 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', '1', '1480221441', '1480221563');
INSERT INTO `ab_admin_action` VALUES ('7', 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', '1', '1480251473', '1480251473');
INSERT INTO `ab_admin_action` VALUES ('8', 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', '1', '1480252369', '1480252369');
INSERT INTO `ab_admin_action` VALUES ('9', 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', '1', '1480252580', '1480252580');
INSERT INTO `ab_admin_action` VALUES ('10', 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', '1', '1480252620', '1480252620');
INSERT INTO `ab_admin_action` VALUES ('11', 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', '1', '1480252651', '1480252651');
INSERT INTO `ab_admin_action` VALUES ('12', 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', '1', '1480253226', '1480253332');
INSERT INTO `ab_admin_action` VALUES ('13', 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', '1', '1480253267', '1480253340');
INSERT INTO `ab_admin_action` VALUES ('14', 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', '1', '1480253323', '1480253323');
INSERT INTO `ab_admin_action` VALUES ('15', 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', '1', '1480296196', '1480296196');
INSERT INTO `ab_admin_action` VALUES ('16', 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', '1', '1480296960', '1480296960');
INSERT INTO `ab_admin_action` VALUES ('17', 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', '1', '1480298479', '1480298479');
INSERT INTO `ab_admin_action` VALUES ('18', 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', '1', '1480298506', '1480298506');
INSERT INTO `ab_admin_action` VALUES ('19', 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', '1', '1480298532', '1480298532');
INSERT INTO `ab_admin_action` VALUES ('20', 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', '1', '1480298946', '1480298946');
INSERT INTO `ab_admin_action` VALUES ('21', 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', '1', '1480301990', '1480302022');
INSERT INTO `ab_admin_action` VALUES ('22', 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', '1', '1480302616', '1480302616');
INSERT INTO `ab_admin_action` VALUES ('23', 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', '1', '1480302798', '1480302798');
INSERT INTO `ab_admin_action` VALUES ('24', 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', '1', '1480302870', '1480302870');
INSERT INTO `ab_admin_action` VALUES ('25', 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', '1', '1480303198', '1480303198');
INSERT INTO `ab_admin_action` VALUES ('26', 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', '1', '1480303229', '1480303229');
INSERT INTO `ab_admin_action` VALUES ('27', 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', '1', '1480303264', '1480303264');
INSERT INTO `ab_admin_action` VALUES ('28', 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', '1', '1480303294', '1480303294');
INSERT INTO `ab_admin_action` VALUES ('29', 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', '1', '1480303409', '1480303409');
INSERT INTO `ab_admin_action` VALUES ('30', 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', '1', '1480305468', '1480305468');
INSERT INTO `ab_admin_action` VALUES ('31', 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', '1', '1480305513', '1480305513');
INSERT INTO `ab_admin_action` VALUES ('32', 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', '1', '1480305562', '1480305562');
INSERT INTO `ab_admin_action` VALUES ('33', 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', '1', '1480305630', '1480305630');
INSERT INTO `ab_admin_action` VALUES ('34', 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', '1', '1480305659', '1480305659');
INSERT INTO `ab_admin_action` VALUES ('35', 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', '1', '1480307558', '1480307558');
INSERT INTO `ab_admin_action` VALUES ('36', 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', '1', '1480307588', '1480307588');
INSERT INTO `ab_admin_action` VALUES ('37', 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', '1', '1480307618', '1480307618');
INSERT INTO `ab_admin_action` VALUES ('38', 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', '1', '1480307653', '1480307653');
INSERT INTO `ab_admin_action` VALUES ('39', 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', '1', '1480307682', '1480307682');
INSERT INTO `ab_admin_action` VALUES ('40', 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', '1', '1480308342', '1480308342');
INSERT INTO `ab_admin_action` VALUES ('41', 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', '1', '1480308372', '1480308372');
INSERT INTO `ab_admin_action` VALUES ('42', 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', '1', '1480309555', '1480309642');
INSERT INTO `ab_admin_action` VALUES ('43', 'cms', 'slider_delete', '删除滚动图片', '删除滚动图片', '', '[user|get_nickname] 删除了滚动图片：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('44', 'cms', 'slider_edit', '编辑滚动图片', '编辑滚动图片', '', '[user|get_nickname] 编辑了滚动图片：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('45', 'cms', 'slider_add', '添加滚动图片', '添加滚动图片', '', '[user|get_nickname] 添加了滚动图片：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('46', 'cms', 'document_delete', '删除文档', '删除文档', '', '[user|get_nickname] 删除了文档：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('47', 'cms', 'document_restore', '还原文档', '还原文档', '', '[user|get_nickname] 还原了文档：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('48', 'cms', 'nav_disable', '禁用导航', '禁用导航', '', '[user|get_nickname] 禁用了导航：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('49', 'cms', 'nav_enable', '启用导航', '启用导航', '', '[user|get_nickname] 启用了导航：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('50', 'cms', 'nav_delete', '删除导航', '删除导航', '', '[user|get_nickname] 删除了导航：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('51', 'cms', 'nav_edit', '编辑导航', '编辑导航', '', '[user|get_nickname] 编辑了导航：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('52', 'cms', 'nav_add', '添加导航', '添加导航', '', '[user|get_nickname] 添加了导航：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('53', 'cms', 'model_disable', '禁用内容模型', '禁用内容模型', '', '[user|get_nickname] 禁用了内容模型：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('54', 'cms', 'model_enable', '启用内容模型', '启用内容模型', '', '[user|get_nickname] 启用了内容模型：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('55', 'cms', 'model_delete', '删除内容模型', '删除内容模型', '', '[user|get_nickname] 删除了内容模型：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('56', 'cms', 'model_edit', '编辑内容模型', '编辑内容模型', '', '[user|get_nickname] 编辑了内容模型：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('57', 'cms', 'model_add', '添加内容模型', '添加内容模型', '', '[user|get_nickname] 添加了内容模型：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('58', 'cms', 'menu_disable', '禁用导航菜单', '禁用导航菜单', '', '[user|get_nickname] 禁用了导航菜单：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('59', 'cms', 'menu_enable', '启用导航菜单', '启用导航菜单', '', '[user|get_nickname] 启用了导航菜单：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('60', 'cms', 'menu_delete', '删除导航菜单', '删除导航菜单', '', '[user|get_nickname] 删除了导航菜单：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('61', 'cms', 'menu_edit', '编辑导航菜单', '编辑导航菜单', '', '[user|get_nickname] 编辑了导航菜单：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('62', 'cms', 'menu_add', '添加导航菜单', '添加导航菜单', '', '[user|get_nickname] 添加了导航菜单：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('63', 'cms', 'link_disable', '禁用友情链接', '禁用友情链接', '', '[user|get_nickname] 禁用了友情链接：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('64', 'cms', 'link_enable', '启用友情链接', '启用友情链接', '', '[user|get_nickname] 启用了友情链接：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('65', 'cms', 'link_delete', '删除友情链接', '删除友情链接', '', '[user|get_nickname] 删除了友情链接：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('66', 'cms', 'link_edit', '编辑友情链接', '编辑友情链接', '', '[user|get_nickname] 编辑了友情链接：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('67', 'cms', 'link_add', '添加友情链接', '添加友情链接', '', '[user|get_nickname] 添加了友情链接：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('68', 'cms', 'field_disable', '禁用模型字段', '禁用模型字段', '', '[user|get_nickname] 禁用了模型字段：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('69', 'cms', 'field_enable', '启用模型字段', '启用模型字段', '', '[user|get_nickname] 启用了模型字段：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('70', 'cms', 'field_delete', '删除模型字段', '删除模型字段', '', '[user|get_nickname] 删除了模型字段：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('71', 'cms', 'field_edit', '编辑模型字段', '编辑模型字段', '', '[user|get_nickname] 编辑了模型字段：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('72', 'cms', 'field_add', '添加模型字段', '添加模型字段', '', '[user|get_nickname] 添加了模型字段：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('73', 'cms', 'column_disable', '禁用栏目', '禁用栏目', '', '[user|get_nickname] 禁用了栏目：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('74', 'cms', 'column_enable', '启用栏目', '启用栏目', '', '[user|get_nickname] 启用了栏目：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('75', 'cms', 'column_delete', '删除栏目', '删除栏目', '', '[user|get_nickname] 删除了栏目：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('76', 'cms', 'column_edit', '编辑栏目', '编辑栏目', '', '[user|get_nickname] 编辑了栏目：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('77', 'cms', 'column_add', '添加栏目', '添加栏目', '', '[user|get_nickname] 添加了栏目：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('78', 'cms', 'advert_type_disable', '禁用广告分类', '禁用广告分类', '', '[user|get_nickname] 禁用了广告分类：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('79', 'cms', 'advert_type_enable', '启用广告分类', '启用广告分类', '', '[user|get_nickname] 启用了广告分类：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('80', 'cms', 'advert_type_delete', '删除广告分类', '删除广告分类', '', '[user|get_nickname] 删除了广告分类：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('81', 'cms', 'advert_type_edit', '编辑广告分类', '编辑广告分类', '', '[user|get_nickname] 编辑了广告分类：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('82', 'cms', 'advert_type_add', '添加广告分类', '添加广告分类', '', '[user|get_nickname] 添加了广告分类：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('83', 'cms', 'advert_disable', '禁用广告', '禁用广告', '', '[user|get_nickname] 禁用了广告：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('84', 'cms', 'advert_enable', '启用广告', '启用广告', '', '[user|get_nickname] 启用了广告：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('85', 'cms', 'advert_delete', '删除广告', '删除广告', '', '[user|get_nickname] 删除了广告：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('86', 'cms', 'advert_edit', '编辑广告', '编辑广告', '', '[user|get_nickname] 编辑了广告：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('87', 'cms', 'advert_add', '添加广告', '添加广告', '', '[user|get_nickname] 添加了广告：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('88', 'cms', 'document_disable', '禁用文档', '禁用文档', '', '[user|get_nickname] 禁用了文档：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('89', 'cms', 'document_enable', '启用文档', '启用文档', '', '[user|get_nickname] 启用了文档：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('90', 'cms', 'document_trash', '回收文档', '回收文档', '', '[user|get_nickname] 回收了文档：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('91', 'cms', 'document_edit', '编辑文档', '编辑文档', '', '[user|get_nickname] 编辑了文档：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('92', 'cms', 'document_add', '添加文档', '添加文档', '', '[user|get_nickname] 添加了文档：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('93', 'cms', 'slider_enable', '启用滚动图片', '启用滚动图片', '', '[user|get_nickname] 启用了滚动图片：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('94', 'cms', 'slider_disable', '禁用滚动图片', '禁用滚动图片', '', '[user|get_nickname] 禁用了滚动图片：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('95', 'cms', 'support_add', '添加客服', '添加客服', '', '[user|get_nickname] 添加了客服：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('96', 'cms', 'support_edit', '编辑客服', '编辑客服', '', '[user|get_nickname] 编辑了客服：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('97', 'cms', 'support_delete', '删除客服', '删除客服', '', '[user|get_nickname] 删除了客服：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('98', 'cms', 'support_enable', '启用客服', '启用客服', '', '[user|get_nickname] 启用了客服：[details]', '1', '1504322571', '1504322571');
INSERT INTO `ab_admin_action` VALUES ('99', 'cms', 'support_disable', '禁用客服', '禁用客服', '', '[user|get_nickname] 禁用了客服：[details]', '1', '1504322571', '1504322571');

-- ----------------------------
-- Table structure for ab_admin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_attachment`;
CREATE TABLE `ab_admin_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(64) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of ab_admin_attachment
-- ----------------------------
INSERT INTO `ab_admin_attachment` VALUES ('1', '1', '290560_201604221639079hdr.jpg', 'cms', 'uploads/images/20170920/c0f0c40af376531b3ad1115aed7e3749.jpg', '', '', 'image/jpeg', 'jpg', '153923', 'c02aadffb98e15fd700a6f50bdaf6ed3', '96b5c9a8bdd1d9d9aae5a885ba25ba6162696567', 'local', '0', '1505920037', '1505920037', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('2', '1', '0bf1cda0228b4d7f291d52df350b1d86.jpeg', 'cms', 'uploads/images/20170920/0bf1cda0228b4d7f291d52df350b1d86.jpeg', '', '', 'image/jpeg', 'jpeg', '38822', '4b262fa773d96545bc4cc9ff62c681dc', '68d0362aadc360429ed5ccbaf64db3f8ac465afa', 'local', '0', '1505920092', '1505920092', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('3', '1', '260360_201604231609qtqq0p.jpg', 'cms', 'uploads/images/20170920/7fbd7f79121dc6caac25f8fd2c38b815.jpg', '', '', 'image/jpeg', 'jpg', '54930', 'b6dba2900108402e1b1af54bfe6ece68', '85cd273d97f130a2aade3d409b22cd65dc252374', 'local', '0', '1505920110', '1505920110', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('4', '1', '7575_2016052316282fkzuy.jpg', 'cms', 'uploads/images/20170920/5e69e906f37532b86d705be1a6107953.jpg', '', '', 'image/jpeg', 'jpg', '5618', '342ceee38f743641a766cfc8421ba08d', 'a8a6d601273b1bccd190b446dc198fce963c684e', 'local', '0', '1505920115', '1505920115', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('5', '1', '7575_2016052316346hxqfv.jpg', 'cms', 'uploads/images/20170920/96d3317919a39d8bf5c64dd36769d538.jpg', '', '', 'image/jpeg', 'jpg', '6479', '12ca18357ed6fab4016795efb8d7a1b6', '7ea97a317c19913954e7eac23e3e3dc0fac84d71', 'local', '0', '1505920117', '1505920117', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('6', '1', '070d5d36724f020de7b5db26bc68982d.jpeg', 'cms', 'uploads/images/20170920/070d5d36724f020de7b5db26bc68982d.jpeg', '', '', 'image/jpeg', 'jpeg', '28117', 'a638a3b6ea3290916ba6ad19d543961a', '60123f49fc6f99faeddfaabd6524a9381aef78f8', 'local', '0', '1505920282', '1505920282', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('7', '1', '231373_201604221329gtncd4.jpg', 'cms', 'uploads/images/20170920/3e3583780eb80732ffc029a7f7757467.jpg', '', '', 'image/jpeg', 'jpg', '77626', '6cc2adcf4f7a8d6a01c68f52163e9697', 'ea0793254b2fe33c5fb80be0c8003b6d35175d41', 'local', '0', '1505920291', '1505920291', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('8', '1', '231373_201604221357udcn84.jpg', 'cms', 'uploads/images/20170920/466d560d47e3ec98d9f6256c972b0b33.jpg', '', '', 'image/jpeg', 'jpg', '94797', 'c93caf86b041c0a44f0f3c7f950c37fc', '94371dc34bd95b7cd59c618c675a8833eb77edfa', 'local', '0', '1505920293', '1505920293', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('9', '1', '231373_201604221401k680iu.jpg', 'cms', 'uploads/images/20170920/d330f0e924436b8884ab01708e18a85a.jpg', '', '', 'image/jpeg', 'jpg', '83189', 'e35ef360d9e57f983e9106d10d8e2c09', 'e5d1961e715efd1d2a1ddace87191aef520bb251', 'local', '0', '1505920294', '1505920294', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('10', '1', 'logo.png', 'admin', 'uploads/images/20170920/3c2e135469280910336616af80cf37a0.png', '', '', 'image/png', 'png', '8192', 'fb46aef5965ed0550878eb2becf2954a', 'c074ea3e5c5e58cdf671e1a07c9b0e3727f144b6', 'local', '0', '1505921484', '1505921484', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('11', '1', '201611030256fj68pm.jpg', 'cms', 'uploads/images/20170921/829c99d86a1ab96dee7bd90c20f8dbb5.jpg', '', '', 'image/jpeg', 'jpg', '798669', 'e6e6c1b5260520d48c0a6aa6ebb24684', '229397208a4344e3d62999fc5ead1cf4c2297c1c', 'local', '0', '1506008623', '1506008623', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('12', '1', '61b6ca543ff8357d4a0c7ee418b0d835.jpeg', 'cms', 'uploads/images/20170924/61b6ca543ff8357d4a0c7ee418b0d835.jpeg', '', '', 'image/jpeg', 'jpeg', '29620', '0c774d4ea410075a0afa7be44034979e', '639d2d0189705f81d11c239af27b522fc04b99da', 'local', '0', '1506258373', '1506258373', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('13', '1', 'ban_kz.jpg', 'cms', 'uploads/images/20170924/bc696eb5606a542a3eca6b1ba1f4a681.jpg', '', '', 'image/jpeg', 'jpg', '520449', '93df9717fcb846d1a007462b12c4fcdc', '73f1dcd51314b1f6c0324ea6767dcc16a7c77226', 'local', '0', '1506258490', '1506258490', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('14', '1', 'ban_lx.jpg', 'cms', 'uploads/images/20170926/1ef94d459a938e34e416eb3e37d2d791.jpg', '', '', 'image/jpeg', 'jpg', '228859', '9aab0087650ad5667315eed56004438f', '75c3e81f161573541cb731d8d2e23e596de86c0a', 'local', '0', '1506390406', '1506390406', '100', '1');
INSERT INTO `ab_admin_attachment` VALUES ('15', '1', '1275176278752419.jpeg', 'cms', 'uploads/images/20170926/ed3eee11c4ffa9268eddc0fded2f3650.jpeg', '', '', 'image/jpeg', 'jpeg', '7777', 'b6d9dae69d5fb1c254b7264c7d1d4648', 'dcb5d7d0eff85f436711d9de734ae0fc153a192f', 'local', '0', '1506390488', '1506390488', '100', '1');

-- ----------------------------
-- Table structure for ab_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_config`;
CREATE TABLE `ab_admin_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of ab_admin_config
-- ----------------------------
INSERT INTO `ab_admin_config` VALUES ('1', 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', '2', '', '', '', '', '1475240395', '1477403914', '1', '1');
INSERT INTO `ab_admin_config` VALUES ('2', 'web_site_title', '站点标题', 'base', 'text', '海豚PHP', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240646', '1477710341', '2', '1');
INSERT INTO `ab_admin_config` VALUES ('3', 'web_site_slogan', '站点标语', 'base', 'text', '海豚PHP，极简、极速、极致', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475240994', '1477710357', '3', '1');
INSERT INTO `ab_admin_config` VALUES ('4', 'web_site_logo', '站点LOGO', 'base', 'image', '10', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241067', '1475241067', '4', '1');
INSERT INTO `ab_admin_config` VALUES ('5', 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', '2', '', '', '', '', '1475241186', '1475241186', '6', '1');
INSERT INTO `ab_admin_config` VALUES ('6', 'web_site_keywords', '站点关键词', 'base', 'text', '海豚PHP、PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', '2', '', '', '', '', '1475241328', '1475241328', '7', '1');
INSERT INTO `ab_admin_config` VALUES ('7', 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2017 DolphinPHP All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241416', '1477710383', '8', '1');
INSERT INTO `ab_admin_config` VALUES ('8', 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241441', '1477710441', '9', '1');
INSERT INTO `ab_admin_config` VALUES ('9', 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', '2', '', '', '', '', '1475241498', '1477710455', '10', '1');
INSERT INTO `ab_admin_config` VALUES ('10', 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241716', '1477649446', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('11', 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', '2', '', '', '', '', '1475241835', '1495853193', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('12', 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475241897', '1477663520', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('13', 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475241975', '1477649489', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('14', 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', '2', '', '', '', '', '1475242015', '1477663529', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('15', 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', '2', '', '', '', '', '1475242056', '1477649506', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('16', 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', '2', '', '', '', '', '1475242066', '1476074507', '101', '1');
INSERT INTO `ab_admin_config` VALUES ('17', 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', '2', '', '', '', '', '1475250066', '1477316689', '102', '1');
INSERT INTO `ab_admin_config` VALUES ('18', 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', '2', '', '', '', '', '1476864205', '1476864231', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('19', 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', '2', '', '', '', '', '1476866355', '1476866355', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('21', 'data_backup_path', '数据库备份根路径', 'database', 'text', './data/', '', '路径必须以 / 结尾', '', '', '', '', '', '2', '', '', '', '', '1477017745', '1477018467', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('22', 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', '2', '', '', '', '', '1477017886', '1477017886', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('23', 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', '2', '', '', '', '', '1477017978', '1477018172', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('24', 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', '2', '', '', '', '', '1477018083', '1477018083', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('25', 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', '2', '', '', '', '', '1477579289', '1477579289', '103', '1');
INSERT INTO `ab_admin_config` VALUES ('26', 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', '2', '', '', '', '', '1477620643', '1477620643', '5', '1');
INSERT INTO `ab_admin_config` VALUES ('27', 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', '2', '', '', '', '', '1477644150', '1477649513', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('28', 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', '2', '', '', '', '', '1477646271', '1477649521', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('29', 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', '2', '', '', '', '', '1477649648', '1477649648', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('30', 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656390', '1477656390', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('31', 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', '2', '', '', '', '', '1477656528', '1477656528', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('32', 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', '2', '', '', '', '', '1477656714', '1477661309', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('33', 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', '2', '', '', '', '', '1477727305', '1477727305', '100', '1');
INSERT INTO `ab_admin_config` VALUES ('34', 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', '2', '', '', '', '', '1478771958', '1478771958', '99', '1');
INSERT INTO `ab_admin_config` VALUES ('35', 'home_default_module', '前台默认模块', 'system', 'select', 'cms', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', '0', '', '', '', '', '1486714723', '1486715620', '104', '1');
INSERT INTO `ab_admin_config` VALUES ('36', 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', '0', '', '', '', '', '1487035843', '1487035843', '99', '1');
INSERT INTO `ab_admin_config` VALUES ('37', 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', '0', '', '', '', '', '1501488567', '1501490821', '100', '1');

-- ----------------------------
-- Table structure for ab_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_hook`;
CREATE TABLE `ab_admin_hook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of ab_admin_hook
-- ----------------------------
INSERT INTO `ab_admin_hook` VALUES ('1', 'admin_index', '', '后台首页', '1', '1468174214', '1477757518', '1');
INSERT INTO `ab_admin_hook` VALUES ('2', 'plugin_index_tab_list', '', '插件扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `ab_admin_hook` VALUES ('3', 'module_index_tab_list', '', '模块扩展tab钩子', '1', '1468174214', '1468174214', '1');
INSERT INTO `ab_admin_hook` VALUES ('4', 'page_tips', '', '每个页面的提示', '1', '1468174214', '1468174214', '1');
INSERT INTO `ab_admin_hook` VALUES ('5', 'signin_footer', '', '登录页面底部钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `ab_admin_hook` VALUES ('6', 'signin_captcha', '', '登录页面验证码钩子', '1', '1479269315', '1479269315', '1');
INSERT INTO `ab_admin_hook` VALUES ('7', 'signin', '', '登录控制器钩子', '1', '1479386875', '1479386875', '1');
INSERT INTO `ab_admin_hook` VALUES ('8', 'upload_attachment', '', '附件上传钩子', '1', '1501493808', '1501493808', '1');

-- ----------------------------
-- Table structure for ab_admin_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_hook_plugin`;
CREATE TABLE `ab_admin_hook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表';

-- ----------------------------
-- Records of ab_admin_hook_plugin
-- ----------------------------
INSERT INTO `ab_admin_hook_plugin` VALUES ('1', 'admin_index', 'SystemInfo', '1477757503', '1477757503', '1', '1');
INSERT INTO `ab_admin_hook_plugin` VALUES ('2', 'admin_index', 'DevTeam', '1477755780', '1477755780', '2', '1');

-- ----------------------------
-- Table structure for ab_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_log`;
CREATE TABLE `ab_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of ab_admin_log
-- ----------------------------
INSERT INTO `ab_admin_log` VALUES ('1', '35', '1', '2130706433', 'admin_module', '0', '超级管理员 安装了模块：门户', '1', '1504322571');
INSERT INTO `ab_admin_log` VALUES ('2', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(system)', '1', '1504322597');
INSERT INTO `ab_admin_log` VALUES ('3', '30', '1', '2130706433', 'admin_menu', '307', '超级管理员 添加了节点：所属模块(cms),所属节点ID(214),节点标题(主题列表),节点链接(cms/theme/index)', '1', '1505919283');
INSERT INTO `ab_admin_log` VALUES ('4', '32', '1', '2130706433', 'admin_menu', '307', '超级管理员 删除了节点：节点ID(307),节点标题(主题列表),节点链接(cms/theme/index)', '1', '1505919374');
INSERT INTO `ab_admin_log` VALUES ('5', '30', '1', '2130706433', 'admin_menu', '308', '超级管理员 添加了节点：所属模块(cms),所属节点ID(214),节点标题(主题列表),节点链接(cms/theme/index)', '1', '1505919400');
INSERT INTO `ab_admin_log` VALUES ('6', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(base)', '1', '1505921499');
INSERT INTO `ab_admin_log` VALUES ('7', '51', '1', '2130706433', 'cms_nav', '3', '超级管理员 编辑了导航：字段(tag)，原值(support_nav)，新值：(theme)', '1', '1505922498');
INSERT INTO `ab_admin_log` VALUES ('8', '51', '1', '2130706433', 'cms_nav', '3', '超级管理员 编辑了导航：字段(title)，原值(服务与支持)，新值：(造型大赏)', '1', '1505922514');
INSERT INTO `ab_admin_log` VALUES ('9', '51', '1', '2130706433', 'cms_nav', '2', '超级管理员 编辑了导航：字段(tag)，原值(about_nav)，新值：(customer)', '1', '1505922525');
INSERT INTO `ab_admin_log` VALUES ('10', '51', '1', '2130706433', 'cms_nav', '2', '超级管理员 编辑了导航：字段(title)，原值(底部关于)，新值：(最新客照)', '1', '1505922533');
INSERT INTO `ab_admin_log` VALUES ('11', '51', '1', '2130706433', 'cms_nav', '1', '超级管理员 编辑了导航：字段(title)，原值(顶部导航)，新值：(客户评价)', '1', '1505922598');
INSERT INTO `ab_admin_log` VALUES ('12', '52', '1', '2130706433', 'cms_nav', '4', '超级管理员 添加了导航：新闻活动', '1', '1505922653');
INSERT INTO `ab_admin_log` VALUES ('13', '52', '1', '2130706433', 'cms_nav', '5', '超级管理员 添加了导航：阿宝加盟', '1', '1505922669');
INSERT INTO `ab_admin_log` VALUES ('14', '51', '1', '2130706433', 'cms_nav', '3', '超级管理员 编辑了导航：字段(sort)，原值()，新值：(0)', '1', '1505922929');
INSERT INTO `ab_admin_log` VALUES ('15', '51', '1', '2130706433', 'cms_nav', '2', '超级管理员 编辑了导航：字段(sort)，原值()，新值：(1)', '1', '1505922934');
INSERT INTO `ab_admin_log` VALUES ('16', '51', '1', '2130706433', 'cms_nav', '1', '超级管理员 编辑了导航：字段(sort)，原值()，新值：(3)', '1', '1505922940');
INSERT INTO `ab_admin_log` VALUES ('17', '51', '1', '2130706433', 'cms_nav', '4', '超级管理员 编辑了导航：字段(sort)，原值()，新值：(4)', '1', '1505922942');
INSERT INTO `ab_admin_log` VALUES ('18', '51', '1', '2130706433', 'cms_nav', '5', '超级管理员 编辑了导航：字段(sort)，原值()，新值：(5)', '1', '1505922944');
INSERT INTO `ab_admin_log` VALUES ('19', '82', '1', '2130706433', 'cms_advert_type', '1', '超级管理员 添加了广告分类：首页banner图', '1', '1506008558');
INSERT INTO `ab_admin_log` VALUES ('20', '87', '1', '2130706433', 'cms_advert', '1', '超级管理员 添加了广告：首页广告图', '1', '1506008650');
INSERT INTO `ab_admin_log` VALUES ('21', '87', '1', '2130706433', 'cms_advert', '2', '超级管理员 添加了广告：banner图', '1', '1506009338');
INSERT INTO `ab_admin_log` VALUES ('22', '30', '1', '2130706433', 'admin_menu', '315', '超级管理员 添加了节点：所属模块(cms),所属节点ID(214),节点标题(客照列表),节点链接(cms/photo/index)', '1', '1506257963');
INSERT INTO `ab_admin_log` VALUES ('23', '82', '1', '2130706433', 'cms_advert_type', '2', '超级管理员 添加了广告分类：客片banner图片', '1', '1506258431');
INSERT INTO `ab_admin_log` VALUES ('24', '87', '1', '2130706433', 'cms_advert', '3', '超级管理员 添加了广告：kepianbnner', '1', '1506258508');
INSERT INTO `ab_admin_log` VALUES ('25', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(cms)', '1', '1506392283');
INSERT INTO `ab_admin_log` VALUES ('26', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(cms)', '1', '1506392602');
INSERT INTO `ab_admin_log` VALUES ('27', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(cms)', '1', '1506393162');
INSERT INTO `ab_admin_log` VALUES ('28', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(cms)', '1', '1506393204');
INSERT INTO `ab_admin_log` VALUES ('29', '42', '1', '2130706433', 'admin_config', '0', '超级管理员 更新了系统设置：分组(cms)', '1', '1506393251');
INSERT INTO `ab_admin_log` VALUES ('30', '34', '1', '2130706433', 'admin_menu', '279', '超级管理员 禁用了节点：节点ID(279),节点标题(内容模型),节点链接(cms/model/index)', '1', '1507196153');
INSERT INTO `ab_admin_log` VALUES ('31', '31', '1', '2130706433', 'admin_menu', '310', '超级管理员 编辑了节点：节点ID(310)', '1', '1507196209');
INSERT INTO `ab_admin_log` VALUES ('32', '31', '1', '2130706433', 'admin_menu', '311', '超级管理员 编辑了节点：节点ID(311)', '1', '1507196222');
INSERT INTO `ab_admin_log` VALUES ('33', '31', '1', '2130706433', 'admin_menu', '312', '超级管理员 编辑了节点：节点ID(312)', '1', '1507196236');
INSERT INTO `ab_admin_log` VALUES ('34', '30', '1', '2130706433', 'admin_menu', '322', '超级管理员 添加了节点：所属模块(cms),所属节点ID(0),节点标题(文章管理),节点链接(cms/news/index)', '1', '1507196333');
INSERT INTO `ab_admin_log` VALUES ('35', '31', '1', '2130706433', 'admin_menu', '322', '超级管理员 编辑了节点：节点ID(322)', '1', '1507196364');
INSERT INTO `ab_admin_log` VALUES ('36', '31', '1', '2130706433', 'admin_menu', '322', '超级管理员 编辑了节点：节点ID(322)', '1', '1507196461');
INSERT INTO `ab_admin_log` VALUES ('37', '82', '1', '2130706433', 'cms_advert_type', '3', '超级管理员 添加了广告分类：新闻列表页banner图', '1', '1507209692');
INSERT INTO `ab_admin_log` VALUES ('38', '87', '1', '2130706433', 'cms_advert', '4', '超级管理员 添加了广告：newsbanner', '1', '1507209728');

-- ----------------------------
-- Table structure for ab_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_menu`;
CREATE TABLE `ab_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of ab_admin_menu
-- ----------------------------
INSERT INTO `ab_admin_menu` VALUES ('1', '0', 'admin', '首页', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', '0', '1467617722', '1477710540', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('2', '1', 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', '0', '1467618170', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('3', '2', 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', '0', '1467618273', '1489049773', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('4', '0', 'admin', '系统', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', '0', '1467618361', '1477710540', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('5', '4', 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', '0', '1467618441', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('6', '5', 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', '0', '1467618490', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('7', '5', 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', '0', '1467618618', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('8', '7', 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', '0', '1467618648', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('9', '7', 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', '0', '1467619566', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('10', '7', 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', '0', '1467619583', '1477710695', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('11', '7', 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', '0', '1467619609', '1477710695', '4', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('12', '7', 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', '0', '1467619637', '1477710695', '5', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('13', '5', 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', '0', '1467619882', '1477710695', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('14', '13', 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', '0', '1467619902', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('15', '13', 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', '0', '1467620331', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('16', '13', 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', '0', '1467620363', '1477710695', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('17', '13', 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', '0', '1467620386', '1477710695', '4', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('18', '13', 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', '0', '1467620404', '1477710695', '5', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('19', '68', 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', '0', '1467688065', '1477710702', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('20', '19', 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1467688137', '1477710702', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('21', '20', 'user', '新增', '', 'module_admin', 'user/index/add', '_self', '0', '1467688177', '1477710702', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('22', '20', 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', '0', '1467688202', '1477710702', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('23', '20', 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', '0', '1467688219', '1477710702', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('24', '20', 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', '0', '1467688238', '1477710702', '4', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('25', '20', 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', '0', '1467688256', '1477710702', '5', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('211', '64', 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', '0', '1480299320', '1480299320', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('32', '4', 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', '0', '1467688853', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('33', '32', 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', '0', '1467689008', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('34', '33', 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', '0', '1467689153', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('35', '33', 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', '0', '1467689173', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('36', '33', 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', '0', '1467689192', '1477710695', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('37', '33', 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', '0', '1467689241', '1477710695', '4', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('38', '33', 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', '0', '1467689294', '1477710695', '5', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('39', '33', 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', '0', '1467689312', '1477710695', '6', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('40', '33', 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', '0', '1467689341', '1477710695', '7', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('41', '32', 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', '0', '1467689527', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('42', '41', 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', '0', '1467689650', '1477710695', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('43', '41', 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', '0', '1467689665', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('44', '41', 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', '0', '1467689680', '1477710695', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('45', '41', 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', '0', '1467689700', '1477710695', '4', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('46', '41', 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', '0', '1467689730', '1477710695', '5', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('47', '41', 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', '0', '1467689747', '1477710695', '6', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('48', '41', 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', '0', '1467689789', '1477710695', '7', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('49', '41', 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', '0', '1467689846', '1477710695', '8', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('50', '5', 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', '0', '1467690161', '1477710695', '4', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('51', '70', 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', '0', '1467690240', '1489049773', '1', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('52', '50', 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', '0', '1467690334', '1477710695', '2', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('53', '50', 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', '0', '1467690352', '1477710695', '3', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('54', '50', 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', '0', '1467690369', '1477710695', '4', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('55', '50', 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', '0', '1467690396', '1477710695', '5', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('56', '41', 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', '0', '1467858065', '1477710695', '11', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('57', '41', 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', '0', '1467858092', '1477710695', '10', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('60', '41', 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', '0', '1467858421', '1477710695', '9', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('61', '41', 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', '0', '1467879016', '1477710695', '14', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('62', '13', 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', '0', '1468073039', '1477710695', '6', '1', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('64', '5', 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', '0', '1476111944', '1477710695', '6', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('65', '5', 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', '0', '1476111992', '1477710695', '8', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('66', '32', 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', '0', '1476112326', '1477710695', '4', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('67', '19', 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', '0', '1476113025', '1477710702', '3', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('68', '0', 'user', '用户', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', '0', '1476193348', '1477710540', '3', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('69', '32', 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', '0', '1476236193', '1477710695', '3', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('70', '2', 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', '0', '1476237472', '1489049773', '1', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('71', '67', 'user', '新增', '', 'module_admin', 'user/role/add', '_self', '0', '1476256935', '1477710702', '1', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('72', '67', 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', '0', '1476256968', '1477710702', '2', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('73', '67', 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', '0', '1476256993', '1477710702', '3', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('74', '67', 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', '0', '1476257023', '1477710702', '4', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('75', '67', 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', '0', '1476257046', '1477710702', '5', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('76', '20', 'user', '授权', '', 'module_admin', 'user/index/access', '_self', '0', '1476375187', '1477710702', '6', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('77', '69', 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', '0', '1476668971', '1477710695', '1', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('78', '69', 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', '0', '1476669006', '1477710695', '2', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('79', '69', 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', '0', '1476669375', '1477710695', '3', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('80', '69', 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', '0', '1476669427', '1477710695', '4', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('81', '69', 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', '0', '1476669564', '1477710695', '5', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('183', '66', 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', '0', '1476851362', '1477710695', '1', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('184', '66', 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', '0', '1476851382', '1477710695', '2', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('185', '5', 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', '0', '1476882441', '1477710695', '7', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('186', '185', 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', '0', '1476884439', '1477710695', '1', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('187', '185', 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', '0', '1476884464', '1477710695', '2', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('188', '185', 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', '0', '1476884493', '1477710695', '3', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('189', '185', 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', '0', '1476884534', '1477710695', '4', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('190', '185', 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', '0', '1476884551', '1477710695', '5', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('191', '65', 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', '0', '1476972746', '1477710695', '1', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('192', '65', 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', '0', '1476972772', '1477710695', '2', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('193', '65', 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', '0', '1476972800', '1477710695', '3', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('194', '65', 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', '0', '1476972825', '1477710695', '4', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('195', '65', 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', '0', '1476973457', '1477710695', '5', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('210', '41', 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', '0', '1477713981', '1477713981', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('209', '185', 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', '0', '1477713939', '1477713939', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('208', '7', 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', '0', '1477713808', '1477713808', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('207', '69', 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', '0', '1477713770', '1477713770', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('212', '2', 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', '0', '1489049767', '1489049773', '2', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('213', '70', 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', '0', '1490588610', '1490588610', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('214', '0', 'cms', '门户', 'fa fa-fw fa-newspaper-o', 'module_admin', 'cms/index/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('215', '214', 'cms', '常用操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('216', '215', 'cms', '仪表盘', 'fa fa-fw fa-tachometer', 'module_admin', 'cms/index/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('217', '215', 'cms', '发布文档', 'fa fa-fw fa-plus', 'module_admin', 'cms/document/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('218', '215', 'cms', '文档列表', 'fa fa-fw fa-list', 'module_admin', 'cms/document/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('219', '218', 'cms', '编辑', '', 'module_admin', 'cms/document/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('220', '218', 'cms', '删除', '', 'module_admin', 'cms/document/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('221', '218', 'cms', '启用', '', 'module_admin', 'cms/document/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('222', '218', 'cms', '禁用', '', 'module_admin', 'cms/document/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('223', '218', 'cms', '快速编辑', '', 'module_admin', 'cms/document/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('224', '215', 'cms', '单页管理', 'fa fa-fw fa-file-word-o', 'module_admin', 'cms/page/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('225', '224', 'cms', '新增', '', 'module_admin', 'cms/page/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('226', '224', 'cms', '编辑', '', 'module_admin', 'cms/page/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('227', '224', 'cms', '删除', '', 'module_admin', 'cms/page/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('228', '224', 'cms', '启用', '', 'module_admin', 'cms/page/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('229', '224', 'cms', '禁用', '', 'module_admin', 'cms/page/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('230', '224', 'cms', '快速编辑', '', 'module_admin', 'cms/page/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('231', '215', 'cms', '回收站', 'fa fa-fw fa-recycle', 'module_admin', 'cms/recycle/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('232', '231', 'cms', '删除', '', 'module_admin', 'cms/recycle/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('233', '231', 'cms', '还原', '', 'module_admin', 'cms/recycle/restore', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('234', '214', 'cms', '内容管理', 'fa fa-fw fa-th-list', 'module_admin', '', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('235', '214', 'cms', '营销管理', 'fa fa-fw fa-money', 'module_admin', '', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('236', '235', 'cms', '广告管理', 'fa fa-fw fa-handshake-o', 'module_admin', 'cms/advert/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('237', '236', 'cms', '新增', '', 'module_admin', 'cms/advert/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('238', '236', 'cms', '编辑', '', 'module_admin', 'cms/advert/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('239', '236', 'cms', '删除', '', 'module_admin', 'cms/advert/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('240', '236', 'cms', '启用', '', 'module_admin', 'cms/advert/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('241', '236', 'cms', '禁用', '', 'module_admin', 'cms/advert/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('242', '236', 'cms', '快速编辑', '', 'module_admin', 'cms/advert/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('243', '236', 'cms', '广告分类', '', 'module_admin', 'cms/advert_type/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('244', '243', 'cms', '新增', '', 'module_admin', 'cms/advert_type/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('245', '243', 'cms', '编辑', '', 'module_admin', 'cms/advert_type/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('246', '243', 'cms', '删除', '', 'module_admin', 'cms/advert_type/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('247', '243', 'cms', '启用', '', 'module_admin', 'cms/advert_type/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('248', '243', 'cms', '禁用', '', 'module_admin', 'cms/advert_type/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('249', '243', 'cms', '快速编辑', '', 'module_admin', 'cms/advert_type/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('250', '235', 'cms', '滚动图片', 'fa fa-fw fa-photo', 'module_admin', 'cms/slider/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('251', '250', 'cms', '新增', '', 'module_admin', 'cms/slider/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('252', '250', 'cms', '编辑', '', 'module_admin', 'cms/slider/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('253', '250', 'cms', '删除', '', 'module_admin', 'cms/slider/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('254', '250', 'cms', '启用', '', 'module_admin', 'cms/slider/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('255', '250', 'cms', '禁用', '', 'module_admin', 'cms/slider/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('256', '250', 'cms', '快速编辑', '', 'module_admin', 'cms/slider/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('257', '235', 'cms', '友情链接', 'fa fa-fw fa-link', 'module_admin', 'cms/link/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('258', '257', 'cms', '新增', '', 'module_admin', 'cms/link/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('259', '257', 'cms', '编辑', '', 'module_admin', 'cms/link/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('260', '257', 'cms', '删除', '', 'module_admin', 'cms/link/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('261', '257', 'cms', '启用', '', 'module_admin', 'cms/link/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('262', '257', 'cms', '禁用', '', 'module_admin', 'cms/link/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('263', '257', 'cms', '快速编辑', '', 'module_admin', 'cms/link/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('264', '235', 'cms', '客服管理', 'fa fa-fw fa-commenting', 'module_admin', 'cms/support/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('265', '264', 'cms', '新增', '', 'module_admin', 'cms/support/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('266', '264', 'cms', '编辑', '', 'module_admin', 'cms/support/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('267', '264', 'cms', '删除', '', 'module_admin', 'cms/support/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('268', '264', 'cms', '启用', '', 'module_admin', 'cms/support/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('269', '264', 'cms', '禁用', '', 'module_admin', 'cms/support/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('270', '264', 'cms', '快速编辑', '', 'module_admin', 'cms/support/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('271', '214', 'cms', '门户设置', 'fa fa-fw fa-sliders', 'module_admin', '', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('272', '271', 'cms', '栏目分类', 'fa fa-fw fa-sitemap', 'module_admin', 'cms/column/index', '_self', '1', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('273', '272', 'cms', '新增', '', 'module_admin', 'cms/column/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('274', '272', 'cms', '编辑', '', 'module_admin', 'cms/column/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('275', '272', 'cms', '删除', '', 'module_admin', 'cms/column/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('276', '272', 'cms', '启用', '', 'module_admin', 'cms/column/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('277', '272', 'cms', '禁用', '', 'module_admin', 'cms/column/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('278', '272', 'cms', '快速编辑', '', 'module_admin', 'cms/column/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('279', '271', 'cms', '内容模型', 'fa fa-fw fa-th-large', 'module_admin', 'cms/model/index', '_self', '0', '1504322571', '1504322571', '100', '0', '0', '');
INSERT INTO `ab_admin_menu` VALUES ('280', '279', 'cms', '新增', '', 'module_admin', 'cms/model/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('281', '279', 'cms', '编辑', '', 'module_admin', 'cms/model/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('282', '279', 'cms', '删除', '', 'module_admin', 'cms/model/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('283', '279', 'cms', '启用', '', 'module_admin', 'cms/model/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('284', '279', 'cms', '禁用', '', 'module_admin', 'cms/model/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('285', '279', 'cms', '快速编辑', '', 'module_admin', 'cms/model/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('286', '279', 'cms', '字段管理', '', 'module_admin', 'cms/field/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('287', '286', 'cms', '新增', '', 'module_admin', 'cms/field/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('288', '286', 'cms', '编辑', '', 'module_admin', 'cms/field/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('289', '286', 'cms', '删除', '', 'module_admin', 'cms/field/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('290', '286', 'cms', '启用', '', 'module_admin', 'cms/field/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('291', '286', 'cms', '禁用', '', 'module_admin', 'cms/field/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('292', '286', 'cms', '快速编辑', '', 'module_admin', 'cms/field/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('293', '271', 'cms', '导航管理', 'fa fa-fw fa-map-signs', 'module_admin', 'cms/nav/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('294', '293', 'cms', '新增', '', 'module_admin', 'cms/nav/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('295', '293', 'cms', '编辑', '', 'module_admin', 'cms/nav/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('296', '293', 'cms', '删除', '', 'module_admin', 'cms/nav/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('297', '293', 'cms', '启用', '', 'module_admin', 'cms/nav/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('298', '293', 'cms', '禁用', '', 'module_admin', 'cms/nav/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('299', '293', 'cms', '快速编辑', '', 'module_admin', 'cms/nav/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('300', '293', 'cms', '菜单管理', '', 'module_admin', 'cms/menu/index', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('301', '300', 'cms', '新增', '', 'module_admin', 'cms/menu/add', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('302', '300', 'cms', '编辑', '', 'module_admin', 'cms/menu/edit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('303', '300', 'cms', '删除', '', 'module_admin', 'cms/menu/delete', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('304', '300', 'cms', '启用', '', 'module_admin', 'cms/menu/enable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('305', '300', 'cms', '禁用', '', 'module_admin', 'cms/menu/disable', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('306', '300', 'cms', '快速编辑', '', 'module_admin', 'cms/menu/quickedit', '_self', '0', '1504322571', '1504322571', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('308', '214', 'cms', '主题列表', 'fa fa-fw fa-th-large', 'module_admin', 'cms/theme/index', '_self', '0', '1505919401', '1505919401', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('309', '308', 'cms', '新增', '', 'module_admin', 'cms/theme/add', '_self', '0', '1505919400', '1505919400', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('310', '308', 'cms', '编辑', '', 'module_admin', 'cms/theme/edit', '_self', '1', '1505919400', '1507196209', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('311', '308', 'cms', '删除', '', 'module_admin', 'cms/theme/delete', '_self', '1', '1505919400', '1507196222', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('312', '308', 'cms', '启用', '', 'module_admin', 'cms/theme/enable', '_self', '1', '1505919400', '1507196236', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('313', '308', 'cms', '禁用', '', 'module_admin', 'cms/theme/disable', '_self', '0', '1505919400', '1505919400', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('314', '308', 'cms', '快速编辑', '', 'module_admin', 'cms/theme/quickedit', '_self', '0', '1505919400', '1505919400', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('315', '214', 'cms', '客照列表', 'fa fa-fw fa-th', 'module_admin', 'cms/photo/index', '_self', '0', '1506257963', '1506257963', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('316', '315', 'cms', '新增', '', 'module_admin', 'cms/photo/add', '_self', '0', '1506257963', '1506257963', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('317', '315', 'cms', '编辑', '', 'module_admin', 'cms/photo/edit', '_self', '0', '1506257963', '1506257963', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('318', '315', 'cms', '删除', '', 'module_admin', 'cms/photo/delete', '_self', '0', '1506257963', '1506257963', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('319', '315', 'cms', '启用', '', 'module_admin', 'cms/photo/enable', '_self', '0', '1506257963', '1506257963', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('320', '315', 'cms', '禁用', '', 'module_admin', 'cms/photo/disable', '_self', '0', '1506257963', '1506257963', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('321', '315', 'cms', '快速编辑', '', 'module_admin', 'cms/photo/quickedit', '_self', '0', '1506257963', '1506257963', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('322', '214', 'cms', '文章管理', 'fa fa-fw fa-th-list', 'module_admin', 'cms/news/index', '_self', '0', '1507196333', '1507196461', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('323', '322', 'cms', '新增', '', 'module_admin', 'cms/news/add', '_self', '0', '1507196333', '1507196333', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('324', '322', 'cms', '编辑', '', 'module_admin', 'cms/news/edit', '_self', '0', '1507196333', '1507196333', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('325', '322', 'cms', '删除', '', 'module_admin', 'cms/news/delete', '_self', '0', '1507196333', '1507196333', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('326', '322', 'cms', '启用', '', 'module_admin', 'cms/news/enable', '_self', '0', '1507196333', '1507196333', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('327', '322', 'cms', '禁用', '', 'module_admin', 'cms/news/disable', '_self', '0', '1507196333', '1507196333', '100', '0', '1', '');
INSERT INTO `ab_admin_menu` VALUES ('328', '322', 'cms', '快速编辑', '', 'module_admin', 'cms/news/quickedit', '_self', '0', '1507196333', '1507196333', '100', '0', '1', '');

-- ----------------------------
-- Table structure for ab_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_module`;
CREATE TABLE `ab_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text COMMENT '配置信息',
  `access` text COMMENT '授权配置',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of ab_admin_module
-- ----------------------------
INSERT INTO `ab_admin_module` VALUES ('1', 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `ab_admin_module` VALUES ('2', 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', '1', '1468204902', '1468204902', '100', '1');
INSERT INTO `ab_admin_module` VALUES ('3', 'cms', '门户', 'fa fa-fw fa-newspaper-o', '门户模块', 'CaiWeiMing', 'http://www.dolphinphp.com', '{\"summary\":\"0\",\"contact\":\"<div class=\\\"font-s13 push\\\"><strong>\\u4e34\\u6c82\\u5e02\\u963f\\u5b9d\\u5316\\u5986\\u5b66\\u6821<\\/strong><br \\/>\\r\\n\\u5730\\u5740\\uff1a\\u4e34\\u6c82\\u5e02<br \\/>\\r\\n\\u7535\\u8bdd\\uff1a5321516<br \\/>\\r\\n\\u90ae\\u7bb1\\uff1aadmin@zrthink.comsss<\\/div>\\r\\n\",\"meta_head\":\"\",\"meta_foot\":\"\",\"support_status\":\"1\",\"support_color\":\"rgba(0,158,232,1)\",\"support_wx\":\"\",\"support_extra\":\"\"}', '{\"group\":{\"tab_title\":\"\\u680f\\u76ee\\u6388\\u6743\",\"table_name\":\"cms_column\",\"primary_key\":\"id\",\"parent_id\":\"pid\",\"node_name\":\"name\"}}', '1.0.0', 'cms.ming.module', '0', '0', '0', '100', '1');

-- ----------------------------
-- Table structure for ab_admin_packet
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_packet`;
CREATE TABLE `ab_admin_packet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表';

-- ----------------------------
-- Records of ab_admin_packet
-- ----------------------------

-- ----------------------------
-- Table structure for ab_admin_plugin
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_plugin`;
CREATE TABLE `ab_admin_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ab_admin_plugin
-- ----------------------------
INSERT INTO `ab_admin_plugin` VALUES ('1', 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'system_info.ming.plugin', '0', '1477757503', '1477757503', '100', '1');
INSERT INTO `ab_admin_plugin` VALUES ('2', 'DevTeam', '开发团队成员信息', 'fa fa-fw fa-users', '开发团队成员信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'dev_team.ming.plugin', '0', '1477755780', '1477755780', '100', '1');

-- ----------------------------
-- Table structure for ab_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_role`;
CREATE TABLE `ab_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ab_admin_role
-- ----------------------------
INSERT INTO `ab_admin_role` VALUES ('1', '0', '超级管理员', '系统默认创建的角色，拥有最高权限', '', '0', '1476270000', '1468117612', '1', '1');

-- ----------------------------
-- Table structure for ab_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `ab_admin_user`;
CREATE TABLE `ab_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ab_admin_user
-- ----------------------------
INSERT INTO `ab_admin_user` VALUES ('1', 'admin', '超级管理员', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', '0', '', '0', '0', '0.00', '0', '1', '0', '0', '1476065410', '1507195681', '1507195681', '2130706433', '100', '1');

-- ----------------------------
-- Table structure for ab_cms_advert
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_advert`;
CREATE TABLE `ab_cms_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) unsigned DEFAULT '0' COMMENT '分类id',
  `tagname` varchar(30) DEFAULT '' COMMENT '广告位标识',
  `ad_type` tinyint(2) unsigned DEFAULT '0' COMMENT '广告类型',
  `timeset` tinyint(2) unsigned DEFAULT '0' COMMENT '时间限制:0-永不过期,1-在设内时间内有效',
  `start_time` int(11) unsigned DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) unsigned DEFAULT '0' COMMENT '结束时间',
  `name` varchar(60) DEFAULT '' COMMENT '广告位名称',
  `src` text COMMENT '广告内容',
  `url` varchar(255) DEFAULT NULL,
  `expcontent` text COMMENT '过期显示内容',
  `create_time` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of ab_cms_advert
-- ----------------------------
INSERT INTO `ab_cms_advert` VALUES ('2', '1', '', '2', '0', '0', '0', 'banner图', '11', 'http://www.baidu.com', null, '1506009338', '1506009338', '1');
INSERT INTO `ab_cms_advert` VALUES ('3', '2', '', '2', '0', '0', '0', 'kepianbnner', '13', 'http://baidu.com', null, '1506258509', '1506258509', '1');
INSERT INTO `ab_cms_advert` VALUES ('4', '3', '', '2', '0', '0', '0', 'newsbanner', '11', 'http://baidu.com', null, '1507209728', '1507209728', '1');

-- ----------------------------
-- Table structure for ab_cms_advert_type
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_advert_type`;
CREATE TABLE `ab_cms_advert_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告分类表';

-- ----------------------------
-- Records of ab_cms_advert_type
-- ----------------------------
INSERT INTO `ab_cms_advert_type` VALUES ('1', '首页banner图', '1506008558', '1506008558', '1');
INSERT INTO `ab_cms_advert_type` VALUES ('2', '客片banner图片', '1506258431', '1506258431', '1');
INSERT INTO `ab_cms_advert_type` VALUES ('3', '新闻列表页banner图', '1507209692', '1507209692', '1');

-- ----------------------------
-- Table structure for ab_cms_column
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_column`;
CREATE TABLE `ab_cms_column` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `model` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文档模型id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `content` text NOT NULL COMMENT '内容',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '字体图标',
  `index_template` varchar(32) NOT NULL DEFAULT '' COMMENT '封面模板',
  `list_template` varchar(32) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `detail_template` varchar(32) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `post_auth` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '投稿权限',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `hide` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `rank_auth` int(11) NOT NULL DEFAULT '0' COMMENT '浏览权限，-1待审核，0为开放浏览，大于0则为对应的用户角色id',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '栏目属性：0-最终列表栏目，1-外部链接，2-频道封面',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of ab_cms_column
-- ----------------------------

-- ----------------------------
-- Table structure for ab_cms_document
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_document`;
CREATE TABLE `ab_cms_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `model` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文档模型ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(32) NOT NULL DEFAULT '' COMMENT '简略标题',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `flag` set('j','p','b','s','a','f','c','h') DEFAULT NULL COMMENT '自定义属性',
  `view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `comment` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `good` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `bad` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '踩数',
  `mark` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `trash` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '回收站',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档基础表';

-- ----------------------------
-- Records of ab_cms_document
-- ----------------------------

-- ----------------------------
-- Table structure for ab_cms_field
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_field`;
CREATE TABLE `ab_cms_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `define` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `fixed` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否为固定字段',
  `show` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `model` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属文档模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='文档字段表';

-- ----------------------------
-- Records of ab_cms_field
-- ----------------------------
INSERT INTO `ab_cms_field` VALUES ('1', 'id', 'ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', 'ID', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480562978', '1480562978', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('2', 'cid', '栏目', 'select', 'int(11) UNSIGNED NOT NULL', '0', '', '请选择所属栏目', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480562978', '1480562978', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('3', 'uid', '用户ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563110', '1480563110', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('4', 'model', '模型ID', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563110', '1480563110', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('5', 'title', '标题', 'text', 'varchar(128) NOT NULL', '', '', '文档标题', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480575844', '1480576134', '1', '1');
INSERT INTO `ab_cms_field` VALUES ('6', 'shorttitle', '简略标题', 'text', 'varchar(32) NOT NULL', '', '', '简略标题', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480575844', '1480576134', '1', '1');
INSERT INTO `ab_cms_field` VALUES ('7', 'flag', '自定义属性', 'checkbox', 'set(\'j\',\'p\',\'b\',\'s\',\'a\',\'f\',\'h\',\'c\') NULL DEFAULT NULL', '', 'j:跳转\r\np:图片\r\nb:加粗\r\ns:滚动\r\na:特荐\r\nf:幻灯\r\nh:头条\r\nc:推荐', '自定义属性', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480671258', '1480671258', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('8', 'view', '阅读量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480563149', '1480563149', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('9', 'comment', '评论数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563189', '1480563189', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('10', 'good', '点赞数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563279', '1480563279', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('11', 'bad', '踩数', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563330', '1480563330', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('12', 'mark', '收藏数量', 'text', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563372', '1480563372', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('13', 'create_time', '创建时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563406', '1480563406', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('14', 'update_time', '更新时间', 'datetime', 'int(11) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563432', '1480563432', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('15', 'sort', '排序', 'text', 'int(11) NOT NULL', '100', '', '', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480563510', '1480563510', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('16', 'status', '状态', 'radio', 'tinyint(2) UNSIGNED NOT NULL', '1', '0:禁用\r\n1:启用', '', '0', '1', '0', '', '', '', '', '', '0', '', '', '', '', '1480563576', '1480563576', '100', '1');
INSERT INTO `ab_cms_field` VALUES ('17', 'trash', '回收站', 'text', 'tinyint(2) UNSIGNED NOT NULL', '0', '', '', '0', '0', '0', '', '', '', '', '', '0', '', '', '', '', '1480563576', '1480563576', '100', '1');

-- ----------------------------
-- Table structure for ab_cms_link
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_link`;
CREATE TABLE `ab_cms_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1-文字链接，2-图片链接',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '链接标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `logo` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '链接LOGO',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `sort` int(11) NOT NULL DEFAULT '100',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='有钱链接表';

-- ----------------------------
-- Records of ab_cms_link
-- ----------------------------

-- ----------------------------
-- Table structure for ab_cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_menu`;
CREATE TABLE `ab_cms_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '导航id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `column` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `page` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单页id',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '类型：0-栏目链接，1-单页链接，2-自定义链接',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `css` varchar(64) NOT NULL DEFAULT '' COMMENT 'css类',
  `rel` varchar(64) NOT NULL DEFAULT '' COMMENT '链接关系网',
  `target` varchar(16) NOT NULL DEFAULT '' COMMENT '打开方式',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of ab_cms_menu
-- ----------------------------
INSERT INTO `ab_cms_menu` VALUES ('1', '1', '0', '0', '0', '2', '首页', 'cms/index/index', '', '', '_self', '1492345605', '1492345605', '100', '1');
INSERT INTO `ab_cms_menu` VALUES ('2', '2', '0', '0', '0', '2', '关于我们', 'http://www.dolphinphp.com', '', '', '_self', '1492346763', '1492346763', '100', '1');
INSERT INTO `ab_cms_menu` VALUES ('3', '3', '0', '0', '0', '2', '开发文档', 'http://www.kancloud.cn/ming5112/dolphinphp', '', '', '_self', '1492346812', '1492346812', '100', '1');
INSERT INTO `ab_cms_menu` VALUES ('4', '3', '0', '0', '0', '2', '开发者社区', 'http://bbs.dolphinphp.com/', '', '', '_self', '1492346832', '1492346832', '100', '1');
INSERT INTO `ab_cms_menu` VALUES ('5', '1', '0', '0', '0', '2', '二级菜单', 'http://www.dolphinphp.com', '', '', '_self', '1492347372', '1492347510', '100', '1');
INSERT INTO `ab_cms_menu` VALUES ('6', '1', '5', '0', '0', '2', '子菜单', 'http://www.dolphinphp.com', '', '', '_self', '1492347388', '1492347520', '100', '1');

-- ----------------------------
-- Table structure for ab_cms_model
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_model`;
CREATE TABLE `ab_cms_model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模型名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `table` varchar(64) NOT NULL DEFAULT '' COMMENT '附加表名称',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '模型类别：0-系统模型，1-普通模型，2-独立模型',
  `icon` varchar(64) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统模型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容模型表';

-- ----------------------------
-- Records of ab_cms_model
-- ----------------------------

-- ----------------------------
-- Table structure for ab_cms_nav
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_nav`;
CREATE TABLE `ab_cms_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(32) NOT NULL DEFAULT '' COMMENT '导航标识',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` int(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of ab_cms_nav
-- ----------------------------
INSERT INTO `ab_cms_nav` VALUES ('1', 'comment', '客户评价', '1492345083', '1492345083', '1', '3', null);
INSERT INTO `ab_cms_nav` VALUES ('2', 'customer', '最新客照', '1492346685', '1492346685', '1', '1', null);
INSERT INTO `ab_cms_nav` VALUES ('3', 'theme', '造型大赏', '1492346715', '1492346715', '1', '0', null);
INSERT INTO `ab_cms_nav` VALUES ('4', 'news', '新闻活动', '1505922653', '1505922653', '1', '4', null);
INSERT INTO `ab_cms_nav` VALUES ('5', 'contact', '阿宝加盟', '1505922669', '1505922669', '1', '5', null);

-- ----------------------------
-- Table structure for ab_cms_news
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_news`;
CREATE TABLE `ab_cms_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '单页标题',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `keywords` varchar(32) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '页面描述',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单页封面',
  `view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
-- Records of ab_cms_news
-- ----------------------------
INSERT INTO `ab_cms_news` VALUES ('2', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('3', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('4', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('5', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('6', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('7', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('8', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('9', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('10', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('11', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('12', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('13', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('14', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('15', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('16', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('17', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '5', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('18', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('19', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('20', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('21', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('22', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('23', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('24', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('25', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('26', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('27', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('28', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('29', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('30', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('31', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('32', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('33', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('34', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('35', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('36', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('37', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('38', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('39', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('40', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('41', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('42', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('43', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('44', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('45', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('46', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('47', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('48', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('49', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('50', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('51', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('52', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('53', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('54', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');
INSERT INTO `ab_cms_news` VALUES ('55', '这是个测试好吧', '<p style=\"text-align: center; \">这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p style=\"text-align: center; \"><br></p><p>这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧</p><p><br></p>', '这是个测试好吧', '这是个测试好吧这是个测试好吧这是个测试好吧这是个测试好吧', '1', '0', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for ab_cms_page
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_page`;
CREATE TABLE `ab_cms_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '单页标题',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `keywords` varchar(32) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(250) NOT NULL DEFAULT '' COMMENT '页面描述',
  `template` varchar(32) NOT NULL DEFAULT '' COMMENT '模板文件',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '单页封面',
  `view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
-- Records of ab_cms_page
-- ----------------------------
INSERT INTO `ab_cms_page` VALUES ('1', '联系我们', '<p style=\"text-align: center; \"><br></p><p style=\"text-align: center; \"><br></p><p style=\"text-align: center; \"><img src=\"/public/uploads/images/20170926/ed3eee11c4ffa9268eddc0fded2f3650.jpeg\" alt=\"1275176278752419\" style=\"max-width:100%;\"><br></p><p style=\"text-align: center; \"><br></p><p style=\"text-align: center; \"><br></p><p style=\"text-align: center;\"><img src=\"/public/uploads/images/20170924/bc696eb5606a542a3eca6b1ba1f4a681.jpg\" alt=\"8171965707611468\" style=\"max-width:100%;\"><br></p><p><br></p>', '', '', '', '14', '0', '1506390552', '1506391437', '1');

-- ----------------------------
-- Table structure for ab_cms_slider
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_slider`;
CREATE TABLE `ab_cms_slider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '封面id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='滚动图片表';

-- ----------------------------
-- Records of ab_cms_slider
-- ----------------------------

-- ----------------------------
-- Table structure for ab_cms_support
-- ----------------------------
DROP TABLE IF EXISTS `ab_cms_support`;
CREATE TABLE `ab_cms_support` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '客服名称',
  `qq` varchar(16) NOT NULL DEFAULT '' COMMENT 'QQ',
  `msn` varchar(100) NOT NULL DEFAULT '' COMMENT 'msn',
  `taobao` varchar(100) NOT NULL DEFAULT '' COMMENT 'taobao',
  `alibaba` varchar(100) NOT NULL DEFAULT '' COMMENT 'alibaba',
  `skype` varchar(100) NOT NULL DEFAULT '' COMMENT 'skype',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客服表';

-- ----------------------------
-- Records of ab_cms_support
-- ----------------------------

-- ----------------------------
-- Table structure for ab_config
-- ----------------------------
DROP TABLE IF EXISTS `ab_config`;
CREATE TABLE `ab_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `data` longtext NOT NULL COMMENT '数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商城配置表ok';

-- ----------------------------
-- Records of ab_config
-- ----------------------------
INSERT INTO `ab_config` VALUES ('1', 'contact', 's:166:\"<div class=\"font-s13 push\"><strong>临沂市阿宝化妆学校</strong><br />\r\n地址：临沂市<br />\r\n电话：5321516<br />\r\n邮箱：admin@zrthink.comsss</div>\r\n\";');

-- ----------------------------
-- Table structure for ab_photo
-- ----------------------------
DROP TABLE IF EXISTS `ab_photo`;
CREATE TABLE `ab_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `w_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ab_photo
-- ----------------------------
INSERT INTO `ab_photo` VALUES ('21', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('22', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('23', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('24', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('25', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('26', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('27', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('28', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('29', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('30', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('31', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('32', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('33', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('34', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('35', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('36', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('37', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('38', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('39', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('40', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('41', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('42', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('43', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('44', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('45', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('46', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('47', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('48', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('49', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('50', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('51', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('52', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('53', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('54', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('55', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('56', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('57', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('58', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('59', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('60', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('61', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('62', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('63', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('64', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('65', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('66', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('67', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('68', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('69', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('70', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('71', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('72', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('73', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');
INSERT INTO `ab_photo` VALUES ('74', '测试一个客片', '0', '测试一个客片测试一个客片测试一个客片测试一个客片', '12', '1506258375', '1');

-- ----------------------------
-- Table structure for ab_theme
-- ----------------------------
DROP TABLE IF EXISTS `ab_theme`;
CREATE TABLE `ab_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fengmian` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `w_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ab_theme
-- ----------------------------
INSERT INTO `ab_theme` VALUES ('2', '欧美复古', '1', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('3', '欧美复古', '1', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('4', '欧美复古', '1', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('5', '欧美复古', '1', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('6', '欧美复古', '1', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('7', '欧美复古', '1', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('8', '欧美复古', '1', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('9', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('10', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('11', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('12', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('13', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('14', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('15', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('16', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('17', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('18', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('19', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
INSERT INTO `ab_theme` VALUES ('20', '欧美复古', '0', 'green', '欧美复古欧美复古欧美复古', '6', '7,8,9', '1505920361', '1');
