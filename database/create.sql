CREATE DATABASE db_quiz;
USE db_quiz;

CREATE TABLE IF NOT EXISTS usuario_admin (

    usuario_admin_id INT NOT NULL AUTO_INCREMENT,
    usuario_admin_login VARCHAR(120) NOT NULL,
    usuario_admin_senha VARCHAR(160) NOT NULL,

    CONSTRAINT pk_usuario_admin
        PRIMARY KEY (usuario_admin_id)
);

CREATE TABLE IF NOT EXISTS usuario (

    usuario_id INT NOT NULL AUTO_INCREMENT,
    usuario_email VARCHAR(120) NOT NULL,
    usuario_nome VARCHAR(120) NULL DEFAULT NULL,
    usuario_status INT(1) NOT NULL DEFAULT 1, 
    usuario_grupo INT,

    CONSTRAINT pk_usuario
        PRIMARY KEY (usuario_id)
);

CREATE TABLE IF NOT EXISTS grupo (

    grupo_id INT NOT NULL AUTO_INCREMENT,    
    grupo_nome VARCHAR(120) NULL DEFAULT NULL,    

    CONSTRAINT pk_grupo
        PRIMARY KEY (grupo_id)
);

CREATE TABLE IF NOT EXISTS pergunta (

    pergunta_id INT NOT NULL AUTO_INCREMENT,
    pergunta_texto TEXT NOT NULL,

    CONSTRAINT pk_pergunta
        PRIMARY KEY (pergunta_id)
);

CREATE TABLE IF NOT EXISTS alternativa (

    alternativa_id INT NOT NULL AUTO_INCREMENT,
    alternativa_texto TEXT NOT NULL,
    alternativa_correta INT(1) NOT NULL DEFAULT 0,
    alternativa_indicador VARCHAR(3) NOT NULL,
    alternativa_pergunta INT NULL,

    CONSTRAINT pk_alternativa
        PRIMARY KEY (alternativa_id)
);

CREATE TABLE IF NOT EXISTS usuario_resposta (

    usuario_resposta_id INT NOT NULL AUTO_INCREMENT,
    usuario_resposta_usuario INT NULL,
    usuario_resposta_grupo INT NULL,
    usuario_resposta_pergunta INT NULL,
    usuario_resposta_resposta INT NULL,
    usuario_resposta_certa INT(1) NULL DEFAULT 0,

    CONSTRAINT pk_usuario_resposta
        PRIMARY KEY (usuario_resposta_id)
);

-- INSERTS
INSERT INTO usuario_admin VALUES (DEFAULT, 'admin', '21232f297a57a5a743894a0e4a801fc3');
-- ----- grupo
INSERT INTO grupo VALUES 
(1, 'Vermelho'),
(2, 'Azul'),
(3, 'Amarelo'),
(4, 'Verde'),
(5, 'Branco');
-- ----- grupo

