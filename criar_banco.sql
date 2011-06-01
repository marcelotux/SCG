-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.37-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_sca
--

CREATE DATABASE IF NOT EXISTS db_sca;
USE db_sca;

--
-- Definition of table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
CREATE TABLE `administrador` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_login` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_administrador_usuario` (`usuario_login`),
  CONSTRAINT `fk_administrador_usuario` FOREIGN KEY (`usuario_login`) REFERENCES `usuario` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrador`
--

/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`matricula`,`usuario_login`) VALUES 
 (1,'marcelo'),
 (3,'Mauricio'),
 (4,'professor');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;


--
-- Definition of table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_login` varchar(20) DEFAULT NULL,
  `disciplina_codDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`matricula`,`disciplina_codDisciplina`),
  KEY `fk_aluno_usuario` (`usuario_login`),
  KEY `fk_aluno_disciplina` (`disciplina_codDisciplina`),
  CONSTRAINT `fk_aluno_disciplina` FOREIGN KEY (`disciplina_codDisciplina`) REFERENCES `disciplina` (`codDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_usuario` FOREIGN KEY (`usuario_login`) REFERENCES `usuario` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aluno`
--

/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`matricula`,`usuario_login`,`disciplina_codDisciplina`) VALUES 
 (1,'marcelo',1),
 (1,'marcelo',2),
 (10,'marcelo',2);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


--
-- Definition of table `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
CREATE TABLE `colaborador` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_login` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_colaborador_usuario` (`usuario_login`),
  CONSTRAINT `fk_colaborador_usuario` FOREIGN KEY (`usuario_login`) REFERENCES `usuario` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `colaborador`
--

/*!40000 ALTER TABLE `colaborador` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador` ENABLE KEYS */;


--
-- Definition of table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE `disciplina` (
  `codDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cargaHoraria` int(11) NOT NULL,
  `conteudo` text,
  PRIMARY KEY (`codDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disciplina`
--

/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`codDisciplina`,`nome`,`cargaHoraria`,`conteudo`) VALUES 
 (1,'Matematica',80,'asd\r\nasd'),
 (2,'Ingles',60,NULL);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;


--
-- Definition of table `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor` (
  `matricula` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_login` varchar(20) DEFAULT NULL,
  `disciplina_codDisciplina` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_professor_usuario` (`usuario_login`),
  KEY `fk_professor_disciplina` (`disciplina_codDisciplina`),
  CONSTRAINT `fk_professor_disciplina` FOREIGN KEY (`disciplina_codDisciplina`) REFERENCES `disciplina` (`codDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_usuario` FOREIGN KEY (`usuario_login`) REFERENCES `usuario` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professor`
--

/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `login` varchar(20) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `senha` varchar(12) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`login`,`nome`,`senha`) VALUES 
 ('marcelo','Marcelo Almeida','123'),
 ('Mauricio','mauricio','10'),
 ('professor','professor','1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
