-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: tmc
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tb_board`
--

DROP TABLE IF EXISTS `tb_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_board` (
  `board_num` varchar(10) NOT NULL,
  `board_title` varchar(50) DEFAULT NULL,
  `board_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`board_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_board`
--

LOCK TABLES `tb_board` WRITE;
/*!40000 ALTER TABLE `tb_board` DISABLE KEYS */;
INSERT INTO `tb_board` VALUES ('B0000001','자유게시판','자유');
/*!40000 ALTER TABLE `tb_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_files`
--

DROP TABLE IF EXISTS `tb_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_files` (
  `file_num` varchar(10) NOT NULL,
  `file_path` varchar(1000) DEFAULT NULL,
  `post_num` varchar(10) NOT NULL,
  `save_file_name` varchar(1000) DEFAULT NULL,
  `original_file_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`file_num`,`post_num`),
  KEY `fk_files_post1_idx` (`post_num`),
  CONSTRAINT `fk_files_post1` FOREIGN KEY (`post_num`) REFERENCES `tb_post` (`post_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_files`
--

LOCK TABLES `tb_files` WRITE;
/*!40000 ALTER TABLE `tb_files` DISABLE KEYS */;
INSERT INTO `tb_files` VALUES ('F001','/upload/post/','P0000003','1627890101323bg01.jpg','bg01.jpg');
/*!40000 ALTER TABLE `tb_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post`
--

DROP TABLE IF EXISTS `tb_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_post` (
  `post_num` varchar(10) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `board_num` varchar(10) NOT NULL,
  `post_title` varchar(45) DEFAULT NULL,
  `post_content` text,
  `write_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_used` varchar(1) DEFAULT 'Y',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_num`),
  KEY `fk_post_board1_idx` (`board_num`),
  KEY `fk_post_userinfo_idx` (`user_id`),
  CONSTRAINT `fk_post_board1` FOREIGN KEY (`board_num`) REFERENCES `tb_board` (`board_num`),
  CONSTRAINT `fk_post_userinfo` FOREIGN KEY (`user_id`) REFERENCES `tb_userinfo` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post`
--

LOCK TABLES `tb_post` WRITE;
/*!40000 ALTER TABLE `tb_post` DISABLE KEYS */;
INSERT INTO `tb_post` VALUES ('P0000001','hyde940@naver.com','B0000001','안녕하세요','하이','2021-08-02 16:23:42','Y','2021-08-02 16:23:42'),('P0000002','hyde940@naver.com','B0000001','tet','eqt','2021-08-02 16:26:51','Y','2021-08-02 16:26:51'),('P0000003','hyde940@naver.com','B0000001','ff','fasfasf','2021-08-02 16:36:33','Y','2021-08-02 17:53:22');
/*!40000 ALTER TABLE `tb_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userinfo`
--

DROP TABLE IF EXISTS `tb_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_userinfo` (
  `user_id` varchar(60) NOT NULL,
  `user_pw` varchar(300) DEFAULT NULL,
  `sessionkey` varchar(50) NOT NULL DEFAULT 'none',
  `sessionlimit` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userinfo`
--

LOCK TABLES `tb_userinfo` WRITE;
/*!40000 ALTER TABLE `tb_userinfo` DISABLE KEYS */;
INSERT INTO `tb_userinfo` VALUES ('hyde10@naver.com','$2a$10$L8E5bjlNs9QhvF1k6l9D6.fwdomEYeB9BR32.GeB1FhJUcUuhQFuC','none',NULL),('hyde1010@naver.com','$2a$10$zC0dh0qH0Ug8ydCsgcqBA.orH1wB2wIfLUsFVJ9UqpORNprVN.T1m','none',NULL),('hyde10102@naver.com','$2a$10$LgGOZXnjTxKE8/Pr04o2t.K5uNbWCSuhbhiBqPatvsT9Ih4NHJfii','none',NULL),('hyde112@naver.com','$2a$10$QgJ8.6a1KcK0Mec9N4D4J.SrmHBuRjpU1i.q7LSC6/2hckW1k5wjq','none',NULL),('hyde940@naver.com','$2a$10$6NJ1xTyKOeNKikbVfgYjq.0ozj/PY7zFb98cW4E/uKg9fvjylimQi','411B826E96E7A89F14530F6CB99A796C','2021-08-02 09:22:38'),('test@naver.com','$2a$10$owGMTr/8UUNXgJxF9g1RpuApdPM8Wn3wBlQpVyzkeqgSEG9VoDd8C','2BE809DB92DBAEBDC91A1302A341774B','2021-08-06 00:42:19'),('tjdwns7761@naver.com','$2a$10$FLS1/TyzoDg1/yz8YdC.TebGTMdonQPErmhBbBU4xNoY07plveLtC','none',NULL),('tjdwns7777@naver.com','$2a$10$xPHAVwpnUwKP1yEO5c2g9OAj025sPX6XsHNjCg9M4k8xfQozAOcKW','none',NULL);
/*!40000 ALTER TABLE `tb_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-06 11:19:23
