-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2021 at 11:40 AM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternativa`
--

CREATE TABLE `alternativa` (
  `alternativa_id` int NOT NULL,
  `alternativa_texto` text NOT NULL,
  `alternativa_correta` int NOT NULL DEFAULT '0',
  `alternativa_indicador` varchar(3) NOT NULL,
  `alternativa_pergunta` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alternativa`
--

INSERT INTO `alternativa` (`alternativa_id`, `alternativa_texto`, `alternativa_correta`, `alternativa_indicador`, `alternativa_pergunta`) VALUES
(1, 'A mudança é algo natural no universo', 0, 'A', 1),
(2, 'Há muitas fases no processo de mudança', 0, 'B', 1),
(3, 'A resistência ao processo de mudança começa pela negação', 0, 'C', 1),
(4, 'A velocidade que assimilamos a mudança é decisiva para o sucesso', 0, 'D', 1),
(5, 'Todas as alternativas são verdadeiras', 1, 'E', 1),
(6, 'Porque estamos perdendo participação de mercado', 0, 'A', 2),
(7, 'Porque estamos acompanhando megatendências globais como urbanização e envelhecimento crescente da polpulação em todo o mundo, aumento de demanda por mobilidade urbana e mudança de hábitos que exigem mais digitalização', 0, 'B', 2),
(8, 'Porque os clientes esperam produtos e ofertas adaptadas e que tenham facilidades de especificar e encomendar', 0, 'C', 2),
(9, 'Somente as alternativas B e C estão corretas', 1, 'D', 2),
(10, 'Todas as alternativas são corretas', 0, 'E', 2),
(11, 'As 3 Linhas de Produto do Projeto F3 aumentam a competitividade da Atlas Schindler', 0, 'A', 3),
(12, 'O Schindler 1000 foi planejado para ser Pratico, Confiável e Compacto', 0, 'B', 3),
(13, 'O Schindler 3000 foi planejado para transmitir Estilo, Funcionalidade e Flexibilidade', 1, 'C', 3),
(14, 'O Schindler 5000 foi planejado para oferecer Imponência, Tecnologia e Superioridade', 0, 'D', 3),
(15, 'Todas as respostas explicam o novo Posionamento das linhas de Produto', 0, 'E', 3),
(16, 'O Schindler 1000 se aplica de 5 a 9 pessoas nas velocodades de 0,75 m/s e 1 m/s , ate´12 paradas, para edifícios residenciais, pequenos hotéis e casas em condomínios', 0, 'A', 4),
(17, 'O schindler 1000 não se aplica como elevador de carga', 0, 'B', 4),
(18, 'O Schindler 1000 se limita a cabinas com 2200mm de altura com portas telescópicas e de abertura central de 800 ou 900mm', 0, 'C', 4),
(19, 'Podemos oferecer um Schindler 1000 com cabina pintada ou inox', 0, 'D', 4),
(20, 'O Schindler 1000 irá competir com Synergy 100 e Otis Gen2 Ligtht', 1, 'E', 4),
(21, 'O Schindler 1000 vai nos tornar mais competitivos com a capacidade de 5 pessoas em edifícios de até 6 andares com 1 elevador', 0, 'A', 5),
(22, 'O Schindler 1000 será a 1a. Opção de configuração no A-NC quando o cliente se restringir às especificações básicas para edifícios até 12 paradas', 0, 'B', 5),
(23, 'O Schindler 1000 permite aplicar portas opostas na cabina', 1, 'C', 5),
(24, 'Com Schindler 1000 podemos operar 2 carros em grupo até 12 paradas', 0, 'D', 5),
(25, 'O Schindler 1000 só tem Nível de Especificação 1', 0, 'E', 5),
(26, 'Nossa oferta de produtos permite um ligeiro aumento da cobertura do mercado no segmento inferior.', 0, 'A', 6),
(27, 'O produto que oferecemos no espectro intermediário do mercado aumentou o âmbito de aplicação e flexibilidade, aumentando a cobertura em ambos os intervalos de mercado, em comparação à solução anterior disponível.', 0, 'B', 6),
(28, 'O nível superior do mercado permanece coberto pelos nossos produtos de alto padrão, capazes de atender aos requisitos mais rigorosos de desempenho, qualidade e complexidade.', 0, 'C', 6),
(29, 'Nenhuma das alternativas está correta', 0, 'D', 6),
(30, 'As alternativas A,B e C estão corretas', 1, 'E', 6),
(31, 'Hotéis', 1, 'A', 7),
(32, 'Transporte Publico', 0, 'B', 7),
(33, 'Escritórios', 0, 'C', 7),
(34, 'Apartamentos', 0, 'D', 7),
(35, 'Hospitais', 0, 'E', 7),
(36, 'Interface para sistema de restrição de acesso: O elevador só pode ser acionado por pessoas previamente cadastradas e reconhecidas por meio de sistemas de restrição de acesso por cartão ou senha.', 0, 'A', 8),
(37, 'CFTV (Circuito Fechado de Televisão): Uma conexão entre entre cabina e sistema de gerenciamento predial do edifício permitirá a transferência de dados para transmissão de imagens obtidas por uma câmera a ser instalada na cabina. (A câmera e os monitores correspondentes não estão inclusos no fornecimento).', 0, 'B', 8),
(38, 'Iluminação indireta: proporciona maior conforto no transporte de passageiros', 0, 'C', 8),
(39, 'Retorno automático ao pavimento principal: Função na qual a cabina retorna automaticamente para o andar principal, reduzindo o tempo de espera dos passageiros que chegam pelo andar térreo, tornando o percurso até os andares superiores mais rápido e confortável.', 0, 'D', 8),
(40, 'Cancelamento de chamadas falsas: O sistema identifica e anula automaticamente as chamadas falsas.', 1, 'E', 8),
(41, 'Relação qualidade x preço', 0, 'A', 9),
(42, 'Escolhas simples', 0, 'B', 9),
(43, 'Pronto para o futuro', 0, 'C', 9),
(44, 'Maximizar o espaço', 0, 'D', 9),
(45, 'Todas as alternativas anteriores', 1, 'E', 9),
(46, '1- Sobrepeso de até 50% 2-variedade de opções 3- design flexivel', 0, 'A', 10),
(47, '1-Unidade de regeneração de energia 2- Classe A 3- Ecologico', 0, 'B', 10),
(48, '1- STM 2- cabina espaçosa 3- viagem mais confortável', 0, 'C', 10),
(49, '1- Plataforma Modular 2-Tempo de resposta rápido 3-Confiável', 1, 'D', 10),
(50, '1-Agrupamento de 8 carros 2- alta capacidade de tragfego 3- Performance', 0, 'E', 10),
(51, 'Uma ferramenta digital on line com interface para projetos', 0, 'A', 11),
(52, 'Uma futura interface para a tecnologia BIM', 0, 'B', 11),
(53, 'Um guia digital que conduz o arquiteto para a especificação certa', 0, 'C', 11),
(54, 'Uma ferramenta para obter relatorios on line de leads', 1, 'D', 11),
(55, 'Somente as alternativas A, B e C estão corretas', 0, 'E', 11),
(56, 'Que a configuração do elevador seja básica dentro do requerimento de cada cliente', 0, 'A', 12),
(57, 'que a competitividade das Ofertas seja maior pois o elevador a ser configurado no A-NC não poderá ter opcionais', 0, 'B', 12),
(58, 'Agrupar olguns pcionais do interesse do cliente com preço mais competitivo', 0, 'C', 12),
(59, 'Somente as alternativas A e C estão corretas', 0, 'D', 12),
(60, 'Todas as alternativas estão corretas', 1, 'E', 12),
(61, 'Será aplicada aos elevadores S1000, S3000 e S5000 em MOD', 1, 'A', 13),
(62, 'Vai permitir substituições parciais com aproveitamento de componentes existentes no lançamento para MOD', 0, 'B', 13),
(63, 'Vai permitir alterações para ser fornecida com portas eixo vertical em predios onde as cabinas já são pequenas', 0, 'C', 13),
(64, 'Vai ser fornecida com portas de 700mm para reduzir problemas de obra civil', 0, 'D', 13),
(65, 'Será limitada a edifícios residenciais de até 12 paradas', 0, 'E', 13),
(66, 'Know-how, estrutura e capacidade para fornecer o escopo de trabalho mais exigente. Um parceiro para todo o ciclo de vida do elevado', 0, 'A', 14),
(67, 'Empresa estável, com valores sólidos e longa história, projetos de sucesso e clientes satisfeitos.', 0, 'B', 14),
(68, 'O tamanho importa, entre as melhores do setor, configuração profissional, alta disponibilidade e capacidade, independentemente da localização.', 0, 'C', 14),
(69, 'As melhores soluções e tecnologias disponíveis. Engenharia de precisão e alta qualidade. Empresa e produtos ecológicos', 1, 'D', 14),
(70, 'Todas são Propostas de Valor da Empresa e devem ser usados nas apresentações de negócios', 0, 'E', 14),
(71, 'Alta Flexibilidade - Confortável - Varias opções de Design', 0, 'A', 15),
(72, 'Escolhas Simples - Compacto - Otimo Custo x Benefício', 0, 'B', 15),
(73, 'Toque Pessoal - Desempenho em grandes alturas - Eficiência Enegética', 0, 'C', 15),
(74, 'Desempenho em alto tráfego - Completa liberdade de design - escolhas simples', 0, 'D', 15),
(75, 'Todas as alternativas estão incorretas', 1, 'E', 15),
(76, 'Navona - Times Square - Sunset Boulevard', 0, 'A', 16),
(77, 'Navona - Times Square - Park Avenue', 0, 'B', 16),
(78, 'Times Square - Park Avenue - Sunset Boulevar', 1, 'C', 16),
(79, 'Navona - Mediterranée - Times Square', 0, 'D', 16),
(80, 'Bare - Navona - Sunset Boulevard', 0, 'E', 16),
(81, 'Schindler 5000', 0, 'A', 17),
(82, 'Schindler 1000', 0, 'B', 17),
(83, 'Schindler 3000', 1, 'C', 17),
(84, 'Todos tem níveis de Especificação 2', 0, 'D', 17),
(85, 'Só a opção A tem Nível de Especificação 2', 0, 'E', 17),
(86, '30% mais o peso do piso de granito', 0, 'A', 18),
(87, '15% no total', 0, 'B', 18),
(88, '50% já incluido o piso de granito', 0, 'C', 18),
(89, '30% já incluido o piso de granito', 1, 'D', 18),
(90, 'Nenhuma das anteriores', 0, 'E', 18),
(91, 'Square spot-round spot- curve-line-bracket -dash - indirect', 0, 'A', 19),
(92, 'Square spot-round spot- curve-dash -bracket', 0, 'B', 19),
(93, 'Round spot- curve-line-bracket- dash - dash array', 0, 'C', 19),
(94, 'Round spot- curve-line-bracket- dash array - indirect', 1, 'D', 19),
(95, 'Square spot-round spot- curve-dash array -bracket', 0, 'E', 19),
(96, 'Schindler 5000 como opcional', 0, 'A', 20),
(97, 'Schindler 3000 como opcional e Schindler 5000', 1, 'B', 20),
(98, 'Em todas as linhas como opcional', 0, 'C', 20),
(99, 'A única alternativa correta é a opção B', 0, 'D', 20),
(100, 'Nenhuma das alternativas é correta', 0, 'E', 20);

