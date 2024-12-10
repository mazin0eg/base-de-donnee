-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: location
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `num_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `num_telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`num_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'Alice Dupont','123 Rue Example, Paris','0612345678'),(2,'Jean Martin','45 Avenue République, Lyon','0678912345');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contrats`
--

DROP TABLE IF EXISTS `Contrats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contrats` (
  `num_contrat` int NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `duree` int GENERATED ALWAYS AS ((to_days(`date_fin`) - to_days(`date_debut`))) STORED,
  `num_client` int NOT NULL,
  `num_immatriculation` varchar(20) NOT NULL,
  PRIMARY KEY (`num_contrat`),
  KEY `num_client` (`num_client`),
  KEY `num_immatriculation` (`num_immatriculation`),
  CONSTRAINT `Contrats_ibfk_1` FOREIGN KEY (`num_client`) REFERENCES `Clients` (`num_client`),
  CONSTRAINT `Contrats_ibfk_2` FOREIGN KEY (`num_immatriculation`) REFERENCES `Voitures` (`num_immatriculation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contrats`
--

LOCK TABLES `Contrats` WRITE;
/*!40000 ALTER TABLE `Contrats` DISABLE KEYS */;
INSERT INTO `Contrats` (`num_contrat`, `date_debut`, `date_fin`, `num_client`, `num_immatriculation`) VALUES (1,'2024-01-01','2024-01-10',1,'AB123CD'),(2,'2024-02-01','2024-02-15',2,'XY456ZT');
/*!40000 ALTER TABLE `Contrats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Voitures`
--

DROP TABLE IF EXISTS `Voitures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Voitures` (
  `num_immatriculation` varchar(20) NOT NULL,
  `marque` varchar(50) NOT NULL,
  `modele` varchar(50) NOT NULL,
  `annee` int NOT NULL,
  PRIMARY KEY (`num_immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Voitures`
--

LOCK TABLES `Voitures` WRITE;
/*!40000 ALTER TABLE `Voitures` DISABLE KEYS */;
INSERT INTO `Voitures` VALUES ('AB123CD','Toyota','Corolla',2020),('AB123XY','Toyota','Corolla',2020),('LM789OP','Ford','Focus',2021),('XY456ZT','Honda','Civic',2022);
/*!40000 ALTER TABLE `Voitures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 15:33:49
