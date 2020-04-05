-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: oreapp
-- ------------------------------------------------------
-- Server version	8.0.19

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `complete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'g0pN1k69','h4ck3r@government.ru','e9d97e383702baacf83d4f5ecb3f7fc08ae32939',NULL,NULL,NULL,0);
(2,'new_user','new@newer.com','a9993e364706816aba3e25717850c26c9cd0d89d',NULL,NULL,NULL,0);
UNLOCK TABLES;
