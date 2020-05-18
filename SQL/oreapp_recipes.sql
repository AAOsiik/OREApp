CREATE DATABASE  IF NOT EXISTS `oreapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oreapp`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: oreapp
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `category` varchar(45) NOT NULL,
  `difficulty` varchar(20) NOT NULL,
  `tags` varchar(45) DEFAULT NULL,
  `picture` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,4,'Vegan Burger Menu','You guys, I don’t even know where to start, other than, I MADE A VEGGIE BURGER THAT’S GRILLABLE. Plus, the method is so simple: Blend toasted walnuts with spices, Sauté onion, Mash black beans, Add remaining ingredients, Stir/mash like a madwoman/madman.','burger','easy','vegan, burger','C:\\uploads\\images\\1_Vegan Burger Menu.png'),(3,2,'Beef Burger','A very nice and juicy burger!\r Nothing beats a simple hamburger on a warm summer evening! Ground beef is blended with an easy to prepare bread crumb mixture. Pile these burgers with your favorite condiments, pop open a cool drink and enjoy!  For this, you will need:\r 1 Pack Beef\r 1 Pack Buns\r 1 Tomato, 1 egg , salt, pepper.','burger','medium','burger, beef','C:\\uploads\\images\\3_Beef Burger.png'),(4,2,'Nigiri Sushi','Selfmade Sushi is easy! You need:\r\n6 sheets sushi seaweed aka nori\r\n1 batch prepared sushi rice\r\n1/2 lb sushi-grade raw salmon or desired raw fish of choice\r\n4 oz cream cheese sliced into strips\r\n1 avocado sliced\r\nsoy sauce for serving','fish','hard','sushi, asia','C:\\uploads\\images\\4_Nigiri Sushi.png'),(5,2,'Curry','1 large onion\r\n, roughly chopped\r\n3 tbsp mild curry paste\r\n400g can chopped tomatoes\r\n2 tsp vegetable bouillon powder\r\n1 tbsp finely chopped ginger\r\n1 yellow pepper, deseeded and chopped\r\n2 skinless chicken legs, fat removed\r\n30g pack fresh coriander, leaves chopped\r\ncooked brown rice\r\n, to serve','beef','easy','curry, pork','C:\\uploads\\images\\5_Curry.png'),(6,3,'Soupy soup','This is a simple one, consisting of a pre-made soup mix and whatever you’ve got around the kitchen (or campsite). Feel free to sub/swap/switch anything in the ingredient list— anything’s fair game! Start onions in pan, cook down. Add chicken, corn. Serve with croutons.','soup','easy','soup','C:\\uploads\\images\\6_Soupy soup.png'),(7,4,'Banana Bread','Beat the eggs, then cream with the butter and sugar.\r\nMix in bananas, then flour, baking soda/powder, salt, and nuts.\r\nAdd to greased and floured pan.\r\nBake until brown/cracked, toothpick comes out clean','dessert','easy','bread, banana, vegan','C:\\uploads\\images\\7_Banana Bread.png');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-17 22:05:13