-- ----- usuario
INSERT INTO usuario VALUES 
(DEFAULT, 'cyntia.mantovani@schindler.com', 'Cyntia Mantovani', 1, 2),
(DEFAULT, 'alex.serravallo@schindler.com', 'Alex Serravallo', 1, 2),
(DEFAULT, 'ivan.milanesi@schindler.com', 'Ivan Milanesi', 1, 2),
(DEFAULT, 'ellery.re@schindler.com', 'Ellery Re', 1, 2),
(DEFAULT, 'eduardo.pardo@schindler.com', 'Eduardo Pardo', 1, 2),
(DEFAULT, 'hugo.eugenio@schindler.com', 'Hugo Eugenio', 1, 2),
(DEFAULT, 'abel.dobrychtop@schindler.com', 'Abel Dobrychtop', 1, 2),
(DEFAULT, 'rosana.percicotti@schindler.com', 'Rosana Percicotti', 1, 2),
(DEFAULT, 'luiz.santos@schindler.com', 'Luiz Santos', 1, 2),
(DEFAULT, 'alexandre.armuch@schindler.com', 'Alexandre Armuch', 1, 2),
(DEFAULT, 'fernando.vinicius@schindler.com', 'Fernando Vinicius', 1, 4),
(DEFAULT, 'geder.monteiro@schindler.com', 'Geder Monteiro', 1, 4),
(DEFAULT, 'roberto.solano@schindler.com', 'Roberto Solano', 1, 4),
(DEFAULT, 'sergio.alves@schindler.com', 'Sergio Alves', 1, 4),
(DEFAULT, 'carlos.gomes@schindler.com', 'Carlos Gomes', 1, 4),
(DEFAULT, 'eduardo.papis@schindler.com', 'Eduardo Papis', 1, 4),
(DEFAULT, 'carlos.canelas@schindler.com', 'Carlos Canelas', 1, 4),
(DEFAULT, 'airton.deitos@schindler.com', 'Airton Deitos', 1, 4),
(DEFAULT, 'cecilia.queiroz@schindler.com', 'Cecilia Queiroz', 1, 4),
(DEFAULT, 'alberto.cohen@schindler.com', 'Alberto Cohen', 1, 4),
(DEFAULT, 'jose.carlos.burle.faria@schindler.com', 'Jose Carlos Burle Faria', 1, 1),
(DEFAULT, 'patricia.andersen@schindler.com', 'Patricia Andersen', 1, 1),
(DEFAULT, 'eduardo.gervasoni@schindler.com', 'Eduardo Gervasoni', 1, 1),
(DEFAULT, 'gustavo.eloy@schindler.com', 'Gustavo Eloy', 1, 1),
(DEFAULT, 'joao.marlus.rodrigues@schindler.com', 'Joao Marlus Rodrigues', 1, 1),
(DEFAULT, 'deitosai@schindler.com', 'Deitosai', 1, 1),
(DEFAULT, 'ana.sena@schindler.com', 'Ana Sena', 1, 1),
(DEFAULT, 'paulo.barcelos@schindler.com', 'Paulo Barcelos', 1, 1),
(DEFAULT, 'silvestre.oliveira@schindler.com', 'Silvestre Oliveira', 1, 1),
(DEFAULT, 'viviana.gomes@schindler.com', 'Viviana Gomes', 1, 1),
(DEFAULT, 'carlos.dumaresq@schindler.com', 'Carlos Dumaresq', 1, 3),
(DEFAULT, 'alexandre.zogaib@schindler.com', 'Alexandre Zogaib', 1, 3),
(DEFAULT, 'jorge.barros@schindler.com', 'Jorge Barros', 1, 3),
(DEFAULT, 'jose.wellington@schindler.com', 'Jose Wellington', 1, 3),
(DEFAULT, 'marcelo.frate@schindler.com', 'Marcelo Frate', 1, 3),
(DEFAULT, 'aylton.nunes@schindler.com', 'Aylton Nunes', 1, 3),
(DEFAULT, 'davison.oliveira@schindler.com', 'Davison Oliveira', 1, 3),
(DEFAULT, 'nabson.bussons@schindler.com', 'Nabson Bussons', 1, 3),
(DEFAULT, 'eneas.oliveira@schindler.com', 'Eneas Oliveira', 1, 3),
(DEFAULT, 'estefania.almeida@schindler.com', 'Estefania Almeida', 1, 3),
(DEFAULT, 'rafael.ferraz@schindler.com', 'Rafael Ferraz', 1, 5),
(DEFAULT, 'jesse.junio@schindler.com', 'Jesse Junio', 1, 5),
(DEFAULT, 'moacir.costa@schindler.com', 'Moacir Costa', 1, 5),
(DEFAULT, 'gustavo.alberte@schindler.com', 'Gustavo Alberte', 1, 5),
(DEFAULT, 'raimundo.andrade@schindler.com', 'Raimundo Andrade', 1, 5),
(DEFAULT, 'pedro.araujo@schindler.com', 'Pedro Araujo', 1, 5),
(DEFAULT, 'rosedema@schindler.com', 'Rosedema', 1, 5),
(DEFAULT, 'dilson.sales@schindler.com', 'Dilson Sales', 1, 5),
(DEFAULT, 'paulene.alexandre@schindler.com', 'Paulene Alexandre', 1, 5),
(DEFAULT, 'bruno.carvalho@schindler.com', 'Bruno Carvalho', 1, 5 );
-- ----- usuario

