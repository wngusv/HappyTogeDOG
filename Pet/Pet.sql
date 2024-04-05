-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 192.168.0.106    Database: pet
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `content` text,
  `ofile` varchar(45) DEFAULT NULL,
  `sfile` varchar(45) DEFAULT NULL,
  `postdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(10) DEFAULT NULL,
  `sympathy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `id_idx` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (8,'급해요','긴급','급해요 완전 급해요ㅎㅇㄱㅎㅇㄱㅇㄱㅎㅇㄱㅎㅇㅌㄱㅎㅇㄱㅎㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ','춘식16.png','20240403_13912835.png','2024-04-03 13:09:10','rkdud',NULL),(9,'sdfsdf','소통','sdfsdfsdf','자바로고.png','20240403_13115590.png','2024-04-03 13:11:53','rkdud',NULL),(12,'ㅇ','소통','ㅇ','','20240403_16121779','2024-04-03 16:12:15','rkdud',NULL),(13,'ㅇ','소통','ㅇㅇ','','20240403_161220204','2024-04-03 16:12:19','rkdud',NULL),(14,'ㅇ','소통','ㅇ','','20240403_161223448','2024-04-03 16:12:22','rkdud',NULL),(15,'ㅇ','소통','ㅇ','','20240403_161226584','2024-04-03 16:12:25','rkdud',NULL),(16,'ㅇ','소통','ㅇ','','20240403_161232401','2024-04-03 16:12:31','rkdud',NULL),(17,'ㅇ','소통','ㅇ','','20240403_16123625','2024-04-03 16:12:34','rkdud',NULL),(18,'ㅇ','소통','ㅇ','','20240403_161239198','2024-04-03 16:12:38','rkdud',NULL),(19,'ㅇ','소통','ㅇㅇ','','20240403_161255929','2024-04-03 16:12:54','rkdud',NULL),(20,'개 사료 후기','후기','맛있네요','춘식1.png','20240403_161637831.png','2024-04-03 16:16:36','rkdud',NULL),(22,'회원','소통','회우너','','20240404_173356605','2024-04-04 17:33:54','rkdud',NULL),(23,'급해용','긴급','급행열차','','20240405_95148470','2024-04-05 09:51:46','wngus',NULL),(24,'asd','소통','asd','','20240405_104434828','2024-04-05 10:44:33','asd',NULL),(25,'ㄹㄴㄹ','소통','ㅇㄹㅇㄴ','','20240405_15485912','2024-04-05 15:48:56','rkdud',NULL),(26,'안녕하세요','소통','ㅎㅇㅎㅇ','','20240405_155327946','2024-04-05 15:53:25','rkdguse',NULL),(27,'asd','소통','asd','강아지비추천.PNG','20240405_155345294.PNG','2024-04-05 15:53:42','asd',NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `post_idx` int NOT NULL,
  `id` varchar(45) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  KEY `post_idx_idx` (`post_idx`),
  CONSTRAINT `post_idx` FOREIGN KEY (`post_idx`) REFERENCES `board` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (19,'rkdud','추천'),(22,'wngus','비추천'),(23,'wngus','추천'),(23,'asd','추천'),(20,'rkdguse','비추천'),(15,'rkdguse','비추천'),(23,'rkdguse','추천'),(27,'rkdguse','추천'),(25,'rkdguse','추천'),(20,'rkdud','추천'),(20,'asd','비추천'),(27,'asd','비추천'),(17,'asd','추천'),(22,'asd','추천'),(25,'asd','비추천');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_content`
--

DROP TABLE IF EXISTS `comment_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_content` (
  `num` int NOT NULL AUTO_INCREMENT,
  `post_idx` int DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `content_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `like` int NOT NULL DEFAULT '0',
  `dislike` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`num`),
  KEY `post_idx_idx` (`post_idx`),
  KEY `id_idx` (`id`),
  CONSTRAINT `content_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `content_post_idx` FOREIGN KEY (`post_idx`) REFERENCES `board` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_content`
--

