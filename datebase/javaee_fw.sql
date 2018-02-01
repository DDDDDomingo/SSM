/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : javaee_fw

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-01 23:47:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category_`
-- ----------------------------
DROP TABLE IF EXISTS `category_`;
CREATE TABLE `category_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_
-- ----------------------------
INSERT INTO `category_` VALUES ('1', 'category1');
INSERT INTO `category_` VALUES ('2', 'category2');
INSERT INTO `category_` VALUES ('3', 'category3');
INSERT INTO `category_` VALUES ('4', 'category4');
INSERT INTO `category_` VALUES ('5', 'category5');

-- ----------------------------
-- Table structure for `fw_admin`
-- ----------------------------
DROP TABLE IF EXISTS `fw_admin`;
CREATE TABLE `fw_admin` (
  `Admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `Admin_name` char(50) NOT NULL,
  `Admin_account` char(50) NOT NULL,
  `Admin_pwd` char(50) NOT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_admin
-- ----------------------------
INSERT INTO `fw_admin` VALUES ('1', '给给管理员', 'admin', 'admin');

-- ----------------------------
-- Table structure for `fw_cart`
-- ----------------------------
DROP TABLE IF EXISTS `fw_cart`;
CREATE TABLE `fw_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `cart_quantity` int(11) NOT NULL DEFAULT '0',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cUser_id` (`user_id`),
  KEY `cSale_id` (`sale_id`),
  KEY `cSeller_id` (`seller_id`),
  CONSTRAINT `cSale_id` FOREIGN KEY (`sale_id`) REFERENCES `fw_salelist` (`Sale_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cSeller_id` FOREIGN KEY (`seller_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cUser_id` FOREIGN KEY (`user_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_cart
-- ----------------------------
INSERT INTO `fw_cart` VALUES ('3', '2', '2', '2', '0', '2018-01-08', '2018-01-08');
INSERT INTO `fw_cart` VALUES ('6', '6', '19', '3', '0', '2018-01-09', '2018-01-09');
INSERT INTO `fw_cart` VALUES ('7', '6', '15', '3', '0', '2018-01-09', '2018-01-09');
INSERT INTO `fw_cart` VALUES ('8', '2', '24', '1', '0', '2018-01-09', '2018-01-09');

-- ----------------------------
-- Table structure for `fw_category`
-- ----------------------------
DROP TABLE IF EXISTS `fw_category`;
CREATE TABLE `fw_category` (
  `Category_id` int(11) NOT NULL AUTO_INCREMENT,
  `Category_type` char(10) NOT NULL,
  `Category_img` varchar(255) DEFAULT 'http://placehold.it/50x50',
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_category
-- ----------------------------
INSERT INTO `fw_category` VALUES ('1', '图书教材', 'http://placehold.it/50x50');
INSERT INTO `fw_category` VALUES ('2', '闲置电脑', 'http://placehold.it/50x50');
INSERT INTO `fw_category` VALUES ('3', '数码耳机', 'http://placehold.it/50x50');
INSERT INTO `fw_category` VALUES ('4', '数码音响', 'http://placehold.it/50x50');
INSERT INTO `fw_category` VALUES ('5', '美妆衣物', 'http://placehold.it/50x50');
INSERT INTO `fw_category` VALUES ('6', '闲置手机', 'http://placehold.it/50x50');
INSERT INTO `fw_category` VALUES ('9', '代步工具', 'http://placehold.it/50x50');

-- ----------------------------
-- Table structure for `fw_letter`
-- ----------------------------
DROP TABLE IF EXISTS `fw_letter`;
CREATE TABLE `fw_letter` (
  `Letter_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Sender_id` int(11) NOT NULL,
  `Reciever_id` int(11) NOT NULL,
  `Letter_time` datetime NOT NULL,
  `Letter_content` text NOT NULL,
  `Letter_state` int(11) NOT NULL,
  PRIMARY KEY (`Letter_id`),
  KEY `lrUser_id` (`Reciever_id`),
  KEY `lsUser_id` (`Sender_id`),
  CONSTRAINT `lrUser_id` FOREIGN KEY (`Reciever_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lsUser_id` FOREIGN KEY (`Sender_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_letter
-- ----------------------------
INSERT INTO `fw_letter` VALUES ('0000000001', '2', '4', '2018-01-08 02:33:25', '你好，我想买你的东西，可以议价吗，我的QQ是77681193@qq.com。', '14');
INSERT INTO `fw_letter` VALUES ('0000000002', '4', '2', '2018-01-03 23:50:15', '我的QQ是222222', '14');
INSERT INTO `fw_letter` VALUES ('0000000003', '6', '1', '2018-01-09 00:35:10', '这个东西多少钱', '23');
INSERT INTO `fw_letter` VALUES ('0000000004', '2', '1', '2018-01-09 08:39:23', '我想购买这个东西', '24');

-- ----------------------------
-- Table structure for `fw_message`
-- ----------------------------
DROP TABLE IF EXISTS `fw_message`;
CREATE TABLE `fw_message` (
  `Msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `Msg_content` char(255) NOT NULL,
  `SaleItem_id` int(11) NOT NULL,
  `Msg_time` datetime NOT NULL,
  `Msg_state` bit(1) NOT NULL DEFAULT b'0',
  `User_id` int(11) NOT NULL,
  PRIMARY KEY (`Msg_id`),
  KEY `mSaleItem_id` (`SaleItem_id`) USING BTREE,
  KEY `mUser_id` (`User_id`),
  CONSTRAINT `mSaleItem_id` FOREIGN KEY (`SaleItem_id`) REFERENCES `fw_salelist` (`Sale_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mUser_id` FOREIGN KEY (`User_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_message
-- ----------------------------
INSERT INTO `fw_message` VALUES ('1', '教材，但不适合作为教材。体系很散，堆砌概念。大一学完不明所以，后来发现有大用后，配合着算法书折回去看。其实形式化语言叙述还是很不错的，严谨。', '3', '2018-01-04 21:06:22', '', '2');
INSERT INTO `fw_message` VALUES ('2', '难度加大了，这个跟左的版本的差距还是体现在叙述少了，符号语言多了，其实从学习角度来说，可以当做一种符号的认识', '3', '2018-01-02 21:06:57', '', '3');
INSERT INTO `fw_message` VALUES ('3', '我是觉得不错。 2.好吧...这本书问题大了，降一颗星。', '1', '2018-01-07 22:44:21', '', '2');
INSERT INTO `fw_message` VALUES ('4', '看了半年的耳机终于剁手了 非常满意 不亏是拜亚经典型号 还没煲的情况下音质都满意 外观大气 配个飞傲k5帅到爆 客服妹子也是很给力 耐心的讲解 100分', '9', '2018-01-07 22:51:46', '', '2');
INSERT INTO `fw_message` VALUES ('5', '这东西不错。。。', '23', '2018-01-09 00:35:33', '', '6');
INSERT INTO `fw_message` VALUES ('6', '评论测试1', '24', '2018-01-09 08:39:37', '', '2');

-- ----------------------------
-- Table structure for `fw_reply`
-- ----------------------------
DROP TABLE IF EXISTS `fw_reply`;
CREATE TABLE `fw_reply` (
  `Reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `Reply_content` char(255) NOT NULL,
  `Reply_time` datetime NOT NULL,
  `Reply_state` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Msg_id` int(11) NOT NULL,
  PRIMARY KEY (`Reply_id`),
  KEY `rrUser_id` (`User_id`),
  KEY `rrMsg_id` (`Msg_id`),
  CONSTRAINT `rrMsg_id` FOREIGN KEY (`Msg_id`) REFERENCES `fw_message` (`Msg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rrUser_id` FOREIGN KEY (`User_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `fw_salelist`
-- ----------------------------
DROP TABLE IF EXISTS `fw_salelist`;
CREATE TABLE `fw_salelist` (
  `Sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `Sale_name` char(255) NOT NULL,
  `Sale_img` char(255) DEFAULT 'http://placehold.it/150x150',
  `Sale_content` text NOT NULL,
  `Sale_time` datetime NOT NULL,
  `Sale_price` decimal(10,0) NOT NULL,
  `Sale_cata` int(11) NOT NULL,
  `Sale_state` bit(1) NOT NULL DEFAULT b'0' COMMENT '0为未售出',
  `User_id` int(11) NOT NULL COMMENT '发布者ID',
  `Sale_reserve` int(11) NOT NULL COMMENT '库存数量',
  `Buyer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sale_id`),
  KEY `sUser_id` (`User_id`),
  KEY `wodeCate` (`Sale_cata`),
  KEY `sBuyer_id` (`Buyer_id`),
  CONSTRAINT `sBuyer_id` FOREIGN KEY (`Buyer_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sUser_id` FOREIGN KEY (`User_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wodeCate` FOREIGN KEY (`Sale_cata`) REFERENCES `fw_category` (`Category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_salelist
-- ----------------------------
INSERT INTO `fw_salelist` VALUES ('1', '数据结构（Java版本） 第四版', '/img/salelist/sjjg.jpg', '《数据结构(C++版)(第2版)》全面系统地介绍数据结构的基础理论和算法设计方法，包括线性表、树、图等数据结构以及查找和排序算法。内容涉及的广度和深度符合计算机专业本科的基本要求，体现了本科教学的培养目标。\r\n\r\n《数据结构(C++版)(第2版)》采用C++语言，以面向对象方法描述数据结构和算法。《数据结构(C++版)(第2版)》理论叙述精练，结构安排合理，重点是数据结构设计和算法设计，通过降低理论难度和抽象性、加强实践环节等措施，力求增强学生的理解能力和应用能力。', '2018-01-04 16:12:50', '20', '1', '', '2', '1', '3');
INSERT INTO `fw_salelist` VALUES ('2', 'iPhone6s 64G 升空会 4G手机', '/img/salelist/ipsj6s.jpg', '8 成新，购入事件是2017.3月份，价格可以商谈，最好面交。', '2018-01-03 22:06:01', '3800', '6', '', '2', '1', '4');
INSERT INTO `fw_salelist` VALUES ('3', '离散数学', '/img/salelist/lssx.jpg', '修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1修改测试1', '2018-01-06 16:38:07', '20', '1', '', '2', '1', null);
INSERT INTO `fw_salelist` VALUES ('9', '拜亚DT880半开放头戴式经典专业耳机', '/img/salelist/bydlej.jpg', '2017年购入，想要卖出', '2018-01-03 23:43:46', '1200', '3', '', '2', '1', null);
INSERT INTO `fw_salelist` VALUES ('11', '捷安特Escape R3 24速公路自行车', '/img/salelist/jatzxc.jpg', '去年购入，9成新，因为脚伤，所以想要卖出，价格可以面议，最好同城面交。', '2018-01-03 22:06:01', '1200', '9', '', '3', '1', null);
INSERT INTO `fw_salelist` VALUES ('13', 'ipad mini 1代 16g 台版', '/img/salelist/ipadmini.jpg', '1平时用得很仔细就看看视频，有膜有壳，很新，无瑕疵无暗病。2机器背后有激光刻了名字，套上壳就看不见。3原装充电头没了，送一个iphone 美版充电头。送线，送变形金刚壳，带待机。4没有箱说', '2018-01-03 22:06:01', '800', '2', '', '4', '1', null);
INSERT INTO `fw_salelist` VALUES ('14', 'Thinkpad T430 独显高配版 图形本', '/img/salelist/think-pad.jpg', '懂的来！ 原装无修无翻新 配置也是原装如下：i5-3320m/8G（4G1600X2）/180G英特尔固态/专业图形卡nvs5400 位宽128bit/1600x900高分屏 极品展示机成色 处女座想必也能接受的成色^_^Thinkpad的性能不必多讲 尤其是T系列稳定是出了名的。 重点说显卡：nvs5400 这款显卡很好的，属于专业级的显卡：1、NVS5400M是一款专业的图形显卡 是为了专业绘图而制作的 2、NVS系列显卡拥有完整的渲染指令集，和Geforce系列最大的区别就是NVS注重2D输出和色彩描绘，并且不接受The way游戏优化。因为画面输出比较好，被称作Nvidia显卡中的ATI。3、NVS 5400M是基于 GeForce GT 630M / 540M的降频版本 ，是40nm GF108。功能上支持Bitstream HD Audio，杜比无损输出；PureVideo HD，可以硬解两条1080P，还有CUDA, OpenCL, and DirectCompute 2.1,PhysX 等等。另外：NVIDIA NVS 5400M 这个卡玩一般的CF LOL 魔兽争霸 街霸4什么的随便通吃，魔兽世界，极品这些游戏默认设置绝对可以流畅运行。NVS 5400和之前的NVS4200等完全高一个档次 这款显卡是128BIT 宽位不是64BIT 不要只拿显存说事， 虽然属于作图卡， 但玩游戏也应付的过来 最主要的是NVS 5400在装驱动的时候有不同的侧重选项，可以根据需要选择驱动。', '2018-01-04 16:29:19', '2189', '2', '', '4', '1', null);
INSERT INTO `fw_salelist` VALUES ('15', '宝宝空气层纯棉西松屋儿童两件套', '/img/salelist/bbljt.jpg', '颜色分类:空气棉套装小象,参考身高:130cm。穿过一个冬天。衣长44cm，袖长37cm，裤长63cm。', '2018-01-04 17:00:31', '10', '5', '', '3', '1', null);
INSERT INTO `fw_salelist` VALUES ('16', 'jQuery in Action', '/img/salelist/s4174499.jpg', 'Bear Bibeault，著名Web技术专家。有30多年编程经验。也是技术社区JavaRanch的核心人物之一。除本书外，他还和其他世界级Web专家联袂打造了圣经级巨著《Ajax实战：实例详解》和《Ajax实战：Prototype与Scriptaculous篇》（均由人民邮电出版社出版）。', '2018-01-02 17:14:47', '30', '1', '', '1', '1', null);
INSERT INTO `fw_salelist` VALUES ('17', 'JavaScript DOM编程艺术 （第2版）', '/img/salelist/s4677623.jpg', 'JavaScript是Web开发中最重要的一门语言，它强大而优美。无论是桌面开发，还是移动应用。JavaScript都是必须掌握的技术。W3C的DOM标准是开发Web应用的基石。已经得到所有现代浏览器的支持，这使得跨平台Web开发成了一件轻松惬意的事。', '2018-01-03 17:16:56', '30', '1', '', '1', '1', null);
INSERT INTO `fw_salelist` VALUES ('18', '深入理解计算机系统（原书第3版）', '/img/salelist/s29195878.jpg', '\r\n\r\n和第2版相比，本版内容上*大的变化是，从以IA32和x86-64为基础转变为完全以x86-64为基础。主要更新如下：\r\n\r\n基于x86-64，大量地重写代码，首次介绍对处理浮点数据的程序的机器级支持。\r\n\r\n处理器体系结构修改为支持64位字和操作的设计。\r\n\r\n引入更多的功能单元和更复杂的控制逻辑，使基于程序数据流表示的程序性能模型预测更加可靠。\r\n\r\n扩充关于用GOT和PLT创建与位置无关代码的讨论，描述了更加强大的链接技术（比如库打桩）。\r\n\r\n增加了对信号处理程序更细致的描述，包括异步信号安全的函数等。\r\n\r\n采用新函数，更新了与协议无关和线程安全的网络编程。', '2018-01-03 17:18:40', '60', '1', '', '3', '1', null);
INSERT INTO `fw_salelist` VALUES ('19', '物联网导论', '/img/salelist/s4620788.jpg', '《物联网导论》从物联网的感知识别层、网络构建层、管理服务层和综合应用层这4层分别进行阐述，深入浅出地为读者拨开萦绕于物联网这个概念的重重迷雾，引领求知者渐渐步入物联网世界，帮助探索者把握第三次IT科技浪潮的方向。物联网是一个基于互联网、传统电信网等信息承载体，让所有能够被独立寻址的普通物理对象实现互联互通的网络。它具有普通对象设备化、自治终端互联化和普适服务智能化3个重要特征。', '2018-01-04 17:22:42', '20', '1', '', '3', '1', null);
INSERT INTO `fw_salelist` VALUES ('20', '疯狂Android讲义', '/img/salelist/s28351119.jpg', '《疯狂Android讲义（第3版）》是《疯狂Android讲义》的第3版，《疯狂Android讲义（第3版）》基于最新的Android 5，并采用了Google推荐的IDE：Android Studio作为开发工具，书中每个案例、每个截图都全面升级到Android 5。《疯狂Android讲义（第3版）》全面介绍了Android应用开发的相关知识，全书内容覆盖了Android用户界面编程、Android四大组件、Android资源访问、图形/图像处理、事件处理机制、Android输入/输出处理、音频/视频多媒体应用开发、OpenGL与3D应用开发、网络通信编程、Android平台的Web Service、传感器应用开发、GPS应用开发、整合第三方Map服务等。', '2018-01-02 17:24:56', '60', '1', '', '4', '1', null);
INSERT INTO `fw_salelist` VALUES ('21', '疯狂Java讲义', '/img/salelist/s27404471.jpg', '《疯狂Java讲义（第3版）(含CD光盘1张)》深入介绍了Java编程的相关方面，全书内容覆盖了Java的基本语法结构、Java的面向对象特征、Java集合框架体系、Java泛型、异常处理、Java GUI编程、JDBC数据库编程、Java注释、Java的IO流体系、Java多线程编程、Java网络通信编程和Java反射机制。覆盖了java.lang、java.util、java.text、java.io和java.nio、java.sql、java.awt、javax.swing包下绝大部分类和接口。本书全面介绍了Java 8的新的接口语法、Lambda表达式、方法引用、构造器引用、函数式编程、流式编程、新的日期、时间API、并行支持、改进的类型推断、重复注解、JDBC 4.2新特性等新特性。', '2018-01-03 17:26:28', '60', '1', '', '4', '1', null);
INSERT INTO `fw_salelist` VALUES ('22', '三星Galaxy S4', '/img/salelist/sxgllaxyS4.jpg', '三星Galaxy\r\n										S4配有1300万像素摄像头，运行Android4.2.2+TouchWiz系统，机身厚度为7.9mm，内置Rom16/32/64GB，RAM为2GB。', '2018-01-07 17:42:47', '500', '6', '', '1', '1', null);
INSERT INTO `fw_salelist` VALUES ('23', 'Sony WH-H900N', '/img/salelist/wh-h900n.jpg', '支持高解析度音频，聆听出众的音质。内置40mm驱动单元，配备圆顶镀钛的振膜，具有从低频到40kHz高频的高带宽音频性能（在开启电源并且连接耳机线时)，尽享音乐的精彩之处。', '2018-01-07 17:48:06', '1099', '3', '', '1', '1', null);
INSERT INTO `fw_salelist` VALUES ('24', 'Sony SRS-HG2', '/img/salelist/5950a14dN79983e0a.jpg', '支持高解析度音源,EXTRABASS一键重低音,NFC/Bluetooth/Wi-Fi/MusicCenterLink,2.0声道+2个被动振膜', '2018-01-07 17:51:00', '899', '4', '', '1', '1', null);

-- ----------------------------
-- Table structure for `fw_user`
-- ----------------------------
DROP TABLE IF EXISTS `fw_user`;
CREATE TABLE `fw_user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `User_name` varchar(15) NOT NULL COMMENT '用户昵称',
  `User_account` varchar(20) NOT NULL COMMENT '用户账号',
  `User_pwd` varchar(20) NOT NULL,
  `User_tel` char(30) NOT NULL,
  `User_realName` char(20) NOT NULL,
  `User_sex` char(20) NOT NULL DEFAULT '' COMMENT '0为男、1为女',
  `User_email` char(30) NOT NULL,
  `User_regTime` datetime NOT NULL,
  `User_lastLogin` datetime DEFAULT NULL,
  `User_qq` char(30) NOT NULL,
  `User_avatar` varchar(255) NOT NULL DEFAULT '/img/user/default-img.png',
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_user
-- ----------------------------
INSERT INTO `fw_user` VALUES ('1', '小明', 'xm2017', 'xm2000', '18258102833', '杨小名', '男', '751448037@qq.com', '2017-12-30 15:51:52', '2018-01-09 07:52:20', '1783611', '/img/user/testpage.png');
INSERT INTO `fw_user` VALUES ('2', '原嘉琦', 'account1', 'test1', '13625775555', '杨大山', '男', '77681193@qq.com', '2018-01-02 18:09:17', '2018-01-09 08:38:35', '77681193', '/img/user/testpage.png');
INSERT INTO `fw_user` VALUES ('3', 'alibaba2', 'account2', 'test2', '13625772222', '杨大名', '男', '751448037@qq.com', '2018-01-02 18:12:09', null, '751448037', '/img/user/default-img.png');
INSERT INTO `fw_user` VALUES ('4', 'alibaba3', 'account3', 'test3', '13625773333', '杨某某', '男', '751448037@qq.com', '2018-01-03 14:59:01', '2018-01-08 02:33:50', '751448037', '/img/user/default-img.png');
INSERT INTO `fw_user` VALUES ('5', 'alibaba4', 'account4', 'test4', '13625770619', '杨某某', '男', '751448037@qq.com', '2018-01-03 14:59:42', null, '751448037', '/img/user/default-img.png');
INSERT INTO `fw_user` VALUES ('6', '测试用户改', 'joe111', 'joe', '12388889999', '周XX', '男', '12312312222@qq.com', '2018-01-09 00:11:13', '2018-01-09 01:32:52', '12312312222', '/img/user/yjq111.jpg');

-- ----------------------------
-- Table structure for `fw_wishlist`
-- ----------------------------
DROP TABLE IF EXISTS `fw_wishlist`;
CREATE TABLE `fw_wishlist` (
  `Wlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `Wlist_name` char(255) NOT NULL,
  `Wlist_img` char(255) NOT NULL DEFAULT 'http://placehold.it/150x150',
  `Wlist_content` text NOT NULL,
  `Wlist_time` datetime NOT NULL,
  `Wlist_state` bit(1) NOT NULL DEFAULT b'0',
  `User_id` int(11) NOT NULL,
  `Wlist_type` int(11) NOT NULL,
  PRIMARY KEY (`Wlist_id`),
  KEY `wUser_id` (`User_id`),
  KEY `wWlist_type` (`Wlist_type`),
  CONSTRAINT `wUser_id` FOREIGN KEY (`User_id`) REFERENCES `fw_user` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fw_wishlist
-- ----------------------------
INSERT INTO `fw_wishlist` VALUES ('1', '精通Spring MVC 4', '/img/wishlist/s29442035.jpg', 'Spring MVC属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。Spring 框架提供了构建 Web 应用程序的全功能 MVC 模块。Spring MVC4是当前zuixin的版本，在众多特性上有了进一步的提升', '2018-01-06 16:43:46', '', '2', '1');
INSERT INTO `fw_wishlist` VALUES ('2', '深入理解Java虚拟机（第2版）', '/img/wishlist/s27458236.jpg', '《深入理解Java虚拟机:JVM高级特性与最佳实践(第2版)》共分为五大部分，围绕内存管理、执行子系统、程序编译与优化、高效并发等核心主题对JVM进行了全面而深入的分析，深刻揭示了JVM的工作原理', '2018-01-03 22:03:03', '', '2', '1');
INSERT INTO `fw_wishlist` VALUES ('3', '编译原理 机械工业出版社', '/img/wishlist/byyl.jpg', '本书全面、深入地探讨了编译器设计方面的重要主题，包括词法分析、语法分析、语法制导定义和语法制导翻译、运行时刻环境、目标代码生成、代码优化技术、并行性检测以及过程间分析技术，并在相关章节中给出大量的实例。与上一版相比，本书进行了全面的修订，涵盖了编译器开发方面的最新进展。每章中都提供了大量的系统及参考文献。', '2018-01-06 16:36:24', '', '2', '1');
INSERT INTO `fw_wishlist` VALUES ('4', '戴尔（DELL）SP2318H 23英寸', '/img/wishlist/5984213dNca3bc5a6.jpg', '（含支架）高度（收起 ~ 展开） 357.1 毫米 ~ 487.1 毫米（14.06 英寸 ~ 19.17 英寸） 宽度 532.0 毫米（20.94 英寸） 深度 180.0 毫米（7.09 英寸）', '2018-01-08 21:20:13', '', '3', '2');
INSERT INTO `fw_wishlist` VALUES ('5', 'SONY进口媒介数播拷贝', '/img/wishlist/test1.jpg', '测试商品1', '2018-01-09 00:24:56', '', '6', '1');
INSERT INTO `fw_wishlist` VALUES ('6', 'iphoendsss', '/img/wishlist/null', '纯正品，功能正常，声音杠杠滴！不包邮', '2018-01-09 08:44:22', '', '2', '1');
