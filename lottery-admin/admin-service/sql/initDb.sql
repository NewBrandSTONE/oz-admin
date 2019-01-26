-- 用户信息表

CREATE TABLE `sys_user_info` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `sys_username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `sys_pwd` varchar(255) DEFAULT NULL COMMENT '密码',
  `sys_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `sys_birth` varchar(20) DEFAULT NULL COMMENT '出生年月',
  `sys_sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `sys_cert_type` varchar(10) DEFAULT NULL COMMENT '证件类型',
  `sys_cert_val` varchar(30) DEFAULT NULL COMMENT '证件信息',
  `sys_user_prov` varchar(40) DEFAULT NULL COMMENT 'Area的uid',
  `sys_prov_name` varchar(60) DEFAULT NULL COMMENT '省名称(冗余)',
  `sys_user_city` varchar(40) DEFAULT NULL COMMENT '市',
  `sys_city_name` varchar(60) DEFAULT NULL COMMENT '市名称(冗余)',
  `sys_user_img` varchar(128) DEFAULT NULL COMMENT '用户头像地址前缀',
  `sys_img_count` int(11) DEFAULT NULL COMMENT '头像张数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_emp` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_emp` varchar(64) DEFAULT NULL COMMENT '更新用户uid',
  `is_delete` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '删除状态,1-删除；0-可用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_username` (`sys_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 资源表
CREATE TABLE `sys_resource_info` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `sys_resource_name` varchar(40) DEFAULT NULL COMMENT '资源节点名字',
  `sys_resource_level` int(4) DEFAULT NULL COMMENT '资源级别',
  `sys_resource_path` varchar(128) DEFAULT NULL COMMENT '资源操作url',
  `sys_parent_uid` varchar(40) DEFAULT NULL COMMENT '父节点uid',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_emp` varchar(64) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_emp` varchar(64) DEFAULT NULL COMMENT '更新用户uid',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除状态1-删除；0-可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 角色表
CREATE TABLE `sys_role_info` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `sys_role_id` varchar(64) DEFAULT NULL COMMENT '唯一键，关联键',
  `sys_role_name` varchar(64) DEFAULT NULL COMMENT '角色名字',
  `sys_role_desc` varchar(128) DEFAULT NULL COMMENT '角色描述',
  `create_emp` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_emp` varchar(64) DEFAULT NULL COMMENT '更新用户uid',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除状态1-删除；0-可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 用户角色关系表
CREATE TABLE `sys_user_role` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `sys_user_id` varchar(64) DEFAULT NULL COMMENT '用户表uid',
  `sys_role_id` varchar(64) DEFAULT NULL COMMENT '角色表uid',
  `create_emp` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_emp` varchar(64) DEFAULT NULL COMMENT '更新用户uid',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;