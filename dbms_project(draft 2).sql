CREATE DATABASE  IF NOT EXISTS `dbms_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbms_project`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: dbms_project
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `daywise_dishes`
--

DROP TABLE IF EXISTS `daywise_dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daywise_dishes` (
  `dish_id` int NOT NULL,
  `day` date DEFAULT NULL,
  `meal_type` enum('Breakfast','Lunch','Dinner') DEFAULT NULL,
  `dish_name` varchar(100) DEFAULT NULL,
  `nutrient_id` int DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `nutrient_id` (`nutrient_id`),
  CONSTRAINT `daywise_dishes_ibfk_1` FOREIGN KEY (`nutrient_id`) REFERENCES `nutrients` (`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daywise_dishes`
--

LOCK TABLES `daywise_dishes` WRITE;
/*!40000 ALTER TABLE `daywise_dishes` DISABLE KEYS */;
INSERT INTO `daywise_dishes` VALUES (1,'2024-03-22','Breakfast','Oatmeal with Berries',1),(2,'2024-03-22','Lunch','Chicken Caesar Salad',2),(3,'2024-03-22','Dinner','Salmon with Roasted Vegetables',3),(4,'2024-03-22','Breakfast','Scrambled Eggs with Toast',4),(5,'2024-03-22','Lunch','Black Bean Burgers on Whole Wheat Buns',5),(6,'2024-03-22','Dinner','Lentil Soup with Whole Grain Bread',6),(7,'2024-03-22','Breakfast','Greek Yogurt with Granola and Fruit',7),(8,'2024-03-22','Lunch','Quinoa Salad with Chickpeas',8),(9,'2024-03-22','Dinner','Tofu Stir-Fry with Brown Rice',9),(10,'2024-03-22','Breakfast','Smoothie with Spinach, Banana, and Almond Milk',10);
/*!40000 ALTER TABLE `daywise_dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_ingredient_link`
--

DROP TABLE IF EXISTS `dish_ingredient_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_ingredient_link` (
  `dish_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`dish_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `dish_ingredient_link_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `daywise_dishes` (`dish_id`),
  CONSTRAINT `dish_ingredient_link_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_ingredient_link`
--

LOCK TABLES `dish_ingredient_link` WRITE;
/*!40000 ALTER TABLE `dish_ingredient_link` DISABLE KEYS */;
INSERT INTO `dish_ingredient_link` VALUES (1,1),(1,2),(2,3),(2,4),(2,5),(3,6),(4,14),(4,15),(5,16),(5,17);
/*!40000 ALTER TABLE `dish_ingredient_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredient_id` int NOT NULL,
  `ingredient_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Oats'),(2,'Berries'),(3,'Chicken'),(4,'Lettuce'),(5,'Caesar Dressing'),(6,'Salmon'),(7,'Vegetables'),(8,'Quinoa'),(9,'Chickpeas'),(10,'Tofu'),(11,'Spinach'),(12,'Banana'),(13,'Almond Milk'),(14,'Eggs'),(15,'Toast'),(16,'Black Beans'),(17,'Whole Wheat Buns'),(18,'Lentils'),(19,'Whole Grain Bread'),(20,'Greek Yogurt'),(21,'Granola'),(22,'Fruit'),(23,'Brown Rice');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `student_id` int NOT NULL,
  `dish_id` int DEFAULT NULL,
  `meal_date` date DEFAULT NULL,
  `meal_type` enum('Breakfast','Lunch','Dinner') DEFAULT NULL,
  `meal_description` text,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `meal_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `meal_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `daywise_dishes` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (1,4,'2024-03-23','Breakfast','Scrambled Eggs with Toast',1),(2,5,'2024-03-23','Lunch','Black Bean Burgers on Whole Wheat Buns',1),(3,6,'2024-03-23','Dinner','Lentil Soup with Whole Grain Bread',1),(4,1,'2024-03-24','Breakfast','Oatmeal with Berries',1),(5,2,'2024-03-24','Lunch','Chicken Caesar Salad',1),(6,3,'2024-03-24','Dinner','Salmon with Roasted Vegetables',1),(7,7,'2024-03-25','Breakfast','Greek Yogurt with Granola and Fruit',1);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrients`
--

DROP TABLE IF EXISTS `nutrients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrients` (
  `nutrient_id` int NOT NULL,
  `dish_id` int DEFAULT NULL,
  `nutrient_name` varchar(100) DEFAULT NULL,
  `nutrient_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrients`
--

LOCK TABLES `nutrients` WRITE;
/*!40000 ALTER TABLE `nutrients` DISABLE KEYS */;
INSERT INTO `nutrients` VALUES (1,1,'Fiber',5.00),(2,2,'Protein',20.00),(3,3,'Omega-3 Fatty Acids',1.50),(4,4,'Protein',12.00),(5,5,'Fiber',7.00),(6,6,'Folate',400.00),(7,7,'Calcium',200.00),(8,8,'Protein',15.00),(9,9,'Iron',4.00),(10,10,'Vitamin C',50.00);
/*!40000 ALTER TABLE `nutrients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rda`
--

DROP TABLE IF EXISTS `rda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rda` (
  `nutrient_id` int NOT NULL,
  `rda_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`nutrient_id`),
  CONSTRAINT `rda_ibfk_1` FOREIGN KEY (`nutrient_id`) REFERENCES `nutrients` (`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rda`
--

LOCK TABLES `rda` WRITE;
/*!40000 ALTER TABLE `rda` DISABLE KEYS */;
INSERT INTO `rda` VALUES (1,25.00),(2,50.00),(3,1.60),(4,400.00),(5,70.00),(6,400.00),(7,1000.00),(8,NULL),(9,8.00),(10,90.00);
/*!40000 ALTER TABLE `rda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dietary_preference` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'John Doe','Vegetarian'),(2,'Jane Smith','Gluten-Free'),(3,'Michael Lee','No Restrictions'),(4,'Alice Johnson','Vegan'),(5,'David Brown','Lactose Intolerant'),(6,'Emily Garcia','Pescatarian'),(7,'Robert Williams','Vegetarian'),(8,'Sarah Miller','Gluten-Free'),(9,'Matthew Davis','No Restrictions'),(10,'Jennifer Hernandez','Vegan');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggestions`
--

DROP TABLE IF EXISTS `suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestions` (
  `suggestion_id` int NOT NULL,
  `day` date DEFAULT NULL,
  `nutrient_id` int DEFAULT NULL,
  `suggested_food` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`suggestion_id`),
  KEY `nutrient_id` (`nutrient_id`),
  CONSTRAINT `suggestions_ibfk_1` FOREIGN KEY (`nutrient_id`) REFERENCES `nutrients` (`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggestions`
--

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-23  1:58:35
