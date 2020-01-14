/*
Navicat MySQL Data Transfer

Source Server         : bendi
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : newtest

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-01-14 16:05:42
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `product_description` varchar(5000) DEFAULT '',
  `sale` int(11) DEFAULT '0',
  `quill` longtext NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `UN_product_name` (`product_name`),
  KEY `product_category` (`product_category`),
  CONSTRAINT `cate` FOREIGN KEY (`product_category`) REFERENCES `t_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('16c387aa-3cd5-473a-8be0-981cda925859', 'Pixiv上偷的图', '998', '6', 'http://image.jt.com/upload/e/0/6/e/1/f/7/1/9c28e76a-2636-496b-97fa-6b3468acd502.jpg', '99', 'Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图Pixiv上偷的图', '0', '<p><img src=\"http://image.jt.com/upload/9/7/5/5/a/d/0/d/6e200cfc-92dd-4227-94bd-6aea75d78cab.jpg\">emmmmm 测试</p>');
INSERT INTO `t_product` VALUES ('1b2297cc-f2ca-48a1-8047-29e184bd4d64', '鬼灭之刃-蝴蝶忍小姐姐', '555', '16', 'http://image.jt.com/upload/4/6/e/a/3/d/0/1/829b1551-7389-4028-b3d1-4a5c87008943.png', '999', '蝴蝶忍，漫画《鬼灭之刃》及其衍生作品中的角色之一。鬼杀队中的虫柱，鬼杀队医疗设施“蝶屋”的主人。精通药学与毒理学，擅长毒杀。因为力气很小，是柱中唯一一个无法斩下鬼头的剑士，但善于制作毒素来弥补力量的不足。黑发紫瞳，发梢紫色，头发长及锁骨，平时梳着夜会卷发型。 [4]  戴深紫色边缘的薄荷色蝴蝶发夹，羽织如同蝴蝶的翅膀。偶尔会对自己的身高不足感到苦恼。穿着保守，不喜欢暴露的服饰。 [5] \n年少时留着短发，严肃认真，不苟言笑。 [6]  在姐姐蝴蝶香奈惠死后，努力变得像姐姐生前一样温和。但即使脸上时常带着微笑，却也一直压抑着对于鬼的愤怒。 [7] \n擅长教导和培育。与恋柱·甘露寺蜜璃趣味相投，时常会向其请教时髦新奇的料理食谱。', '0', '');
INSERT INTO `t_product` VALUES ('24fb320a-a2f5-4029-a880-2a6fbc23b5b5', '鬼灭之刃-灶门炭治郎', '888', '10', 'http://image.jt.com/upload/4/3/4/4/d/6/3/e/88add59e-fcd9-4f99-a51b-75cd0301648f.jpg', '1', '鬼杀队剑士，有着一头深红发与红色眼睛的“赫灼之子”，\n左额处有伤疤，佩戴有代代相传的日轮耳饰，性格憨厚，善良温柔，重视家人、个性认真顽固有担当的长男。制服上披着市松图案的羽织。\n不擅于说谎，一说谎表情就会变得很奇怪，而另一方面却又十分固执，绝不会允许自己欠对方的人情和金钱。有着如石头般坚硬的额头，能让被撞击的人失去知觉。\n另外，炭治郎还有着不输犬类的灵敏“嗅觉”，可以从摔碎的盘子上闻出碰过盘子的猫的味道，甚至能够感应到味道来源的位置，并凭借这一能力轻易找到了鬼杀队多年来都无法找到的鬼舞辻无惨。经过训练后，连极其细微的“隙之线”都能成功感应', '0', '');
INSERT INTO `t_product` VALUES ('33474a37-fd7c-4fba-aea9-46bf83d99ea0', 'Pixiv_Environment', '3', '10', 'http://image.jt.com/upload/d/a/7/e/3/2/1/1/3092e9a9-5f94-4047-aae3-53a2b65a63f4.png', '3', 'Pixiv_Environment', '0', '');
INSERT INTO `t_product` VALUES ('6b0cbdf7-e2c4-4faf-bea5-5c4950154889', '“在那里，那是家园，那是我们\"', '457.99', '10', 'http://image.jt.com/upload/3/9/d/f/2/2/d/e/001fccb5-0df3-4fe9-9477-e3a6bef07bd0.png', '998', '“在那里，那是家园，那是我们。在那里，你爱的每个人，你认识的每个人，你听说过的每个人，在这世上存在过的每个人，度过了自己的一生。\n聚集在这里的，是我们的欢乐和痛苦，是成千上万的宗教信仰、意识形态，和经济学说每个猎手与觅食者，每个英雄与懦夫，每个文明的创立者和毁灭者，每个国王与农夫，每对年轻的爱侣，每一个母亲与父亲、充满希望的孩子们，发明家与探险家，每一位高尚的教师、每一位贪腐的政客，每一位超级明星、每一位最高领袖，人类史上的每一位圣人和罪人，都生活在这里，\n如一粒微尘，悬浮在一束阳光之中。地球是一个很小的舞台，在浩瀚的宇宙背景下，想想过去的血流成河，那为帝王将相而流的血，只为让他们在光荣和胜利中，成为瞬间的伟人，占有那一个小点中…那一小部分。想想那无尽的残酷，图像里那一个像素点的某个角落的民众，每天把这残酷施加到与他们没什么区别的另一个角落的民众身上。他们为何常常误解，他们为何渴望杀死对方，他们的憎恨为何如此狂热。\n我们在装模做样，我们自以为很重要，妄想着我们人类地位特殊，在宇宙中与众不同，这一切，都因这泛着苍白蓝光的小点而动摇。我们的星球，不过是一粒孤独的微尘，笼罩在伟大的宇宙黑暗之中。\n我们默默无闻，沉浸在无尽的浩瀚里，没有一丝线索显示，除了我们自己，\n还有谁能拯救我们。地球是目前已知唯一有生命的世界，生命再无其他去处，至少在不久的将来，亦是如此。没有外星球，供人类迁移，只可参观，不能定居。不管你喜欢与否，现在，只有地球供我们立足。据说研习天文，可以让人谦卑，塑造人心，磨炼个性，也许再没有更好的方法能比这遥远的画面更好地显示出人类的自负与愚蠢。\n对我而言，它强调了我们的责任，要对人更友善，懂得珍惜与爱护，这泛着苍白蓝光的小点是我们知道的唯一的家园。\n“That’s here, that’s home, that’s us. On it everyone you love, everyone you know, everyone you ever heard of, every human being who ever was, lived out their lives. The aggregate of our joy and suffering, thousands of confident religions, ideologies, and economic doctrines, every hunter and forager, every hero and coward, every creator and destroyer of civilization, every king and peasant, every young couple in love, every mother and father, hopeful child, inventor and explorer, every teacher of morals, every corrupt politician, every “superstar,” every “supreme leader,” every saint and sinner in the history of our species lived there – on a mote of dust suspended in a sunbeam. The Earth is a very small stage in a vast cosmic arena. Think of the rivers of blood spilled by all those generals and emperors so that, in glory and triumph, they could become the momentary masters of a fraction of a dot. Think of the endless cruelties visited by the inhabitants of one corner of this pixel on the scarcely distinguishable inhabitants of some other corner, how frequent their misunderstandings, how eager they are to kill one another, how fervent their hatreds. Our posturings, our imagined self-importance, the delusion that we have some privileged position in the Universe, are challenged by this point of pale light. Our planet is a lonely speck in the great enveloping cosmic dark. In our obscurity, in all this vastness, there is no hint that help will come from elsewhere to save us from ourselves. The Earth is the only world known so far to harbor life. There is nowhere else, at least in the near future, to which our species could migrate. Visit, yes. Settle, not yet. Like it or not, for the moment the Earth is where we make our stand. It has been said that astronomy is a humbling and character-building experience. There is perhaps no better demonstration of the folly of human conceits than this distant image of our tiny world. To me, it underscores our responsibility to deal more kindly with one another, and to preserve and cherish the pale blue dot, the only home we’ve ever known.”', '0', '');
INSERT INTO `t_product` VALUES ('8ab5f0ee-c4c1-4134-a3af-19d776a2a2c9', '月下独酌 | 李白 ', '9999', '7', 'http://image.jt.com/upload/9/a/2/4/c/0/5/e/5895034b-d181-4ad4-b889-7e6de6fd7603.png', '33', '月下独酌四首·其一\n【作者】李白 【朝代】唐\n花间一壶酒，独酌无相亲。\n\n举杯邀明月，对影成三人。\n\n月既不解饮，影徒随我身。\n\n暂伴月将影，行乐须及春。\n\n我歌月徘徊，我舞影零乱。\n\n醒时相交欢，醉后各分散。\n\n永结无情游，相期邈云汉。', '0', '');
INSERT INTO `t_product` VALUES ('96e740cf-a801-437e-8497-5b91c7805dfd', 'Pixiv_3', '587', '4', 'http://image.jt.com/upload/e/3/5/e/f/c/5/3/00980f31-d02a-4f68-8f46-2cea5e475869.jpg', '23', 'Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3Pixiv_3', '0', '');
INSERT INTO `t_product` VALUES ('a35bc8b6-46d1-4677-b24a-6fde9c327cb5', '临江仙·梦后楼台高锁 【作者】晏几道 【朝代】宋', '998', '10', 'http://image.jt.com/upload/3/9/d/1/0/b/5/d/5aec3212-86b9-4ee3-9e34-be25d2245ff3.png', '4', '临江仙·梦后楼台高锁\n【作者】晏几道 【朝代】宋 译文对照\n梦后楼台高锁，酒醒帘幕低垂。去年春恨却来时。落花人独立，微雨燕双飞。\n\n记得小苹初见，两重心字罗衣。琵琶弦上说相思。当时明月在，曾照彩云归。\n\n标签: 歌女情感人物婉约宋词三百首怀念宋词精选', '0', '');
INSERT INTO `t_product` VALUES ('a9f3b3f5-0f62-4238-bef6-02ea9fe0494f', '怪盗基德', '1412', '4', 'http://image.jt.com/upload/d/b/4/1/b/b/2/1/159d1f96-7e99-4e29-ae80-3672b5ec3401.png', '174', '怪盗基德（日文：怪盗キッド；英文：Kid the Phantom Thief），又译怪盗小子、怪盗奇度，原名“怪盗1412号”（源自其国际罪犯代码“1412”），是日本动漫《魔术快斗》中的主人公以及《名侦探柯南》中的客串角色。第一代的真实身份为黑羽盗一，现在第二代为黑羽快斗。一个充满传奇色彩的怪盗，拥有过人才智，精通易容、变声、逃脱术，以珠宝等各类贵重艺术品为目标，使用魔术手法进行犯案的超级盗窃犯。', '0', '');
INSERT INTO `t_product` VALUES ('af2c91bb-1baa-4e5f-adc1-bbfbe4cf0bb6', '蝴蝶忍插图2', '856', '8', 'http://image.jt.com/upload/e/e/1/8/5/f/7/4/8444aa98-ed75-4e02-b76a-9bd7a052f321.jpg', '787', '不多介绍了', '0', '');
INSERT INTO `t_product` VALUES ('c995d2a8-9f27-4262-b40c-1f3c30cd1b6b', 'Pixiv_', '1312', '14', 'http://image.jt.com/upload/a/7/0/6/5/8/a/a/097d27e9-866e-402a-b7ca-982583413487.png', '854', 'Pixiv_Pixiv_Pixiv_Pixiv_Pixiv_Pixiv_', '0', '');
INSERT INTO `t_product` VALUES ('d727ec26-6ff5-4924-a659-7b58075ada43', 'Pixiv_2', '958', '11', 'http://image.jt.com/upload/f/3/0/d/b/2/f/2/c3e06d61-605e-4c9b-a857-58ea581d1404.jpg', '777', 'Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2Pixiv_2', '0', '');
