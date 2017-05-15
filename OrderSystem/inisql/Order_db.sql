-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: order_db
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_ dining`
--

DROP TABLE IF EXISTS `tb_ dining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ dining` (
  `ding_number` int(11) NOT NULL COMMENT '餐桌编号',
  `ding_name` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '餐桌名字',
  `ding_location` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '餐桌位置',
  `ding_status` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '空闲',
  `ding_type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ding_is_window` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ding_serve` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ding_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`ding_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ dining`
--

LOCK TABLES `tb_ dining` WRITE;
/*!40000 ALTER TABLE `tb_ dining` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ dining` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart`
--

DROP TABLE IF EXISTS `tb_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart` (
  `cart_id` int(11) NOT NULL COMMENT '购物车外键',
  `user_id` int(11) NOT NULL COMMENT '购物车对应用户外键',
  `ding_id` int(11) NOT NULL COMMENT '购物车对应餐桌外键',
  PRIMARY KEY (`cart_id`,`ding_id`),
  KEY `fk_cart_user_id_key_idx` (`user_id`),
  KEY `fk_cart_ding_id_key_idx` (`ding_id`),
  CONSTRAINT `fk_cart_ding_id_key` FOREIGN KEY (`ding_id`) REFERENCES `tb_ dining` (`ding_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_user_id_key` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart`
--

LOCK TABLES `tb_cart` WRITE;
/*!40000 ALTER TABLE `tb_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_greens`
--

DROP TABLE IF EXISTS `tb_cart_greens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_greens` (
  `cg__id` int(11) NOT NULL COMMENT '购物车和菜品的联合表的id',
  `cart_id` int(11) NOT NULL COMMENT '购物车ID',
  `greens_id` int(11) NOT NULL COMMENT '菜品id',
  PRIMARY KEY (`cg__id`),
  KEY `fk_cartGreens_cart_id_key_idx` (`cart_id`),
  KEY `fk_cartGreens_greens_id_key_idx` (`greens_id`),
  CONSTRAINT `fk_cartGreens_cart_id_key` FOREIGN KEY (`cart_id`) REFERENCES `tb_cart` (`cart_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartGreens_greens_id_key` FOREIGN KEY (`greens_id`) REFERENCES `tb_greens` (`greens_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车和菜品的联合表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_greens`
--

LOCK TABLES `tb_cart_greens` WRITE;
/*!40000 ALTER TABLE `tb_cart_greens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_greens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_greens`
--

DROP TABLE IF EXISTS `tb_greens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_greens` (
  `greens_id` int(11) NOT NULL,
  `greens_name` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '菜品名字',
  `greens_img_location` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '菜品图片位置',
  `greens_pabulum` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '营养价值',
  `greens_cost` float NOT NULL COMMENT '成本',
  `greens_price` float NOT NULL COMMENT '价格',
  PRIMARY KEY (`greens_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_greens`
--

LOCK TABLES `tb_greens` WRITE;
/*!40000 ALTER TABLE `tb_greens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_greens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_greens_production`
--

DROP TABLE IF EXISTS `tb_greens_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_greens_production` (
  `gp_id` int(11) NOT NULL COMMENT '菜品制作表id',
  `greens_id` int(11) NOT NULL COMMENT '菜品id',
  `greens_pre_time` int(11) NOT NULL COMMENT '菜品准备时间（单位分钟）',
  `greens_cook_time` int(11) NOT NULL COMMENT '菜品烹饪时间（单位分钟）',
  PRIMARY KEY (`gp_id`),
  KEY `fk_gp_greens_id_key_idx` (`greens_id`),
  CONSTRAINT `fk_gp_greens_id_key` FOREIGN KEY (`greens_id`) REFERENCES `tb_greens` (`greens_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品制作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_greens_production`
--

LOCK TABLES `tb_greens_production` WRITE;
/*!40000 ALTER TABLE `tb_greens_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_greens_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_greens_variety_menu`
--

DROP TABLE IF EXISTS `tb_greens_variety_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_greens_variety_menu` (
  `gvm_id` int(11) NOT NULL,
  `greens_id` int(11) DEFAULT NULL COMMENT '菜品id',
  `greensfm_id` int(11) DEFAULT NULL COMMENT '一级菜单id',
  PRIMARY KEY (`gvm_id`),
  KEY `fk_gvm_greens_id_key_idx` (`greens_id`),
  KEY `fk_gvm_greensfm_id_key_idx` (`greensfm_id`),
  CONSTRAINT `fk_gvm_greens_id_key` FOREIGN KEY (`greens_id`) REFERENCES `tb_greens` (`greens_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gvm_greensfm_id_key` FOREIGN KEY (`greensfm_id`) REFERENCES `tb_greensfirstmenu` (`menu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_greens_variety_menu`
--

LOCK TABLES `tb_greens_variety_menu` WRITE;
/*!40000 ALTER TABLE `tb_greens_variety_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_greens_variety_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_greensfirstmenu`
--

DROP TABLE IF EXISTS `tb_greensfirstmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_greensfirstmenu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '一级菜单名',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='一级菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_greensfirstmenu`
--

LOCK TABLES `tb_greensfirstmenu` WRITE;
/*!40000 ALTER TABLE `tb_greensfirstmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_greensfirstmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order`
--

DROP TABLE IF EXISTS `tb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order` (
  `o_id` int(11) NOT NULL COMMENT '订单表id',
  `o_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单时间',
  `o_staus` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '未支付' COMMENT '订单状态，是否支付',
  `o_endtime` timestamp NULL DEFAULT NULL COMMENT '用餐结束时间',
  `user_id` int(11) NOT NULL COMMENT '用户外键',
  PRIMARY KEY (`o_id`),
  KEY `fk_order_user_id_key_idx` (`user_id`),
  CONSTRAINT `fk_order_user_id_key` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order`
--

LOCK TABLES `tb_order` WRITE;
/*!40000 ALTER TABLE `tb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_greens`
--

DROP TABLE IF EXISTS `tb_order_greens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_greens` (
  `og_id` int(11) NOT NULL COMMENT '订单和对应菜品的联合表的id',
  `greens_id` int(11) NOT NULL COMMENT '菜品外键',
  `o_id` int(11) NOT NULL COMMENT '订单外键',
  `og_staus` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT '未制作' COMMENT '订单中这个菜品的状态（上菜，为上菜，烹饪，未制作）',
  `og_wait_time` int(11) NOT NULL DEFAULT '0' COMMENT '菜品等待时间',
  PRIMARY KEY (`og_id`),
  KEY `fk_og_order_id_key_idx` (`o_id`),
  KEY `fk_og_greens_id_key_idx` (`greens_id`),
  CONSTRAINT `fk_og_greens_id_key` FOREIGN KEY (`greens_id`) REFERENCES `tb_greens` (`greens_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_og_order_id_key` FOREIGN KEY (`o_id`) REFERENCES `tb_order` (`o_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单与菜品的联合表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_greens`
--

LOCK TABLES `tb_order_greens` WRITE;
/*!40000 ALTER TABLE `tb_order_greens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_greens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_privilege`
--

DROP TABLE IF EXISTS `tb_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_privilege` (
  `pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `pri_name` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '优惠名',
  `pri_desc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '优惠描述',
  PRIMARY KEY (`pri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='优惠表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_privilege`
--

LOCK TABLES `tb_privilege` WRITE;
/*!40000 ALTER TABLE `tb_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sort`
--

DROP TABLE IF EXISTS `tb_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sort` (
  `sort_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '排序名',
  `sort_desc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '排序描述',
  PRIMARY KEY (`sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sort`
--

LOCK TABLES `tb_sort` WRITE;
/*!40000 ALTER TABLE `tb_sort` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  ` user_phone` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '用户电话号码',
  `user_email` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '用户邮箱',
  `user_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-15 22:47:51
