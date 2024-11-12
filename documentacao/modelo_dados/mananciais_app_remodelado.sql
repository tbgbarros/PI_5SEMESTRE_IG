-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Out-2024 às 21:07
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mananciais_app`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `curtida`
--



-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--



-- --------------------------------------------------------

--
-- Estrutura da tabela `login_user`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senha` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `logradouro` varchar(30) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `numero_casa` int(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `fk_login_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`fk_login_id`) REFERENCES `login`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Extraindo dados da tabela `login_user`
--
CREATE TABLE `liked` (
  `id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_Post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`fk_user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `dependent` (
  `id` int(11) NOT NULL,
  `nome_dependete` varchar(30) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

CREATE TABLE `post` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_file_id` int(11) NOT NULL,
  FOREIGN KEY (`fk_file_id`) REFERENCES `storage`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- --------------------------------------------------------
CREATE TABLE `storage`(
  `id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `file` mediumblob DEFAULT NULL,
  `fk_post_id` int(11) NOT NULL,
  FOREIGN KEY (`fk_post_id`) REFERENCES `post`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Estrutura da tabela `salvar`
--

CREATE TABLE `save` (
  `fk_user_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `fk_Post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `curtida`
--
ALTER TABLE `liked`
  ADD KEY `FK_Like_2` (`fk_Post_id`);
  

--
-- Índices para tabela `dependente`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Dependente_2` (`fk_user_id`);


--
-- Índices para tabela `salvar`
--
ALTER TABLE `save`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Salvar_2` (`fk_Post_id`),
  ADD KEY `Fk_salvar` (`fk_user_id`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `curtida`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `FK_Like_2` FOREIGN KEY (`fk_Post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `FK_Dependente_2` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_Post_2` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);

--
-- Limitadores para a tabela `salvar`
--
ALTER TABLE `save`
  ADD CONSTRAINT `FK_Salvar_2` FOREIGN KEY (`fk_Post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Fk_salvar` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