-- ----- perguntas
INSERT INTO pergunta VALUES
(DEFAULT, 'Estamos enfrentando um período de mudanças. Escolha a alternativa verdadeira'),
(DEFAULT, 'Por que a Schindler desenvolveu o Projeto F3? Indique a resposta correta.'),
(DEFAULT, 'Selecione a resposta que explica o novo Posicionamento das Linhas de Produto'),
(DEFAULT, 'Assinale a resposta errada'),
(DEFAULT, 'Assinale a resposta errada'),
(DEFAULT, 'Assinale a alternativa correta'),
(DEFAULT, '"Nossos elevadores e escadas rolantes funcionam com eficiência máxima durante o pico de tráfego. Quando o tráfego diminui o mesmo ocorre com o consumo de energia. Nossa tecnologia oferece desemppenho sem desperdício e oferecenos flexibilidade em design, tamanhos de cabina e opções de comando". Esta afirmativa corresponde ao segmento de mercado de:'),
(DEFAULT, 'Não faz paerte do KIT Hotelaria'),
(DEFAULT, 'A argumentação de vendas para o Schinlder 1000 será'),
(DEFAULT, 'Sabendo o que é modularidade relacione para o componrnte INVERSOR qual a alternativa que apresenta 1- a caracteristica do componente 2- o benefício para o cliente 3- qual será o valor para o cliente:'),
(DEFAULT, 'Com a nova ferramenta PDT a Schindler vai oferecer globalmente a seus clientes:'),
(DEFAULT, 'A nova estratégia de oferta de Kits vai permitir'),
(DEFAULT, 'A denominação Plus nos nomes das linhas de produto:'),
(DEFAULT, 'A Schindler possui uma série de atributos que constituem a Proposta de Valor da Empresa, expressa pela sua da marca. O front de vendas deve aproveitar a oportunidade ao contatar seus clientes para criar percepção de valor, reforçar a imagem da marca Schindler e seus diferenciais. Identifique quais são diferenciais a serem usados como argumentos nos negócios.'),
(DEFAULT, 'Enquanto o Schindler 1000 tem Posicionamento como uma linha de Mobilidade Econômica , o Posicionamento de mercado para o Schindler 3000 é ser Flexível, Elegante e Versátil pela sua abrangência de aplicações. Escolha 3 argumentos-chave de sua aplicação.'),
(DEFAULT, 'As linhas de design do Schindler 3000 são'),
(DEFAULT, 'Sabendo que os Níveis de Especificação são um conjunto de opções agrupados no configurador A-NC em 3 níveis diferentes indique qual linha de produtos tem Nivel de Especificação 2.'),
(DEFAULT, 'O sobrepeso permitido para a linha S3000 é de'),
(DEFAULT, 'Os tetos que podem ser especificados na linha S3000 são'),
(DEFAULT, 'A botoeira Linea 800 pode ser especificada nas seguintes linhas');
-- ----- perguntas

-- ----- alternativa
-- ----- alternativa
INSERT INTO alternativa VALUES
(DEFAULT, 'A mudança é algo natural no universo', DEFAULT, 'A', 1),
(DEFAULT, 'Há muitas fases no processo de mudança', DEFAULT, 'B', 1),
(DEFAULT, 'A resistência ao processo de mudança começa pela negação', DEFAULT, 'C', 1),
(DEFAULT, 'A velocidade que assimilamos a mudança é decisiva para o sucesso', DEFAULT, 'D', 1),
(DEFAULT, 'Todas as alternativas são verdadeiras', 1, 'E', 1),

(DEFAULT, 'Porque estamos perdendo participação de mercado', DEFAULT, 'A', 2),
(DEFAULT, 'Porque estamos acompanhando megatendências globais como urbanização e envelhecimento crescente da polpulação em todo o mundo, aumento de demanda por mobilidade urbana e mudança de hábitos que exigem mais digitalização', DEFAULT, 'B', 2),
(DEFAULT, 'Porque os clientes esperam produtos e ofertas adaptadas e que tenham facilidades de especificar e encomendar', DEFAULT, 'C', 2),
(DEFAULT, 'Somente as alternativas B e C estão corretas', 1, 'D', 2),
(DEFAULT, 'Todas as alternativas são corretas', DEFAULT, 'E', 2),