-- --------------------------------------------------------

--
-- Table structure for table `grupo`
--

CREATE TABLE `grupo` (
  `grupo_id` int NOT NULL,
  `grupo_nome` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `grupo`
--

INSERT INTO `grupo` (`grupo_id`, `grupo_nome`) VALUES
(1, 'Vermelho'),
(2, 'Azul'),
(3, 'Amarelo'),
(4, 'Verde'),
(5, 'Branco');

-- --------------------------------------------------------

--
-- Table structure for table `pergunta`
--

CREATE TABLE `pergunta` (
  `pergunta_id` int NOT NULL,
  `pergunta_texto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pergunta`
--

INSERT INTO `pergunta` (`pergunta_id`, `pergunta_texto`) VALUES
(1, 'Estamos enfrentando um período de mudanças. Escolha a alternativa verdadeira'),
(2, 'Por que a Schindler desenvolveu o Projeto F3? Indique a resposta correta.'),
(3, 'Selecione a resposta que explica o novo Posicionamento das Linhas de Produto'),
(4, 'Assinale a resposta errada'),
(5, 'Assinale a resposta errada'),
(6, 'Assinale a alternativa correta'),
(7, '\"Nossos elevadores e escadas rolantes funcionam com eficiência máxima durante o pico de tráfego. Quando o tráfego diminui o mesmo ocorre com o consumo de energia. Nossa tecnologia oferece desemppenho sem desperdício e oferecenos flexibilidade em design, tamanhos de cabina e opções de comando\". Esta afirmativa corresponde ao segmento de mercado de:'),
(8, 'Não faz paerte do KIT Hotelaria'),
(9, 'A argumentação de vendas para o Schinlder 1000 será'),
(10, 'Sabendo o que é modularidade relacione para o componrnte INVERSOR qual a alternativa que apresenta 1- a caracteristica do componente 2- o benefício para o cliente 3- qual será o valor para o cliente:'),
(11, 'Com a nova ferramenta PDT a Schindler vai oferecer globalmente a seus clientes:'),
(12, 'A nova estratégia de oferta de Kits vai permitir'),
(13, 'A denominação Plus nos nomes das linhas de produto:'),
(14, 'A Schindler possui uma série de atributos que constituem a Proposta de Valor da Empresa, expressa pela sua da marca. O front de vendas deve aproveitar a oportunidade ao contatar seus clientes para criar percepção de valor, reforçar a imagem da marca Schindler e seus diferenciais. Identifique quais são diferenciais a serem usados como argumentos nos negócios.'),
(15, 'Enquanto o Schindler 1000 tem Posicionamento como uma linha de Mobilidade Econômica , o Posicionamento de mercado para o Schindler 3000 é ser Flexível, Elegante e Versátil pela sua abrangência de aplicações. Escolha 3 argumentos-chave de sua aplicação.'),
(16, 'As linhas de design do Schindler 3000 são'),
(17, 'Sabendo que os Níveis de Especificação são um conjunto de opções agrupados no configurador A-NC em 3 níveis diferentes indique qual linha de produtos tem Nivel de Especificação 2.'),
(18, 'O sobrepeso permitido para a linha S3000 é de'),
(19, 'Os tetos que podem ser especificados na linha S3000 são'),
(20, 'A botoeira Linea 800 pode ser especificada nas seguintes linhas');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int NOT NULL,
  `usuario_email` varchar(120) NOT NULL,
  `usuario_nome` varchar(120) DEFAULT NULL,
  `usuario_status` int NOT NULL DEFAULT '1',
  `usuario_grupo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_email`, `usuario_nome`, `usuario_status`, `usuario_grupo`) VALUES
(1, 'cyntia.mantovani@schindler.com', 'Cyntia Mantovani', 1, 2),
(2, 'alex.serravallo@schindler.com', 'Alex Serravallo', 1, 2),
(3, 'ivan.milanesi@schindler.com', 'Ivan Milanesi', 1, 2),
(4, 'ellery.re@schindler.com', 'Ellery Re', 1, 2),
(5, 'eduardo.pardo@schindler.com', 'Eduardo Pardo', 1, 2),
(6, 'hugo.eugenio@schindler.com', 'Hugo Eugenio', 1, 2),
(7, 'abel.dobrychtop@schindler.com', 'Abel Dobrychtop', 1, 2),
(8, 'rosana.percicotti@schindler.com', 'Rosana Percicotti', 1, 2),
(9, 'luiz.santos@schindler.com', 'Luiz Santos', 1, 2),
(10, 'alexandre.armuch@schindler.com', 'Alexandre Armuch', 1, 2),
(11, 'fernando.vinicius@schindler.com', 'Fernando Vinicius', 1, 4),
(12, 'geder.monteiro@schindler.com', 'Geder Monteiro', 1, 4),
(13, 'roberto.solano@schindler.com', 'Roberto Solano', 1, 4),
(14, 'sergio.alves@schindler.com', 'Sergio Alves', 1, 4),
(15, 'carlos.gomes@schindler.com', 'Carlos Gomes', 1, 4),
(16, 'eduardo.papis@schindler.com', 'Eduardo Papis', 1, 4),
(17, 'carlos.canelas@schindler.com', 'Carlos Canelas', 1, 4),
(18, 'airton.deitos@schindler.com', 'Airton Deitos', 1, 4),
(19, 'cecilia.queiroz@schindler.com', 'Cecilia Queiroz', 1, 4),
(20, 'alberto.cohen@schindler.com', 'Alberto Cohen', 1, 4),
(21, 'jose.carlos.burle.faria@schindler.com', 'Jose Carlos Burle Faria', 1, 1),
(22, 'patricia.andersen@schindler.com', 'Patricia Andersen', 1, 1),
(23, 'eduardo.gervasoni@schindler.com', 'Eduardo Gervasoni', 1, 1),
(24, 'gustavo.eloy@schindler.com', 'Gustavo Eloy', 1, 1),
(25, 'joao.marlus.rodrigues@schindler.com', 'Joao Marlus Rodrigues', 1, 1),
(26, 'deitosai@schindler.com', 'Deitosai', 1, 1),
(27, 'ana.sena@schindler.com', 'Ana Sena', 1, 1),
(28, 'paulo.barcelos@schindler.com', 'Paulo Barcelos', 1, 1),
(29, 'silvestre.oliveira@schindler.com', 'Silvestre Oliveira', 1, 1),
(30, 'viviana.gomes@schindler.com', 'Viviana Gomes', 1, 1),
(31, 'carlos.dumaresq@schindler.com', 'Carlos Dumaresq', 1, 3),
(32, 'alexandre.zogaib@schindler.com', 'Alexandre Zogaib', 1, 3),
(33, 'jorge.barros@schindler.com', 'Jorge Barros', 1, 3),
(34, 'jose.wellington@schindler.com', 'Jose Wellington', 1, 3),
(35, 'marcelo.frate@schindler.com', 'Marcelo Frate', 1, 3),
(36, 'aylton.nunes@schindler.com', 'Aylton Nunes', 1, 3),
(37, 'davison.oliveira@schindler.com', 'Davison Oliveira', 1, 3),
(38, 'nabson.bussons@schindler.com', 'Nabson Bussons', 1, 3),
(39, 'eneas.oliveira@schindler.com', 'Eneas Oliveira', 1, 3),
(40, 'estefania.almeida@schindler.com', 'Estefania Almeida', 1, 3),
(41, 'rafael.ferraz@schindler.com', 'Rafael Ferraz', 1, 5),
(42, 'jesse.junio@schindler.com', 'Jesse Junio', 1, 5),
(43, 'moacir.costa@schindler.com', 'Moacir Costa', 1, 5),
(44, 'gustavo.alberte@schindler.com', 'Gustavo Alberte', 1, 5),
(45, 'raimundo.andrade@schindler.com', 'Raimundo Andrade', 1, 5),
(46, 'pedro.araujo@schindler.com', 'Pedro Araujo', 1, 5),
(47, 'rosedema@schindler.com', 'Rosedema', 1, 5),
(48, 'dilson.sales@schindler.com', 'Dilson Sales', 1, 5),
(49, 'paulene.alexandre@schindler.com', 'Paulene Alexandre', 1, 5),
(50, 'bruno.carvalho@schindler.com', 'Bruno Carvalho', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_admin`
--

CREATE TABLE `usuario_admin` (
  `usuario_admin_id` int NOT NULL,
  `usuario_admin_login` varchar(120) NOT NULL,
  `usuario_admin_senha` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario_admin`
--

INSERT INTO `usuario_admin` (`usuario_admin_id`, `usuario_admin_login`, `usuario_admin_senha`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_resposta`
--

CREATE TABLE `usuario_resposta` (
  `usuario_resposta_id` int NOT NULL,
  `usuario_resposta_usuario` int DEFAULT NULL,
  `usuario_resposta_grupo` int DEFAULT NULL,
  `usuario_resposta_pergunta` int DEFAULT NULL,
  `usuario_resposta_resposta` int DEFAULT NULL,
  `usuario_resposta_certa` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternativa`
--
ALTER TABLE `alternativa`
  ADD PRIMARY KEY (`alternativa_id`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`grupo_id`);

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
-- Indexes for table `usuario_admin`
--
ALTER TABLE `usuario_admin`
  ADD PRIMARY KEY (`usuario_admin_id`);

--
-- Indexes for table `usuario_resposta`
--
ALTER TABLE `usuario_resposta`
  ADD PRIMARY KEY (`usuario_resposta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternativa`
--
ALTER TABLE `alternativa`
  MODIFY `alternativa_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `grupo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pergunta`
--
ALTER TABLE `pergunta`
  MODIFY `pergunta_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `usuario_admin`
--
ALTER TABLE `usuario_admin`
  MODIFY `usuario_admin_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario_resposta`
--
ALTER TABLE `usuario_resposta`
  MODIFY `usuario_resposta_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
