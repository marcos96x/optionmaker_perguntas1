-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 186.202.152.102
-- Generation Time: 31-Jul-2023 às 15:50
-- Versão do servidor: 5.7.32-35-log
-- PHP Version: 5.6.40-0+deb8u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_qrcode_test`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alternativa`
--

CREATE TABLE `alternativa` (
  `alternativa_id` int(11) NOT NULL,
  `alternativa_titulo` text,
  `alternativa_cor` varchar(16) DEFAULT NULL,
  `alternativa_pergunta` int(11) DEFAULT NULL,
  `alternativa_escolhas` int(11) DEFAULT '0',
  `alternativa_peso` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `alternativa`
--

INSERT INTO `alternativa` (`alternativa_id`, `alternativa_titulo`, `alternativa_cor`, `alternativa_pergunta`, `alternativa_escolhas`, `alternativa_peso`) VALUES
(33, 'O ano todo, basta querer.', '#000000', 7, 2, 0),
(34, 'De novembro a março', '#000000', 7, 0, 0),
(35, 'junho e julho', '#000000', 7, 0, 0),
(36, 'nenhuma das alternativas', '#000000', 7, 0, 0),
(51, 'teste 1', '#000000', 8, 0, 0),
(52, 'teste 2', '#000000', 8, 0, 0),
(53, 'teste 3', '#000000', 8, 0, 0),
(54, 'teste 4', '#000000', 8, 0, 0),
(55, 'Uma bem elegante, como a Le Lis Blanc e Vivara', '#000000', 9, 0, 0),
(56, 'Uma super utilitária, como Le Biscuit e Preçolândia', '#000000', 9, 0, 0),
(57, 'Uma acessível, como C&A e Riachuello', '#000000', 9, 0, 0),
(58, 'Uma prática e fitness, como Centauro e Mundo Verde', '#000000', 9, 0, 0),
(59, 'Uma bem inteligente, como a Leitura', '#000000', 9, 0, 0),
(60, 'Padecer no paraíso', '#000000', 10, 0, 0),
(61, 'Viver rodeado de tentações', '#000000', 10, 0, 0),
(62, 'Diversão de domingo a domingo', '#000000', 10, 0, 0),
(63, '“Já que você está aí, não esquece de comprar…”', '#000000', 10, 0, 0),
(64, 'todas as anteriores.', '#000000', 10, 0, 0),
(65, 'Aprender a materializar, muitas vezes, o que parecia impossível', '#000000', 11, 1, 0),
(66, 'Um constante aprendizado', '#000000', 11, 1, 0),
(67, 'Uma chance de construir uma carreira', '#000000', 11, 1, 0),
(68, 'Fazer parte de uma equipe top', '#000000', 11, 0, 0),
(69, 'todas as anteriores', '#000000', 11, 8, 0),
(70, 'Top: consegui atingir meus objetivos', '#000000', 12, 0, 0),
(71, 'No sufoco: penei bastante, mas sinto que estou mais afiado agora', '#000000', 12, 0, 0),
(72, 'Difícil, mas sobrevivi.', '#000000', 12, 0, 0),
(73, 'Vôo de cruzeiro, sem grandes mudanças', '#000000', 12, 0, 0),
(74, 'Não acredito que já estamos quase em dezembro', '#000000', 12, 0, 0),
(75, 'Vou entrar de pé direito', '#000000', 13, 0, 0),
(76, 'Que venham ainda mais desafios, pois já tô fera', '#000000', 13, 0, 0),
(77, 'Fervilhando de ideias', '#000000', 13, 0, 0),
(78, 'Minha vez de brilhar', '#000000', 13, 0, 0),
(79, 'Ainda vou fazer minha lista', '#000000', 13, 0, 0),
(80, 'Crise Argentina e Venezuela', '#000000', 14, 0, 0),
(81, 'Redução gradual da inflação dos EUA ', '#000000', 14, 0, 0),
(82, 'China em constante expansão nos mercados emergentes', '#000000', 14, 0, 0),
(83, 'Ucrânia ou outra crise geopolítica', '#000000', 14, 1, 0),
(84, 'Abaixo de 6%', '#000000', 15, 0, 0),
(85, '6-7%', '#000000', 15, 0, 0),
(86, '7-8%', '#000000', 15, 0, 0),
(87, 'Acima de 8%', '#000000', 15, 0, 0),
(88, 'Baixo, porque a hidrologia vai melhorar', '#000000', 16, 0, 0),
(89, 'Baixo, porque o presidente Luiz Inacio da Silva não implementará recursos de infraestrutura ', '#000000', 16, 0, 0),
(90, 'Alta, por causa da hidrologia pouco robusta', '#000000', 16, 0, 0),
(91, 'Alta, por problemas estruturais do setor', '#000000', 16, 1, 0),
(92, 'Abaixo de 5,20', '#000000', 17, 0, 0),
(93, '5,20 – 5,35', '#000000', 17, 0, 0),
(94, '5,35 – 5,50', '#000000', 17, 0, 0),
(95, '5,50 – 6,00', '#000000', 17, 0, 0),
(96, 'Acima de 6,00', '#000000', 17, 0, 0),
(97, '0,20 mg/Kg', '#000000', 18, 0, 0),
(99, '0,25 mg/Kg', '#000000', 18, 0, 0),
(100, '0,5 mg/Kg', '#000000', 18, 0, 0),
(102, '5 mg', '#000000', 18, 0, 0),
(105, 'ALTERNATIVA 1', '#000000', 19, 0, 0),
(106, 'ALTERNATIVA 2', '#000000', 19, 0, 0),
(107, 'ALTERNATIVA 3', '#000000', 19, 0, 0),
(108, 'ALTERNATIVA 4', '#000000', 19, 0, 0),
(109, 'opção 1', '#000000', 21, 0, 0),
(114, 'opção 2', '#000000', 21, 0, 0),
(116, 'opção 3', '#000000', 21, 0, 0),
(117, 'opção 4', '#000000', 21, 0, 0),
(118, 'opção 5', '#000000', 21, 0, 0),
(119, 'opção 6', '#000000', 21, 0, 0),
(120, 'Sim, para todos os casos rotineiramente', '#000000', 22, 1, 0),
(121, 'Sim, dependendo da história clínica e imagem', '#000000', 22, 2, 0),
(122, 'Não, solicitamos no intraoperatório', '#000000', 22, 1, 0),
(123, 'Não, deixamos a cargo do oncologista no pós-operatório', '#000000', 22, 2, 0),
(124, 'Não, nunca solicitamos', '#000000', 22, 2, 0),
(125, 'teste1', '#000000', 23, 46, 0),
(126, 'teste2', '#000000', 23, 32, 0),
(127, 'teste3', '#000000', 23, 37, 0),
(128, 'teste4', '#000000', 23, 40, 0),
(129, 'uma', '#000000', 24, 18, 0),
(130, 'duas', '#000000', 24, 34, 0),
(131, 'tres', '#000000', 24, 26, 0),
(132, 'quatro', '#000000', 24, 22, 0),
(133, 'Maria de Lurdes', '#000000', 25, 1, 0),
(134, 'Maria Aparecida', '#000000', 25, 0, 0),
(135, 'Luiza Brunet', '#000000', 25, 0, 0),
(136, 'Juliana Paes', '#000000', 25, 1, 0),
(137, 'Marisa de Lima', '#000000', 25, 0, 0),
(138, 'Roberta Miranda', '#000000', 25, 0, 0),
(139, 'Dona Flor', '#000000', 25, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pasta`
--

CREATE TABLE `pasta` (
  `pasta_id` int(11) NOT NULL,
  `pasta_nome` varchar(255) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `pasta`
--

INSERT INTO `pasta` (`pasta_id`, `pasta_nome`) VALUES
(12, 'RAINHA 2023 - FESTA DO PEÃO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pasta_usuario`
--

CREATE TABLE `pasta_usuario` (
  `pasta_usuario_id` int(11) NOT NULL,
  `pasta_usuario_usuario_id` int(11) DEFAULT NULL,
  `pasta_usuario_pasta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `pasta_usuario`
--

INSERT INTO `pasta_usuario` (`pasta_usuario_id`, `pasta_usuario_usuario_id`, `pasta_usuario_pasta_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 1, 1),
(4, 2, 3),
(5, 2, 4),
(6, 3, 4),
(7, 3, 3),
(8, 2, 7),
(9, 2, 5),
(10, 2, 9),
(11, 2, 11),
(12, 2, 10),
(13, 2, 8),
(14, 1, 11),
(15, 3, 11),
(16, 1, 10),
(17, 1, 8),
(18, 1, 4),
(19, 2, 6),
(22, 2, 12),
(23, 1, 7),
(24, 3, 7),
(25, 1, 5),
(26, 3, 5),
(27, 1, 3),
(28, 1, 9),
(29, 3, 9),
(30, 3, 10),
(31, 3, 8),
(32, 1, 6),
(33, 3, 6),
(34, 4, 13),
(35, 1, 13),
(36, 1, 15),
(37, 4, 15),
(40, 5, 1),
(42, 3, 1),
(44, 7, 1),
(46, 7, 3),
(47, 8, 3),
(48, 8, 5),
(49, 9, 5),
(50, 4, 6),
(51, 5, 6),
(53, 7, 8),
(54, 8, 10),
(55, 9, 10),
(57, 10, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pergunta`
--

CREATE TABLE `pergunta` (
  `pergunta_id` int(11) NOT NULL,
  `pergunta_titulo` text,
  `pergunta_url` varchar(255) DEFAULT NULL,
  `pergunta_pasta` int(11) DEFAULT NULL,
  `pergunta_tipo` int(11) DEFAULT '1',
  `pergunta_contabiliza_grupo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pergunta`
--

INSERT INTO `pergunta` (`pergunta_id`, `pergunta_titulo`, `pergunta_url`, `pergunta_pasta`, `pergunta_tipo`, `pergunta_contabiliza_grupo`) VALUES
(7, 'Qual a melhor época para ir à Maceió?', '09a37e1fc39928fe0fdebf2333486d8e', 3, 2, 0),
(8, 'teste keypad', '5dfafccab8abba464ff9da93e2748cc1', 4, 1, 0),
(9, '1- Se você fosse uma loja do Parque Shopping, seria…', 'b10e81e3d7bc158e8dacbe2bfd583f63', 5, 2, 0),
(10, '2- Trabalhar num shopping center é…', '87ce7ded65e34d7f3d6927a7ae7fbb83', 5, 2, 0),
(11, '3- O que significa para você fazer parte do Parque Shopping?', 'e31dae39768c82810d9d15d4c54e6e30', 5, 2, 0),
(12, '4- Na sua percepção, 2022 foi um ano…', '21f6be122e0bca0b10641bcecb5cb737', 5, 2, 0),
(13, '5- Qual sua expectativa para 2023:', '646bc4dba45986e71f8e7a31c5a80e98', 5, 2, 0),
(14, '1- Qual é a sua principal preocupação no cenário macro global para 2023?', 'd96670c3262a6141c01a727fc7a35507', 6, 2, 0),
(15, '2 - Qual é a sua expectativa para o crescimento da China em 2023?', '0bafde200b59080d051a153e6b901d82', 6, 2, 1),
(16, '3 - Qual o risco de racionamento de energia no Brasil em 2023?', 'becb8eb9ea5ecb727538b437bfed6262', 6, 2, 1),
(17, '4 - Onde você espera que o USD-BRL termine ano de 2023?', '889147090a66bfd8299e84eed4fc326f', 6, 2, 0),
(18, 'BSP, 4 anos: AME tipo 2 •Idade de início: 10 meses (hipotonia e atraso motor) •Idade ao diagnóstico: 2 anos •Tratamento: Nusinersena – 2,5 aos 3 anos (parou por dificuldade de acesso lombar) Risdiplam – a partir dos 3 anos •Status no início do tratamento com Risdiplam: Escala HFMSE = 6 / 66.  Que dose de Risdiplam este paciente deve receber?', 'bbaaeb48dedc26f1f82745506f6bfc98', 7, 2, 1),
(19, 'PERGUNTA CASO CLINICO 1', '2c219dbdb8dd52cfe933bc406970e9c5', 8, 2, 0),
(20, 'PERGUNTA CASO CLINICO 2', '3c9b3f0653e1f75f49ede22c1d2d9a22', 8, 2, 0),
(21, 'adicione o titulo da pergunta', '94ebca38a6e81323129d868a9de4bbb3', 9, 2, 0),
(22, 'Na sua rotina de trabalho, voce (ou sua equipe) pede testagem molecular durante o estadiamento de paciente com eCPNPC?', '659006b37cf59ba013536c0b97b1655b', 10, 2, 0),
(23, 'testesssss', '5448547faa704d9ca37a2d2975bf8a6c', 11, 2, 0),
(24, 'testes 2', '701b45ac3aca0160c53c0ca99141594d', 11, 2, 0),
(25, 'Vote para a Rainha da Festa do Peão de Guarani d\\\'Oeste', '41f956dde5b601e3cfdb955b46d5f503', 12, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nome` varchar(255) DEFAULT NULL,
  `usuario_status` int(11) NOT NULL DEFAULT '1',
  `usuario_login` varchar(255) DEFAULT NULL,
  `usuario_senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nome`, `usuario_status`, `usuario_login`, `usuario_senha`) VALUES
(1, 'admin', 1, 'admin', '4a0d87d0862679ef7ccc0cfa5bca5cbb'),
(3, NULL, 1, 'marcos', 'c5e3539121c4944f2bbe097b425ee774'),
(9, NULL, 2, 'rica@justlive', '827ccb0eea8a706c4c34a16891f84e7b'),
(10, NULL, 2, 'Rainha-Teste', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternativa`
--
ALTER TABLE `alternativa`
  ADD PRIMARY KEY (`alternativa_id`);

--
-- Indexes for table `pasta`
--
ALTER TABLE `pasta`
  ADD PRIMARY KEY (`pasta_id`);

--
-- Indexes for table `pasta_usuario`
--
ALTER TABLE `pasta_usuario`
  ADD PRIMARY KEY (`pasta_usuario_id`);

--
-- Indexes for table `pergunta`
--
ALTER TABLE `pergunta`
  ADD PRIMARY KEY (`pergunta_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternativa`
--
ALTER TABLE `alternativa`
  MODIFY `alternativa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `pasta`
--
ALTER TABLE `pasta`
  MODIFY `pasta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pasta_usuario`
--
ALTER TABLE `pasta_usuario`
  MODIFY `pasta_usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `pergunta`
--
ALTER TABLE `pergunta`
  MODIFY `pergunta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
