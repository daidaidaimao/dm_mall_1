/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : newtest

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 07/06/2020 14:27:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for approval
-- ----------------------------
DROP TABLE IF EXISTS `approval`;
CREATE TABLE `approval`  (
  `product_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(3) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `finsh_time` datetime(0) NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`product_message`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of approval
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `other` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '大大', 23, '杰少');
INSERT INTO `student` VALUES ('10', '小朱', 22, '超级小桀');
INSERT INTO `student` VALUES ('11', '大朱', 22, '超级大杰');
INSERT INTO `student` VALUES ('12', '啊啊', 22, '毛毛呆毛');
INSERT INTO `student` VALUES ('13', '小杰杰', 22, '呆毛');
INSERT INTO `student` VALUES ('14', '大杰杰', 23, '呆毛');
INSERT INTO `student` VALUES ('2', '王一枫', 23, '王哥');
INSERT INTO `student` VALUES ('3', '毛毛', 18, '呆毛');
INSERT INTO `student` VALUES ('4', '贾傲娇', 18, '小贾');
INSERT INTO `student` VALUES ('5', '一一', 22, '毛毛');
INSERT INTO `student` VALUES ('6', '尔尔', 22, '毛明辉');
INSERT INTO `student` VALUES ('7', '三三', 22, '贾祯');
INSERT INTO `student` VALUES ('8', '王家', 22, '王一枫');
INSERT INTO `student` VALUES ('9', '许智杰', 22, '王长生');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父节点id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (0, 9999, '商品分类');
INSERT INTO `t_category` VALUES (1, 0, '数码产品');
INSERT INTO `t_category` VALUES (2, 1, '手机');
INSERT INTO `t_category` VALUES (4, 2, '小米手机');
INSERT INTO `t_category` VALUES (5, 1, '电脑');
INSERT INTO `t_category` VALUES (6, 5, '联想笔记本');
INSERT INTO `t_category` VALUES (7, 5, '神州笔记本');
INSERT INTO `t_category` VALUES (8, 5, '戴尔笔记本');
INSERT INTO `t_category` VALUES (14, 2, '华为手机');
INSERT INTO `t_category` VALUES (15, 0, '二次元相关');
INSERT INTO `t_category` VALUES (16, 15, '鬼灭之刃');
INSERT INTO `t_category` VALUES (17, 1, '电脑外设');
INSERT INTO `t_category` VALUES (19, 1, '游戏设备');
INSERT INTO `t_category` VALUES (20, 5, '小米笔记本');
INSERT INTO `t_category` VALUES (21, 15, '其他');
INSERT INTO `t_category` VALUES (22, 0, '智能家电');
INSERT INTO `t_category` VALUES (23, 22, '小米家电');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `comment_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '评论时间',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `score` int(2) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('170aac67-cf9b-4316-886b-da162b36d582', '10656139-af7a-4741-900d-a6a0e88b6236', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '很好！', '2020-05-30 00:23:21', '呆毛的第二个号', '15efac1b-f740-4e96-82aa-b45bb114dc8f', 5);
INSERT INTO `t_comment` VALUES ('170d6f62-a05b-4c5e-92c8-761838a46cb4', '841a186e-b51d-4f7c-bf92-062f13e36bbe', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '华为流批', '2020-05-29 22:23:11', '呆毛的第二个号', '9ec493df-7ba2-4f81-9aa4-f512c22bdf06', 5);
INSERT INTO `t_comment` VALUES ('18339155-8a12-48c7-bd4d-fc18c1bfdb7d', '0f76260e-f9e7-4107-b342-b46edaf036eb', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '微波炉流批', '2020-05-29 22:17:08', '呆毛的第二个号', 'dfc5783c-b334-4cfe-b4a7-ffa94e119b5b', 4);
INSERT INTO `t_comment` VALUES ('1dc84e4a-1337-42d7-ac1d-21aa883b0fea', '13c756bf-cbdb-467f-8f1b-22c76cb8b9c6', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '好', '2020-05-30 11:02:11', '呆毛的第二个号', '65eb18ac-77b4-4eb7-912e-b99e8647602c', 5);
INSERT INTO `t_comment` VALUES ('2921e043-c991-40d6-8888-1134e610d31e', '6b0cbdf7-e2c4-4faf-bea5-5c4950154889', '64499a59-2396-46d6-926b-0893046c8749', '17', '2020-03-12 16:33:27', '呆毛~~', '7b8cf3c7-d131-477d-851e-b295343dd1bc', 1);
INSERT INTO `t_comment` VALUES ('4648e170-4855-4ac5-a0a4-e032d6a17546', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', '64499a59-2396-46d6-926b-0893046c8749', 'test', '2020-04-09 16:14:58', '呆毛~~', '6be36fa3-076c-494a-9470-d2c64c233ce3', 5);
INSERT INTO `t_comment` VALUES ('5fc43776-08e4-4b00-ad99-c491eb37d4b3', 'beccbb5e-2fb2-44ae-ae96-203e88ea046d', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '这冰箱太猛了', '2020-05-29 22:17:19', '呆毛的第二个号', 'dfc5783c-b334-4cfe-b4a7-ffa94e119b5b', 5);
INSERT INTO `t_comment` VALUES ('610c8c6f-469c-4df6-9611-07a7738f37d4', 'dce55adb-2d1e-4cf7-a55d-2a8a7e8c6073', '64499a59-2396-46d6-926b-0893046c8749', '设计', '2020-05-13 16:20:14', '呆毛~~', '013f0c28-4423-4436-9e2e-b8749f2d085b', 5);
INSERT INTO `t_comment` VALUES ('67879c2c-ef7c-481c-a5a7-f8c17ceadc6b', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', '64499a59-2396-46d6-926b-0893046c8749', 'test', '2020-04-09 16:15:02', '呆毛~~', '6be36fa3-076c-494a-9470-d2c64c233ce3', 5);
INSERT INTO `t_comment` VALUES ('6c6488e0-704c-42b2-80bf-18f09adf6eb0', '00ed7179-b17f-4125-b237-3b520aecde82', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '好！', '2020-05-30 00:23:18', '呆毛的第二个号', '15efac1b-f740-4e96-82aa-b45bb114dc8f', 5);
INSERT INTO `t_comment` VALUES ('6c74b6b8-5480-48db-bd7f-4ae5f6cbc56a', '0d98ef2e-0b35-45ef-af01-aa3d306accfb', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '好手机！', '2020-05-29 22:20:41', '呆毛的第二个号', 'b8c44113-351d-40dd-9a78-42ce94f5fe6d', 0);
INSERT INTO `t_comment` VALUES ('6e416269-7b79-46b2-839a-e3b5d6088b33', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', '64499a59-2396-46d6-926b-0893046c8749', 'test', '2020-04-09 16:14:57', '呆毛~~', '6be36fa3-076c-494a-9470-d2c64c233ce3', 5);
INSERT INTO `t_comment` VALUES ('72b69c55-d9c1-4b12-8a2b-a72e0aaf3c89', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', '64499a59-2396-46d6-926b-0893046c8749', '设计', '2020-05-13 16:20:15', '呆毛~~', '013f0c28-4423-4436-9e2e-b8749f2d085b', 5);
INSERT INTO `t_comment` VALUES ('7dc3238e-0d6b-4638-b074-3e908354a099', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', '64499a59-2396-46d6-926b-0893046c8749', '测试', '2020-05-06 11:40:00', '呆毛~~', '62d0bf7b-1792-44f8-9acf-e7c48ff2787a', 5);
INSERT INTO `t_comment` VALUES ('878ca413-17ca-44da-b2bb-5d02a256e4ab', '96781946-5c49-4795-b192-75698eca5577', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '神舟流批', '2020-05-29 22:23:22', '呆毛的第二个号', '9ec493df-7ba2-4f81-9aa4-f512c22bdf06', 5);
INSERT INTO `t_comment` VALUES ('8b557c00-5361-4933-ba7c-7609122a1206', '16c387aa-3cd5-473a-8be0-981cda925859', '64499a59-2396-46d6-926b-0893046c8749', '18', '2020-03-12 16:33:31', '呆毛~~', '7b8cf3c7-d131-477d-851e-b295343dd1bc', 3);
INSERT INTO `t_comment` VALUES ('9e2f878b-ec62-459b-8099-11c4544a5a1e', '692f16fb-521d-4359-9ce3-4e5a414490c0', '64499a59-2396-46d6-926b-0893046c8749', '马造2真好玩，游戏机很不错，给5星好评了！', '2020-05-22 17:57:05', '呆毛~~', 'b6bab76a-d095-4564-9e40-5a79eb40dd0d', 5);
INSERT INTO `t_comment` VALUES ('a22f0459-1923-4f6d-8051-861fcfc55ed2', 'ca843588-4264-437a-aa54-f3a559890baa', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '神舟流批', '2020-05-29 22:23:30', '呆毛的第二个号', '9ec493df-7ba2-4f81-9aa4-f512c22bdf06', 5);
INSERT INTO `t_comment` VALUES ('b195ca0a-fdf2-4f12-802e-d8d8931b8831', '27ba2206-7dbe-4c07-a48e-59a1ffeef7f5', '64499a59-2396-46d6-926b-0893046c8749', '仁王2真好玩！', '2020-05-22 17:57:07', '呆毛~~', 'b6bab76a-d095-4564-9e40-5a79eb40dd0d', 5);
INSERT INTO `t_comment` VALUES ('cd167def-4198-4b12-ad09-f99832542e23', '00ed7179-b17f-4125-b237-3b520aecde82', '090d399e-f155-4f0a-af9e-32d5338dbd19', '这电脑可以', '2020-05-30 07:36:02', 'JayChou', '7273ead8-e379-48c2-9e36-ca87b7c47084', 5);
INSERT INTO `t_comment` VALUES ('e65d0120-79dd-429b-bf6d-a3c7e437644d', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', '090d399e-f155-4f0a-af9e-32d5338dbd19', '3333', '2020-04-10 15:13:38', '呆毛~~', 'a4607d3a-a3f2-46e4-8b73-bd00443304ff', 5);
INSERT INTO `t_comment` VALUES ('ed702d30-1015-4999-95c1-fa00ec3e11e9', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', '64499a59-2396-46d6-926b-0893046c8749', '第八次测试 应该没问题了', '2020-03-12 14:57:03', '呆毛~~', '62d0bf7b-1792-44f8-9acf-e7c48ff2787a', 0);
INSERT INTO `t_comment` VALUES ('f2d26e82-c288-43a9-902c-659f32adc559', '666bf03a-bedc-4218-8a14-57d44d614c7f', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '小米电视机强啊', '2020-05-29 22:17:10', '呆毛的第二个号', 'dfc5783c-b334-4cfe-b4a7-ffa94e119b5b', 5);
INSERT INTO `t_comment` VALUES ('f3c99eda-d04e-4727-b420-5fc3b816d545', '13c756bf-cbdb-467f-8f1b-22c76cb8b9c6', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '超棒！', '2020-05-30 00:23:24', '呆毛的第二个号', '15efac1b-f740-4e96-82aa-b45bb114dc8f', 0);
INSERT INTO `t_comment` VALUES ('f9835621-3007-4032-8f95-d9ed48621a90', 'c8412d5d-9774-4a10-878f-9f35874743d6', '8883b7c9-b39b-452f-a0fb-c39e27185edf', '这电脑可以', '2020-05-30 00:13:02', '呆毛的第二个号', '387d62ba-1542-420c-beed-698dab55f9af', 4);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `product_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品id',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_price` double NULL DEFAULT 0 COMMENT '商品价格',
  `product_category` int(11) NULL DEFAULT NULL COMMENT '商品分类',
  `product_imgurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品图片地址',
  `product_num` int(11) NULL DEFAULT 0 COMMENT '商品库存',
  `product_description` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品简单描述',
  `sale` int(11) NULL DEFAULT 0 COMMENT '销量',
  `quill` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细描述',
  `product_status` int(3) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`product_id`) USING BTREE,
  UNIQUE INDEX `UN_product_name`(`product_name`) USING BTREE,
  INDEX `product_category`(`product_category`) USING BTREE,
  CONSTRAINT `cate` FOREIGN KEY (`product_category`) REFERENCES `t_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('00ed7179-b17f-4125-b237-3b520aecde82', '拯救者 Y7000P ', 7299, 6, 'http://image.jt.com/upload/6/e/e/5/a/b/4/0/1a614512-1f29-4385-8116-90a947c78792.jpg', 893, '九代英特尔酷睿i5-9300H/Windows 10 家庭中文版/15.6英寸/16G/1T SSD/ GeForce GTX 1650 4G独显/黑色', 6, '<p><img src=\"http://image.jt.com/upload/f/f/d/a/a/f/e/1/11067579-3e25-4094-a1c5-4eeafc723572.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('0d98ef2e-0b35-45ef-af01-aa3d306accfb', 'HUAWEI P40 Pro 5G', 5988, 14, 'http://image.jt.com/upload/4/c/a/f/d/6/d/3/a7139d33-787e-4c20-a729-efa58d148ec8.png', 896, '麒麟990 5G SoC芯片 5000万超感知徕卡四摄 50倍数字变焦 全网通5G手机', 2, '<p><img src=\"http://image.jt.com/upload/f/b/2/0/9/7/0/0/16d9e5e0-b407-4153-980a-bd814d32b476.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('0f76260e-f9e7-4107-b342-b46edaf036eb', '米家微波炉', 399, 23, 'http://image.jt.com/upload/a/4/9/7/d/a/f/0/2a8c5a0e-684e-47e8-a2ec-2b97ee747053.jpg', 896, '「小米618开门红，6月1日到手价不高于379元，前2小时369元」智能APP操控 / 平板式加热 / 专项分类解冻 / 20L容量 / 30+精选食谱', 2, '<p><img src=\"http://image.jt.com/upload/9/8/e/a/d/2/5/3/8c5a785e-d6f8-4458-b73d-8360c21a60ec.jpg\"><img src=\"http://image.jt.com/upload/9/8/f/8/e/9/d/4/3324dfb1-5c09-4b94-bea7-b9d7081e980c.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('10656139-af7a-4741-900d-a6a0e88b6236', '全新XBOX360 E SLIM主机', 3365.01, 19, 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/48074068-e924-41e1-a16b-4aebe31c4734.jpg', 8893, '【涛哥电玩四冠】全新XBOX360 E SLIM主机 KINECT互动体感游戏机', 6, '<p><img src=\"http://image.jt.com/upload/2/d/7/3/2/6/d/0/79aa6fab-91bd-49d1-98d5-26bd96cde3d7.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('13c756bf-cbdb-467f-8f1b-22c76cb8b9c6', '米家空气净化器MAX 增强版', 2199, 23, 'http://image.jt.com/upload/f/d/a/2/5/7/6/e/78c3c8a3-1330-4d91-8d45-ed319d096487.jpg', 226, '「小米618开门红，6月1日预计到手价1899元！更享12期分期免息，平均每月低至159元！」专业级除甲醛 / 澎湃净化力，适用84㎡大空间* / 高效净化PM2.5、过敏原和细菌', 6, '<p><img src=\"http://image.jt.com/upload/e/1/e/7/4/7/a/d/fd382485-2174-4572-be70-0d942c2ebc11.jpg\"><img src=\"http://image.jt.com/upload/e/1/f/5/5/f/2/e/904845fd-b81b-4e51-8280-67570ecfc307.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('16c387aa-3cd5-473a-8be0-981cda925859', 'Pixiv上偷的图', 998, 16, 'http://image.jt.com/upload/e/0/6/e/1/f/7/1/9c28e76a-2636-496b-97fa-6b3468acd502.jpg', 95, 'Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图', 2, '<p><span style=\"color: rgb(230, 0, 0);\">为什么保存不了字体的格式呢</span></p><p><img src=\"http://image.jt.com/upload/9/7/5/5/a/d/0/d/6e200cfc-92dd-4227-94bd-6aea75d78cab.jpg\">emmmmm 测试</p>', 1);
INSERT INTO `t_product` VALUES ('1a315f85-bf15-4e4d-b27f-9dbc72b2f6ca', '华为畅享10 Plus', 1399, 14, 'http://image.jt.com/upload/4/c/a/1/b/f/5/2/a90a035e-c6df-4860-b809-a69d4c984915.png', 898, '【预订享优惠】华为畅享10 Plus 4GB+128GB 全网通版（赤茶橘）', 0, '<p><img src=\"http://image.jt.com/upload/a/5/f/3/a/a/6/f/830aaf5b-c6bb-4617-a463-5bccff644f48.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('1b2297cc-f2ca-48a1-8047-29e184bd4d64', '鬼灭之刃-蝴蝶忍小姐姐', 555, 16, 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png', 994, '蝴蝶忍，漫画《鬼灭之刃》及其衍生作品中的角色之一。鬼杀队中的虫柱，鬼杀队医疗设施“蝶屋”的主人。精通药学与毒理学，擅长毒杀。因为力气很小，是柱中唯一一个无法斩下鬼头的剑士，但善于制作毒素来弥补力量的不足。黑发紫瞳，发梢紫色，头发长及锁骨，平时梳着夜会卷发型。 [4]  戴深紫色边缘的薄荷色蝴蝶发夹，羽织如同蝴蝶的翅膀。偶尔会对自己的身高不足感到苦恼。穿着保守，不喜欢暴露的服饰。 [5] \n年少时留着短发，严肃认真，不苟言笑。 [6]  在姐姐蝴蝶香奈惠死后，努力变得像姐姐生前一样温和。但即使脸上时常带着微笑，却也一直压抑着对于鬼的愤怒。 [7] \n擅长教导和培育。与恋柱·甘露寺蜜璃趣味相投，时常会向其请教时髦新奇的料理食谱。', 11, '', 1);
INSERT INTO `t_product` VALUES ('1c5c01d4-5af7-48dc-a206-7f42c40d1418', '小米游戏本15.6', 8999, 20, 'http://image.jt.com/upload/3/5/5/f/7/a/d/d/0f45a155-dc1e-4905-9999-92f25b125aaf.jpg', 887, '第八代酷睿处理器 ／ 72%NTSC高色域窄边框全高清屏 ／ 256G PCIe高速固态 ／ 双烤不限频不降频', 2, '<p><img src=\"http://image.jt.com/upload/5/6/8/4/6/9/c/a/ab664cee-1a42-4292-afb4-bc41ca0af0fa.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('1f9b1177-3557-45bc-bc08-d0c71d2e127f', '小米柔风立式空调', 5999, 23, 'http://image.jt.com/upload/d/c/6/1/d/0/f/c/111bf532-0e51-4d6b-bb88-ec4624efac08.jpg', 854, '「新品超级预售，6月1日0点开抢，支付尾款送Redmi小爱音箱 Play（白色），前1小时支付尾款加赠蓝牙温湿度计」舒适柔风/新一级能效/自动清洁/变频3匹/小爱语音控制', 0, '<p><img src=\"http://image.jt.com/upload/4/6/3/b/9/c/a/8/9ac72ccb-b5bd-4930-b56b-30ce09f3c941.png\"><img src=\"http://image.jt.com/upload/4/6/4/9/b/4/2/9/4314090b-cd48-4076-8626-245c25d1f684.png\"><img src=\"http://image.jt.com/upload/4/6/5/7/c/b/a/a/60c767c6-4cd8-4b58-a5a2-4116480d62b2.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('22444b33-f4a6-4e16-8e6a-432a1ca3320a', '小米10Pro', 4999, 4, 'http://image.jt.com/upload/6/5/6/c/1/a/8/5/fee85d53-98f1-4d70-9d6d-1644a4915f60.png', 996, '「8GB+128GB订金预售，到手价仅3799元；购256GB赠立式风冷无线充，6月1日0点付尾款限量+1元得冰封散热背夹」向往的生活同款 / 骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC', 2, '<p><img src=\"http://image.jt.com/upload/7/a/f/c/6/e/f/0/7e44e5d6-0208-4572-9425-453844c7106f.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('24fb320a-a2f5-4029-a880-2a6fbc23b5b5', '鬼灭之刃-灶门炭治郎', 888, 21, 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg', 995, '鬼杀队剑士，有着一头深红发与红色眼睛的“赫灼之子”，\n左额处有伤疤，佩戴有代代相传的日轮耳饰，性格憨厚，善良温柔，重视家人、个性认真顽固有担当的长男。制服上披着市松图案的羽织。\n不擅于说谎，一说谎表情就会变得很奇怪，而另一方面却又十分固执，绝不会允许自己欠对方的人情和金钱。有着如石头般坚硬的额头，能让被撞击的人失去知觉。\n另外，炭治郎还有着不输犬类的灵敏“嗅觉”，可以从摔碎的盘子上闻出碰过盘子的猫的味道，甚至能够感应到味道来源的位置，并凭借这一能力轻易找到了鬼杀队多年来都无法找到的鬼舞辻无惨。经过训练后，连极其细微的“隙之线”都能成功感应', 5, '<p>水之呼吸 第12式 水调歌头</p>', 1);
INSERT INTO `t_product` VALUES ('27ba2206-7dbe-4c07-a48e-59a1ffeef7f5', 'PS4主机全新PS4 游戏机 国行', 3790, 19, 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/d00d13fc-5a32-4cdc-b09c-fb4f4ecce6a2.jpg', 87, '涛哥电玩 PS4主机全新PS4 游戏机 国行 港版slim500G/1TB/PRO', 3, '<p><img src=\"http://image.jt.com/upload/2/d/7/3/2/6/d/0/636af647-8dc7-4d73-bd9f-b13d34af0854.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('325407f5-d28f-41f7-b462-231e1f1bc7ef', 'RedmiBook 13 全面屏', 4499, 20, 'http://image.jt.com/upload/b/7/d/1/b/8/0/7/2597dfe9-22dd-4861-ae99-d6bd1a304a13.png', 998, '四窄边全面屏 / 全新十代酷睿™处理器 / 全金属超轻机身 / MX250 高性能独显 / 小米互传 / 专业「飓风」散热系统 / 11小时长续航', 0, '<p><img src=\"http://image.jt.com/upload/3/5/3/5/4/a/a/2/a7767a64-0550-41c0-b29a-d28faaeee7dc.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('33474a37-fd7c-4fba-aea9-46bf83d99ea0', 'Pixiv_Environment', 3, 21, 'http://image.jt.com/upload/d/a/7/e/3/2/1/1/3092e9a9-5f94-4047-aae3-53a2b65a63f4.png', 3, 'Pixiv_Environment', 0, '', 1);
INSERT INTO `t_product` VALUES ('3bb33a38-7ea7-4ecc-bc30-e24846e5cae9', 'Redmi 10X 4G', 999, 4, 'http://image.jt.com/upload/f/1/f/9/b/7/7/d/1abb3435-6adb-496e-9964-b9e6f6916a20.png', 998, '「新品现货热卖中！前3000名评价晒单赠小背包；享延保、碎屏保5折；赠价值470元善诊体检卡」5020mAh超长续航+18W快充+最高9W反向充电 /128GB大内存 / 4800万超清四摄 /Helio G85游戏芯 /6.53\"小孔全面屏 /指纹识别+人脸解锁 /红外遥控', 0, '<p><img src=\"http://image.jt.com/upload/1/3/6/5/1/9/1/c/22f67440-fbc8-481f-babe-dea1f278c221.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('3cbd9db4-ef01-40b5-90cd-0e3f400e5686', '小米10', 3999, 4, 'http://image.jt.com/upload/a/0/c/a/5/9/1/e/71783f97-bb47-498e-b147-147b2dd8b8f8.png', 998, '「8GB+128GB订金预售，到手价仅3799元；购256GB赠立式风冷无线充，6月1日0点付尾款限量+1元得冰封散热背夹」向往的生活同款 / 骁龙865处理器 / 1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC', 0, '<p><img src=\"http://image.jt.com/upload/c/4/0/6/5/5/b/6/d590d572-8cfe-47dd-875a-b0e79b05b7ac.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('3dbb51c1-8f18-4b09-90e9-a1c78401f8c8', 'Y9000X高性能标压轻薄笔记本', 6999, 6, 'http://image.jt.com/upload/6/f/c/7/2/3/5/0/c71134a4-94dd-45a8-a746-39a167d7fb8d.jpg', 998, '九代英特尔酷睿i5-9300H/Windows 10 家庭中文版/15.6英寸/16G/512G SSD/ 集成显卡/深空灰', 0, '<p><img src=\"http://image.jt.com/upload/3/4/c/0/e/b/2/2/ade36b02-d3c2-4d91-b3d8-a6c87727a2b9.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('3de07819-573e-4b55-9d7c-be690fb91c5f', '小米净水器500G', 2199, 23, 'http://image.jt.com/upload/7/c/e/c/3/2/3/1/1d757f21-80c7-4a05-939a-73f7e74fefc2.jpg', 8989, '「小米618开门红，6月1日到手价不高于1199元」500加仑大通量，畅快出水不久等 / 127mm纤薄，厨下安装省空间 / RO反渗透技术，深层净水 / 3合1复合强化滤芯 / APP水质查询 / 自主换芯；', 0, '<p><img src=\"http://image.jt.com/upload/e/d/d/c/c/b/2/0/4e9815a8-45bf-4abb-ba0b-5fb9d158d449.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('5360eff0-e737-49ab-8c90-f08760d318d3', 'HUAWEI P40', 4488, 14, 'http://image.jt.com/upload/4/c/a/f/d/6/d/3/fd77d9c5-8554-4251-8bd2-fc7cdde1f8f8.png', 7487, 'HUAWEI P40 5G 全网通 8GB+128GB（零度白）', 0, '<p><img src=\"http://image.jt.com/upload/d/a/e/7/f/d/3/1/6c03ceaa-ad9d-4b3e-bab2-7297f060f562.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('555467fb-d536-424f-84c5-dd9ea22c5273', 'Redmi K30 Pro', 3399, 4, 'http://image.jt.com/upload/c/e/d/6/5/8/f/1/bcc78a7c-9b7e-4665-a15b-e27772872b7d.jpg', 989, '「8GB+128GB订金预售进行中，支付100元订金抵500元，实际到手价仅2999元。尾款享信用卡24期免息」双模5G / 高通骁龙865 / 弹出式超光感全面屏 /索尼 6400万高清四摄 / 8K视频拍摄 / 超大面积VC立体散热 / 4700mAh+33W疾速闪充 / 多功能NFC / 红外遥控', 0, '<p><img src=\"http://image.jt.com/upload/6/d/a/d/f/b/5/d/6c7b8f92-6df1-440f-a009-358d097e310b.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('5d5ffacf-c666-4b7c-86da-fe64450df5d7', '神舟精盾系列 笔记本电脑', 4599, 7, 'http://image.jt.com/upload/d/d/d/5/3/9/9/7/c0334e1e-321e-4ec8-952d-588b1a642cf9.jpg', 989, '神舟（HASEE）神舟精盾系列高性能商务本 笔记本电脑 轻薄便携 U45A2｜十代i5+MX250 2G+512', 0, '<p><img src=\"http://image.jt.com/upload/b/8/8/5/6/2/0/4/c4819b26-697e-43ed-a930-d72cf5d3feac.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('6553a143-cca6-4454-9c95-37ad20a0009d', '小米净水器S1 800G', 2999, 23, 'http://image.jt.com/upload/7/c/d/e/1/a/b/0/22a35f68-2fc4-4c85-a2b6-a24da39f67cb.jpg', 898, '「小米618开门红，6月1日到手价不高于1999元」800G超大通量，制水速度翻一倍；“真”双出水，厨房用水全净化；新一代OLED屏显水龙头，水质清晰可见；一级水效，纯废水比最高可达3:1；横抽式滤芯设计，换滤芯更方便。', 0, '<p><img src=\"http://image.jt.com/upload/b/8/c/c/3/3/1/4/d1a4260c-3f76-49ea-8bb9-633451030abd.jpg\"><img src=\"http://image.jt.com/upload/b/8/d/a/4/a/9/5/5fbae3ef-60fc-4897-abab-b848972c3de1.jpg\"><img src=\"http://image.jt.com/upload/b/8/e/8/6/2/1/6/2c96cece-3fe7-4ee8-83e9-e43823022d0f.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('6627a7b7-90b3-45f2-a5a8-cba3506e2bb6', '械键盘鼠标耳机三件套网吧粉色套装', 479, 17, 'http://image.jt.com/upload/5/8/2/9/8/1/7/b/9f0103a7-3f94-4b1d-8d1f-28f2063e102c.png', 997, '520礼物达尔优真机械键盘鼠标耳机三件套网吧粉色套装女生网红电脑笔记本有线游戏外设专用电竞键鼠可爱少女', 1, '<p><img src=\"http://image.jt.com/upload/5/9/e/c/7/1/9/b/33ecf8c3-fc23-489c-99fd-69fce953b489.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('666bf03a-bedc-4218-8a14-57d44d614c7f', '小米全面屏电视E55A', 1749, 23, 'http://image.jt.com/upload/b/3/d/f/f/b/9/c/b0714c81-980d-4431-be0f-674c32b9c76e.jpg', 1477, '「618超级预售，订金100抵150，尾款再减100元，到手价不高于1599！6月1日支付尾款，付尾款还可抢小米10手机！」全面屏设计 / 4K超高清+HDR / 纤薄机身 / 2GB+8GB大内存 / 64位四核处理器 / 内置小爱同学', 1, '<p><img src=\"http://image.jt.com/upload/3/6/d/9/9/f/4/8/fa3d74f1-3e21-4e55-906a-ac15260e8bc5.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('6743e1d8-50ea-4c59-ab9c-b9390774e2a8', 'ThinkPad X1 隐士 笔记本电脑', 18999, 6, 'http://image.jt.com/upload/7/1/8/a/1/3/7/0/eb749568-c457-4240-bab1-ac6bf1195db6.jpg', 889, '八代英特尔酷睿i7-8750H/Windows10 专业版/16GB/512GB SSD/独显/15.6英寸', 0, '<p><img src=\"http://image.jt.com/upload/9/e/8/d/6/1/a/4/dc1d5be8-4841-4343-985d-8bb1abfc8423.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('692f16fb-521d-4359-9ce3-4e5a414490c0', '任天堂NS switch', 4798, 19, 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/521add55-81ae-40ab-867a-1eb5442d4e84.jpg', 897, '任天堂NS switch Lite新款主机加强续航游戏机 国行塞尔达 马里奥', 3, '<p><img src=\"http://image.jt.com/upload/2/d/7/3/2/6/d/0/9d5b34f6-06e0-4251-9454-448749dc30ed.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('69855aeb-a08f-4984-a79d-34499ff7363b', '米家风冷两门冰箱170L', 1499, 23, 'http://image.jt.com/upload/4/b/f/d/9/4/c/4/0d9e321e-4c0b-4dc6-a8fe-a4ec420d818f.jpg', 898, '「付100元抵400元，6月1日付尾款到手价1199元，付尾款赠MIJOY 抽纸青春版 24包/箱」风冷循环/变速风机/二级能效,环保节能/冷藏冷冻,按需调节', 0, '<p><img src=\"http://image.jt.com/upload/3/e/0/3/8/f/a/9/e63e2232-8bf3-4834-be67-3d4eec73a7a6.jpg\"></p><p><img src=\"http://image.jt.com/upload/3/e/1/1/a/7/2/a/cdf582ae-6506-4f96-aedd-94b11d1b263c.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('6b0cbdf7-e2c4-4faf-bea5-5c4950154889', '“在那里，那是家园，那是我们\"', 457.99, 21, 'http://image.jt.com/upload/3/9/d/f/2/2/d/e/001fccb5-0df3-4fe9-9477-e3a6bef07bd0.png', 992, '“在那里，那是家园，那是我们。在那里，你爱的每个人，你认识的每个人，你听说过的每个人，在这世上存在过的每个人，度过了自己的一生。\n聚集在这里的，是我们的欢乐和痛苦，是成千上万的宗教信仰、意识形态，和经济学说每个猎手与觅食者，每个英雄与懦夫，每个文明的创立者和毁灭者，每个国王与农夫，每对年轻的爱侣，每一个母亲与父亲、充满希望的孩子们，发明家与探险家，每一位高尚的教师、每一位贪腐的政客，每一位超级明星、每一位最高领袖，人类史上的每一位圣人和罪人，都生活在这里，\n如一粒微尘，悬浮在一束阳光之中。地球是一个很小的舞台，在浩瀚的宇宙背景下，想想过去的血流成河，那为帝王将相而流的血，只为让他们在光荣和胜利中，成为瞬间的伟人，占有那一个小点中…那一小部分。想想那无尽的残酷，图像里那一个像素点的某个角落的民众，每天把这残酷施加到与他们没什么区别的另一个角落的民众身上。他们为何常常误解，他们为何渴望杀死对方，他们的憎恨为何如此狂热。\n我们在装模做样，我们自以为很重要，妄想着我们人类地位特殊，在宇宙中与众不同，这一切，都因这泛着苍白蓝光的小点而动摇。我们的星球，不过是一粒孤独的微尘，笼罩在伟大的宇宙黑暗之中。\n我们默默无闻，沉浸在无尽的浩瀚里，没有一丝线索显示，除了我们自己，\n还有谁能拯救我们。地球是目前已知唯一有生命的世界，生命再无其他去处，至少在不久的将来，亦是如此。没有外星球，供人类迁移，只可参观，不能定居。不管你喜欢与否，现在，只有地球供我们立足。据说研习天文，可以让人谦卑，塑造人心，磨炼个性，也许再没有更好的方法能比这遥远的画面更好地显示出人类的自负与愚蠢。\n对我而言，它强调了我们的责任，要对人更友善，懂得珍惜与爱护，这泛着苍白蓝光的小点是我们知道的唯一的家园。\n“That’s here, that’s home, that’s us. On it everyone you love, everyone you know, everyone you ever heard of, every human being who ever was, lived out their lives. The aggregate of our joy and suffering, thousands of confident religions, ideologies, and economic doctrines, every hunter and forager, every hero and coward, every creator and destroyer of civilization, every king and peasant, every young couple in love, every mother and father, hopeful child, inventor and explorer, every teacher of morals, every corrupt politician, every “superstar,” every “supreme leader,” every saint and sinner in the history of our species lived there – on a mote of dust suspended in a sunbeam. The Earth is a very small stage in a vast cosmic arena. Think of the rivers of blood spilled by all those generals and emperors so that, in glory and triumph, they could become the momentary masters of a fraction of a dot. Think of the endless cruelties visited by the inhabitants of one corner of this pixel on the scarcely distinguishable inhabitants of some other corner, how frequent their misunderstandings, how eager they are to kill one another, how fervent their hatreds. Our posturings, our imagined self-importance, the delusion that we have some privileged position in the Universe, are challenged by this point of pale light. Our planet is a lonely speck in the great enveloping cosmic dark. In our obscurity, in all this vastness, there is no hint that help will come from elsewhere to save us from ourselves. The Earth is the only world known so far to harbor life. There is nowhere else, at least in the near future, to which our species could migrate. Visit, yes. Settle, not yet. Like it or not, for the moment the Earth is where we make our stand. It has been said that astronomy is a humbling and character-building experience. There is perhaps no better demonstration of the folly of human conceits than this distant image of our tiny world. To me, it underscores our responsibility to deal more kindly with one another, and to preserve and cherish the pale blue dot, the only home we’ve ever known.”', 0, '<p><img src=\"http://image.jt.com/upload/3/9/d/f/2/2/d/e/2ee6ecb9-74d8-434d-bf1f-18ab9fbcb6e1.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('6cdf2ce6-b90e-4812-92c8-1b70b7daddf5', '小米空调', 1499, 23, 'http://image.jt.com/upload/d/c/5/3/b/9/7/b/08d5dad8-bafc-4bdf-889b-dca6ec634be3.jpg', 987, '空调（大1匹/定频/三级能效）\n快速冷暖 / 静音设计 / 强力除湿', 0, '<p><img src=\"http://image.jt.com/upload/1/1/5/5/6/1/6/7/521f0174-3f58-4dc7-85af-82a4d9b37018.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('73438be1-1a72-40b7-aaad-d7c5809e0ba8', '米家空气净化器Pro H 高效除菌', 1699, 23, 'http://image.jt.com/upload/7/a/7/2/9/3/c/c/fbfb5c91-2026-47b6-8ce2-5b152278db74.jpg', 696, '「小米618开门红，6月1日预计到手价1499元！更享12期分期免息，平均每月低至125元！」强力去除甲醛 / 高效净化PM2.5、过敏原和细菌 / 全新强大风路，极速净化', 0, '<p><img src=\"http://image.jt.com/upload/a/3/2/6/d/5/3/0/d9f5690e-6576-4077-9e15-3d5b96f08e28.jpg\"><img src=\"http://image.jt.com/upload/a/3/3/4/e/c/b/1/8c33062d-b57e-4b3f-9ce8-96713c750039.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('841a186e-b51d-4f7c-bf92-062f13e36bbe', 'HUAWEI nova 7', 2999, 14, 'http://image.jt.com/upload/4/c/9/3/a/7/d/1/4faabe56-3f44-459a-88b3-b1ce94fed965.png', 897, 'HUAWEI nova 7 5G 前置3200万像素高清自拍 后置6400万变焦四摄 麒麟985 5G SoC 芯片 8GB+128GB 全网通版（7号色）', 1, '<p><img src=\"http://image.jt.com/upload/7/0/f/f/5/7/a/d/2c5fd027-aae5-4e61-8bb7-70b84708330b.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('86c3cdad-a399-409d-a65a-b2e3753e3313', '米家扫地机器人边刷', 29, 23, 'http://image.jt.com/upload/1/a/b/4/e/2/9/5/b7dccb3f-38f9-4703-90ec-d7fcaaf87239.jpg', 898, '「仅适用于米家扫地机器人和米家扫地机器人1S ！」动态调速边刷，清扫墙边及墙角灰尘和垃圾', 0, '<p><img src=\"http://image.jt.com/upload/1/2/d/6/9/7/2/6/7470b6f9-2cf0-4bf4-bde6-5eaa95a286c8.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', '月下独酌 | 李白 ', 9999, 21, 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png', 31, '月下独酌四首·其一\n【作者】李白 【朝代】唐\n花间一壶酒，独酌无相亲。\n\n举杯邀明月，对影成三人。\n\n月既不解饮，影徒随我身。\n\n暂伴月将影，行乐须及春。\n\n我歌月徘徊，我舞影零乱。\n\n醒时相交欢，醉后各分散。\n\n永结无情游，相期邈云汉。', 3, '', 1);
INSERT INTO `t_product` VALUES ('9321e49a-9ea0-44e8-809d-80bb69a440ca', 'Redmi全自动波轮洗衣机1A 8kg', 899, 23, 'http://image.jt.com/upload/2/2/d/1/9/6/5/7/70f83335-e0ed-4344-acb7-63819f76d35d.jpg', 8979, '8kg大容量 / 10种洗涤模式 / 10挡水位调节 / 耐腐蚀金属机身 / 桶自洁、桶风干模式避免细菌滋生 / 空气阻尼减震 / 免运费及基础安装费', 0, '<p><img src=\"http://image.jt.com/upload/a/f/d/d/7/8/7/c/3be9db36-183c-4866-8d09-927715d41f8c.jpg\"><img src=\"http://image.jt.com/upload/a/f/f/9/a/7/7/e/280078cf-a63b-48e5-b626-f8839c36e424.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('96781946-5c49-4795-b192-75698eca5577', '神舟战神Z8/G8系列 笔记本电脑', 8389, 7, 'http://image.jt.com/upload/d/d/f/1/6/8/9/9/d105e775-c3f9-4e62-9ccf-799f26971248.jpg', 897, '神舟(HASEE)战神Z8/G8系列 RTX2060显卡IPS屏游戏笔记本电脑 G8-CU7NK丨十代I7+16G+双硬盘', 1, '<p><img src=\"http://image.jt.com/upload/2/2/5/1/d/8/8/6/8e6e20d1-d452-4f1c-ba81-90363ec383c2.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('96e740cf-a801-437e-8497-5b91c7805dfd', 'Pixiv_3', 587, 21, 'http://image.jt.com/upload/e/3/5/e/f/c/5/3/00980f31-d02a-4f68-8f46-2cea5e475869.jpg', 23, 'Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3', 0, '', 1);
INSERT INTO `t_product` VALUES ('a0295c62-dece-42a7-9660-b12c7ed4aaf6', 'Redmi 智能电视 X65', 3299, 23, 'http://image.jt.com/upload/b/3/d/1/e/4/1/b/15cc17c0-7426-4988-9d68-99c31f75d488.jpg', 797, '订金20抵320元，6月10日10点支付尾款，到手2999元！支付尾款抽小米手表|晒单随机选100位赠小米驱蚊器|6期免息！全金属边框/4K超高清/MEMC运动补偿/8单元重低音音响系统', 0, '<p><img src=\"http://image.jt.com/upload/1/f/3/4/d/b/f/0/037ac597-0be6-42d4-bdf8-ac667d5dec15.jpg\"></p><p><img src=\"http://image.jt.com/upload/2/0/1/6/5/4/0/0/e3fd5f0f-1043-4128-8075-d152ef8b6f98.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('a1097402-74f3-4f27-80c6-b9b376fdd3f5', '神舟(HASEE)战神Z10笔记本电脑', 11199, 7, 'http://image.jt.com/upload/d/d/c/7/2/2/1/6/360d81b0-4623-46de-94de-f0e34267c830.jpg', 889, '神舟(HASEE)战神Z8/G8系列 RTX2060显卡IPS屏游戏笔记本电脑 Z10-CU7PF丨十代I7+16G+双硬盘', 0, '<p><img src=\"http://image.jt.com/upload/8/3/9/f/2/6/c/3/6de3bd15-9585-4dff-8470-e0ecd07cbf19.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('a35bc8b6-46d1-4677-b24a-6fde9c327cb5', '临江仙·梦后楼台高锁 【作者】晏几道 【朝代】宋', 998, 21, 'http://image.jt.com/upload/3/9/d/1/0/b/5/d/5aec3212-86b9-4ee3-9e34-be25d2245ff3.png', 4, '临江仙·梦后楼台高锁\n【作者】晏几道 【朝代】宋 译文对照\n梦后楼台高锁，酒醒帘幕低垂。去年春恨却来时。落花人独立，微雨燕双飞。\n\n记得小苹初见，两重心字罗衣。琵琶弦上说相思。当时明月在，曾照彩云归。\n\n标签: 歌女情感人物婉约宋词三百首怀念宋词精选', 0, '', 1);
INSERT INTO `t_product` VALUES ('a425d8f2-7cce-46de-a74b-f08703c31728', 'ThinkPad X390 笔记本电脑', 6499, 6, 'http://image.jt.com/upload/7/2/6/b/8/b/8/0/c090a99d-ab27-404c-b0de-b40d061fd3d2.jpg', 8789, '全新十代英特尔酷睿i5-10210U/Windows 10家庭中文版/8GB/256GB SSD/UHD 620显示芯片/13.3英寸', 0, '<p><img src=\"http://image.jt.com/upload/d/3/7/3/9/c/e/5/31e2f8ec-a248-459b-be30-73e2db901016.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('a6bcbaba-8f85-4227-93e8-14a5b283cfe1', '米家扫拖一体机器人', 1999, 23, 'http://image.jt.com/upload/9/8/3/f/0/9/8/5/ee510aff-7205-442d-a627-ea98bdbbafcd.png', 12312, '「小米618开门红，6月1日预计到手价1499！更享12期分期免息，平均每月低至125元！」三种扫拖模式 / 智能电控水箱，呵护木地板 / LDS激光导航 / 米家APP远程操控 / 高精度传感器 / 软件虚拟墙，房间自动分区 /指哪儿扫哪儿 / 2100Pa', 0, '<p><img src=\"http://image.jt.com/upload/7/f/5/9/1/c/6/1/ac70513a-ab93-42ff-b049-3e5ce66021bd.jpg\"><img src=\"http://image.jt.com/upload/7/f/6/7/3/3/e/2/66af3a3f-252d-42fd-b24c-c1d8d0166629.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('a9f3b3f5-0f62-4238-bef6-02ea9fe0494f', '怪盗基德', 1412, 21, 'http://image.jt.com/upload/d/b/4/1/b/b/2/1/159d1f96-7e99-4e29-ae80-3672b5ec3401.png', 175, '怪盗基德（日文：怪盗キッド；英文：Kid the Phantom Thief），又译怪盗小子、怪盗奇度，原名“怪盗1412号”（源自其国际罪犯代码“1412”），是日本动漫《魔术快斗》中的主人公以及《名侦探柯南》中的客串角色。第一代的真实身份为黑羽盗一，现在第二代为黑羽快斗。一个充满传奇色彩的怪盗，拥有过人才智，精通易容、变声、逃脱术，以珠宝等各类贵重艺术品为目标，使用魔术手法进行犯案的超级盗窃犯。', 0, '', 1);
INSERT INTO `t_product` VALUES ('ae3ea77c-e060-4f9c-a0bf-a94280298397', '米家扫地机器人尘盒滤网', 39, 23, 'http://image.jt.com/upload/6/2/0/3/e/4/0/0/670f44c5-52e8-42af-97dd-de469217fb9e.jpg', 898, '「仅适用于米家扫地机器人和米家扫地机器人1S！」一体成型，更换方便 / 密封良好，风压零损耗', 0, '<p><img src=\"http://image.jt.com/upload/1/5/3/7/2/d/e/3/18038d25-d906-4cdc-aa7f-56ae8ed7df6b.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('af2c91bb-1baa-4e5f-adc1-bbfbe4cf0bb6', '蝴蝶忍插图2', 856, 16, 'http://image.jt.com/upload/e/e/1/8/5/f/7/4/8444aa98-ed75-4e02-b76a-9bd7a052f321.jpg', 787, '不多介绍了', 0, '', 1);
INSERT INTO `t_product` VALUES ('b005e874-9334-4298-bd85-f9616de945b8', '米家电烤箱', 299, 23, 'http://image.jt.com/upload/5/7/0/0/9/a/a/2/c35c8ee8-6ed9-497a-98a3-465b4a4b89d5.jpg', 898, '「小米618开门红，6月1日到手价不高于289元，前2小时279元」32L大容积 / 上下独立控温 / 旋转烤叉 / 热风循环 / 40°C恒温发酵 / 120分钟定时 / 支持免定时持续运行', 0, '<p><img src=\"http://image.jt.com/upload/9/4/4/e/7/e/8/6/5550f6ff-c13b-47a6-9f1d-c0a09aa17cce.jpg\"><img src=\"http://image.jt.com/upload/9/4/5/c/9/6/0/7/5936839b-af60-4925-92ad-0ea36528226a.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('b6298be9-46cd-425c-8924-521994c34256', '小米10 青春版 5G', 2499, 4, 'http://image.jt.com/upload/c/e/e/4/7/0/7/2/30ea1382-e659-44ab-b427-8f58a3c2ec29.jpg', 989, '「100元订金预售火爆进行中，6月1日支付尾款，尾款享6期免息，限量+1元得几何保护壳」向往的生活同款/ 50倍潜望式超远变焦 / 双模5G / 骁龙765G处理器 / 三星AMOLED原色屏 / 180Hz采样率 / 4160mAh大电池 / 多功能NFC / 红外遥控器', 0, '<p><img src=\"http://image.jt.com/upload/b/1/7/b/6/6/8/4/612e3df4-f154-49d2-bb96-d02a28fa5402.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('b945b8bd-a9c6-4fcc-99a7-21d1ebd01fdc', 'Redmi 10X 5G 系列', 1899, 4, 'http://image.jt.com/upload/f/3/a/e/9/0/1/c/abb6fcc0-41c8-4839-87da-a0082001847d.png', 998, '「100元订金预售中！付尾款赠69元耳机；享延保、碎屏保5折」双5G待机 /天玑820处理器 /4800万流光相机+800万超广角/6.57\"三星AMOLED屏幕 /屏幕指纹 /4520mAh长续航 /红外遥控', 0, '<p><img src=\"http://image.jt.com/upload/7/b/4/6/4/5/f/b/7225fce8-0bb7-49c2-a1e8-89445906ec20.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('beccbb5e-2fb2-44ae-ae96-203e88ea046d', '风冷十字四门冰箱 486L', 2999, 23, 'http://image.jt.com/upload/4/b/e/f/7/d/4/3/4952d8dd-2dae-4a06-a0cb-7dd008f98f6b.jpg', 2130, '486L占地约0.55㎡ / 风冷无霜不结冰 / 全直流双变频，高效制冷，静音节能 / 环绕立体出风，长久锁水保鲜 / 自动恒温校准 / 支持米家APP智能控制', 1, '<p><img src=\"http://image.jt.com/upload/9/0/f/5/3/2/f/0/46d88f43-8014-471a-ab51-f154a0e165a1.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('c8412d5d-9774-4a10-878f-9f35874743d6', 'Pro 15 增强版', 5899, 20, 'http://image.jt.com/upload/3/5/2/7/3/3/2/1/f0eacb7a-72d6-463f-92f2-dd4298f03a6d.png', 993, '全新十代酷睿处理器 / 大满贯接口 / 100%sRGB高色域 / 全尺寸背光键盘', 5, '<p><img src=\"http://image.jt.com/upload/e/5/4/4/9/8/d/3/0534419b-865a-45f8-bc54-83faa4c98f6f.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 'Pixiv_', 1312, 21, 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png', 854, 'Pixiv_Pixiv_Pixiv_Pixiv_Pixiv_Pixiv_', 21, '', 1);
INSERT INTO `t_product` VALUES ('c9d651ec-ea47-49dc-ac3b-9e5bc6a29242', '把酒问月·故人贾淳令予问之_李白_白底', 11.11, 21, 'http://image.jt.com/upload/a/4/1/b/e/b/6/4/ceaf3604-edd6-4b17-bb21-c8f956a3f17e.png', 45, '把酒问月·故人贾淳令予问之\n唐代：李白\n\n青天有月来几时？我今停杯一问之。\n人攀明月不可得，月行却与人相随。\n皎如飞镜临丹阙，绿烟灭尽清辉发。\n但见宵从海上来，宁知晓向云间没。\n白兔捣药秋复春，嫦娥孤栖与谁邻？\n今人不见古时月，今月曾经照古人。\n古人今人若流水，共看明月皆如此。\n惟愿当歌对酒时，月光长照金樽里。', 0, '<h1>把酒问月·故人贾淳令予问之</h1><p><span style=\"color: rgb(101, 100, 95);\">唐代：李白</span></p><p>青天有月来几时？我今停杯一问之。</p><p>人攀明月不可得，月行却与人相随。</p><p>皎如飞镜临丹阙，绿烟灭尽清辉发。</p><p>但见宵从海上来，宁知晓向云间没。</p><p>白兔捣药秋复春，嫦娥孤栖与谁邻？</p><p>今人不见古时月，今月曾经照古人。</p><p>古人今人若流水，共看明月皆如此。</p><p>惟愿当歌对酒时，月光长照金樽里。</p><p><img src=\"http://image.jt.com/upload/a/4/1/b/e/b/6/4/fec4a1c3-7d78-4eda-8061-662c30cfe59c.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('ca843588-4264-437a-aa54-f3a559890baa', '拯救者 Y7000', 6999, 6, 'http://image.jt.com/upload/6/e/0/4/3/3/3/0/9c545007-938b-4271-a2a3-36ce2a4eef0a.jpg', 298, '九代英特尔酷睿i7-9750H/Windows 10 家庭中文版/15.6英寸/8G/1T SSD/ GeForce GTX 1650 4G独显/黑色', 1, '<p><img src=\"http://image.jt.com/upload/c/a/f/4/7/4/a/0/563b36db-60b7-42c2-8e9a-2e8ed2182864.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('cec4dd95-4682-4c6c-8137-c5b11dbe2798', '米家互联网洗烘一体机Pro 10kg', 2999, 23, 'http://image.jt.com/upload/2/2/c/3/7/e/d/6/3a67e039-7e5f-470d-a860-7c3d7aa76b6a.jpg', 898, '国标双A+级洗烘能力 / 22种洗烘模式 / 除菌率达99.9%+ / 支持小爱同学语音遥控 / 支持OTA在线智能升级 / 智能空气洗 / 智能投放洗涤剂', 0, '<p><img src=\"http://image.jt.com/upload/7/a/e/9/2/5/b/a/aa673d47-3a46-409e-aa66-e26334b17733.jpg\"><img src=\"http://image.jt.com/upload/7/a/f/7/3/d/3/b/3bad7f57-0149-4623-8955-c2fd957f65ac.jpg\"><img src=\"http://image.jt.com/upload/7/b/0/5/5/4/b/c/bb3621d4-a3c5-4b6b-9eed-27af8fc444c7.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('d00add8b-ea1f-4938-8e89-0df20c094435', 'RedmiBook 14 Ⅱ 锐龙版', 3999, 20, 'http://image.jt.com/upload/3/5/5/1/7/9/a/4/8fdb6fc8-c173-4966-b458-f89e600d4b8a.png', 9998, '14英寸FHD全面屏 / 超轻薄金属机身 / AMD锐龙 4500U 处理器', 0, '<p><img src=\"http://image.jt.com/upload/2/1/9/e/2/e/8/9/ba27179a-8c4b-4774-a864-ee2889ebd1ea.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('d29f0ef9-7250-4a95-b5b7-062254f3496d', '小新 潮7000 15.6英寸轻薄笔记本', 4399, 6, 'http://image.jt.com/upload/7/0/a/8/9/b/6/0/2dd10ebd-c16c-4320-8f1b-12c3b29aa8c1.jpg', 889, 'A9-9425/Windows 10 家庭中文版/15.6英寸/4GB/2T+128G SSD/Radeon 530 2GB独显/极光银', 0, '<p><img src=\"http://image.jt.com/upload/6/9/a/7/2/6/6/3/c88f5fed-70cb-4b7a-9ccb-a3a0c00d9a08.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('d727ec26-6ff5-4924-a659-7b58075ada43', 'Pixiv_2', 958, 21, 'http://image.jt.com/upload/f/3/0/d/b/2/f/2/c3e06d61-605e-4c9b-a857-58ea581d1404.jpg', 777, 'Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2', 0, '', 1);
INSERT INTO `t_product` VALUES ('dce55adb-2d1e-4cf7-a55d-2a8a7e8c6073', 'Razer雷蛇黑寡妇蜘蛛标准版键盘', 449, 17, 'http://image.jt.com/upload/5/1/1/4/a/5/c/2/a4fb0c9a-dacf-40fd-93ba-da7c17388cd6.png', 996, 'Razer雷蛇黑寡妇蜘蛛标准版电脑游戏电竞背光机械键盘绿轴lol吃鸡\n双侧墙雷蛇绿轴，触发更稳定，按键更耐用', 4, '<p><img src=\"http://image.jt.com/upload/2/d/7/3/2/6/d/0/b33500ec-d7fa-49f1-bd20-0f8de8c36bd0.png\"></p><p><img src=\"http://image.jt.com/upload/2/c/9/0/4/a/4/0/60e792dd-a7dd-4ce5-903a-ea2eaaa63e61.jpg\"></p><p><br></p><p><img src=\"http://image.jt.com/upload/2/d/7/1/c/2/5/0/da351636-4867-4141-98a4-c9ba8b7d4926.jpg\"></p><p><img src=\"http://image.jt.com/upload/2/e/5/3/3/a/6/0/d9d93489-8a88-4e0d-adc0-bc32f1c29089.jpg\"></p><p><img src=\"http://image.jt.com/upload/2/f/3/4/b/2/7/0/25be0ad4-e375-466a-9c2c-498482f95b45.jpg\"></p><p><img src=\"http://image.jt.com/upload/3/0/1/6/2/a/8/0/06d63de0-93f0-4910-9089-dc31d8fd73e5.jpg\"></p><p><img src=\"http://image.jt.com/upload/3/0/f/7/a/2/9/0/e6ca016a-511a-466f-aa4b-5443dea7efad.jpg\"></p><p><img src=\"http://image.jt.com/upload/3/1/d/9/1/a/a/0/68248c12-f3d4-4695-bd03-2095db9b13d8.jpg\"></p><p><img src=\"http://image.jt.com/upload/3/2/b/a/9/2/b/0/e55e8aea-2ba9-41c7-aae2-c3cb8333c598.jpg\"></p><p><img src=\"http://image.jt.com/upload/3/3/9/c/0/a/c/0/c922cd30-ab1c-4a6d-a8f9-048b2899441e.jpg\"></p><p><img src=\"http://image.jt.com/upload/5/6/5/8/6/3/9/2/786ee1ea-26a5-436a-928f-3654109b5dd0.jpg\"></p>', 1);
INSERT INTO `t_product` VALUES ('e5f058be-b0fe-4903-a73c-933bc6b77112', '修图辅助键盘', 1280, 17, 'http://image.jt.com/upload/5/b/a/f/6/1/b/b/8081d3b7-4b27-4a6e-8e9d-44cf27870143.png', 997, 'Tourbox照片图像视频Adobe编辑设计师专用修图辅助键盘PS美工调色', 1, '<p><img src=\"http://image.jt.com/upload/5/d/7/2/5/1/d/b/5e6a316d-e1c1-4a36-b4f3-1320ca1e9b89.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('e8c9273e-c021-46c7-80d2-75662b2cdcdf', 'RedmiBook 16 锐龙版', 3999, 20, 'http://image.jt.com/upload/3/5/1/9/1/b/a/0/4e51f6c6-bafb-426f-af58-925196e60c8c.png', 998, '16英寸全面屏 / 100% sRGB / AMD锐龙 4500U 处理器', 0, '<p><img src=\"http://image.jt.com/upload/7/d/6/3/6/b/f/4/a4352999-eefd-456e-8547-c6ac2b56d973.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('f131ae97-3209-4021-a3fa-411f70166553', '神舟战神Z7M笔记本电脑', 6799, 7, 'http://image.jt.com/upload/d/d/b/9/0/a/9/5/e15703c5-1c45-47f3-8791-1b039c0725e2.jpg', 998, '神舟战神Z7M/G7T 十代酷睿i7 GTX1650/Ti独显游戏本15.6英寸全面屏学生笔记本电脑 G7T-CU7NA｜十代i7+8G+512GSSD', 0, '<p><img src=\"http://image.jt.com/upload/4/e/a/a/d/4/0/1/f9808eba-16df-4d4d-8a3d-a532353fb30f.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('f6ee2eae-8313-405f-9458-56bfd539a55e', '神舟优雅系列商务笔记本电脑', 2499, 7, 'http://image.jt.com/upload/d/d/e/3/5/1/1/8/e71552b7-d80b-41d7-8db5-4678c6484848.jpg', 98989, '神舟（HASEE）优雅XS/X3/X4系列商务本轻薄便携 IPS屏幕商务笔记本电脑 256GSSD X3G1｜i3-5005U+8G+13.3\"72%', 0, '<p><img src=\"http://image.jt.com/upload/e/d/6/b/9/d/4/5/e0da2088-6b51-480c-b182-7306322e0871.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('f72d54cd-b82a-4c25-9458-b62d1ff1bc8d', '行路难三首_李白_白底', 14.59, 21, 'http://image.jt.com/upload/4/9/2/0/b/e/a/c/d53b4d7d-be08-4bca-8cef-ded5851f8e4b.png', 44, '有耳莫洗颍川水，有口莫食首阳蕨。\n含光混世贵无名，何用孤高比云月？\n吾观自古贤达人，功成不退皆殒身。\n子胥既弃吴江上，屈原终投湘水滨。\n陆机雄才岂自保？李斯税驾苦不早。\n华亭鹤唳讵可闻？上蔡苍鹰何足道？\n君不见吴中张翰称达生，秋风忽忆江东行。\n且乐生前一杯酒，何须身后千载名？', 0, '<h1><strong style=\"color: rgb(176, 8, 21);\">行路难</strong><strong style=\"color: rgb(25, 83, 125);\">三首</strong></h1><p><span style=\"color: rgb(101, 100, 95);\">唐代：&nbsp;李白</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">有耳莫洗颍川水，有口莫食首阳蕨。</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">含光混世贵无名，何用孤高比云月？</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">吾观自古贤达人，功成不退皆殒身。</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">子胥既弃吴江上，屈原终投湘水滨。</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">陆机雄才岂自保？李斯税驾苦不早。</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">华亭鹤唳讵可闻？上蔡苍鹰何足道？</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">君不见吴中张翰称达生，秋风忽忆江东行。</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\">且乐生前一杯酒，何须身后千载名？</span></p><p><span style=\"background-color: rgb(240, 239, 226); color: rgb(15, 15, 15);\"><span class=\"ql-cursor\">﻿</span></span><img src=\"http://image.jt.com/upload/4/9/2/0/b/e/a/c/ce863d96-75d8-4e6d-a36a-437054d0cbb1.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('fa29c8dd-3c18-4655-9ede-672a78d340ec', 'Razer雷蛇毒蝰有线游戏专用鼠标', 199, 17, 'http://image.jt.com/upload/2/2/5/0/6/6/6/5/3c33e237-3cfc-4dce-b416-6447305a202d.png', 999, 'Razer雷蛇毒蝰迷你版轻量有线游戏专用鼠标笔记本台式电脑RGB电竞\n', 0, '<p>品牌名称：<span style=\"color: rgb(51, 51, 51);\">Razer/雷蛇</span></p><p><strong>产品参数：</strong></p><ul><li>产品名称：Razer/雷蛇 毒蝰迷你版</li><li>品牌:&nbsp;Razer/雷蛇</li><li>型号:&nbsp;毒蝰迷你版</li><li>成色:&nbsp;全新</li><li>售后服务:&nbsp;全国联保</li><li>接口类型:&nbsp;USB</li><li>按键数:&nbsp;6个</li><li>光学分辨率:&nbsp;其他/other</li><li>工作方式:&nbsp;光学</li><li>颜色分类:&nbsp;黑色</li><li>套餐类型:&nbsp;官方标配</li><li>是否支持人体工程学:&nbsp;支持</li><li>保修期:&nbsp;24个月</li></ul><p><img src=\"http://image.jt.com/upload/2/c/9/1/a/e/c/0/d2878890-dd1d-4361-a9d6-f2cbe88a9e18.png\"></p><p><img src=\"http://image.jt.com/upload/2/2/5/e/7/d/e/6/42eb61fd-2a94-4b4e-9750-e25f187f80b2.png\"></p>', 1);
INSERT INTO `t_product` VALUES ('fd1f5818-3bd1-4327-8806-c1f87a8475d7', '米家扫地机器人主刷罩', 38, 23, 'http://image.jt.com/upload/6/8/0/c/8/4/8/c/cdbf8bf8-e4e3-4222-b3a4-a844e8c8ca50.jpg', 8688, '「仅适用于米家扫地机器人和米家扫地机器人1S ！」密封处理，缓冲胶垫减少损伤 / 结构坚固，防缠绕设计 / 单手操作，拆卸方便', 0, '<p><img src=\"http://image.jt.com/upload/7/b/b/f/9/d/c/f/1938507f-2bda-471a-80fd-ebaf21ae67ee.jpg\"></p>', 1);

-- ----------------------------
-- Table structure for table1
-- ----------------------------
DROP TABLE IF EXISTS `table1`;
CREATE TABLE `table1`  (
  `id` int(11) NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table1
-- ----------------------------
INSERT INTO `table1` VALUES (1, 'Home', 0);
INSERT INTO `table1` VALUES (2, 'About', 1);
INSERT INTO `table1` VALUES (3, 'Contact', 1);
INSERT INTO `table1` VALUES (4, 'Legal', 2);
INSERT INTO `table1` VALUES (5, 'Privacy', 4);
INSERT INTO `table1` VALUES (6, 'Products', 1);
INSERT INTO `table1` VALUES (7, 'Support', 2);

-- ----------------------------
-- Table structure for u_cart
-- ----------------------------
DROP TABLE IF EXISTS `u_cart`;
CREATE TABLE `u_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `product_imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `product_num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_cart
-- ----------------------------
INSERT INTO `u_cart` VALUES (6, '', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png', 5, 9999.00, '月下独酌 | 李白 ');

-- ----------------------------
-- Table structure for u_detail
-- ----------------------------
DROP TABLE IF EXISTS `u_detail`;
CREATE TABLE `u_detail`  (
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户Id',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_detail
-- ----------------------------
INSERT INTO `u_detail` VALUES ('090d399e-f155-4f0a-af9e-32d5338dbd19', 'http://image.jt.com/upload/e/e/d/7/4/a/e/a/8d8b2780-d009-4283-a373-2f4f0b72b0ae.png', '男', 'JayChou', '653108117@qq.com', '13225237022', NULL);
INSERT INTO `u_detail` VALUES ('21bd717c-ea28-4a37-b62f-d0791605c5b1', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/f15b24dd-57ca-49c3-994e-d05fe4097b85.jpg', '男', '测试管理员', '653108117@132.com', '1891324574', '2020-05-13 11:39:50');
INSERT INTO `u_detail` VALUES ('64499a59-2396-46d6-926b-0893046c8749', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/320296db-9a7e-4a34-b2d8-0eeeff88d4d9.jpg', '男', '呆毛~~', '653108117@qq.com', '13225237022', NULL);
INSERT INTO `u_detail` VALUES ('8883b7c9-b39b-452f-a0fb-c39e27185edf', 'http://image.jt.com/upload/9/8/3/f/0/9/8/5/89b68a5a-905a-4b41-90ae-0cc7b6e8e3dd.png', '男', '呆毛的第二个号', '653108117@qq.com', '13225237022', '2020-05-29 22:03:58');
INSERT INTO `u_detail` VALUES ('a432a188-44c3-4fca-bffb-9b0c5b297e34', NULL, NULL, '呆毛2号', NULL, NULL, '2020-01-10 17:37:44');
INSERT INTO `u_detail` VALUES ('fc89e384-37d8-425a-9b91-191e2858b1c8', '', '男', '呆毛', '653108118@qq.com', '13225237022', '2020-01-08 14:23:42');

-- ----------------------------
-- Table structure for u_order
-- ----------------------------
DROP TABLE IF EXISTS `u_order`;
CREATE TABLE `u_order`  (
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `order_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '定价总价',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `status` int(5) NULL DEFAULT NULL COMMENT '订单状态',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `order_time` timestamp(0) NULL DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_order
-- ----------------------------
INSERT INTO `u_order` VALUES ('0017ab36-3747-4747-840a-68d9f42ba07b', 2624.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '33', '2020-05-18 10:16:59');
INSERT INTO `u_order` VALUES ('013f0c28-4423-4436-9e2e-b8749f2d085b', 4899.00, '64499a59-2396-46d6-926b-0893046c8749', 4, '啊实打实的撒打算的', '2020-05-13 16:17:33');
INSERT INTO `u_order` VALUES ('09ca5be1-5ef9-43c4-86ed-fdbc76913df1', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '7', '2020-02-27 17:29:23');
INSERT INTO `u_order` VALUES ('0fc88403-018f-42fc-adc6-5f99991ac851', 1412.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '测试未付款下单1', '2020-03-17 11:20:11');
INSERT INTO `u_order` VALUES ('15efac1b-f740-4e96-82aa-b45bb114dc8f', 64315.05, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 4, ' 江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-30 00:22:32');
INSERT INTO `u_order` VALUES ('1f25e64e-ad14-466f-aab5-e920c550223b', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '9', '2020-02-28 09:13:58');
INSERT INTO `u_order` VALUES ('2398e79d-21a0-4375-b52f-5c9883434536', 2624.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '我要测试一下啊啊啊啊啊啊', '2020-04-10 11:19:23');
INSERT INTO `u_order` VALUES ('266f050b-2781-4082-9090-d4c70b9d4317', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '11', '2020-02-27 16:27:21');
INSERT INTO `u_order` VALUES ('29b08130-b2e4-4086-b82b-f5fd1a445bc6', 4440.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '测试4', '2020-01-19 10:08:30');
INSERT INTO `u_order` VALUES ('33e00b9b-e2f5-4cf6-a68f-03ad777a89de', 555.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '1222', '2020-05-17 15:04:12');
INSERT INTO `u_order` VALUES ('361c9c9e-2f9e-4e2e-9019-04a0a548d218', 9998.00, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 2, '江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-30 10:04:15');
INSERT INTO `u_order` VALUES ('387d62ba-1542-420c-beed-698dab55f9af', 29495.00, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 4, '江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-30 00:02:20');
INSERT INTO `u_order` VALUES ('41a6b54b-d68c-4e14-83c8-c2f35c40ced1', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '123', '2020-02-27 15:59:22');
INSERT INTO `u_order` VALUES ('442eb283-2bae-4d1d-bbe8-8260d6033d62', 1996.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '测试销量3', '2020-03-24 14:50:25');
INSERT INTO `u_order` VALUES ('4676b8aa-dc4c-457d-a650-a7c157a30910', 4440.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '1231', '2020-02-27 15:48:43');
INSERT INTO `u_order` VALUES ('467bed92-d9a4-40b4-881d-2551639767f4', 19998.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '测试5', '2020-01-19 10:49:11');
INSERT INTO `u_order` VALUES ('48c5de79-622b-4dad-b716-ddb51afb7e50', 9999.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '15', '2020-02-28 10:54:49');
INSERT INTO `u_order` VALUES ('4b0d4bb1-862d-461f-b291-36b5eb89dce1', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '5', '2020-02-27 17:02:22');
INSERT INTO `u_order` VALUES ('4ea972d2-dd82-47ab-a293-cad02244df62', 4440.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '111', '2020-02-27 15:48:49');
INSERT INTO `u_order` VALUES ('50423cd6-e832-489d-ba28-d66b238d3bff', 1759.00, '090d399e-f155-4f0a-af9e-32d5338dbd19', 2, '江苏省南京市江宁区', '2020-05-22 19:15:32');
INSERT INTO `u_order` VALUES ('5773b6f2-e774-448f-93cd-37aaa853a603', 10393.87, 'fc89e384-37d8-425a-9b91-191e2858b1c8', 1, 'ces', '2020-01-17 18:38:50');
INSERT INTO `u_order` VALUES ('5bbbeec5-4522-4871-9ff7-902775b747bd', 30903.87, 'fc89e384-37d8-425a-9b91-191e2858b1c8', 1, '123', '2020-01-17 18:40:47');
INSERT INTO `u_order` VALUES ('613d6a38-1923-4d97-a4d8-1eaac7d2ab30', 4798.00, 'a432a188-44c3-4fca-bffb-9b0c5b297e34', 1, '江苏省 南京市 江宁区 淳化街道湖山路419号天景山公寓佳福苑23幢', '2020-05-18 16:39:28');
INSERT INTO `u_order` VALUES ('62d0bf7b-1792-44f8-9acf-e7c48ff2787a', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', 4, '13', '2020-02-28 10:38:55');
INSERT INTO `u_order` VALUES ('636a7f02-16ce-4861-8227-e08563f36a1d', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '12', '2020-02-28 10:30:31');
INSERT INTO `u_order` VALUES ('6406bc75-751d-412d-838b-d459454f8ee1', 555.00, '64499a59-2396-46d6-926b-0893046c8749', -1, 'ces测试', '2020-05-17 21:42:54');
INSERT INTO `u_order` VALUES ('65eb18ac-77b4-4eb7-912e-b99e8647602c', 2199.00, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 4, '江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-30 10:56:59');
INSERT INTO `u_order` VALUES ('68965827-8787-422d-89e1-c7054283998d', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, 'test2', '2020-02-27 16:16:11');
INSERT INTO `u_order` VALUES ('6be36fa3-076c-494a-9470-d2c64c233ce3', 1665.00, '64499a59-2396-46d6-926b-0893046c8749', 4, 'test', '2020-04-09 16:14:12');
INSERT INTO `u_order` VALUES ('7273ead8-e379-48c2-9e36-ca87b7c47084', 7299.00, '090d399e-f155-4f0a-af9e-32d5338dbd19', 4, '	 江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-30 07:34:31');
INSERT INTO `u_order` VALUES ('7b8cf3c7-d131-477d-851e-b295343dd1bc', 5741.94, '64499a59-2396-46d6-926b-0893046c8749', 4, '测试', '2020-02-04 17:00:56');
INSERT INTO `u_order` VALUES ('7c19435a-4813-47bd-9f24-2d522616742c', 4440.00, '64499a59-2396-46d6-926b-0893046c8749', 3, '111', '2020-02-27 15:49:02');
INSERT INTO `u_order` VALUES ('7c83367d-e71e-4ca5-a993-bb732797e096', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '3', '2020-02-27 16:37:16');
INSERT INTO `u_order` VALUES ('80ee13cb-9be8-44fe-913e-4b19f045b63a', 3365.01, '090d399e-f155-4f0a-af9e-32d5338dbd19', 1, '江苏省 南京市 江宁区 淳化街道湖山路419号天景山公寓佳福苑23幢', '2020-05-18 16:47:55');
INSERT INTO `u_order` VALUES ('82620c07-1df6-41e6-9c4c-cb45b1ed8d60', 19998.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '第二次测试 大大家', '2020-01-19 09:07:30');
INSERT INTO `u_order` VALUES ('85e59330-9b86-41be-b92b-62ce0fccaaa1', 555.00, '64499a59-2396-46d6-926b-0893046c8749', 1, 'ces', '2020-05-17 21:30:58');
INSERT INTO `u_order` VALUES ('863d65e8-6f64-48c2-8626-7ab45b022a3f', 17998.00, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 2, '	 江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-30 10:13:41');
INSERT INTO `u_order` VALUES ('864e7430-bd46-4de6-8bd7-f363c702d8b6', 1373.97, '64499a59-2396-46d6-926b-0893046c8749', 1, '测试6', '2020-02-27 15:49:42');
INSERT INTO `u_order` VALUES ('880c2177-ebea-4abc-86e7-07cd0b97c6f4', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '8', '2020-02-28 09:00:09');
INSERT INTO `u_order` VALUES ('94264807-9bbc-4ea5-82b3-01e4057eb2ba', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '4', '2020-02-27 16:48:50');
INSERT INTO `u_order` VALUES ('9e6b12fe-186f-472f-ae13-ef74e811d267', 4440.00, '64499a59-2396-46d6-926b-0893046c8749', 3, '测试3', '2020-02-27 15:49:47');
INSERT INTO `u_order` VALUES ('9ec493df-7ba2-4f81-9aa4-f512c22bdf06', 18387.00, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 4, '江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-29 22:22:30');
INSERT INTO `u_order` VALUES ('a4607d3a-a3f2-46e4-8b73-bd00443304ff', 29997.00, '090d399e-f155-4f0a-af9e-32d5338dbd19', 4, '小朱家', '2020-01-18 11:16:34');
INSERT INTO `u_order` VALUES ('b6bab76a-d095-4564-9e40-5a79eb40dd0d', 8588.00, '64499a59-2396-46d6-926b-0893046c8749', 4, '江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-22 16:56:34');
INSERT INTO `u_order` VALUES ('b70bf6d4-73c5-4b9c-aa4a-5ce469711174', 449.00, 'a432a188-44c3-4fca-bffb-9b0c5b297e34', 1, 'test2', '2020-05-18 16:16:56');
INSERT INTO `u_order` VALUES ('b8c44113-351d-40dd-9a78-42ce94f5fe6d', 11976.00, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 4, '江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-29 22:20:13');
INSERT INTO `u_order` VALUES ('bc5ffdb2-ac26-420a-85f7-0296326f11fe', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '8', '2020-02-27 17:39:17');
INSERT INTO `u_order` VALUES ('c9bcd397-f203-45e0-a34a-e23a623bcd5f', 2994.00, 'fc89e384-37d8-425a-9b91-191e2858b1c8', 2, '测试', '2020-01-18 10:55:13');
INSERT INTO `u_order` VALUES ('cdb7800d-ab8d-43c4-98e2-a55ab6f1e544', 1996.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '测试销量2', '2020-03-24 14:45:51');
INSERT INTO `u_order` VALUES ('dfc5783c-b334-4cfe-b4a7-ffa94e119b5b', 5546.00, '8883b7c9-b39b-452f-a0fb-c39e27185edf', 4, '', '2020-05-29 22:06:54');
INSERT INTO `u_order` VALUES ('e0781534-04cf-4fab-b429-51995b3a1561', 2200.00, 'a432a188-44c3-4fca-bffb-9b0c5b297e34', 1, '测试2', '2020-05-18 16:12:09');
INSERT INTO `u_order` VALUES ('e127e290-d58a-4a78-8817-602afc6fce4e', 3790.00, 'a432a188-44c3-4fca-bffb-9b0c5b297e34', 1, 'test2', '2020-05-18 16:34:29');
INSERT INTO `u_order` VALUES ('e6b84c02-c1c0-4c80-9d78-44a6d7d66084', 555.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '测试第一次', '2020-05-17 21:17:52');
INSERT INTO `u_order` VALUES ('e9367ba7-0087-495c-97a3-7e1d6e09c3eb', 2624.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '3434', '2020-05-17 23:27:12');
INSERT INTO `u_order` VALUES ('eac6a0db-4653-4f4d-82ee-6d4c0cc56fbb', 8588.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '江苏省 南京市 江宁区 淳化街道 湖山路419号天景山公寓佳福苑23幢', '2020-05-22 15:57:46');
INSERT INTO `u_order` VALUES ('ed88d484-b85c-400a-8890-89cffb68da59', 1110.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '6', '2020-02-27 17:14:12');
INSERT INTO `u_order` VALUES ('f2cff497-7735-46b7-925a-225ba4024eba', 9999.00, '64499a59-2396-46d6-926b-0893046c8749', -1, '16', '2020-02-28 11:22:45');
INSERT INTO `u_order` VALUES ('f518dcd9-5bfe-41a4-8479-a05e73846826', 29997.00, '64499a59-2396-46d6-926b-0893046c8749', 1, 'wdnmd的', '2020-04-10 14:15:53');
INSERT INTO `u_order` VALUES ('fff7804d-97d8-403c-b592-0a8d63e16c1b', 11411.00, '64499a59-2396-46d6-926b-0893046c8749', 1, '测试销量', '2020-03-24 14:41:24');

-- ----------------------------
-- Table structure for u_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `u_orderitem`;
CREATE TABLE `u_orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `product_num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_orderitem
-- ----------------------------
INSERT INTO `u_orderitem` VALUES (4, '5bbbeec5-4522-4871-9ff7-902775b747bd', '16c387aa-3cd5-473a-8be0-981cda925859', 25, 998.00, 'Pixiv上偷的图', 'http://image.jt.com/upload/e/0/6/e/1/f/7/1/9c28e76a-2636-496b-97fa-6b3468acd502.jpg');
INSERT INTO `u_orderitem` VALUES (5, '5bbbeec5-4522-4871-9ff7-902775b747bd', '6b0cbdf7-e2c4-4faf-bea5-5c4950154889', 13, 457.99, '“在那里，那是家园，那是我们\"', 'http://image.jt.com/upload/3/9/d/f/2/2/d/e/001fccb5-0df3-4fe9-9477-e3a6bef07bd0.png');
INSERT INTO `u_orderitem` VALUES (6, 'a4607d3a-a3f2-46e4-8b73-bd00443304ff', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 3, 9999.00, '月下独酌 | 李白 ', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png');
INSERT INTO `u_orderitem` VALUES (7, '5773b6f2-e774-448f-93cd-37aaa853a603', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 5, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (8, '5773b6f2-e774-448f-93cd-37aaa853a603', '6b0cbdf7-e2c4-4faf-bea5-5c4950154889', 13, 457.99, '“在那里，那是家园，那是我们\"', 'http://image.jt.com/upload/3/9/d/f/2/2/d/e/001fccb5-0df3-4fe9-9477-e3a6bef07bd0.png');
INSERT INTO `u_orderitem` VALUES (9, 'c9bcd397-f203-45e0-a34a-e23a623bcd5f', '16c387aa-3cd5-473a-8be0-981cda925859', 3, 998.00, 'Pixiv上偷的图', 'http://image.jt.com/upload/e/0/6/e/1/f/7/1/9c28e76a-2636-496b-97fa-6b3468acd502.jpg');
INSERT INTO `u_orderitem` VALUES (10, '82620c07-1df6-41e6-9c4c-cb45b1ed8d60', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 2, 9999.00, '月下独酌 | 李白 ', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png');
INSERT INTO `u_orderitem` VALUES (11, '4ea972d2-dd82-47ab-a293-cad02244df62', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 5, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (12, '4676b8aa-dc4c-457d-a650-a7c157a30910', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 5, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (13, '7c19435a-4813-47bd-9f24-2d522616742c', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 5, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (14, '9e6b12fe-186f-472f-ae13-ef74e811d267', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 5, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (15, '29b08130-b2e4-4086-b82b-f5fd1a445bc6', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 5, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (16, '467bed92-d9a4-40b4-881d-2551639767f4', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 2, 9999.00, '月下独酌 | 李白 ', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png');
INSERT INTO `u_orderitem` VALUES (17, '864e7430-bd46-4de6-8bd7-f363c702d8b6', '6b0cbdf7-e2c4-4faf-bea5-5c4950154889', 3, 457.99, '“在那里，那是家园，那是我们\"', 'http://image.jt.com/upload/3/9/d/f/2/2/d/e/001fccb5-0df3-4fe9-9477-e3a6bef07bd0.png');
INSERT INTO `u_orderitem` VALUES (18, '7b8cf3c7-d131-477d-851e-b295343dd1bc', '6b0cbdf7-e2c4-4faf-bea5-5c4950154889', 6, 457.99, '“在那里，那是家园，那是我们\"', 'http://image.jt.com/upload/3/9/d/f/2/2/d/e/001fccb5-0df3-4fe9-9477-e3a6bef07bd0.png');
INSERT INTO `u_orderitem` VALUES (19, '7b8cf3c7-d131-477d-851e-b295343dd1bc', '16c387aa-3cd5-473a-8be0-981cda925859', 3, 998.00, 'Pixiv上偷的图', 'http://image.jt.com/upload/e/0/6/e/1/f/7/1/9c28e76a-2636-496b-97fa-6b3468acd502.jpg');
INSERT INTO `u_orderitem` VALUES (20, '41a6b54b-d68c-4e14-83c8-c2f35c40ced1', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (21, '68965827-8787-422d-89e1-c7054283998d', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (22, '266f050b-2781-4082-9090-d4c70b9d4317', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (23, '7c83367d-e71e-4ca5-a993-bb732797e096', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (24, '94264807-9bbc-4ea5-82b3-01e4057eb2ba', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (25, '4b0d4bb1-862d-461f-b291-36b5eb89dce1', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (26, 'ed88d484-b85c-400a-8890-89cffb68da59', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (27, '09ca5be1-5ef9-43c4-86ed-fdbc76913df1', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (28, 'bc5ffdb2-ac26-420a-85f7-0296326f11fe', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (29, '880c2177-ebea-4abc-86e7-07cd0b97c6f4', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (30, '1f25e64e-ad14-466f-aab5-e920c550223b', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (31, '636a7f02-16ce-4861-8227-e08563f36a1d', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (32, '62d0bf7b-1792-44f8-9acf-e7c48ff2787a', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 2, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (33, '48c5de79-622b-4dad-b716-ddb51afb7e50', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 1, 9999.00, '月下独酌 | 李白 ', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png');
INSERT INTO `u_orderitem` VALUES (34, 'f2cff497-7735-46b7-925a-225ba4024eba', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 1, 9999.00, '月下独酌 | 李白 ', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png');
INSERT INTO `u_orderitem` VALUES (35, '0fc88403-018f-42fc-adc6-5f99991ac851', 'a9f3b3f5-0f62-4238-bef6-02ea9fe0494f', 1, 1412.00, '怪盗基德', 'http://image.jt.com/upload/d/b/4/1/b/b/2/1/159d1f96-7e99-4e29-ae80-3672b5ec3401.png');
INSERT INTO `u_orderitem` VALUES (36, 'fff7804d-97d8-403c-b592-0a8d63e16c1b', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 1, 9999.00, '月下独酌 | 李白 ', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png');
INSERT INTO `u_orderitem` VALUES (37, 'fff7804d-97d8-403c-b592-0a8d63e16c1b', 'a9f3b3f5-0f62-4238-bef6-02ea9fe0494f', 1, 1412.00, '怪盗基德', 'http://image.jt.com/upload/d/b/4/1/b/b/2/1/159d1f96-7e99-4e29-ae80-3672b5ec3401.png');
INSERT INTO `u_orderitem` VALUES (38, 'cdb7800d-ab8d-43c4-98e2-a55ab6f1e544', '16c387aa-3cd5-473a-8be0-981cda925859', 2, 998.00, 'Pixiv上偷的图', 'http://image.jt.com/upload/e/0/6/e/1/f/7/1/9c28e76a-2636-496b-97fa-6b3468acd502.jpg');
INSERT INTO `u_orderitem` VALUES (39, '442eb283-2bae-4d1d-bbe8-8260d6033d62', '16c387aa-3cd5-473a-8be0-981cda925859', 2, 998.00, 'Pixiv上偷的图', 'http://image.jt.com/upload/e/0/6/e/1/f/7/1/9c28e76a-2636-496b-97fa-6b3468acd502.jpg');
INSERT INTO `u_orderitem` VALUES (40, '6be36fa3-076c-494a-9470-d2c64c233ce3', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 3, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (41, '2398e79d-21a0-4375-b52f-5c9883434536', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 2, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (42, 'f518dcd9-5bfe-41a4-8479-a05e73846826', '8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', 3, 9999.00, '月下独酌 | 李白 ', 'http://image.jt.com/upload/e/5/d/3/2/9/1/0/78ab9ee6-238a-418d-bc47-f2d53ed51649.png');
INSERT INTO `u_orderitem` VALUES (43, '013f0c28-4423-4436-9e2e-b8749f2d085b', 'dce55adb-2d1e-4cf7-a55d-2a8a7e8c6073', 3, 449.00, 'Razer雷蛇黑寡妇蜘蛛标准版键盘', 'http://image.jt.com/upload/5/1/1/4/a/5/c/2/a4fb0c9a-dacf-40fd-93ba-da7c17388cd6.png');
INSERT INTO `u_orderitem` VALUES (44, '013f0c28-4423-4436-9e2e-b8749f2d085b', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 4, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (45, '33e00b9b-e2f5-4cf6-a68f-03ad777a89de', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (46, 'e6b84c02-c1c0-4c80-9d78-44a6d7d66084', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (47, '85e59330-9b86-41be-b92b-62ce0fccaaa1', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (48, '6406bc75-751d-412d-838b-d459454f8ee1', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (49, '5b5191c3-3059-4118-bf5e-e3a2777cf981', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (50, '2b75fecf-270b-4865-b0ca-ce6b4ead319f', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (51, 'ae504cb7-dc46-402c-aee4-9f97a9744591', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (52, 'a1b593f4-86e3-41e8-bf0b-fca977cd03cc', '1b2297cc-f2ca-48a1-8047-29e184bd4d64', 1, 555.00, '鬼灭之刃-蝴蝶忍小姐姐', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png');
INSERT INTO `u_orderitem` VALUES (53, '145de5af-e5f5-4898-9018-f1940b87746b', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 2, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (54, '2c5dc1b3-357d-4af7-a4cc-ded930b9ed84', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 2, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (55, '7f30d50a-04bb-4e18-8e61-94f332a6d200', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 2, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (56, '43b64657-b92b-4225-8cf6-b612308ac917', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 2, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (57, 'e9367ba7-0087-495c-97a3-7e1d6e09c3eb', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 2, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (58, '0017ab36-3747-4747-840a-68d9f42ba07b', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 2, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (59, 'e0781534-04cf-4fab-b429-51995b3a1561', '24fb320a-a2f5-4029-a880-2a6fbc23b5b5', 1, 888.00, '鬼灭之刃-灶门炭治郎', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg');
INSERT INTO `u_orderitem` VALUES (60, 'e0781534-04cf-4fab-b429-51995b3a1561', 'c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 1, 1312.00, 'Pixiv_', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png');
INSERT INTO `u_orderitem` VALUES (61, 'b70bf6d4-73c5-4b9c-aa4a-5ce469711174', 'dce55adb-2d1e-4cf7-a55d-2a8a7e8c6073', 1, 449.00, 'Razer雷蛇黑寡妇蜘蛛标准版键盘', 'http://image.jt.com/upload/5/1/1/4/a/5/c/2/a4fb0c9a-dacf-40fd-93ba-da7c17388cd6.png');
INSERT INTO `u_orderitem` VALUES (62, 'e127e290-d58a-4a78-8817-602afc6fce4e', '27ba2206-7dbe-4c07-a48e-59a1ffeef7f5', 1, 3790.00, 'PS4主机全新PS4 游戏机 国行', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/d00d13fc-5a32-4cdc-b09c-fb4f4ecce6a2.jpg');
INSERT INTO `u_orderitem` VALUES (63, '613d6a38-1923-4d97-a4d8-1eaac7d2ab30', '692f16fb-521d-4359-9ce3-4e5a414490c0', 1, 4798.00, '任天堂NS switch', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/521add55-81ae-40ab-867a-1eb5442d4e84.jpg');
INSERT INTO `u_orderitem` VALUES (64, '80ee13cb-9be8-44fe-913e-4b19f045b63a', '10656139-af7a-4741-900d-a6a0e88b6236', 1, 3365.01, '全新XBOX360 E SLIM主机', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/48074068-e924-41e1-a16b-4aebe31c4734.jpg');
INSERT INTO `u_orderitem` VALUES (65, 'eac6a0db-4653-4f4d-82ee-6d4c0cc56fbb', '692f16fb-521d-4359-9ce3-4e5a414490c0', 1, 4798.00, '任天堂NS switch', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/521add55-81ae-40ab-867a-1eb5442d4e84.jpg');
INSERT INTO `u_orderitem` VALUES (66, 'eac6a0db-4653-4f4d-82ee-6d4c0cc56fbb', '27ba2206-7dbe-4c07-a48e-59a1ffeef7f5', 1, 3790.00, 'PS4主机全新PS4 游戏机 国行', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/d00d13fc-5a32-4cdc-b09c-fb4f4ecce6a2.jpg');
INSERT INTO `u_orderitem` VALUES (67, 'b6bab76a-d095-4564-9e40-5a79eb40dd0d', '692f16fb-521d-4359-9ce3-4e5a414490c0', 1, 4798.00, '任天堂NS switch', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/521add55-81ae-40ab-867a-1eb5442d4e84.jpg');
INSERT INTO `u_orderitem` VALUES (68, 'b6bab76a-d095-4564-9e40-5a79eb40dd0d', '27ba2206-7dbe-4c07-a48e-59a1ffeef7f5', 1, 3790.00, 'PS4主机全新PS4 游戏机 国行', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/d00d13fc-5a32-4cdc-b09c-fb4f4ecce6a2.jpg');
INSERT INTO `u_orderitem` VALUES (69, '50423cd6-e832-489d-ba28-d66b238d3bff', '6627a7b7-90b3-45f2-a5a8-cba3506e2bb6', 1, 479.00, '械键盘鼠标耳机三件套网吧粉色套装', 'http://image.jt.com/upload/5/8/2/9/8/1/7/b/9f0103a7-3f94-4b1d-8d1f-28f2063e102c.png');
INSERT INTO `u_orderitem` VALUES (70, '50423cd6-e832-489d-ba28-d66b238d3bff', 'e5f058be-b0fe-4903-a73c-933bc6b77112', 1, 1280.00, '修图辅助键盘', 'http://image.jt.com/upload/5/b/a/f/6/1/b/b/8081d3b7-4b27-4a6e-8e9d-44cf27870143.png');
INSERT INTO `u_orderitem` VALUES (71, 'dfc5783c-b334-4cfe-b4a7-ffa94e119b5b', '0f76260e-f9e7-4107-b342-b46edaf036eb', 2, 399.00, '米家微波炉', 'http://image.jt.com/upload/a/4/9/7/d/a/f/0/2a8c5a0e-684e-47e8-a2ec-2b97ee747053.jpg');
INSERT INTO `u_orderitem` VALUES (72, 'dfc5783c-b334-4cfe-b4a7-ffa94e119b5b', '666bf03a-bedc-4218-8a14-57d44d614c7f', 1, 1749.00, '小米全面屏电视E55A', 'http://image.jt.com/upload/b/3/d/f/f/b/9/c/b0714c81-980d-4431-be0f-674c32b9c76e.jpg');
INSERT INTO `u_orderitem` VALUES (73, 'dfc5783c-b334-4cfe-b4a7-ffa94e119b5b', 'beccbb5e-2fb2-44ae-ae96-203e88ea046d', 1, 2999.00, '风冷十字四门冰箱 486L', 'http://image.jt.com/upload/4/b/e/f/7/d/4/3/4952d8dd-2dae-4a06-a0cb-7dd008f98f6b.jpg');
INSERT INTO `u_orderitem` VALUES (74, 'b8c44113-351d-40dd-9a78-42ce94f5fe6d', '0d98ef2e-0b35-45ef-af01-aa3d306accfb', 2, 5988.00, 'HUAWEI P40 Pro 5G', 'http://image.jt.com/upload/4/c/a/f/d/6/d/3/a7139d33-787e-4c20-a729-efa58d148ec8.png');
INSERT INTO `u_orderitem` VALUES (75, '9ec493df-7ba2-4f81-9aa4-f512c22bdf06', '841a186e-b51d-4f7c-bf92-062f13e36bbe', 1, 2999.00, 'HUAWEI nova 7', 'http://image.jt.com/upload/4/c/9/3/a/7/d/1/4faabe56-3f44-459a-88b3-b1ce94fed965.png');
INSERT INTO `u_orderitem` VALUES (76, '9ec493df-7ba2-4f81-9aa4-f512c22bdf06', '96781946-5c49-4795-b192-75698eca5577', 1, 8389.00, '神舟战神Z8/G8系列 笔记本电脑', 'http://image.jt.com/upload/d/d/f/1/6/8/9/9/d105e775-c3f9-4e62-9ccf-799f26971248.jpg');
INSERT INTO `u_orderitem` VALUES (77, '9ec493df-7ba2-4f81-9aa4-f512c22bdf06', 'ca843588-4264-437a-aa54-f3a559890baa', 1, 6999.00, '拯救者 Y7000', 'http://image.jt.com/upload/6/e/0/4/3/3/3/0/9c545007-938b-4271-a2a3-36ce2a4eef0a.jpg');
INSERT INTO `u_orderitem` VALUES (78, '387d62ba-1542-420c-beed-698dab55f9af', 'c8412d5d-9774-4a10-878f-9f35874743d6', 5, 5899.00, 'Pro 15 增强版', 'http://image.jt.com/upload/3/5/2/7/3/3/2/1/f0eacb7a-72d6-463f-92f2-dd4298f03a6d.png');
INSERT INTO `u_orderitem` VALUES (79, '15efac1b-f740-4e96-82aa-b45bb114dc8f', '00ed7179-b17f-4125-b237-3b520aecde82', 5, 7299.00, '拯救者 Y7000P ', 'http://image.jt.com/upload/6/e/e/5/a/b/4/0/1a614512-1f29-4385-8116-90a947c78792.jpg');
INSERT INTO `u_orderitem` VALUES (80, '15efac1b-f740-4e96-82aa-b45bb114dc8f', '10656139-af7a-4741-900d-a6a0e88b6236', 5, 3365.01, '全新XBOX360 E SLIM主机', 'http://image.jt.com/upload/2/c/9/0/4/a/4/0/48074068-e924-41e1-a16b-4aebe31c4734.jpg');
INSERT INTO `u_orderitem` VALUES (81, '15efac1b-f740-4e96-82aa-b45bb114dc8f', '13c756bf-cbdb-467f-8f1b-22c76cb8b9c6', 5, 2199.00, '米家空气净化器MAX 增强版', 'http://image.jt.com/upload/f/d/a/2/5/7/6/e/78c3c8a3-1330-4d91-8d45-ed319d096487.jpg');
INSERT INTO `u_orderitem` VALUES (82, '7273ead8-e379-48c2-9e36-ca87b7c47084', '00ed7179-b17f-4125-b237-3b520aecde82', 1, 7299.00, '拯救者 Y7000P ', 'http://image.jt.com/upload/6/e/e/5/a/b/4/0/1a614512-1f29-4385-8116-90a947c78792.jpg');
INSERT INTO `u_orderitem` VALUES (83, '361c9c9e-2f9e-4e2e-9019-04a0a548d218', '22444b33-f4a6-4e16-8e6a-432a1ca3320a', 2, 4999.00, '小米10Pro', 'http://image.jt.com/upload/6/5/6/c/1/a/8/5/fee85d53-98f1-4d70-9d6d-1644a4915f60.png');
INSERT INTO `u_orderitem` VALUES (84, '863d65e8-6f64-48c2-8626-7ab45b022a3f', '1c5c01d4-5af7-48dc-a206-7f42c40d1418', 2, 8999.00, '小米游戏本15.6', 'http://image.jt.com/upload/3/5/5/f/7/a/d/d/0f45a155-dc1e-4905-9999-92f25b125aaf.jpg');
INSERT INTO `u_orderitem` VALUES (85, '65eb18ac-77b4-4eb7-912e-b99e8647602c', '13c756bf-cbdb-467f-8f1b-22c76cb8b9c6', 1, 2199.00, '米家空气净化器MAX 增强版', 'http://image.jt.com/upload/f/d/a/2/5/7/6/e/78c3c8a3-1330-4d91-8d45-ed319d096487.jpg');

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user`  (
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `u_detail` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('090d399e-f155-4f0a-af9e-32d5338dbd19', 'lishuai', '123456', 1);
INSERT INTO `u_user` VALUES ('64499a59-2396-46d6-926b-0893046c8749', 'daimao', '123456', 1);
INSERT INTO `u_user` VALUES ('8883b7c9-b39b-452f-a0fb-c39e27185edf', 'daimao2', '123456', 1);
INSERT INTO `u_user` VALUES ('a432a188-44c3-4fca-bffb-9b0c5b297e34', 'test', '123456', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'daimao', '123456');
INSERT INTO `user` VALUES (2, 'dada', '123456');
INSERT INTO `user` VALUES (3, 'wyf', '123456');

-- ----------------------------
-- Function structure for getChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildList`;
delimiter ;;
CREATE FUNCTION `getChildList`(rootId VARCHAR(100))
 RETURNS varchar(1000) CHARSET utf8
BEGIN
    DECLARE pTemp VARCHAR(1000);  
    DECLARE cTemp VARCHAR(1000); -- 定义两个临时变量

    SET pTemp = '';  
    SET cTemp = rootId;

    WHILE cTemp is not null DO  
       if (pTemp = '') then
         SET pTemp = cTemp;
         elseif(pTemp <> '') then
         SET pTemp = concat(pTemp,',',cTemp); -- 所有节点连接成字符串
         end if;
         SELECT group_concat(id) INTO cTemp FROM t_category   
         WHERE FIND_IN_SET(parent_id,cTemp)>0; 
     END WHILE;  
     RETURN pTemp;  
END
;;
delimiter ;

-- ----------------------------
-- Function structure for getParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentList`;
delimiter ;;
CREATE FUNCTION `getParentList`(rootId varchar(100))
 RETURNS varchar(1000) CHARSET utf8
BEGIN   
DECLARE fid varchar(100) default '';   
DECLARE str varchar(1000) default rootId;   
  
WHILE rootId is not null  do   
    SET fid =(SELECT parent_id FROM t_category WHERE id = rootId);   
    IF fid is not null THEN   
        SET str = concat(str, ',', fid);   
        SET rootId = fid;   
    ELSE   
        SET rootId = fid;   
    END IF;   
END WHILE;   
return str;  
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