LOCK TABLES `comment_content` WRITE;
/*!40000 ALTER TABLE `comment_content` DISABLE KEYS */;
INSERT INTO `comment_content` VALUES (1,20,'rkdud','디비에 들어가라','2024-04-04 15:35:52',1,0),(2,22,'rkdud','ㅎㅎ','2024-04-04 19:14:56',0,0),(3,20,'rkdud','ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ','2024-04-04 19:17:47',0,1),(4,20,'wngus','헐 대박대박','2024-04-05 09:52:01',0,1),(5,20,'wngus','헐 대박대박','2024-04-05 09:54:50',2,0),(6,20,'wngus','헐 대박','2024-04-05 09:59:13',1,0),(7,24,'asd','asdasd','2024-04-05 10:45:04',0,1),(8,24,'asd','zcvawert','2024-04-05 10:45:12',1,0),(11,23,'rkdud','헉\r\n','2024-04-05 15:01:18',1,0),(12,26,'asd','어쩌라고요 나가세요','2024-04-05 15:54:41',2,0),(13,27,'rkdud','ㅇㅇ','2024-04-05 16:06:32',1,0),(14,26,'rkdud','하하하ㅏ','2024-04-05 17:29:44',0,0),(15,26,'rkdud','하하하핳ㅎㅎㅎㅎㅎㅎ','2024-04-05 17:31:04',0,0);
/*!40000 ALTER TABLE `comment_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_likeordislike`
--

DROP TABLE IF EXISTS `comment_likeordislike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_likeordislike` (
  `num` int DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  KEY `num_idx` (`num`),
  CONSTRAINT `num` FOREIGN KEY (`num`) REFERENCES `comment_content` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likeordislike`
--

LOCK TABLES `comment_likeordislike` WRITE;
/*!40000 ALTER TABLE `comment_likeordislike` DISABLE KEYS */;
INSERT INTO `comment_likeordislike` VALUES (7,'asd','싫어요'),(8,'asd','좋아요'),(11,'rkdud','좋아요'),(1,'rkdud','좋아요'),(3,'rkdud','싫어요'),(12,'asd','좋아요'),(13,'rkdud','좋아요'),(4,'rkdud','싫어요'),(5,'rkdud','좋아요'),(6,'rkdud','좋아요'),(5,'asd','좋아요'),(12,'rkdud','좋아요');
/*!40000 ALTER TABLE `comment_likeordislike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dogwalker`
--

DROP TABLE IF EXISTS `dogwalker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dogwalker` (
  `num` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) DEFAULT NULL,
  `title` text NOT NULL,
  `size` text,
  `day` text,
  `time` text,
  `address` text,
  `address_detail` text,
  `pay` int NOT NULL,
  `content` text,
  `today_date` datetime NOT NULL,
  `fileName1` text,
  `fileRealName1` text,
  `file_route1` text,
  `fileName2` text,
  `fileRealName2` text,
  `file_route2` text,
  `fileName3` text,
  `fileRealName3` text,
  `file_route3` text,
  `fileName4` text,
  `fileRealName4` text,
  `file_route4` text,
  `fileName5` text,
  `fileRealName5` text,
  `file_route5` text,
  PRIMARY KEY (`num`),
  KEY `id_idx` (`id`),
  CONSTRAINT `dogwalker_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dogwalker`
--

LOCK TABLES `dogwalker` WRITE;
/*!40000 ALTER TABLE `dogwalker` DISABLE KEYS */;
INSERT INTO `dogwalker` VALUES (3,NULL,'ㅁㄹㄴ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'ㄴㄹㅇㄴㄹㅇㅁ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:23:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'ㄴㄹㅇㄴㄹㅇㅁ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:24:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'ㄴㄻㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:26:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'ㅁㄴㄹㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:28:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,'ㄴㅇㄻ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:30:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,'ㄴㅁㄹㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:31:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'ㄴㄻㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:48:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,'ㄴㅁㄹㅇ','중형견(8kg이상)','평일','오후',NULL,NULL,23243,'234234ㄷㅈㅂㄱㅈㄷ','2024-04-03 10:56:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'ㄹㄴㅇㅁ','소형견(7kg이하)','평일','오전',NULL,'103동 2102호',243432,'ㄴㅇㄹㄹㅇㄴ','2024-04-03 11:09:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,'ㄻㄴㅇ','소형견(7kg이하)','평일','오전',NULL,'103동 2102호',0,'ㄴㄹㅇㄴㄹㅇㅁㄹㄴㅁㅇㄴㄹㅇ','2024-04-03 11:10:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,'ㄻㄴㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',423243,'ㄻㄴㅁㄹㄴㅇ','2024-04-03 11:11:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,'ㄴㅁㅇㄹ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',23423,'ㄻㄴㅁㄴㅇ','2024-04-03 11:54:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,'귀여운댕','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',123132,'ㅁㄹㅇㄴㅁㄴㄹㅇㅁ','2024-04-03 11:55:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,'ㄴㄹㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',324234,'ㅁㄴㄴㄹㅇㄴㄹㅇㅁㄻㄴㅇ','2024-04-03 11:59:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,'ㄱㅇㅇ','대형견(16kg이상)','평일','오후','서울 강남구 가로수길 5','111호',123456789,'ㅇㄴㄹㄴㄹㅇ','2024-04-03 12:45:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,'sda','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',0,'','2024-04-03 12:45:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,'asfd','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',0,'','2024-04-03 12:45:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,'ㅈㄹㄴㅇㄹ','중형견(8kg이상)','주말','오전','서울 강남구 가로수길 5','111호',45634,'ㅠㅗㅜㅎ','2024-04-03 12:52:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,'ㅏ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',56,'ㄴㅁㄹㅇㄴㄹㅇㅁ','2024-04-03 15:16:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,'하이하이','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243243423,'ㄻㄴㅇㄻㄴㅇㄹㅇㄴ','2024-04-03 16:01:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,'ㅇㄴㄹ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',253,'ㄹㅇㄴ','2024-04-03 17:13:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,'fasd','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',254,'fas','2024-04-03 17:16:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,'분단위','소형견(7kg이하)','평일','오전','서울 강남구 테헤란로 101','13',32423,'ㄻㅇㄻㄴ','2024-04-04 10:02:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,'분','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',234423,'ㄴㅇㅁㅁㄹㄴㅇ','2024-04-04 10:05:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,'ㄻㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',1432,'ㄻㄴㅇ','2024-04-04 10:06:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,'sfda','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243,'sfda','2024-04-04 10:10:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,NULL,'safd','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243,'asfd','2024-04-04 10:13:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'asd','asfddfs','소형견(7kg이하)','평일','오전','부산시 남구','',0,'','2024-04-04 11:56:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'wngus','ㅁㄴㄹㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',4321,'ㄻㄴㅇ','2024-04-04 14:54:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'wngus','asfdfsdafdas','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',0,'','2024-04-04 15:01:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'wngus','수정테스트','초대형견(45kg이상)','평일','오후','부산 동래구 쇠미로 37','103동 2102호',423243,'수정수정수정','2024-04-05 16:46:25','춘식1.png','춘식15.png','/uploads/춘식15.png','춘식2.png','춘식25.png','/uploads/춘식25.png','춘식3.png','춘식33.png','/uploads/춘식33.png',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null'),(48,'wngus','수정테스트2','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',23243,'ㄹㅇㅁㄻㄴㅇㄹㄴㅁㅇ','2024-04-05 16:46:38','춘식1.png','춘식16.png','/uploads/춘식16.png',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null'),(49,'wngus','수정테스트3','중형견(8kg이상)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243,'ㄱㅇㅈㄷ','2024-04-05 16:46:56','춘식1.png','춘식17.png','/uploads/춘식17.png','춘식2.png','춘식26.png','/uploads/춘식26.png',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null');
/*!40000 ALTER TABLE `dogwalker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(10) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `address_detail` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aaaaa','aaaaa','aaaaa','01095173408','제주특별자치도 제주시 제주대학로 21-1','7894동 12345호'),('asd','asd','허성재','01050182195','부산시 남구',''),('rkdguse','rkdguse','이강현','01022211718','부산 사하구 신산북로 41','302동 601호'),('rkdud','rkdud','김가영','01095173408','서울 강남구 가로수길 5','111호'),('tjdwo12','asdasd','허성재','01050182195','부산 남구 수영로325번길 159-30','103동 401호'),('wngus','qwer','박주현','01023229753','부산 동래구 쇠미로 37','103동 2102호');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-05 17:57:31
=======
CREATE DATABASE  IF NOT EXISTS `pet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pet`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 192.168.0.106    Database: pet
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `content` text,
  `ofile` varchar(45) DEFAULT NULL,
  `sfile` varchar(45) DEFAULT NULL,
  `postdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(10) DEFAULT NULL,
  `sympathy` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `id_idx` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (8,'급해요','긴급','급해요 완전 급해요ㅎㅇㄱㅎㅇㄱㅇㄱㅎㅇㄱㅎㅇㅌㄱㅎㅇㄱㅎㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ','춘식16.png','20240403_13912835.png','2024-04-03 13:09:10','rkdud',NULL),(9,'sdfsdf','소통','sdfsdfsdf','자바로고.png','20240403_13115590.png','2024-04-03 13:11:53','rkdud',NULL),(12,'ㅇ','소통','ㅇ','','20240403_16121779','2024-04-03 16:12:15','rkdud',NULL),(13,'ㅇ','소통','ㅇㅇ','','20240403_161220204','2024-04-03 16:12:19','rkdud',NULL),(14,'ㅇ','소통','ㅇ','','20240403_161223448','2024-04-03 16:12:22','rkdud',NULL),(15,'ㅇ','소통','ㅇ','','20240403_161226584','2024-04-03 16:12:25','rkdud',NULL),(16,'ㅇ','소통','ㅇ','','20240403_161232401','2024-04-03 16:12:31','rkdud',NULL),(17,'ㅇ','소통','ㅇ','','20240403_16123625','2024-04-03 16:12:34','rkdud',NULL),(18,'ㅇ','소통','ㅇ','','20240403_161239198','2024-04-03 16:12:38','rkdud',NULL),(19,'ㅇ','소통','ㅇㅇ','','20240403_161255929','2024-04-03 16:12:54','rkdud',NULL),(20,'개 사료 후기','후기','맛있네요','춘식1.png','20240403_161637831.png','2024-04-03 16:16:36','rkdud',NULL),(22,'회원','소통','회우너','','20240404_173356605','2024-04-04 17:33:54','rkdud',NULL),(23,'급해용','긴급','급행열차','','20240405_95148470','2024-04-05 09:51:46','wngus',NULL),(24,'asd','소통','asd','','20240405_104434828','2024-04-05 10:44:33','asd',NULL),(25,'ㄹㄴㄹ','소통','ㅇㄹㅇㄴ','','20240405_15485912','2024-04-05 15:48:56','rkdud',NULL),(26,'안녕하세요','소통','ㅎㅇㅎㅇ','','20240405_155327946','2024-04-05 15:53:25','rkdguse',NULL),(27,'asd','소통','asd','강아지비추천.PNG','20240405_155345294.PNG','2024-04-05 15:53:42','asd',NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `post_idx` int NOT NULL,
  `id` varchar(45) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  KEY `post_idx_idx` (`post_idx`),
  CONSTRAINT `post_idx` FOREIGN KEY (`post_idx`) REFERENCES `board` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (19,'rkdud','추천'),(22,'wngus','비추천'),(23,'wngus','추천'),(23,'asd','추천'),(20,'rkdguse','비추천'),(15,'rkdguse','비추천'),(23,'rkdguse','추천'),(27,'rkdguse','추천'),(25,'rkdguse','추천'),(20,'rkdud','추천'),(20,'asd','비추천'),(27,'asd','비추천'),(17,'asd','추천'),(22,'asd','추천'),(25,'asd','비추천');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_content`
--

DROP TABLE IF EXISTS `comment_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_content` (
  `num` int NOT NULL AUTO_INCREMENT,
  `post_idx` int DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `content_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `like` int NOT NULL DEFAULT '0',
  `dislike` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`num`),
  KEY `post_idx_idx` (`post_idx`),
  KEY `id_idx` (`id`),
  CONSTRAINT `content_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `content_post_idx` FOREIGN KEY (`post_idx`) REFERENCES `board` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_content`
--

LOCK TABLES `comment_content` WRITE;
/*!40000 ALTER TABLE `comment_content` DISABLE KEYS */;
INSERT INTO `comment_content` VALUES (1,20,'rkdud','디비에 들어가라','2024-04-04 15:35:52',1,0),(2,22,'rkdud','ㅎㅎ','2024-04-04 19:14:56',0,0),(3,20,'rkdud','ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ','2024-04-04 19:17:47',0,1),(4,20,'wngus','헐 대박대박','2024-04-05 09:52:01',0,1),(5,20,'wngus','헐 대박대박','2024-04-05 09:54:50',2,0),(6,20,'wngus','헐 대박','2024-04-05 09:59:13',1,0),(7,24,'asd','asdasd','2024-04-05 10:45:04',0,1),(8,24,'asd','zcvawert','2024-04-05 10:45:12',1,0),(11,23,'rkdud','헉\r\n','2024-04-05 15:01:18',1,0),(12,26,'asd','어쩌라고요 나가세요','2024-04-05 15:54:41',2,0),(13,27,'rkdud','ㅇㅇ','2024-04-05 16:06:32',1,0),(14,26,'rkdud','하하하ㅏ','2024-04-05 17:29:44',0,0),(15,26,'rkdud','하하하핳ㅎㅎㅎㅎㅎㅎ','2024-04-05 17:31:04',0,0);
/*!40000 ALTER TABLE `comment_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_likeordislike`
--

DROP TABLE IF EXISTS `comment_likeordislike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_likeordislike` (
  `num` int DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  KEY `num_idx` (`num`),
  CONSTRAINT `num` FOREIGN KEY (`num`) REFERENCES `comment_content` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likeordislike`
--

LOCK TABLES `comment_likeordislike` WRITE;
/*!40000 ALTER TABLE `comment_likeordislike` DISABLE KEYS */;
INSERT INTO `comment_likeordislike` VALUES (7,'asd','싫어요'),(8,'asd','좋아요'),(11,'rkdud','좋아요'),(1,'rkdud','좋아요'),(3,'rkdud','싫어요'),(12,'asd','좋아요'),(13,'rkdud','좋아요'),(4,'rkdud','싫어요'),(5,'rkdud','좋아요'),(5,'asd','좋아요'),(12,'rkdud','좋아요'),(6,'rkdud','좋아요');
/*!40000 ALTER TABLE `comment_likeordislike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dogwalker`
--

DROP TABLE IF EXISTS `dogwalker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dogwalker` (
  `num` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) DEFAULT NULL,
  `title` text NOT NULL,
  `size` text,
  `day` text,
  `time` text,
  `address` text,
  `address_detail` text,
  `pay` int NOT NULL,
  `content` text,
  `today_date` datetime NOT NULL,
  `fileName1` text,
  `fileRealName1` text,
  `file_route1` text,
  `fileName2` text,
  `fileRealName2` text,
  `file_route2` text,
  `fileName3` text,
  `fileRealName3` text,
  `file_route3` text,
  `fileName4` text,
  `fileRealName4` text,
  `file_route4` text,
  `fileName5` text,
  `fileRealName5` text,
  `file_route5` text,
  PRIMARY KEY (`num`),
  KEY `id_idx` (`id`),
  CONSTRAINT `dogwalker_id` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dogwalker`
--

LOCK TABLES `dogwalker` WRITE;
/*!40000 ALTER TABLE `dogwalker` DISABLE KEYS */;
INSERT INTO `dogwalker` VALUES (3,NULL,'ㅁㄹㄴ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,'ㄴㄹㅇㄴㄹㅇㅁ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:23:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'ㄴㄹㅇㄴㄹㅇㅁ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:24:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'ㄴㄻㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:26:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'ㅁㄴㄹㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:28:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,'ㄴㅇㄻ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:30:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,'ㄴㅁㄹㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:31:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'ㄴㄻㅇ',NULL,'weekday','morning',NULL,NULL,0,NULL,'2024-04-03 10:48:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,'ㄴㅁㄹㅇ','중형견(8kg이상)','평일','오후',NULL,NULL,23243,'234234ㄷㅈㅂㄱㅈㄷ','2024-04-03 10:56:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,'ㄹㄴㅇㅁ','소형견(7kg이하)','평일','오전',NULL,'103동 2102호',243432,'ㄴㅇㄹㄹㅇㄴ','2024-04-03 11:09:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,'ㄻㄴㅇ','소형견(7kg이하)','평일','오전',NULL,'103동 2102호',0,'ㄴㄹㅇㄴㄹㅇㅁㄹㄴㅁㅇㄴㄹㅇ','2024-04-03 11:10:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,'ㄻㄴㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',423243,'ㄻㄴㅁㄹㄴㅇ','2024-04-03 11:11:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,'ㄴㅁㅇㄹ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',23423,'ㄻㄴㅁㄴㅇ','2024-04-03 11:54:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,'귀여운댕','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',123132,'ㅁㄹㅇㄴㅁㄴㄹㅇㅁ','2024-04-03 11:55:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,'ㄴㄹㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',324234,'ㅁㄴㄴㄹㅇㄴㄹㅇㅁㄻㄴㅇ','2024-04-03 11:59:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,'ㄱㅇㅇ','대형견(16kg이상)','평일','오후','서울 강남구 가로수길 5','111호',123456789,'ㅇㄴㄹㄴㄹㅇ','2024-04-03 12:45:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,'sda','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',0,'','2024-04-03 12:45:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,'asfd','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',0,'','2024-04-03 12:45:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,'ㅈㄹㄴㅇㄹ','중형견(8kg이상)','주말','오전','서울 강남구 가로수길 5','111호',45634,'ㅠㅗㅜㅎ','2024-04-03 12:52:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,'ㅏ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',56,'ㄴㅁㄹㅇㄴㄹㅇㅁ','2024-04-03 15:16:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,'하이하이','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243243423,'ㄻㄴㅇㄻㄴㅇㄹㅇㄴ','2024-04-03 16:01:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,'ㅇㄴㄹ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',253,'ㄹㅇㄴ','2024-04-03 17:13:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,'fasd','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',254,'fas','2024-04-03 17:16:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,'분단위','소형견(7kg이하)','평일','오전','서울 강남구 테헤란로 101','13',32423,'ㄻㅇㄻㄴ','2024-04-04 10:02:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,'분','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',234423,'ㄴㅇㅁㅁㄹㄴㅇ','2024-04-04 10:05:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,'ㄻㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',1432,'ㄻㄴㅇ','2024-04-04 10:06:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,'sfda','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243,'sfda','2024-04-04 10:10:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,NULL,'safd','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243,'asfd','2024-04-04 10:13:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'asd','asfddfs','소형견(7kg이하)','평일','오전','부산시 남구','',0,'','2024-04-04 11:56:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'wngus','ㅁㄴㄹㅇ','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',4321,'ㄻㄴㅇ','2024-04-04 14:54:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'wngus','asfdfsdafdas','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',0,'','2024-04-04 15:01:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'wngus','수정테스트','초대형견(45kg이상)','평일','오후','부산 동래구 쇠미로 37','103동 2102호',423243,'수정수정수정','2024-04-05 16:46:25','춘식1.png','춘식15.png','/uploads/춘식15.png','춘식2.png','춘식25.png','/uploads/춘식25.png','춘식3.png','춘식33.png','/uploads/춘식33.png',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null'),(48,'wngus','수정테스트2','소형견(7kg이하)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',23243,'ㄹㅇㅁㄻㄴㅇㄹㄴㅁㅇ','2024-04-05 16:46:38','춘식1.png','춘식16.png','/uploads/춘식16.png',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null'),(49,'wngus','수정테스트3','중형견(8kg이상)','평일','오전','부산 동래구 쇠미로 37','103동 2102호',243,'ㄱㅇㅈㄷ','2024-04-05 16:46:56','춘식1.png','춘식17.png','/uploads/춘식17.png','춘식2.png','춘식26.png','/uploads/춘식26.png',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null',NULL,NULL,'/uploads/null');
/*!40000 ALTER TABLE `dogwalker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(10) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `address_detail` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aaaaa','aaaaa','aaaaa','01095173408','제주특별자치도 제주시 제주대학로 21-1','7894동 12345호'),('asd','asd','허성재','01050182195','부산시 남구',''),('rkdguse','rkdguse','이강현','01022211718','부산 사하구 신산북로 41','302동 601호'),('rkdud','rkdud','김가영','01095173408','서울 강남구 가로수길 5','111호'),('tjdwo12','asdasd','허성재','01050182195','부산 남구 수영로325번길 159-30','103동 401호'),('wngus','qwer','박주현','01023229753','부산 동래구 쇠미로 37','103동 2102호');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-05 18:05:16