(DEFAULT, 'As 3 Linhas de Produto do Projeto F3 aumentam a competitividade da Atlas Schindler', DEFAULT, 'A', 3),
(DEFAULT, 'O Schindler 1000 foi planejado para ser Pratico, Confiável e Compacto', DEFAULT, 'B', 3),
(DEFAULT, 'O Schindler 3000 foi planejado para transmitir Estilo, Funcionalidade e Flexibilidade', 1, 'C', 3),
(DEFAULT, 'O Schindler 5000 foi planejado para oferecer Imponência, Tecnologia e Superioridade', DEFAULT, 'D', 3),
(DEFAULT, 'Todas as respostas explicam o novo Posionamento das linhas de Produto', DEFAULT, 'E', 3),

(DEFAULT, 'O Schindler 1000 se aplica de 5 a 9 pessoas nas velocodades de 0,75 m/s e 1 m/s , ate´12 paradas, para edifícios residenciais, pequenos hotéis e casas em condomínios', DEFAULT, 'A', 4),
(DEFAULT, 'O schindler 1000 não se aplica como elevador de carga', DEFAULT, 'B', 4),
(DEFAULT, 'O Schindler 1000 se limita a cabinas com 2200mm de altura com portas telescópicas e de abertura central de 800 ou 900mm', DEFAULT, 'C', 4),
(DEFAULT, 'Podemos oferecer um Schindler 1000 com cabina pintada ou inox', DEFAULT, 'D', 4),
(DEFAULT, 'O Schindler 1000 irá competir com Synergy 100 e Otis Gen2 Ligtht', 1, 'E', 4),

(DEFAULT, 'O Schindler 1000 vai nos tornar mais competitivos com a capacidade de 5 pessoas em edifícios de até 6 andares com 1 elevador', DEFAULT, 'A', 5),
(DEFAULT, 'O Schindler 1000 será a 1a. Opção de configuração no A-NC quando o cliente se restringir às especificações básicas para edifícios até 12 paradas', DEFAULT, 'B', 5),
(DEFAULT, 'O Schindler 1000 permite aplicar portas opostas na cabina', 1, 'C', 5),
(DEFAULT, 'Com Schindler 1000 podemos operar 2 carros em grupo até 12 paradas', DEFAULT, 'D', 5),
(DEFAULT, 'O Schindler 1000 só tem Nível de Especificação 1', DEFAULT, 'E', 5),

(DEFAULT, 'Nossa oferta de produtos permite um ligeiro aumento da cobertura do mercado no segmento inferior.', DEFAULT, 'A', 6),
(DEFAULT, 'O produto que oferecemos no espectro intermediário do mercado aumentou o âmbito de aplicação e flexibilidade, aumentando a cobertura em ambos os intervalos de mercado, em comparação à solução anterior disponível.', DEFAULT, 'B', 6),
(DEFAULT, 'O nível superior do mercado permanece coberto pelos nossos produtos de alto padrão, capazes de atender aos requisitos mais rigorosos de desempenho, qualidade e complexidade.', DEFAULT, 'C', 6),
(DEFAULT, 'Nenhuma das alternativas está correta', DEFAULT, 'D', 6),
(DEFAULT, 'As alternativas A,B e C estão corretas', 1, 'E', 6),

(DEFAULT, 'Hotéis', 1, 'A', 7),
(DEFAULT, 'Transporte Publico', DEFAULT, 'B', 7),
(DEFAULT, 'Escritórios', DEFAULT, 'C', 7),
(DEFAULT, 'Apartamentos', DEFAULT, 'D', 7),
(DEFAULT, 'Hospitais', DEFAULT, 'E', 7),

