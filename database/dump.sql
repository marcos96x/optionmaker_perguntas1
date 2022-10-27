-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 19/07/2021 às 01:34
-- Versão do servidor: 10.3.28-MariaDB
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_perguntas_qr`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alternativa`
--

CREATE TABLE `alternativa` (
  `alternativa_id` int(11) NOT NULL,
  `alternativa_titulo` text DEFAULT NULL,
  `alternativa_cor` varchar(16) DEFAULT NULL,
  `alternativa_pergunta` int(11) DEFAULT NULL,
  `alternativa_escolhas` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `alternativa`
--

INSERT INTO `alternativa` (`alternativa_id`, `alternativa_titulo`, `alternativa_cor`, `alternativa_pergunta`, `alternativa_escolhas`) VALUES
(12, 'Kurosaki Ichigo', '#000000', 18, 0),
(13, 'Amano Ichigo', '#000000', 18, 0),
(14, 'Ichigo Kurokishi', '#000000', 18, 0),
(15, 'Azul', '#000000', 19, 0),
(16, 'Laranja', '#000000', 19, 0),
(17, 'Amarelo', '#000000', 19, 0),
(18, 'Twist', '#000000', 20, 0),
(19, 'GT', '#000000', 20, 0),
(20, 'GB', '#000000', 20, 0),
(21, 'KAL', '#000000', 20, 0),
(22, 'Bulma', '#000000', 21, 0),
(23, 'Cell', '#000000', 21, 0),
(24, 'Goshiko', '#000000', 21, 0),
(25, 'Goten', '#000000', 21, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pasta`
--

CREATE TABLE `pasta` (
  `pasta_id` int(11) NOT NULL,
  `pasta_nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pasta`
--

INSERT INTO `pasta` (`pasta_id`, `pasta_nome`) VALUES
(5, 'Bleach'),
(6, 'Naruto'),
(7, 'Dragon ball');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pasta_usuario`
--

CREATE TABLE `pasta_usuario` (
  `pasta_usuario_id` int(11) NOT NULL,
  `pasta_usuario_usuario_id` int(11) DEFAULT NULL,
  `pasta_usuario_pasta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pasta_usuario`
--

INSERT INTO `pasta_usuario` (`pasta_usuario_id`, `pasta_usuario_usuario_id`, `pasta_usuario_pasta_id`) VALUES
(3, 2, 3),
(4, 1, 3),
(5, 2, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pergunta`
--

CREATE TABLE `pergunta` (
  `pergunta_id` int(11) NOT NULL,
  `pergunta_titulo` text DEFAULT NULL,
  `pergunta_url` varchar(255) DEFAULT NULL,
  `pergunta_pasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pergunta`
--

INSERT INTO `pergunta` (`pergunta_id`, `pergunta_titulo`, `pergunta_url`, `pergunta_pasta`) VALUES
(18, 'Qual o nome do protagonista?', '00dad87d8bdce06143bbc380466ff944', 5),
(19, 'Qual a cor do cabelo do protagonista?', 'bcd8d6bcdc1e7bff5bedeb7c852c9d81', 5),
(20, 'Qual destas é uma saga oficial?', 'fc934ffb87262ee4e022b194c0c43c10', 7),
(21, 'Qual destes não é um personagem deste anime?', '02ba290f6fccac1d5c3aeb2d5de296ee', 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nome` varchar(255) DEFAULT NULL,
  `usuario_status` int(11) NOT NULL DEFAULT 1,
  `usuario_login` varchar(255) DEFAULT NULL,
  `usuario_senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nome`, `usuario_status`, `usuario_login`, `usuario_senha`) VALUES
(1, 'admin', 1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, NULL, 2, 'teste', '698dc19d489c4e4db73e28a713eab07b');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `alternativa`
--
ALTER TABLE `alternativa`
  ADD PRIMARY KEY (`alternativa_id`);

--
-- Índices de tabela `pasta`
--
ALTER TABLE `pasta`
  ADD PRIMARY KEY (`pasta_id`);

--
-- Índices de tabela `pasta_usuario`
--
ALTER TABLE `pasta_usuario`
  ADD PRIMARY KEY (`pasta_usuario_id`);

--
-- Índices de tabela `pergunta`
--
ALTER TABLE `pergunta`
  ADD PRIMARY KEY (`pergunta_id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `alternativa`
--
ALTER TABLE `alternativa`
  MODIFY `alternativa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `pasta`
--
ALTER TABLE `pasta`
  MODIFY `pasta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `pasta_usuario`
--
ALTER TABLE `pasta_usuario`
  MODIFY `pasta_usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pergunta`
--
ALTER TABLE `pergunta`
  MODIFY `pergunta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
