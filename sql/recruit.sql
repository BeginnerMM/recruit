/*
 Navicat Premium Data Transfer

 Source Server         : hutter
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : recruit

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 21/03/2020 18:08:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `userid` bigint(20) NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (19980208, '17812345678', '9136f8f230e20ca9afc410d14c826586', '管理员', 'babycoder@163.com');

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application`  (
  `applicationId` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) NULL DEFAULT NULL,
  `recentTime` datetime(0) NULL DEFAULT NULL COMMENT '最近时间',
  `resumeId` int(11) NOT NULL,
  `positionId` int(11) NOT NULL COMMENT '职称id',
  `hrId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`applicationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应聘记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES (1, 1, NULL, 1, 1, 1);
INSERT INTO `application` VALUES (2, 1, NULL, 2, 5, 2);
INSERT INTO `application` VALUES (3, 1, NULL, 2, 11, 2);
INSERT INTO `application` VALUES (4, 1, NULL, 2, 15, 3);
INSERT INTO `application` VALUES (5, 1, NULL, 6, 11, 5);
INSERT INTO `application` VALUES (6, 1, NULL, 5, 3, 3);
INSERT INTO `application` VALUES (7, 1, NULL, 6, 18, 1);
INSERT INTO `application` VALUES (8, 1, NULL, 4, 5, 1);
INSERT INTO `application` VALUES (9, 1, NULL, 4, 13, 6);
INSERT INTO `application` VALUES (12, 0, '2017-11-17 11:32:47', 24, 14, NULL);
INSERT INTO `application` VALUES (13, 0, '2017-11-17 20:36:09', 25, 15, NULL);
INSERT INTO `application` VALUES (14, 0, '2020-03-09 12:05:43', 1, 16, NULL);
INSERT INTO `application` VALUES (15, 0, '2020-03-20 21:57:49', 27, 14, NULL);
INSERT INTO `application` VALUES (16, 0, '2020-03-20 22:00:22', 27, 10, NULL);
INSERT INTO `application` VALUES (17, 0, '2020-03-21 12:04:06', 27, 1, NULL);
INSERT INTO `application` VALUES (18, 0, '2020-03-21 18:03:19', 27, 14, NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职称',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  PRIMARY KEY (`categoryId`) USING BTREE,
  UNIQUE INDEX `categoryName_UNIQUE`(`categoryName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职称表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Java', 'Java开发');
INSERT INTO `category` VALUES (2, 'C++', 'C++开发');
INSERT INTO `category` VALUES (3, 'PHP', 'PHP开发');
INSERT INTO `category` VALUES (4, '.NET', '.NET开发');
INSERT INTO `category` VALUES (5, 'Python', 'Python开发');
INSERT INTO `category` VALUES (6, '数据挖掘', '数据挖掘');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialNumber` int(11) NULL DEFAULT NULL COMMENT '标号',
  `parentSerialNumber` int(11) NULL DEFAULT NULL COMMENT '父编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/城市/区名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 110000, 100000, '北京市');
INSERT INTO `city` VALUES (2, 330000, 100000, '浙江');
INSERT INTO `city` VALUES (3, 110100, 110000, '北京市');
INSERT INTO `city` VALUES (4, 330100, 330000, '杭州');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `releaseTime` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `positionId` int(11) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 3, 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计', '2017-11-14 22:47:42', 1, 5);
INSERT INTO `comment` VALUES (2, 2, 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念', '2017-11-14 22:47:42', 1, 17);
INSERT INTO `comment` VALUES (3, 1, 'Python是纯粹的自由软件， 源代码和解释器CPython遵循 GPL(GNU General Public License)协议', '2017-11-14 22:47:42', 2, 11);
INSERT INTO `comment` VALUES (4, 3, 'C++不仅拥有计算机高效运行的实用性特征，同时还致力于提高大规模程序的编程质量与程序设计语言的问题描述能力', '2017-11-14 22:47:42', 3, 18);
INSERT INTO `comment` VALUES (5, 3, '这是一些关于Java工程师的评论，这个职位需要丰富的阅历的和工作经验', '2017-11-14 22:47:42', 5, 2);
INSERT INTO `comment` VALUES (6, 2, '又要写测试评论，写点啥呢？布吉岛', '2017-11-14 22:47:42', 6, 8);
INSERT INTO `comment` VALUES (7, 3, '数据挖掘一般是指从大量的数据中通过算法搜索隐藏于其中信息的过程', '2017-11-14 22:47:42', 6, 14);
INSERT INTO `comment` VALUES (8, 3, 'Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点', '2017-11-14 22:47:42', 6, 17);
INSERT INTO `comment` VALUES (9, 2, 'Python 已经成为最受欢迎的程序设计语言之一', '2017-11-14 22:47:42', 1, 10);
INSERT INTO `comment` VALUES (10, 3, '<p>.NET是 Microsoft XML Web services 平台</p>', '2017-11-14 22:47:42', 2, 9);
INSERT INTO `comment` VALUES (19, 3, 'IndexRecruit大透明弱弱地评论一句~', '2017-11-16 22:37:26', 7, 13);
INSERT INTO `comment` VALUES (21, 3, '学习数据挖掘小白应该从哪个方面入手？萌新小白求教~', '2017-11-17 11:32:32', 24, 14);
INSERT INTO `comment` VALUES (23, 3, '<p><span><u><b>XML Web services 允许应用程序通过 Internet 进行通讯和共享数据，而不管所采用的是哪种操作系统、设备或编程语言</b></u></span></p>', '2017-11-17 21:45:42', 25, 9);
INSERT INTO `comment` VALUES (24, 3, '<i>阿里今年双十一赚大发了。。。</i>', '2017-11-17 21:56:58', 25, 1);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyLogo` int(11) NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `state` int(11) NULL DEFAULT NULL,
  `companyCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`companyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '阿里巴巴', 1, '阿里巴巴网络技术有限公司（简称：阿里巴巴集团）是以曾担任英语教师的马云为首的18人于1999年在浙江杭州创立', 1, 'AL85685');
INSERT INTO `company` VALUES (2, '滴滴出行', 2, '滴滴出行是涵盖出租车、专车、 快车、顺风车、代驾及 大巴等多项业务在内的一站式出行平台，2015年9月9日由“滴滴打车”更名而来', 1, 'DD36526');
INSERT INTO `company` VALUES (3, '搜狐媒体', 3, '搜狐公司是中国领先的互联网品牌，是中国最主要的新闻提供商，搜狐的网络资产给众多用户在信息、娱乐以及交流方面提供了广泛的选择', 1, 'SH74524');
INSERT INTO `company` VALUES (4, '京东', 4, '京东致力于成为一家为社会创造最大价值的公司。经过13年砥砺前行，京东在商业领域一次又一次突破创新，取得了跨越式发展', 1, 'JD86635');
INSERT INTO `company` VALUES (5, '网易', 5, '网易公司（NASDAQ: NTES）是中国的互联网公司，利用互联网技术，加强人与人之间信息的交流和共享，实现“网聚人的力量”', 1, 'WY53265');
INSERT INTO `company` VALUES (6, '爱奇艺', 6, '自成立伊始，爱奇艺坚持“悦享品质”的公司理念，以“用户体验”为生命，专注为用户提供清晰、流畅、界面友好的观映体验', 1, 'AQ86532');

-- ----------------------------
-- Table structure for company_detail
-- ----------------------------
DROP TABLE IF EXISTS `company_detail`;
CREATE TABLE `company_detail`  (
  `companypParticularsId` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `companyLogo` int(11) NULL DEFAULT NULL COMMENT '公司log',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司描述',
  `productPresentation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品介绍',
  `companyAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `corporateJuridicalPerson` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司法人',
  `registeredAssets` bigint(255) NULL DEFAULT NULL COMMENT '注册资产',
  `registrationTime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `cityId` int(11) NULL DEFAULT NULL COMMENT '所在市编号',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updeateTime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`companypParticularsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company_detail
-- ----------------------------
INSERT INTO `company_detail` VALUES (1, '阿里巴巴', 1, '阿里巴巴集团的使命是让天下没有难做的生意。\r\n我们旨在赋能企业改变营销、销售和经营的方式。我们为商家、品牌及其他企业提供基本的互联网基础设施以及营销平台，让其可借助互联网的力量与用户和客户互动。我们的业务包括核心电商、云计算、数字媒体和娱乐以及创新项目和其他业务。我们并通过子公司菜鸟网络及所投资的关联公司口碑，参与物流和本地服务行业，同时与蚂蚁金融服务集团有战略合作，该金融服务集团主要通过中国领先的第三方网上支付平台支付宝运营。', 'Alibaba.com开拓海外客户(http://www.alibaba.com)', '杭州滨江区阿里巴巴滨江园区', '张勇', 15298, '2007-03-26 00:00:00', 330100, 1, '2020-03-15 19:22:16', '2020-03-15 19:22:18');
INSERT INTO `company_detail` VALUES (2, '滴滴出行', 2, '滴滴出行是卓越的一站式移动出行平台；为5.5亿用户提供出租车、快车、专车、豪华车、公交、代驾、企业级、共享单车、共享电单车、共享汽车、外卖等多元化的出行和运输服务。在滴滴平台，超过3100万车主及司机获得灵活的工作和收入机会。\r\n滴滴出行与监管部门、出租车行业及社群积极协作，致力于以智慧交通创新解决全球交通、环保和就业挑战。滴滴也和汽车产业链企业建立广泛的合作，携手打造面向未来的汽车运营服务平台。\r\n在全球范围内，滴滴与Grab、Lyft、Ola、99、Taxify、Careem构建的移动出行网络触达全球超过80%的人口、覆盖1000多座城市。', '滴滴出行', '北京市 海淀区 钻石大厦(软件园三号路)', '程维', 79958, '2013-05-06 00:00:00', 110100, 1, '2020-03-15 19:25:58', '2020-03-15 19:26:00');
INSERT INTO `company_detail` VALUES (3, '搜狐媒体', 3, '北京搜狐互联网信息服务有限公司成立于2003年07月31日，注册地位于北京市海淀区科学院南路2号院3号楼11层1101，法人代表为张朝阳。经营范围包括第二类增值电信业务中的信息服务业务（仅限互联网信息服务）（ 含利用www.sohu.com；www.chinaren.com；www.focus.cn网站发布网络广告）；利用互联网经营音乐美术娱乐产品、游戏产品、艺术品、演出剧（节）目、动（漫）画产品；制作、发行动画片、专题片、电视综艺，不得制作时政新闻及同类专题、专栏等广播电视节目；图书、期刊、电子出版物、音像制品网上销售；社会科学、文学、艺术（含动画片、图片）', '搜狐网', '北京市海淀区', '张朝阳', 300, '2003-07-31 00:00:00', 110100, 1, '2020-03-15 19:32:15', '2020-03-15 19:32:18');
INSERT INTO `company_detail` VALUES (4, '京东', 4, '京东于2004年正式涉足电商领域，2018年，京东集团市场交易额接近1.7万亿元*。2019年7月，京东第四次入榜《财富》全球500强，位列第139位，在全球仅次于亚马逊和Alphabet，位列互联网企业第三。\r\n\r\n2014年5月，京东集团在美国纳斯达克证券交易所正式挂牌上市，是中国第一个成功赴美上市的大型综合型电商平台。2015年7月，京东凭借高成长性入选纳斯达克100指数和纳斯达克100平均加权指数。', '无界零售让购物无处不在（http://jd.com）', '北京大兴区京东集团总部', '张雱', 26000, '2012-03-13 00:00:00', 110100, 1, '2020-03-15 19:27:53', '2020-03-15 19:27:55');
INSERT INTO `company_detail` VALUES (5, '网易', 5, '网易 (NASDAQ: NTES)，1997年由丁磊先生在广州创办、2000年在美国NASDAQ股票交易所挂牌上市，是中国领先的互联网技术公司，在开发互联网应用、服务等方面始终保持中国业界领先地位。本着对中国互联网发展强烈的使命感，缔造美好生活的愿景，网易利用最先进的互联网技术，加强人与人之间信息的交流和共享，为海量用户提供优质的产品和服务，始终秉持着\"以匠心、致创新\"的理念，通过科技创新改变生活。', '企业邮箱让办公更简单，更快捷。', '杭州滨江区网易大厦', '丁磊', 13760, '2006-06-02 00:00:00', 330100, 1, '2020-03-15 19:23:48', '2020-03-15 19:23:50');
INSERT INTO `company_detail` VALUES (6, '爱奇艺', 6, '北京爱奇艺科技有限公司成立于2007年03月27日，注册地位于北京市海淀区海淀北一街2号11层1101，法人代表为耿晓华。经营范围包括技术开发、技术咨询、技术服务、技术转让；设计、制作、代理、发布广告；销售自行开发后的产品、电子产品、机械设备、家用电器、计算机、软件及辅助设备、通讯设备、文化用品、玩具；健康咨询（须经审批的诊疗活动除外）；预防保健服务（须经审批的诊疗活动除外）', '爱奇艺网', '北京市海淀区', '耿晓华', 450, '2007-03-27 00:00:00', 110100, 1, '2020-03-15 19:30:04', '2020-03-15 19:30:07');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `companyId` int(11) NOT NULL COMMENT '公司id',
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 1);
INSERT INTO `department` VALUES (2, '行政部', '负责行政事务和办公事务', 1);
INSERT INTO `department` VALUES (3, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 1);
INSERT INTO `department` VALUES (4, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 2);
INSERT INTO `department` VALUES (5, '行政部', '负责行政事务和办公事务', 2);
INSERT INTO `department` VALUES (6, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 2);
INSERT INTO `department` VALUES (7, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 3);
INSERT INTO `department` VALUES (8, '行政部', '负责行政事务和办公事务', 3);
INSERT INTO `department` VALUES (9, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 3);
INSERT INTO `department` VALUES (10, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 4);
INSERT INTO `department` VALUES (11, '行政部', '负责行政事务和办公事务', 4);
INSERT INTO `department` VALUES (12, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 4);
INSERT INTO `department` VALUES (13, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 5);
INSERT INTO `department` VALUES (14, '行政部', '负责行政事务和办公事务', 5);
INSERT INTO `department` VALUES (15, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 5);
INSERT INTO `department` VALUES (16, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 6);
INSERT INTO `department` VALUES (17, '行政部', '负责行政事务和办公事务', 6);
INSERT INTO `department` VALUES (18, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 6);

-- ----------------------------
-- Table structure for favor
-- ----------------------------
DROP TABLE IF EXISTS `favor`;
CREATE TABLE `favor`  (
  `favorId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `positionId` int(11) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`favorId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favor
-- ----------------------------
INSERT INTO `favor` VALUES (4, 2, 2);
INSERT INTO `favor` VALUES (5, 2, 15);
INSERT INTO `favor` VALUES (6, 2, 3);
INSERT INTO `favor` VALUES (7, 2, 5);
INSERT INTO `favor` VALUES (8, 3, 1);
INSERT INTO `favor` VALUES (9, 4, 6);
INSERT INTO `favor` VALUES (10, 4, 8);
INSERT INTO `favor` VALUES (11, 4, 8);
INSERT INTO `favor` VALUES (12, 6, 10);
INSERT INTO `favor` VALUES (13, 6, 11);
INSERT INTO `favor` VALUES (14, 6, 18);
INSERT INTO `favor` VALUES (17, 24, 2);
INSERT INTO `favor` VALUES (18, 27, 17);

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr`  (
  `hrId` int(11) NOT NULL AUTO_INCREMENT,
  `hrMobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hrPassword` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hrEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`hrId`) USING BTREE,
  UNIQUE INDEX `mobile_UNIQUE`(`hrMobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES (1, '15786586352', 'e10adc3949ba59abbe56e057f20f883e', '董一鸣', 'dongyiming@163.com', '行政部HR', 2);
INSERT INTO `hr` VALUES (2, '13685653625', 'e10adc3949ba59abbe56e057f20f883e', '张帆', 'zhangfan@163.com', '行政部HR', 5);
INSERT INTO `hr` VALUES (3, '18596475235', 'e10adc3949ba59abbe56e057f20f883e', '李斌', 'libin@163.com', '行政部HR', 8);
INSERT INTO `hr` VALUES (4, '16785253625', 'e10adc3949ba59abbe56e057f20f883e', '王语意', 'wangyuyi@163.com', '行政部HR', 11);
INSERT INTO `hr` VALUES (5, '17865253625', 'e10adc3949ba59abbe56e057f20f883e', '李星泽', 'lixingze@163.com', '行政部HR', 14);
INSERT INTO `hr` VALUES (6, '13958726395', 'e10adc3949ba59abbe56e057f20f883e', '程瑜', 'chengyu@163.com', '行政部HR', 17);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `newsTitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `newsContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻内容',
  `newsImage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `newsSource` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻来源',
  `newsReleaseTime` datetime(0) NULL DEFAULT NULL COMMENT '新闻发布时间',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`newsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资讯表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '百万岗位虚位以待，全国首个城市网络招聘节在嘉兴开幕', '2月22日下午，由嘉兴市人民政府主办的“嘉兴万家企业百万岗位网络招聘节”正式启动。包括五芳斋等名企在内的上万家企业将为全国求职者在线提供超过一百万个就业岗位，通过网络搭台，用工双方实现“无接触高效招聘', NULL, '人民网-浙江频道', '2020-02-29 00:00:00', '2020-03-21 12:23:51', '2020-03-21 12:23:53');
INSERT INTO `news` VALUES (2, '嘉兴打出“复工+招工”组合拳 网络招聘节吸引求职者50.3万人', '在疫情防控最吃劲的关键时刻，嘉兴坚决贯彻防疫和复工复产“两手抓、两手都要硬、两战都要赢”的工作要求，千方百计推进“复工+招工”，效果“杠杠的”——网络招聘节引爆“线上线下”求职热“在家就能找工作，不仅', NULL, '浙江新闻', '2020-02-29 00:00:00', '2020-03-21 12:24:41', '2020-03-21 12:24:43');
INSERT INTO `news` VALUES (3, '嘉兴：打“飞的”接员工回“嘉”上班', '随着新冠肺炎疫情防控进入新阶段，复工复产大潮在全国掀起。从2月10日开始，嘉兴各类企业都在忙着复工复产，人员短缺问题随之而来。包专车、包专列、包专机接返员工，人才关爱“八个一”服务，全国首个由地方城市', NULL, '嘉兴日报', '2020-02-29 00:00:00', '2020-03-21 12:25:15', '2020-03-21 12:25:17');
INSERT INTO `news` VALUES (4, '疫情之下在行动：百胜中国启动 “餐厅管理组爱心互助基金计划”', '疫情之下，很多企业都在为自己的员工默默的付出着，据BOSS直聘了解到，2020年2月5日，中国上海百胜中国控股有限公司（“百胜中国”，纽约证券交易所代码：YUMC）便宣布推出“餐厅管理组爱心互助基金计', NULL, 'BOSS直聘小哥哥', '2020-02-06 00:00:00', '2020-03-21 12:25:42', '2020-03-21 12:25:44');
INSERT INTO `news` VALUES (5, '请传阅！首个病毒防控指南正式发布', '日前，国家卫建委发布《新型冠状病毒防控指南（第一版）》，内容涵盖老年人防控指南、儿童防控指南、学生防控指南、幼儿园（或学校）防控指南、养老院防控指南、办公场所防控指南、交通工具防控指南、公共场所防控指', NULL, '人民网', '2020-02-03 00:00:00', '2020-03-21 12:26:22', '2020-03-21 12:26:24');
INSERT INTO `news` VALUES (6, 'BOSS直聘X包图网联合打造#职人生活摄影大赛#，诚邀你的参与！', '最近，BOSS直聘戏精编辑部收到一些摄影作品投稿，作者都是带着故事来的，想分享给身在职场的你。摄影by 王徐这是公司前同事遗留下来的盆栽，他是被领导以毫无任何优点为由辞退的，这盆盆栽也被遗弃在窗台角落', NULL, '职人生活摄影大赛', '2019-10-25 00:00:00', '2020-03-21 12:26:46', '2020-03-21 12:26:49');
INSERT INTO `news` VALUES (7, '乙组战报 | 2019中国网络媒体足球精英赛小组赛第三轮', '8月17日、18日，2019中国网络媒体足球精英赛小组赛在华夏醒狮足球俱乐部举行。在乙组第三轮的比赛中，乙A组36氪1:6快手，世纪互联5:0市委网信办；乙B组贝壳找房1:3中国网，北京新媒体集团0:', NULL, '直直', '2019-08-20 00:00:00', '2020-03-21 12:27:15', '2020-03-21 12:27:17');

-- ----------------------------
-- Table structure for news_detail
-- ----------------------------
DROP TABLE IF EXISTS `news_detail`;
CREATE TABLE `news_detail`  (
  `newsDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `newsDetailContent` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻详情内容',
  `newsId` int(11) NULL DEFAULT NULL COMMENT '新闻id',
  PRIMARY KEY (`newsDetailId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资讯详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news_detail
-- ----------------------------
INSERT INTO `news_detail` VALUES (1, '2月22日下午，由嘉兴市人民政府主办的“嘉兴万家企业百万岗位网络招聘节”正式启动。包括五芳斋等名企在内的上万家企业将为全国求职者在线提供超过一百万个就业岗位，通过网络搭台，用工双方实现“无接触高效招聘”，在全市企业复工复产上迈出了坚实的一步。\r\n\r\n市政府常务副市长徐淼指出，当前嘉兴各级政府部门都在积极行动，开展了“就业服务不打烊、网上招聘不停歇”春风行动，出台了一大批惠企政策，积极通过包车、包列、包机，接外地员工返城。希望通过“线上招聘+优惠政策”双管齐下，让活动有影响、政策出实效、企业有信心、员工得实惠、经济再发展。\r\n\r\n本次网络招聘节面向全国广大求职者，立足普工技工，面向高校技校，重点需要机电技术类、化工环保类、建筑工程类等职业工种。与传统招聘会不同的是，本次网络招聘节完全以线上招聘的形式展开。个人或企业可通过www.renlibao.cn网站及其微信小程序进入“会场”——招聘活动主页。活动主页设立了招聘区、求职区、中介区、宣传区、面试区、直播区等六大版块。企业、求职者、中介机构三方可在不同分区发布信息，实现招聘岗位与求职人员精准匹配。企业与求职者还可通过视频方式进行一对一远程面试，择优招录。启动仪式上，还发布了《嘉兴市疫情期间支持企业吸纳就业的若干意见》，围绕劳务输出地奖励、中介机构奖励、员工就业补贴、员工交通补助、企业招工补贴、企业线上职业培训奖励等方面推出7条支持政策，最大限度地调动各方积极性，专项支持当前企业用工。\r\n\r\n接下来，本次招聘节还将在线上进行一系列推广活动，及时传递招聘信息、跟进最新动态，助推招聘活动服务更多劳动者和用工企业。\r\n\r\n作为全国首个由地方城市发起的全网招聘节，将有效缓解本地企业用工紧缺的现状，在当前疫情防控背景下，高效推进企业复工复产。\r\n\r\n在严格落实中央和省“有序保障复工、恢复经济运行”总体部署，坚持防疫和复工复产两手抓，“两手都要硬，两战都要赢”的背景下，覆盖全网的招聘节体现了嘉兴市委、市政府稳企业、稳经济、稳发展的信心和决心，同时也为进一步创新人才政策，优化人才生态，打造人才高地添砖加瓦，让更多“千里马”在嘉禾大地竞相奔驰，助力嘉兴展翅高飞。（孔越）', 1);
INSERT INTO `news_detail` VALUES (2, '在疫情防控最吃劲的关键时刻，嘉兴坚决贯彻防疫和复工复产“两手抓、两手都要硬、两战都要赢”的工作要求，千方百计推进“复工+招工”，效果“杠杠的”——\r\n\r\n网络招聘节引爆“线上线下”求职热\r\n\r\n嘉兴打出“复工+招工”组合拳 网络招聘节吸引求职者50.3万人\r\n\r\n“在家就能找工作，不仅高效快捷，还有效避免不必要的接触。”2月27日下午，刚刚在“嘉兴万家企业百万岗位网络招聘节”平台上完成网签的李明高兴地说。他来自河南信阳，最近一直在关注网上的各类招聘信息，看到嘉兴举办网络招聘节，就立马注册，并向飞利浦（嘉兴）健康科技有限公司投递了简历。很快，他就在网上进行了视频面试，并完成了网签。\r\n\r\n就业是最大的民生。已经连续开展了5天的“嘉兴万家企业百万岗位网络招聘节”，使求职热度不减，线上服务不停，在线上线下都掀起了热潮。\r\n\r\n记者从嘉兴市人力社保局获悉，截至2月26日，全市招聘网站累计点击量达2821万次，注册企业1.7万家，发布招聘岗位23.8万个，吸引求职者50.3万人，达成求职意向4.4万人次。同时，组织全市76家人力资源机构，在疫情期间组成志愿组为全市企业恢复生产提供免费服务。平台上线“网签”功能不到1天时间，就有200多人签约成功，使招聘过程更高效便捷。\r\n\r\n“线上+线下”，全力以赴保障企业用工招聘。嘉兴在开展“嘉兴万家企业百万岗位网络招聘节”的同时，还积极开展省外驻点招工，前往安徽、河南、贵州、四川、云南等我省农民工用工数量集中的外省低风险地区，直接驻点当地，开展新员工的招录。\r\n\r\n“软硬兼施”全方位保障企业用工、员工返岗\r\n\r\n嘉兴打出“复工+招工”组合拳 网络招聘节吸引求职者50.3万人\r\n\r\n包车、包列、包机……连日来，嘉兴“硬核”举措颇受瞩目。截至2月26日，全市各级政府累计包车654辆、包列15列、包机10架，服务企业578家，接返外地员工近2.8万人。同时，该市还将加强各县（市、区）内部协调，针对员工输出地对应嘉兴市多个县（市、区）的情况，由市人力社保部门牵头，采取拼车、拼机、拼列的方式，先返“嘉”后，再由各地接回，全力以赴保障员工返岗返工。\r\n\r\n《关于进一步加强疫情防控做好稳就业工作促进和谐劳动关系的通知》、《嘉兴企业市外员工返工返岗指南》、《嘉兴市疫情期间支持企业吸纳就业的若干意见》，研究制定2020年市本级稳岗补贴、社保费返还落实文件，拟定新增就业岗位补贴和援企稳岗操作细则……嘉兴市打出了用工保供政策“组合拳”。\r\n\r\n2月10日启动的网上复工招募平台，鼓励全体市民参与复工复产。平台建立以来，已受理招聘企业459家，达成供需匹配7216人次。同时，组织全市76家人力资源机构，在疫情期间组成志愿组为全市企业恢复生产提供免费服务。\r\n\r\n记者 周静 通讯员 晓张', 2);
INSERT INTO `news_detail` VALUES (3, '随着新冠肺炎疫情防控进入新阶段，复工复产大潮在全国掀起。\r\n\r\n从2月10日开始，嘉兴各类企业都在忙着复工复产，人员短缺问题随之而来。包专车、包专列、包专机接返员工，人才关爱“八个一”服务，全国首个由地方城市发起的全网招聘活动——嘉兴万家企业百万岗位网络招聘节火热进行中……嘉兴在返岗复工中的种种创新举措备受关注。此前，嘉善县开启浙江省首架返程复工包机，之后，南湖区40家已复工复产重点工业企业的100名老员工乘坐包机从四川宜宾五粮液机场回“嘉”。\r\n\r\n2月21日17点45分，从贵州仁怀市飞往杭州萧山的MF8022次航班从茅台机场起飞，机上载着首批59名来自仁怀各乡镇的员工，他们将前往位于嘉兴市秀洲区王店镇的浙江台华新材料股份有限公司入职上岗。2月中旬开始，许多企业在政府部门组织下有序复工，复工就得有人。大量依赖外来员工的嘉兴企业面临着如何让工人出得来的问题。\r\n\r\n2月11日，嘉兴市出台交通运输服务企业返岗复工22条措施，随后，大量由政府和企业组织的专机、专列、专车从全国各地驶向嘉兴。\r\n\r\n2月18日，秀洲经济开发区（王店镇）组织用工缺口较大的几家规上企业，兵分三路赴四川省剑阁县、安岳县、贵州省仁怀市定点招聘和接返员工。\r\n\r\n接下来，还有第二批、第三批约1700名员工通过专车、专列和包机等形式，前往位于秀洲经济开发区的浙江台华新材料股份有限公司、浙江华岩针织有限公司、浙江东信电器有限公司等公司上班。', 3);
INSERT INTO `news_detail` VALUES (4, '疫情之下，很多企业都在为自己的员工默默的付出着，据BOSS直聘了解到，2020年2月5日，中国上海百胜中国控股有限公司（“百胜中国”，纽约证券交易所代码：YUMC）便宣布推出“餐厅管理组爱心互助基金计划”，在已有的商业保险基础上，为餐厅管理组员工升级家庭保障。该计划将从2020年7月实施，首批惠及人群预计将覆盖31000多名管理组员工的86000多名父母、配偶及子女。\r\n\r\n“2018年，百胜推出餐厅经理全家福计划，深受每一位餐厅经理和他们家人的欢迎。因此，我们一直在研究升级方案，希望为更多伙伴和家人提供健康保障，减轻伙伴们的后顾之忧。此次推出爱心互助基金计划，展现了公司关爱员工的一份诚意和承诺。“百胜中国首席执行官屈翠容（Joey Wat）女士表示百胜中国CEO屈翠容走访旗下品牌餐厅慰问一线员工\r\n\r\n该计划是对管理组员工现有商业保险的进一步补充，增加了父母重大疾病保障、子女和配偶意外保障，并特别为父母定制了重疾就医绿色通道。\r\n\r\n“在举国抗击疫情的时期，每一位百胜中国的员工都是这场战役中的英雄。每一天，他们都坚守岗位，守护着顾客的健康。未来，百胜希望能陪伴他们一起，守护家人的健康，回报家人的支持与关爱。”屈翠容表示。\r\n\r\n此次，百胜秉持着“一家有需要，百胜共守护”的原则，建立了爱心互助基金。根据计划，员工在自愿的前提下，每年只需在基金池内投入少量的费用，就能为父母购买重疾保障、为配偶和子女购买意外保障，公司将承担其余所有费用。同时，为了覆盖更多受益人群，百胜特别打破行业标准，将父母的保障年龄提升到75周岁，子女的保障年龄提升到22周岁。\r\n\r\n“此次推出爱心互助基金计划，旨在为管理组提供切实所需的帮助。在百胜中国，90%以上的管理组为80后和90后，他们都是家庭的支柱，是公司的支柱，也是社会的中流砥柱。我们希望，能够让每一位伙伴都成为行业内最有自豪感的先锋，和公司共同创造业绩、共同分享成功、共同实现成长。”百胜中国首席人力资源官袁耀宗（Aiken Yuen）表示。\r\n\r\n百胜中国为餐厅管理组提供完善的培训和发展计划，并提供具有竞争力的全面薪酬制度，这也是百胜激活人才潜力，领先行业的最重要秘诀之一。\r\n\r\n关于百胜中国\r\n\r\n百胜中国控股有限公司是Yum! Brands在中国大陆的特许经营商。百胜中国拥有肯德基、必胜客和塔可贝尔三大品牌在中国大陆的独家运营和授权经营权。肯德基是中国领先的快餐品牌；必胜客是中国市场领先的休闲餐饮品牌；塔可贝尔是源自美国加州的连锁餐饮品牌，提供创新美式墨西哥食品。百胜中国还完全拥有小肥羊、东方既白和COFFii & JOY连锁餐饮品牌。截至2019年9月底，百胜中国在1300多座城镇经营着8900多家餐厅。百胜中国在2019年《财富》美国500强排名第362位。百胜中国于2019年、2020年连续两年入选彭博性别平等指数，并荣获中国杰出雇主认证。\r\n\r\n\r\n\r\n想加入这家对员工超有爱的公司吗？马上去搜索百胜中国的岗位，与百胜的BOSS们直接开聊吧，聊好还有视频面试功能，可以先网面延期入职哦', 4);
INSERT INTO `news_detail` VALUES (5, '日前，国家卫建委发布《新型冠状病毒防控指南（第一版）》，内容涵盖老年人防控指南、儿童防控指南、学生防控指南、幼儿园（或学校）防控指南、养老院防控指南、办公场所防控指南、交通工具防控指南、公共场所防控指南、居家隔离防控指南等几大方面。\r\n\r\n\r\n\r\n【一】特殊人群防控指南\r\n\r\n一、老年人防控指南\r\n\r\n1.确保老人掌握预防新型冠状病毒感染的肺炎的个人防护措施、手卫生要求、卫生和健康习惯，避免共用个人物品，注意通风，落实消毒措施。倡导老人养成经常洗手的好习惯。\r\n\r\n2.老人出现发热、咳嗽、咽痛、胸闷、呼吸困难、乏力、恶心呕吐、腹泻、结膜炎、肌肉酸痛等可疑症状时，应采取以下措施：\r\n\r\n（1）自我隔离，避免与其他人员近距离接触。\r\n\r\n（2）由医护人员对其健康状况进行评估，视病情状况送至医疗机构就诊，送医途中应佩戴医用外科口罩，尽量避免乘坐公共交通工具。\r\n\r\n（3）曾与可疑症状者有无有效防护的密切接触者，应立即登记，并进行医学观察。\r\n\r\n（4）减少不必要的聚会、聚餐等群体性活动，不安排集中用餐。\r\n\r\n（5）若出现可疑症状的老人被确诊为新型冠状病毒感染的肺炎，其密切接触者应接受14天医学观察。病人离开后（如住院、死亡等），应及时对住所进行终末消毒。具体消毒方式由当地疾控机构的专业人员或具有资质的第三方操作或指导。没有消毒前，该住所不建议使用。\r\n\r\n\r\n\r\n二、儿童防控指南\r\n\r\n1.不要去人多的地方，不参加聚会。\r\n\r\n2.外出一定要戴上口罩，记得提醒爸爸妈妈和爷爷奶奶戴好口罩。\r\n\r\n3.作息规律，健康饮食。饭前便后认真洗手。在家多和爸爸、妈妈一起做做体育运动。\r\n\r\n4.从现在起，养成打喷嚏或咳嗽时用纸巾或袖肘遮住嘴巴、鼻子的习惯。\r\n\r\n5.如果有发烧、生病的情况，一定要配合爸爸、妈妈及时去医院就医。\r\n\r\n\r\n\r\n三、学生防控指南\r\n\r\n1.寒假期间\r\n\r\n（1）有疫情高发地区（如武汉等地区）居住史或旅行史的学生，自离开疫情高发地区后，居家或在指定场所医学观察14天。\r\n\r\n（2）各地学生均应尽量居家，减少走亲访友、聚会聚餐，减少到人员密集的公共场所活动，尤其是空气流动性差的地方。\r\n\r\n（3）建议学生每日进行健康监测，并根据社区或学校要求向社区或学校指定负责人报告。\r\n\r\n（4）寒假结束时，学生如无可疑症状，可正常返校。如有可疑症状，应报告学校或由监护人报告学校，及时就医，待痊愈后再返校。\r\n\r\n2.返校途中\r\n\r\n（1）乘坐公共交通工具时全程佩戴医用外科口罩或N95口罩。\r\n\r\n（2）随时保持手卫生，减少接触交通工具的公共物品和部位。\r\n\r\n（3）旅途中做好健康监测，自觉发热时要主动测量体温。\r\n\r\n（4）留意周围旅客健康状况，避免与可疑症状人员近距离接触。\r\n\r\n（5）若旅途中出现可疑症状，应主动戴上医用外科口罩或N95口罩，尽量避免接触其他人员，并视病情及时就医。\r\n\r\n（6）旅途中如需去医疗机构就诊时，应主动告诉医生相关疾病流行地区的旅行居住史，配合医生开展相关调查。\r\n\r\n（7）妥善保存旅行票据信息，以配合可能的相关密切接触者调查。\r\n\r\n', 5);
INSERT INTO `news_detail` VALUES (6, '最近，BOSS直聘戏精编辑部收到一些摄影作品投稿，作者都是带着故事来的，想分享给身在职场的你。这是公司前同事遗留下来的盆栽，他是被领导以毫无任何优点为由辞退的，这盆盆栽也被遗弃在窗台角落，无人问津。直到某个寒冷的下午，一缕阳光照射在它身上，作者拿着手机换了个角度，拍下了这张照片，发现它其实可以很美。这张《夜雨》图是作者在一个雨天打出租拍到的。这是作者下班后抬头看见的深夜，是在大城市日复一日打拼的夜，是有人和你一起努力的夜。这是作者在三里屯工作时拍摄到的一张三里屯SOHO大楼图。虽然已是深夜，但大楼里依旧灯火通明，职场人忙碌的身影依稀可见。\r\n\r\n\r\n\r\n以上是他们的故事。\r\n\r\n我这里有钱，你有故事吗？\r\n\r\n身在职场，总有那么一个\r\n\r\n与工作有关的瞬间或物品你想定格下来。\r\n\r\n比如上班途中拥挤的地铁人群，\r\n\r\n下班途中看到的美丽晚霞，\r\n\r\n比如工位上女朋友送你的一盆陪伴你的绿植，\r\n\r\n又比如炫丽的玻璃幕墙大厦等等。\r\n\r\n\r\n\r\nBOSS直聘和包图网发起\r\n\r\n#职人生活摄影大赛#\r\n\r\n6000元现金奖励等大家来拿\r\n\r\n前往【包图网】官网\r\n\r\n点击首页大赛banner位即可上传作品参赛', 6);
INSERT INTO `news_detail` VALUES (7, '8月17日、18日，2019中国网络媒体足球精英赛小组赛在华夏醒狮足球俱乐部举行。\r\n\r\n在乙组第三轮的比赛中，\r\n\r\n乙A组36氪1:6快手，世纪互联5:0市委网信办；\r\n\r\n乙B组贝壳找房1:3中国网，北京新媒体集团0:1中国新闻网；\r\n\r\n乙C组央视网1:1汽车之家，爱奇艺3:0一点资讯；\r\n\r\n乙D组看准科技10:0 91科技，中华网0:8第一视频集团。\r\n\r\n本届中国网络媒体足球精英赛小组赛第三轮乙组共打进40粒进球。\r\n\r\n\r\n\r\n\r\n看准科技 10:0 91科技\r\n\r\n\r\n\r\n\r\n36氪 1:6 快手\r\n\r\n\r\n\r\n世纪互联 5:0 市委网信办\r\n\r\n\r\n贝壳找房 1:3 中国网\r\n\r\n北京新媒体集团 0:1 中国新闻网\r\n\r\n\r\n央视网 1:1 汽车之家\r\n\r\n\r\n爱奇艺 3:0 一点资讯\r\n\r\n中华网 0:8 第一视频集团', 7);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `positionId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  `requirement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '要求',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `workCity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `salaryUp` int(11) NULL DEFAULT NULL COMMENT '最高薪资',
  `salaryDown` int(11) NULL DEFAULT NULL COMMENT '最低薪资',
  `releaseDate` date NULL DEFAULT NULL COMMENT '发布日期',
  `validDate` date NULL DEFAULT NULL COMMENT '有效日期',
  `statePub` int(11) NULL DEFAULT NULL COMMENT '公共声明',
  `hits` int(11) NULL DEFAULT 0 COMMENT '点击数',
  `categoryId` int(11) NOT NULL COMMENT '职称id',
  `departmentId` int(11) NOT NULL COMMENT '部门id',
  `hrIdPub` int(11) NOT NULL,
  PRIMARY KEY (`positionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 'Java工程师', '熟练使用RPC框架，具备相关的分布式开发经验', 3, '北京市', 12000, 7000, '2017-10-27', NULL, 1, 145, 1, 1, 1);
INSERT INTO `position` VALUES (2, 'Java工程师', '接收应届实习生，实习期满应聘上岗接收应届实习生，实习期满应聘上岗收应届实习生，实习期满应聘上岗', 5, '上海市', 16000, 11000, '2017-11-07', NULL, 1, 121, 1, 4, 2);
INSERT INTO `position` VALUES (3, 'Java工程师', '有扎实的java基础，熟悉分布式、缓存、异步消息等原理和应用', 15, '天津市', 13000, 10000, '2017-09-30', NULL, 1, 3, 1, 7, 3);
INSERT INTO `position` VALUES (4, 'Java工程师', 'JAVA WEB方向2年+经验', 2, '南京市', 16000, 12000, '2017-09-25', NULL, 1, 8, 1, 10, 4);
INSERT INTO `position` VALUES (5, 'C++工程师', '可接收计算机相关专业应届生，表现优秀者加薪转正', 30, '南京市', 8000, 5000, '2017-10-16', NULL, 1, 16, 2, 10, 4);
INSERT INTO `position` VALUES (6, 'C++工程师', '3-5年工作经验，计算机相关专业毕业', 1, '上海市', 16000, 8000, '2017-11-03', NULL, 1, 4, 2, 4, 2);
INSERT INTO `position` VALUES (7, 'PHP工程师', '一年以上PHP开发经验 （项目经验丰富的，也可以升级为高级开发工程师）', 10, '上海市', 11000, 8000, '2017-11-10', NULL, 1, 82, 3, 4, 2);
INSERT INTO `position` VALUES (8, 'PHP工程师', '熟悉LNMP/WNMP开发环境 , 熟练使用Yaf, Yii, ThinkPHP等一种或多种框架', 5, '上海市', 12000, 7000, '2017-11-01', NULL, 1, 1, 3, 4, 2);
INSERT INTO `position` VALUES (9, '.NET工程师', '熟悉WinForm/WPF窗体开发并有实际项目经验', 2, '北京市', 13000, 11000, '2017-11-02', NULL, 1, 11, 4, 1, 1);
INSERT INTO `position` VALUES (10, 'Python数据分析', '熟练使用Linux，可以快速上手编写shell、powershell、cmd等操作系统脚本', 2, '北京市', 23000, 18000, '2017-10-09', NULL, 1, 44, 5, 1, 1);
INSERT INTO `position` VALUES (11, 'Python开发', '4年以上互联网产品后台研发经验，2年以上后台构架经验', 2, '北京市', 22000, 18000, '2017-09-23', NULL, 1, 0, 5, 1, 1);
INSERT INTO `position` VALUES (12, 'Python开发', '精通Python，2年或以上Python项目经验', 3, '天津市', 16000, 14000, '2017-07-27', NULL, 1, 36, 5, 7, 3);
INSERT INTO `position` VALUES (13, '数据挖掘工程师', '熟悉 Linux平台上的编程环境，精通Java开发，精通 Python/Shell等脚本语言', 12, '天津市', 22000, 15000, '2017-11-05', NULL, 1, 4, 6, 7, 3);
INSERT INTO `position` VALUES (14, '数据挖掘工程师', '熟悉Hadoop、Hive、Spark、流式计算、实时计算等大数据相关技术者优先，熟悉时序挖掘、文本挖掘、网络挖掘等优先', 2, '北京市', 32000, 28000, '2017-11-06', NULL, 1, 22, 6, 1, 1);
INSERT INTO `position` VALUES (15, '数据挖掘工程师', '精通Python，熟悉PHP/GO/Java/C++/C等语言中的一种或几种', 2, '杭州市', 26000, 14000, '2017-11-08', NULL, 1, 21, 6, 13, 5);
INSERT INTO `position` VALUES (16, 'Java工程师', '熟悉Spring、Freemark、Struts、Hibernate 等开源框架', 13, '杭州市', 18000, 15000, '2017-11-11', NULL, 1, 8, 1, 17, 6);
INSERT INTO `position` VALUES (17, 'Java后端开发', '熟练使用Mybatis，SpringMVC，SpringCloud等框架', 5, '杭州市', 21000, 18000, '2017-10-23', NULL, 1, 5, 1, 13, 5);
INSERT INTO `position` VALUES (18, 'C++后端开发', '熟练linux系统操作，熟练gcc,gdb,vim, eclipse等开发工具', 5, '北京市', 12000, 9000, '2017-10-28', NULL, 1, 0, 2, 1, 1);

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `resumeId` int(11) NOT NULL AUTO_INCREMENT,
  `ability` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专业能力',
  `internship` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '实习经历',
  `workExperience` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作经历',
  `certificate` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '获得荣誉',
  `jobDesire` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '就职期望',
  `userId` int(11) NOT NULL COMMENT '用户i的',
  PRIMARY KEY (`resumeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简历表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `resume` VALUES (2, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `resume` VALUES (3, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `resume` VALUES (4, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `resume` VALUES (5, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `resume` VALUES (6, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `resume` VALUES (7, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `resume` VALUES (8, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO `resume` VALUES (9, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO `resume` VALUES (10, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO `resume` VALUES (11, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `resume` VALUES (12, NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO `resume` VALUES (13, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `resume` VALUES (14, NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO `resume` VALUES (17, NULL, NULL, NULL, NULL, NULL, 17);
INSERT INTO `resume` VALUES (21, NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `resume` VALUES (24, '写点什么。。。', '写点什么。。。', '写点什么。。。', '写点什么。。。', '写点什么。。。', 24);
INSERT INTO `resume` VALUES (25, '专业能力么。。。也就能悄悄代码', '还没毕业，也没啥实习经历~', '无实际工作经历~', '拿过几次奖学金吧', '有一份别太累稳定的工作就好。。。', 25);
INSERT INTO `resume` VALUES (26, NULL, NULL, NULL, NULL, NULL, 26);
INSERT INTO `resume` VALUES (27, 'dd', 'dd', 'dd', 'dd', 'dd', 27);
INSERT INTO `resume` VALUES (28, NULL, NULL, NULL, NULL, NULL, 28);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别',
  `birthYear` int(11) NULL DEFAULT NULL COMMENT '出生年份',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `eduDegree` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `graduation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `graYear` int(11) NULL DEFAULT NULL COMMENT '毕业年份',
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主修专业',
  `dirDesire` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `user_id_UNIQUE`(`userId`) USING BTREE,
  UNIQUE INDEX `user_mobile_UNIQUE`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '13754258565', '4QrcOUm6Wau+VuBX8g+IPg==', '夏高兴', 0, NULL, '云淡天高', 'xiagaoxin@163.com', '北京市', '北京市', '硕士', '中南财经政法大学', NULL, NULL, 3);
INSERT INTO `user` VALUES (2, '16873315255', '4QrcOUm6Wau+VuBX8g+IPg==', '沈茂德', 0, NULL, '冷酷的云', 'shenmaode@163.com', '北京市', '北京市', '本科', '湖南师范大学', NULL, NULL, 3);
INSERT INTO `user` VALUES (3, '16535356412', '4QrcOUm6Wau+VuBX8g+IPg==', '杜文瑞', 0, NULL, '我心寂寞', 'duwenrui@163.com', '上海市', '上海市', '本科', '东北财经大学', NULL, NULL, 1);
INSERT INTO `user` VALUES (4, '15785658371', '4QrcOUm6Wau+VuBX8g+IPg==', '彭友卉', 0, NULL, '尘封记忆', 'pengyouhui@163.com', '上海市', '上海市', '本科', '西南大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (5, '16735259632', '4QrcOUm6Wau+VuBX8g+IPg==', '崔谷槐', 0, NULL, '飘雪无垠', 'cuiguhuai@163.com', '上海市', '上海市', '本科', '苏州大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (6, '17898763255', '4QrcOUm6Wau+VuBX8g+IPg==', '魏茂材', 0, NULL, '风过无痕', 'weimaocai@163.com', '广东省', '广州市', '本科', '西北大学', NULL, NULL, 6);
INSERT INTO `user` VALUES (7, '17563522636', '4QrcOUm6Wau+VuBX8g+IPg==', '侯成文', 0, 1997, '星月相随', 'huochengwen', '湖北省', '武汉市', '硕士', '上海财经大学', 2019, '国际金融', 3);
INSERT INTO `user` VALUES (8, '18936258863', '4QrcOUm6Wau+VuBX8g+IPg==', '邵夜云', 1, NULL, '低调沉默者', 'shaoyeyun@163.com', '北京市', '北京市', '本科', '江苏大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (9, '13752533625', '4QrcOUm6Wau+VuBX8g+IPg==', '方彭湃', 1, NULL, '梦醒童话', 'fangpengpai@163.com', '天津市', '天津市', '硕士', '西南政法大学', NULL, NULL, 4);
INSERT INTO `user` VALUES (10, '15763968252', '4QrcOUm6Wau+VuBX8g+IPg==', '熊新觉', 1, NULL, '咖啡的味道', 'xiongxinjue@163.com', '广东省', '广州市', '本科', '重庆医科大学', NULL, NULL, 3);
INSERT INTO `user` VALUES (11, '13685259986', '4QrcOUm6Wau+VuBX8g+IPg==', '肖又香', 1, NULL, '悬世尘埃', 'xiaoyouxiang@163.com', '浙江省', '杭州市', '大专', '福建师范大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (12, '15788875236', '4QrcOUm6Wau+VuBX8g+IPg==', '严经纶', 0, NULL, '冰封夕阳', 'yanjinlun@163.com', '浙江省', '杭州市', '本科', '广州中医药大学', NULL, NULL, 6);
INSERT INTO `user` VALUES (13, '18766635865', '4QrcOUm6Wau+VuBX8g+IPg==', '邓和豫', 1, NULL, '隐水酣龙', 'dengheyu@163.com', '浙江省', '杭州市', '本科', '哈尔滨工程大学', NULL, NULL, 1);
INSERT INTO `user` VALUES (14, '15623527861', '4QrcOUm6Wau+VuBX8g+IPg==', '邓雪风', 0, NULL, '一顿小皮锤', 'dengxuefeng@163.com', '江苏省', '南京市', '本科', '暨南大学', NULL, NULL, 4);
INSERT INTO `user` VALUES (17, '15726928003', '4QrcOUm6Wau+VuBX8g+IPg==', '龟龟', 0, NULL, '龟龟', 'guigui@163.com', '广东省', '中山市', '本科', '华东理工大学', NULL, NULL, 0);
INSERT INTO `user` VALUES (21, '13957336750', '4QrcOUm6Wau+VuBX8g+IPg==', '木木', 0, NULL, '木木', 'mumu@163.com', '湖北省', '武汉市', '本科', '天津科技大学', NULL, NULL, 0);
INSERT INTO `user` VALUES (24, '17863954768', '4QrcOUm6Wau+VuBX8g+IPg==', '轩', 0, 1997, '轩', 'xuan@163.com', '山东省', '青岛市', '本科', '青岛科技大学', 2019, '软件工程', 2);
INSERT INTO `user` VALUES (25, '17812345687', '4QrcOUm6Wau+VuBX8g+IPg==', '青柠', 0, 1997, '青柠', 'babycoder@foxmail.com', '浙江省', '杭州市', '本科', '青岛科技大学', 2019, '软件', 1);
INSERT INTO `user` VALUES (27, '15570069597', '4QrcOUm6Wau+VuBX8g+IPg==', 'zhangsan', 0, 1997, 'hutter', '88888@qq.com', '浙江省', '杭州市', '本科', '杭州电子科技大学', 2019, '计算机与科学', 1);
INSERT INTO `user` VALUES (28, '15570069598', '4QrcOUm6Wau+VuBX8g+IPg==', NULL, 0, 0, 'admin', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