(DEFAULT, 'Interface para sistema de restrição de acesso: O elevador só pode ser acionado por pessoas previamente cadastradas e reconhecidas por meio de sistemas de restrição de acesso por cartão ou senha.', DEFAULT, 'A', 8),
(DEFAULT, 'CFTV (Circuito Fechado de Televisão): Uma conexão entre entre cabina e sistema de gerenciamento predial do edifício permitirá a transferência de dados para transmissão de imagens obtidas por uma câmera a ser instalada na cabina. (A câmera e os monitores correspondentes não estão inclusos no fornecimento).', DEFAULT, 'B', 8),
(DEFAULT, 'Iluminação indireta: proporciona maior conforto no transporte de passageiros', DEFAULT, 'C', 8),
(DEFAULT, 'Retorno automático ao pavimento principal: Função na qual a cabina retorna automaticamente para o andar principal, reduzindo o tempo de espera dos passageiros que chegam pelo andar térreo, tornando o percurso até os andares superiores mais rápido e confortável.', DEFAULT, 'D', 8),
(DEFAULT, 'Cancelamento de chamadas falsas: O sistema identifica e anula automaticamente as chamadas falsas.', 1, 'E', 8),

(DEFAULT, 'Relação qualidade x preço', DEFAULT, 'A', 9),
(DEFAULT, 'Escolhas simples', DEFAULT, 'B', 9),
(DEFAULT, 'Pronto para o futuro', DEFAULT, 'C', 9),
(DEFAULT, 'Maximizar o espaço', DEFAULT, 'D', 9),
(DEFAULT, 'Todas as alternativas anteriores', 1, 'E', 9),

(DEFAULT, '1- Sobrepeso de até 50% 2-variedade de opções 3- design flexivel', DEFAULT, 'A', 10),
(DEFAULT, '1-Unidade de regeneração de energia 2- Classe A 3- Ecologico', DEFAULT, 'B', 10),
(DEFAULT, '1- STM 2- cabina espaçosa 3- viagem mais confortável', DEFAULT, 'C', 10),
(DEFAULT, '1- Plataforma Modular 2-Tempo de resposta rápido 3-Confiável', 1, 'D', 10),
(DEFAULT, '1-Agrupamento de 8 carros 2- alta capacidade de tragfego 3- Performance', DEFAULT, 'E', 10),

(DEFAULT, 'Uma ferramenta digital on line com interface para projetos', DEFAULT, 'A', 11),
(DEFAULT, 'Uma futura interface para a tecnologia BIM', DEFAULT, 'B', 11),
(DEFAULT, 'Um guia digital que conduz o arquiteto para a especificação certa', DEFAULT, 'C', 11),
(DEFAULT, 'Uma ferramenta para obter relatorios on line de leads', 1, 'D', 11),
(DEFAULT, 'Somente as alternativas A, B e C estão corretas', DEFAULT, 'E', 11),

(DEFAULT, 'Que a configuração do elevador seja básica dentro do requerimento de cada cliente', DEFAULT, 'A', 12),
(DEFAULT, 'que a competitividade das Ofertas seja maior pois o elevador a ser configurado no A-NC não poderá ter opcionais', DEFAULT, 'B', 12),
(DEFAULT, 'Agrupar olguns pcionais do interesse do cliente com preço mais competitivo', DEFAULT, 'C', 12),
(DEFAULT, 'Somente as alternativas A e C estão corretas', DEFAULT, 'D', 12),
(DEFAULT, 'Todas as alternativas estão corretas', 1, 'E', 12),

(DEFAULT, 'Será aplicada aos elevadores S1000, S3000 e S5000 em MOD', 1, 'A', 13),
(DEFAULT, 'Vai permitir substituições parciais com aproveitamento de componentes existentes no lançamento para MOD', DEFAULT, 'B', 13),
(DEFAULT, 'Vai permitir alterações para ser fornecida com portas eixo vertical em predios onde as cabinas já são pequenas', DEFAULT, 'C', 13),
(DEFAULT, 'Vai ser fornecida com portas de 700mm para reduzir problemas de obra civil', DEFAULT, 'D', 13),
(DEFAULT, 'Será limitada a edifícios residenciais de até 12 paradas', DEFAULT, 'E', 13),

