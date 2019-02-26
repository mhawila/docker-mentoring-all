-- MySQL dump 10.16  Distrib 10.1.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: accountmanager
-- ------------------------------------------------------
-- Server version	10.1.22-MariaDB

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
-- Table structure for table `APPLICATION`
--

DROP TABLE IF EXISTS `APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED_AT` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) NOT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `CODE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `CONTEXT_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_pjmu3j0185gkd4i7voj2i99hm` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATION`
--

LOCK TABLES `APPLICATION` WRITE;
/*!40000 ALTER TABLE `APPLICATION` DISABLE KEYS */;
INSERT INTO `APPLICATION` VALUES (1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'','01','Gestão de Acessos','/account-manager-web'),(2,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'','02','Sistema de Gestão para Farmácias','/ncare-web');
/*!40000 ALTER TABLE `APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPLICATION_AUD`
--

DROP TABLE IF EXISTS `APPLICATION_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATION_AUD` (
  `ID` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CONTEXT_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK_hu2s1785cl2n093lo6q2fvfrh` (`REV`),
  CONSTRAINT `FK_hu2s1785cl2n093lo6q2fvfrh` FOREIGN KEY (`REV`) REFERENCES `REVINFO` (`REV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATION_AUD`
--

LOCK TABLES `APPLICATION_AUD` WRITE;
/*!40000 ALTER TABLE `APPLICATION_AUD` DISABLE KEYS */;
INSERT INTO `APPLICATION_AUD` VALUES (2,3,1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'','02','Sistema de Gestão para Farmácias','/ncare-web');
/*!40000 ALTER TABLE `APPLICATION_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPLICATION_ROLE`
--

DROP TABLE IF EXISTS `APPLICATION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATION_ROLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED_AT` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) NOT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `APPLICATION_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_7nsw1d6voaity369c4jdilx4x` (`APPLICATION_ID`,`ROLE_ID`),
  KEY `FK_tro743493jljna1iihs537cqo` (`ROLE_ID`),
  CONSTRAINT `FK_dojtmb64yuge5yd27bhk39h47` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `APPLICATION` (`ID`),
  CONSTRAINT `FK_tro743493jljna1iihs537cqo` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATION_ROLE`
--

LOCK TABLES `APPLICATION_ROLE` WRITE;
/*!40000 ALTER TABLE `APPLICATION_ROLE` DISABLE KEYS */;
INSERT INTO `APPLICATION_ROLE` VALUES (1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'',1,1),(2,'2017-06-09 15:28:23','08cc21901f18424ebb4a232f8963fc1b','ACTIVE','2017-06-09 15:28:36','08cc21901f18424ebb4a232f8963fc1b','a65c93b0d73a48a4934afeec6762863b',2,1);
/*!40000 ALTER TABLE `APPLICATION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPLICATION_ROLE_AUD`
--

DROP TABLE IF EXISTS `APPLICATION_ROLE_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATION_ROLE_AUD` (
  `ID` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) DEFAULT NULL,
  `APPLICATION_ID` bigint(20) DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK_kvehy2gdpwuonoo3gia4bkkrq` (`REV`),
  CONSTRAINT `FK_kvehy2gdpwuonoo3gia4bkkrq` FOREIGN KEY (`REV`) REFERENCES `REVINFO` (`REV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATION_ROLE_AUD`
--

LOCK TABLES `APPLICATION_ROLE_AUD` WRITE;
/*!40000 ALTER TABLE `APPLICATION_ROLE_AUD` DISABLE KEYS */;
INSERT INTO `APPLICATION_ROLE_AUD` VALUES (2,3,0,'2017-06-09 15:28:23','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'a65c93b0d73a48a4934afeec6762863b',2,1),(2,4,1,'2017-06-09 15:28:23','08cc21901f18424ebb4a232f8963fc1b','ACTIVE','2017-06-09 15:28:36','08cc21901f18424ebb4a232f8963fc1b','a65c93b0d73a48a4934afeec6762863b',2,1);
/*!40000 ALTER TABLE `APPLICATION_ROLE_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPLICATION_UNIT`
--

DROP TABLE IF EXISTS `APPLICATION_UNIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATION_UNIT` (
  `UNIT_ID` bigint(20) NOT NULL,
  `APPLICATION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`UNIT_ID`,`APPLICATION_ID`),
  KEY `FK_hjjbrn3lthn57ncvylcp9xl53` (`APPLICATION_ID`),
  CONSTRAINT `FK_c27qlrlis6bepi6evwmj6qxy3` FOREIGN KEY (`UNIT_ID`) REFERENCES `UNITS` (`ID`),
  CONSTRAINT `FK_hjjbrn3lthn57ncvylcp9xl53` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `APPLICATION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATION_UNIT`
--

LOCK TABLES `APPLICATION_UNIT` WRITE;
/*!40000 ALTER TABLE `APPLICATION_UNIT` DISABLE KEYS */;
INSERT INTO `APPLICATION_UNIT` VALUES (2,1),(3,2);
/*!40000 ALTER TABLE `APPLICATION_UNIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `APPLICATION_UNIT_AUD`
--

DROP TABLE IF EXISTS `APPLICATION_UNIT_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATION_UNIT_AUD` (
  `REV` int(11) NOT NULL,
  `UNIT_ID` bigint(20) NOT NULL,
  `APPLICATION_ID` bigint(20) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`UNIT_ID`,`APPLICATION_ID`),
  CONSTRAINT `FK_j8t3lri7flcig90or08h9q1o3` FOREIGN KEY (`REV`) REFERENCES `REVINFO` (`REV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATION_UNIT_AUD`
--

LOCK TABLES `APPLICATION_UNIT_AUD` WRITE;
/*!40000 ALTER TABLE `APPLICATION_UNIT_AUD` DISABLE KEYS */;
INSERT INTO `APPLICATION_UNIT_AUD` VALUES (1,2,1,0),(2,3,2,0);
/*!40000 ALTER TABLE `APPLICATION_UNIT_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVINFO`
--

DROP TABLE IF EXISTS `REVINFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REVINFO` (
  `REV` int(11) NOT NULL AUTO_INCREMENT,
  `REVTSTMP` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`REV`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVINFO`
--

LOCK TABLES `REVINFO` WRITE;
/*!40000 ALTER TABLE `REVINFO` DISABLE KEYS */;
INSERT INTO `REVINFO` VALUES (1,1496314182979),(2,1497014864031),(3,1497014903809),(4,1497014916689);
/*!40000 ALTER TABLE `REVINFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED_AT` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) NOT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'','Esta permisão permite um acesso total a aplicação',NULL,'Administrador'),(2,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'','Apenas opera em tarefas definidas',NULL,'Operador');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACTIONS`
--

DROP TABLE IF EXISTS `TRANSACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSACTIONS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED_AT` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) NOT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `CODE` varchar(5) NOT NULL,
  `NAME` varchar(150) NOT NULL,
  `APPLICATION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_2b20pj9r7qsfd8w5joshboot7` (`CODE`,`APPLICATION_ID`),
  KEY `FK_pngjqgjwj8tkk6b0k7tf3a7tj` (`APPLICATION_ID`),
  CONSTRAINT `FK_pngjqgjwj8tkk6b0k7tf3a7tj` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `APPLICATION` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTIONS`
--

LOCK TABLES `TRANSACTIONS` WRITE;
/*!40000 ALTER TABLE `TRANSACTIONS` DISABLE KEYS */;
INSERT INTO `TRANSACTIONS` VALUES (1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'','001','Realizar Vendas',2),(2,'2017-05-29 01:52:23','1','ACTIVE',NULL,NULL,'','002','Cadastrar Stocks',2),(3,'2017-05-29 01:52:23','1','ACTIVE',NULL,NULL,'','003','Listar Stocks',2),(4,'2017-05-29 01:52:23','1','ACTIVE',NULL,NULL,'','004','Remover/Editar Stocks',2),(5,'2017-05-29 01:52:23','1','ACTIVE',NULL,NULL,'','005','Manutenção de Medicamentos',2);
/*!40000 ALTER TABLE `TRANSACTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACTIONS_AUD`
--

DROP TABLE IF EXISTS `TRANSACTIONS_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSACTIONS_AUD` (
  `ID` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) DEFAULT NULL,
  `CODE` varchar(5) DEFAULT NULL,
  `NAME` varchar(150) DEFAULT NULL,
  `APPLICATION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK_sm5bgu0966o3wrpj94se40i72` (`REV`),
  CONSTRAINT `FK_sm5bgu0966o3wrpj94se40i72` FOREIGN KEY (`REV`) REFERENCES `REVINFO` (`REV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTIONS_AUD`
--

LOCK TABLES `TRANSACTIONS_AUD` WRITE;
/*!40000 ALTER TABLE `TRANSACTIONS_AUD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRANSACTIONS_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACTION_APPLICATION_ROLES`
--

DROP TABLE IF EXISTS `TRANSACTION_APPLICATION_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSACTION_APPLICATION_ROLES` (
  `TRANSACTION_ID` bigint(20) NOT NULL,
  `APPLICATION_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TRANSACTION_ID`,`APPLICATION_ROLE_ID`),
  KEY `FK_r1dtdxi1xiiixc6xiabgk5m2j` (`APPLICATION_ROLE_ID`),
  CONSTRAINT `FK_ci99y5uj52sf2ytv9dgto3um9` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `APPLICATION_ROLE` (`ID`),
  CONSTRAINT `FK_r1dtdxi1xiiixc6xiabgk5m2j` FOREIGN KEY (`APPLICATION_ROLE_ID`) REFERENCES `TRANSACTIONS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTION_APPLICATION_ROLES`
--

LOCK TABLES `TRANSACTION_APPLICATION_ROLES` WRITE;
/*!40000 ALTER TABLE `TRANSACTION_APPLICATION_ROLES` DISABLE KEYS */;
INSERT INTO `TRANSACTION_APPLICATION_ROLES` VALUES (2,1),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `TRANSACTION_APPLICATION_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACTION_APPLICATION_ROLES_AUD`
--

DROP TABLE IF EXISTS `TRANSACTION_APPLICATION_ROLES_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSACTION_APPLICATION_ROLES_AUD` (
  `REV` int(11) NOT NULL,
  `TRANSACTION_ID` bigint(20) NOT NULL,
  `APPLICATION_ROLE_ID` bigint(20) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`REV`,`APPLICATION_ROLE_ID`,`TRANSACTION_ID`),
  CONSTRAINT `FK_d7r3n3qqs0e96g7al0ai0c30j` FOREIGN KEY (`REV`) REFERENCES `REVINFO` (`REV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTION_APPLICATION_ROLES_AUD`
--

LOCK TABLES `TRANSACTION_APPLICATION_ROLES_AUD` WRITE;
/*!40000 ALTER TABLE `TRANSACTION_APPLICATION_ROLES_AUD` DISABLE KEYS */;
INSERT INTO `TRANSACTION_APPLICATION_ROLES_AUD` VALUES (4,2,1,0),(4,2,2,0),(4,2,3,0),(4,2,4,0),(4,2,5,0);
/*!40000 ALTER TABLE `TRANSACTION_APPLICATION_ROLES_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNITS`
--

DROP TABLE IF EXISTS `UNITS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UNITS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED_AT` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) NOT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `CODE` varchar(30) NOT NULL,
  `CONTACT` varchar(255) NOT NULL,
  `EMAIL` varchar(80) DEFAULT NULL,
  `NAME` varchar(80) NOT NULL,
  `NUIT` varchar(9) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_lcjrtakaa9nkf4oaa8f8noekb` (`CODE`,`NUIT`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNITS`
--

LOCK TABLES `UNITS` WRITE;
/*!40000 ALTER TABLE `UNITS` DISABLE KEYS */;
INSERT INTO `UNITS` VALUES (1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'','Rua da Mozal, Bairro Djuba, Q - 2, Casa nr 375.Matola - Rio','AMU000001','+258 82 2546100','stelio@gmail.com','Farmácia Alima','102124774'),(2,'2017-06-01 12:49:42','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'21ca8e9459d84d229c3eb76662527e94','NA','AMU000002','+258822546100','his@fgh.org.mz','Friends In Global Health','123456789'),(3,'2017-06-09 15:27:43','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'d29d0f11343a492d8947d6abc4486881','NA','AMU000003','+258822546100','txova@gmail.com','Farmacia Txova','123456789');
/*!40000 ALTER TABLE `UNITS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNITS_AUD`
--

DROP TABLE IF EXISTS `UNITS_AUD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UNITS_AUD` (
  `ID` bigint(20) NOT NULL,
  `REV` int(11) NOT NULL,
  `REVTYPE` tinyint(4) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CODE` varchar(30) DEFAULT NULL,
  `CONTACT` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(80) DEFAULT NULL,
  `NAME` varchar(80) DEFAULT NULL,
  `NUIT` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID`,`REV`),
  KEY `FK_ox4rtb7b1blcsxvrtatlgnspb` (`REV`),
  CONSTRAINT `FK_ox4rtb7b1blcsxvrtatlgnspb` FOREIGN KEY (`REV`) REFERENCES `REVINFO` (`REV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNITS_AUD`
--

LOCK TABLES `UNITS_AUD` WRITE;
/*!40000 ALTER TABLE `UNITS_AUD` DISABLE KEYS */;
INSERT INTO `UNITS_AUD` VALUES (2,1,0,'2017-06-01 12:49:42','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'21ca8e9459d84d229c3eb76662527e94','NA','AMU000002','+258822546100','his@fgh.org.mz','Friends In Global Health','123456789'),(3,2,0,'2017-06-09 15:27:43','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'d29d0f11343a492d8947d6abc4486881','NA','AMU000003','+258822546100','txova@gmail.com','Farmacia Txova','123456789');
/*!40000 ALTER TABLE `UNITS_AUD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIT_USER_APP_ROLES`
--

DROP TABLE IF EXISTS `UNIT_USER_APP_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UNIT_USER_APP_ROLES` (
  `UNIT_ID` bigint(20) NOT NULL,
  `USER_APPLICATION_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`UNIT_ID`,`USER_APPLICATION_ROLE_ID`),
  KEY `FK_79n2j1napqb709i3pwhby07gc` (`USER_APPLICATION_ROLE_ID`),
  CONSTRAINT `FK_79n2j1napqb709i3pwhby07gc` FOREIGN KEY (`USER_APPLICATION_ROLE_ID`) REFERENCES `UNITS` (`ID`),
  CONSTRAINT `FK_jaum5nskab23rotaexwx373yc` FOREIGN KEY (`UNIT_ID`) REFERENCES `USER_APPLICATION_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIT_USER_APP_ROLES`
--

LOCK TABLES `UNIT_USER_APP_ROLES` WRITE;
/*!40000 ALTER TABLE `UNIT_USER_APP_ROLES` DISABLE KEYS */;
INSERT INTO `UNIT_USER_APP_ROLES` VALUES (1,1),(4,2),(5,3);
/*!40000 ALTER TABLE `UNIT_USER_APP_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED_AT` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) NOT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `ACCOUNT_NON_EXPIRED` bit(1) DEFAULT NULL,
  `ACCOUNT_NON_LOCKED` bit(1) DEFAULT NULL,
  `CREDENTIALS_NON_EXPIRED` bit(1) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ENABLED` bit(1) DEFAULT NULL,
  `FULL_NAME` varchar(80) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `SESSION_ID` varchar(50) DEFAULT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_q1niii5896w6uexgsvbvx0g2i` (`USER_NAME`,`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE','2017-06-09 15:25:38','08cc21901f18424ebb4a232f8963fc1b','08cc21901f18424ebb4a232f8963fc1b','','','','steliomo@gmail.com','','Stelio Klesio Adriano Moiane','$2a$10$EK0RxRRofLbOFEvrGOmJB.7lSCiTHPYtkbx/uGq258Tzlwzasx6qy','01AMU000001steliomo','steliomo'),(2,'2017-05-30 10:17:45','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'f443bbb66fe949558938f3c9a7a32690','','','','hamilton.mutemba@fgh.org.mz','','Hamilton Mutemba','$2a$10$aFPO7AVr9X12fHiX4Jmp5OBQi6fF74TtRuptbZG0xuB3xEoOg0XDa',NULL,'hamilton.mutemba'),(3,'2017-06-01 12:52:14','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'0807983dd3b34f109fb75756862d4a72','','','','nico.silima@fgh.org.mz','','Nico Silima','$2a$10$zt6GPhCO9uyX.Vrk154K5OhFDV1eZvBzvUT/4AaO3..0Ai3LtAj9e',NULL,'nico.silima'),(4,'2017-06-01 16:34:07','08cc21901f18424ebb4a232f8963fc1b','ACTIVE','2017-06-15 10:26:20','ad3d2a5ade75429798e5ab12a8e4413d','ad3d2a5ade75429798e5ab12a8e4413d','','','','domingos.bernardo@fgh.org.mz','','Domingos Bernardo','$2a$10$YcCvzW9VihUPTGHLOOx4zu/LSzKTXhrw42i1ujCYeYjJ1uhhA93Om','01AMU000002domingos.bernardo','domingos.bernardo'),(5,'2017-06-02 11:51:32','ad3d2a5ade75429798e5ab12a8e4413d','ACTIVE',NULL,NULL,'3dac1bc2b6f14fb88143ba3f2bd6e926','','','','reinaldo.jorge@fgh.org.mz','','Reinaldo Luis','$2a$10$yatJRIBYrNfHXvmazJmrBOG6TeJ31426O6xb7Wp0vus67BooHwSkm',NULL,'reinaldo.luis'),(6,'2017-06-06 10:34:07','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'bd7d53869e11423f94453c706aab08b8','','','','lino.miguel@fgh.org.mz','','Lino Miguel','$2a$10$oLxg1C62VEzXL4TdaAulauEJJg8Rf6iqpfZBlqQ2EQ920zJwLIOou',NULL,'lino.miguel'),(7,'2017-06-09 15:26:38','08cc21901f18424ebb4a232f8963fc1b','ACTIVE','2017-06-10 19:46:46','6c38569e99e9406e992b4c1f1a66c879','6c38569e99e9406e992b4c1f1a66c879','','','','his@fgh.org.mz','','Admin','$2a$10$Dmm6H1e2thteJlvA6YmBlukZV0xrO6tMRtwclgxEhgkQ40huAe9Wm','02AMU000003admin','admin');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_APPLICATION_ROLE`
--

DROP TABLE IF EXISTS `USER_APPLICATION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_APPLICATION_ROLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATED_AT` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `LIFE_CYCLE_STATUS` varchar(100) NOT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `UUID` varchar(50) NOT NULL,
  `APPLICATION_ROLE_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_rud8kast2fp7cj251pjysmxxh` (`USER_ID`,`APPLICATION_ROLE_ID`),
  KEY `FK_8lp82p0ubww4desghoytxdtrr` (`APPLICATION_ROLE_ID`),
  CONSTRAINT `FK_8lp82p0ubww4desghoytxdtrr` FOREIGN KEY (`APPLICATION_ROLE_ID`) REFERENCES `APPLICATION_ROLE` (`ID`),
  CONSTRAINT `FK_8uayqqhsehcl7lpel14idy6iu` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_APPLICATION_ROLE`
--

LOCK TABLES `USER_APPLICATION_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_APPLICATION_ROLE` DISABLE KEYS */;
INSERT INTO `USER_APPLICATION_ROLE` VALUES (1,'2017-05-29 01:52:23','682eb67387a84d54b9adf93247aefb55','ACTIVE',NULL,NULL,'',1,1),(2,'2017-05-30 10:18:06','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'4899664a40044d518a20d8c5d9a5524a',1,2),(4,'2017-06-01 16:34:36','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'5eea2bc81fd541b18849f15bc0cfcb6d',1,4),(5,'2017-06-09 15:29:00','08cc21901f18424ebb4a232f8963fc1b','ACTIVE',NULL,NULL,'0fc4f5cbfd8a479d9ca7519eaa5a62a5',2,7);
/*!40000 ALTER TABLE `USER_APPLICATION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`),
  KEY `schema_version_vr_idx` (`version_rank`),
  KEY `schema_version_ir_idx` (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` VALUES (1,1,'1','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2017-05-28 23:52:08',0,1),(2,2,'2','Add First User','SQL','V2__Add_First_User.sql',304032785,'root','2017-05-28 23:52:23',60,1);
/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-30 21:57:42
