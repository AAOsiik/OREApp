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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `recipeid` int NOT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`userid`),
  KEY `recipeid_idx` (`recipeid`),
  CONSTRAINT `recipe` FOREIGN KEY (`recipeid`) REFERENCES `recipes` (`id`),
  CONSTRAINT `user` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,'You have very nice recipe!'),(2,2,4,'It is hard. But, my opinion... what matters! Delicious recipe!'),(3,2,6,'Very cheap and easy!'),(4,5,1,'I am true beef lover, but this one also tastes good');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `f_userid` int NOT NULL,
  `recipeid` int NOT NULL,
  PRIMARY KEY (`f_userid`,`recipeid`),
  KEY `fk_userid_idx` (`f_userid`),
  KEY `fk_recipeid_idx` (`recipeid`),
  CONSTRAINT `fk_recipeid` FOREIGN KEY (`recipeid`) REFERENCES `recipes` (`id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`f_userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (1,1),(1,6),(2,1),(2,3);
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `complete` tinyint(1) NOT NULL,
  `picture` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'g0pN1k69','h4ck3r@government.ru','e9d97e383702baacf83d4f5ecb3f7fc08ae32939',NULL,NULL,NULL,0,NULL),(2,'new_user','new@newer.com','a9993e364706816aba3e25717850c26c9cd0d89d','alex','admin',NULL,0,'C:\\uploads\\users\\new_user.png'),(3,'admin','admin@admin.com','d033e22ae348aeb5660fc2140aec35850c4da997',NULL,NULL,NULL,0,NULL),(4,'VeganMan3000','VeganMan3000@v.com','f0c247bf7f72e6f6327ffb8bc179ea78512eafe',NULL,NULL,NULL,0,NULL),(5,'PashaBiceps','Beef4Life@yandex.ru','7677ca593fffbc1f3ecbe757ec62779e2e67903c',NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-18  3:39:14
