/*
Navicat MySQL Data Transfer

Source Server         : bendi
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : newtest

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-01-13 08:46:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '大大', '23', '杰少');
INSERT INTO `student` VALUES ('10', '小朱', '22', '超级小桀');
INSERT INTO `student` VALUES ('11', '大朱', '22', '超级大杰');
INSERT INTO `student` VALUES ('12', '啊啊', '22', '毛毛呆毛');
INSERT INTO `student` VALUES ('13', '小杰杰', '22', '呆毛');
INSERT INTO `student` VALUES ('14', '大杰杰', '23', '呆毛');
INSERT INTO `student` VALUES ('2', '王一枫', '23', '王哥');
INSERT INTO `student` VALUES ('3', '毛毛', '18', '呆毛');
INSERT INTO `student` VALUES ('4', '贾傲娇', '18', '小贾');
INSERT INTO `student` VALUES ('5', '一一', '22', '毛毛');
INSERT INTO `student` VALUES ('6', '尔尔', '22', '毛明辉');
INSERT INTO `student` VALUES ('7', '三三', '22', '贾祯');
INSERT INTO `student` VALUES ('8', '王家', '22', '王一枫');
INSERT INTO `student` VALUES ('9', '许智杰', '22', '王长生');

-- ----------------------------
-- Table structure for table1
-- ----------------------------
DROP TABLE IF EXISTS `table1`;
CREATE TABLE `table1` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table1
-- ----------------------------
INSERT INTO `table1` VALUES ('1', 'Home', '0');
INSERT INTO `table1` VALUES ('2', 'About', '1');
INSERT INTO `table1` VALUES ('3', 'Contact', '1');
INSERT INTO `table1` VALUES ('4', 'Legal', '2');
INSERT INTO `table1` VALUES ('5', 'Privacy', '4');
INSERT INTO `table1` VALUES ('6', 'Products', '1');
INSERT INTO `table1` VALUES ('7', 'Support', '2');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('0', '9999', '商品分类');
INSERT INTO `t_category` VALUES ('1', '0', '数码产品');
INSERT INTO `t_category` VALUES ('2', '1', '手机');
INSERT INTO `t_category` VALUES ('4', '2', '小米手机');
INSERT INTO `t_category` VALUES ('5', '1', '电脑');
INSERT INTO `t_category` VALUES ('6', '5', '联想笔记本');
INSERT INTO `t_category` VALUES ('7', '5', '神州笔记本');
INSERT INTO `t_category` VALUES ('8', '5', '戴尔笔记本');
INSERT INTO `t_category` VALUES ('9', '0', '书法作品');
INSERT INTO `t_category` VALUES ('10', '9', '电子版书法');
INSERT INTO `t_category` VALUES ('11', '9', '实体版书法');
INSERT INTO `t_category` VALUES ('14', '2', '华为手机');
INSERT INTO `t_category` VALUES ('15', '0', '二次元傻卵');
INSERT INTO `t_category` VALUES ('16', '15', '鬼灭之刃');
INSERT INTO `t_category` VALUES ('17', '0', '李帅');
INSERT INTO `t_category` VALUES ('18', '17', '啥 比');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `product_id` char(36) NOT NULL DEFAULT '',
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` double DEFAULT '0',
  `product_category` int(11) DEFAULT NULL,
  `product_imgurl` varchar(500) DEFAULT '',
  `product_num` int(11) DEFAULT '0',
  `product_description` varchar(20000) DEFAULT '',
  `sale` int(11) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `UN_product_name` (`product_name`),
  KEY `product_category` (`product_category`),
  CONSTRAINT `cate` FOREIGN KEY (`product_category`) REFERENCES `t_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('16c387aa-3cd5-473a-8be0-981cda925859', 'Pixiv上偷的图', '998', '6', 'http://image.jt.com/upload/9/7/5/5/a/d/0/d/b7d1d88e-f19e-40c6-9056-40eca7eea4b1.jpg', '99', 'Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图', '0');
INSERT INTO `t_product` VALUES ('1b2297cc-f2ca-48a1-8047-29e184bd4d64', '鬼灭之刃-蝴蝶忍小姐姐', '555', '16', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png', '999', '蝴蝶忍，漫画《鬼灭之刃》及其衍生作品中的角色之一。鬼杀队中的虫柱，鬼杀队医疗设施“蝶屋”的主人。精通药学与毒理学，擅长毒杀。因为力气很小，是柱中唯一一个无法斩下鬼头的剑士，但善于制作毒素来弥补力量的不足。黑发紫瞳，发梢紫色，头发长及锁骨，平时梳着夜会卷发型。 [4]  戴深紫色边缘的薄荷色蝴蝶发夹，羽织如同蝴蝶的翅膀。偶尔会对自己的身高不足感到苦恼。穿着保守，不喜欢暴露的服饰。 [5] \n年少时留着短发，严肃认真，不苟言笑。 [6]  在姐姐蝴蝶香奈惠死后，努力变得像姐姐生前一样温和。但即使脸上时常带着微笑，却也一直压抑着对于鬼的愤怒。 [7] \n擅长教导和培育。与恋柱·甘露寺蜜璃趣味相投，时常会向其请教时髦新奇的料理食谱。', '0');
INSERT INTO `t_product` VALUES ('24fb320a-a2f5-4029-a880-2a6fbc23b5b5', '鬼灭之刃-灶门炭治郎', '888', '10', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg', '1', '鬼杀队剑士，有着一头深红发与红色眼睛的“赫灼之子”，\n左额处有伤疤，佩戴有代代相传的日轮耳饰，性格憨厚，善良温柔，重视家人、个性认真顽固有担当的长男。制服上披着市松图案的羽织。\n不擅于说谎，一说谎表情就会变得很奇怪，而另一方面却又十分固执，绝不会允许自己欠对方的人情和金钱。有着如石头般坚硬的额头，能让被撞击的人失去知觉。\n另外，炭治郎还有着不输犬类的灵敏“嗅觉”，可以从摔碎的盘子上闻出碰过盘子的猫的味道，甚至能够感应到味道来源的位置，并凭借这一能力轻易找到了鬼杀队多年来都无法找到的鬼舞辻无惨。经过训练后，连极其细微的“隙之线”都能成功感应', '0');
INSERT INTO `t_product` VALUES ('33474a37-fd7c-4fba-aea9-46bf83d99ea0', 'Pixiv_Environment', '3', '10', 'http://image.jt.com/upload/d/a/7/e/3/2/1/1/3092e9a9-5f94-4047-aae3-53a2b65a63f4.png', '3', 'Pixiv_Environment', '0');
INSERT INTO `t_product` VALUES ('8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', '月下独酌 | 李白 ', '9999', '7', 'http://image.jt.com/upload/9/a/2/4/c/0/5/e/5895034b-d181-4ad4-b889-7e6de6fd7603.png', '33', '月下独酌四首·其一\n【作者】李白 【朝代】唐\n花间一壶酒，独酌无相亲。\n\n举杯邀明月，对影成三人。\n\n月既不解饮，影徒随我身。\n\n暂伴月将影，行乐须及春。\n\n我歌月徘徊，我舞影零乱。\n\n醒时相交欢，醉后各分散。\n\n永结无情游，相期邈云汉。', '0');
INSERT INTO `t_product` VALUES ('96e740cf-a801-437e-8497-5b91c7805dfd', 'Pixiv_3', '587', '4', 'http://image.jt.com/upload/e/3/5/e/f/c/5/3/00980f31-d02a-4f68-8f46-2cea5e475869.jpg', '23', 'Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3', '0');
INSERT INTO `t_product` VALUES ('a9f3b3f5-0f62-4238-bef6-02ea9fe0494f', '怪盗基德', '1412', '4', 'http://image.jt.com/upload/d/b/4/1/b/b/2/1/159d1f96-7e99-4e29-ae80-3672b5ec3401.png', '174', '怪盗基德（日文：怪盗キッド；英文：Kid the Phantom Thief），又译怪盗小子、怪盗奇度，原名“怪盗1412号”（源自其国际罪犯代码“1412”），是日本动漫《魔术快斗》中的主人公以及《名侦探柯南》中的客串角色。第一代的真实身份为黑羽盗一，现在第二代为黑羽快斗。一个充满传奇色彩的怪盗，拥有过人才智，精通易容、变声、逃脱术，以珠宝等各类贵重艺术品为目标，使用魔术手法进行犯案的超级盗窃犯。', '0');
INSERT INTO `t_product` VALUES ('af2c91bb-1baa-4e5f-adc1-bbfbe4cf0bb6', '蝴蝶忍插图2', '856', '8', 'http://image.jt.com/upload/e/e/1/8/5/f/7/4/8444aa98-ed75-4e02-b76a-9bd7a052f321.jpg', '787', '不多介绍了', '0');
INSERT INTO `t_product` VALUES ('c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 'Pixiv_', '1312', '14', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png', '854', 'Pixiv_Pixiv_Pixiv_Pixiv_Pixiv_Pixiv_', '0');
INSERT INTO `t_product` VALUES ('d727ec26-6ff5-4924-a659-7b58075ada43', 'Pixiv_2', '958', '11', 'http://image.jt.com/upload/f/3/0/d/b/2/f/2/c3e06d61-605e-4c9b-a857-58ea581d1404.jpg', '777', 'Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'daimao', '123456');
INSERT INTO `user` VALUES ('2', 'dada', '123456');
INSERT INTO `user` VALUES ('3', 'wyf', '123456');

-- ----------------------------
-- Table structure for u_detail
-- ----------------------------
DROP TABLE IF EXISTS `u_detail`;
CREATE TABLE `u_detail` (
  `username` varchar(255) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_detail
-- ----------------------------
INSERT INTO `u_detail` VALUES ('daimao', 'null', '男', '呆毛~~', '653108117@qq.com', '13225237022', null);
INSERT INTO `u_detail` VALUES ('lishuai', 'null', '男', '呆毛~~', '653108117@qq.com', '13225237022', null);
INSERT INTO `u_detail` VALUES ('test', 'null', '男', '呆毛~~', '653108117@qq.com', '13225237022', null);
INSERT INTO `u_detail` VALUES ('test1111', null, null, null, null, null, '2020-01-10 17:37:44');

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `user_id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  CONSTRAINT `user` FOREIGN KEY (`username`) REFERENCES `u_detail` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('090d399e-f155-4f0a-af9e-32d5338dbd19', 'lishuai', '123456');
INSERT INTO `u_user` VALUES ('64499a59-2396-46d6-926b-0893046c8749', 'test', '123456');
INSERT INTO `u_user` VALUES ('a432a188-44c3-4fca-bffb-9b0c5b297e34', 'test1111', '123456');
INSERT INTO `u_user` VALUES ('fc89e384-37d8-425a-9b91-191e2858b1c8', 'daimao', '123456');

-- ----------------------------
-- Function structure for getChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildList`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getChildList`(rootId VARCHAR(100)) RETURNS varchar(1000) CHARSET utf8
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
DELIMITER ;

-- ----------------------------
-- Function structure for getParentList
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentList`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getParentList`(rootId varchar(100)) RETURNS varchar(1000) CHARSET utf8
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
DELIMITER ;