(DEFAULT, 'Know-how, estrutura e capacidade para fornecer o escopo de trabalho mais exigente. Um parceiro para todo o ciclo de vida do elevado', DEFAULT, 'A', 14),
(DEFAULT, 'Empresa estável, com valores sólidos e longa história, projetos de sucesso e clientes satisfeitos.', DEFAULT, 'B', 14),
(DEFAULT, 'O tamanho importa, entre as melhores do setor, configuração profissional, alta disponibilidade e capacidade, independentemente da localização.', DEFAULT, 'C', 14),
(DEFAULT, 'As melhores soluções e tecnologias disponíveis. Engenharia de precisão e alta qualidade. Empresa e produtos ecológicos', 1, 'D', 14),
(DEFAULT, 'Todas são Propostas de Valor da Empresa e devem ser usados nas apresentações de negócios', DEFAULT, 'E', 14),

(DEFAULT, 'Alta Flexibilidade - Confortável - Varias opções de Design', DEFAULT, 'A', 15),
(DEFAULT, 'Escolhas Simples - Compacto - Otimo Custo x Benefício', DEFAULT, 'B', 15),
(DEFAULT, 'Toque Pessoal - Desempenho em grandes alturas - Eficiência Enegética', DEFAULT, 'C', 15),
(DEFAULT, 'Desempenho em alto tráfego - Completa liberdade de design - escolhas simples', DEFAULT, 'D', 15),
(DEFAULT, 'Todas as alternativas estão incorretas', 1, 'E', 15),

(DEFAULT, 'Navona - Times Square - Sunset Boulevard', DEFAULT, 'A', 16),
(DEFAULT, 'Navona - Times Square - Park Avenue', DEFAULT, 'B', 16),
(DEFAULT, 'Times Square - Park Avenue - Sunset Boulevar', 1, 'C', 16),
(DEFAULT, 'Navona - Mediterranée - Times Square', DEFAULT, 'D', 16),
(DEFAULT, 'Bare - Navona - Sunset Boulevard', DEFAULT, 'E', 16),

(DEFAULT, 'Schindler 5000', DEFAULT, 'A', 17),
(DEFAULT, 'Schindler 1000', DEFAULT, 'B', 17),
(DEFAULT, 'Schindler 3000', 1, 'C', 17),
(DEFAULT, 'Todos tem níveis de Especificação 2', DEFAULT, 'D', 17),
(DEFAULT, 'Só a opção A tem Nível de Especificação 2', DEFAULT, 'E', 17),

(DEFAULT, '30% mais o peso do piso de granito', DEFAULT, 'A', 18),
(DEFAULT, '15% no total', DEFAULT, 'B', 18),
(DEFAULT, '50% já incluido o piso de granito', DEFAULT, 'C', 18),
(DEFAULT, '30% já incluido o piso de granito', 1, 'D', 18),
(DEFAULT, 'Nenhuma das anteriores', DEFAULT, 'E', 18),

(DEFAULT, 'Square spot-round spot- curve-line-bracket -dash - indirect', DEFAULT, 'A', 19),
(DEFAULT, 'Square spot-round spot- curve-dash -bracket', DEFAULT, 'B', 19),
(DEFAULT, 'Round spot- curve-line-bracket- dash - dash array', DEFAULT, 'C', 19),
(DEFAULT, 'Round spot- curve-line-bracket- dash array - indirect', 1, 'D', 19),
(DEFAULT, 'Square spot-round spot- curve-dash array -bracket', DEFAULT, 'E', 19),

(DEFAULT, 'Schindler 5000 como opcional', DEFAULT, 'A', 20),
(DEFAULT, 'Schindler 3000 como opcional e Schindler 5000', 1, 'B', 20),
(DEFAULT, 'Em todas as linhas como opcional', DEFAULT, 'C', 20),
(DEFAULT, 'A única alternativa correta é a opção B', DEFAULT, 'D', 20),
(DEFAULT, 'Nenhuma das alternativas é correta', DEFAULT, 'E', 20);