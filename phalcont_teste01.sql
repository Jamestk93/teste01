-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.29-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para phalcont_teste01
CREATE DATABASE IF NOT EXISTS `phalcont_teste01` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `phalcont_teste01`;

-- Copiando estrutura para tabela phalcont_teste01.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela phalcont_teste01.categoria: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT IGNORE INTO `categoria` (`id`, `nome_categoria`) VALUES
	(1, 'Esportes'),
	(2, 'Saúde'),
	(3, 'Cinema'),
	(4, 'Política');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela phalcont_teste01.noticia
CREATE TABLE IF NOT EXISTS `noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `titulo` varchar(500) DEFAULT NULL,
  `texto` text,
  `publicado` varchar(10) DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `data_ultima_atualizacao` datetime DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_id` (`categoria_id`),
  CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela phalcont_teste01.noticia: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT IGNORE INTO `noticia` (`id`, `categoria_id`, `titulo`, `texto`, `publicado`, `data_publicacao`, `data_ultima_atualizacao`, `data_cadastro`) VALUES
	(25, 1, 'asdasd', 'asdasdasd', NULL, '2022-01-23 00:00:00', '2022-01-27 05:44:54', '2022-01-26 23:48:30'),
	(27, 1, 'afsadf', 'asdfs', '0', '0000-00-00 00:00:00', '2022-01-27 05:47:24', '2022-01-27 05:35:08'),
	(28, 1, 'asdasd', 'sdfsadfasdf', 'on', '0000-00-00 00:00:00', '2022-01-27 05:47:20', '2022-01-27 05:40:56'),
	(29, 4, 'sdasdf', 's', 'on', '2022-01-19 00:00:00', '2022-01-27 05:47:53', '2022-01-27 05:47:53');
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;

-- Copiando estrutura para tabela phalcont_teste01.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela phalcont_teste01.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`id`, `nome`, `email`, `senha`) VALUES
	(1, 'Teste', 'teste1@brasilbigdata.com.br', '123456');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
