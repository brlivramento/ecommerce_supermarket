-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.50-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ecommerce_db
--

CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

--
-- Definition of table `tab_carrinhocompras`
--

DROP TABLE IF EXISTS `tab_carrinhocompras`;
CREATE TABLE `tab_carrinhocompras` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_data` varchar(10) DEFAULT NULL,
  `pedido_total` double DEFAULT NULL,
  `pedido_comentarios` varchar(120) DEFAULT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`pedido_id`,`login_id`) USING BTREE,
  KEY `FK_tab_carrinhocompras_1` (`login_id`),
  CONSTRAINT `FK_tab_carrinhocompras_1` FOREIGN KEY (`login_id`) REFERENCES `tab_login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_carrinhocompras`
--

/*!40000 ALTER TABLE `tab_carrinhocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_carrinhocompras` ENABLE KEYS */;


--
-- Definition of table `tab_categoria`
--

DROP TABLE IF EXISTS `tab_categoria`;
CREATE TABLE `tab_categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_categoria`
--

/*!40000 ALTER TABLE `tab_categoria` DISABLE KEYS */;
INSERT INTO `tab_categoria` (`categoria_id`,`categoria_descricao`) VALUES 
 (1,'Limpeza'),
 (2,'Açougue'),
 (3,'Congelados'),
 (4,'Padaria'),
 (5,'Sobremesas'),
 (6,'Compostas'),
 (7,'Higiene Pessoal'),
 (8,'Bebidas'),
 (9,'Molhos'),
 (10,'Enlatados'),
 (11,'Massas'),
 (12,'Biscoitos'),
 (13,'Farináceos'),
 (14,'Cereais'),
 (15,'Horti-fruit'),
 (16,'Frios e Laticínios'),
 (17,'Matinais'),
 (18,'Doces e Chocolates'),
 (19,'Utilidades'),
 (20,'Temperos');
/*!40000 ALTER TABLE `tab_categoria` ENABLE KEYS */;


--
-- Definition of table `tab_cliente`
--

DROP TABLE IF EXISTS `tab_cliente`;
CREATE TABLE `tab_cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_nome` varchar(50) DEFAULT NULL,
  `cliente_sexo` varchar(10) DEFAULT NULL,
  `cliente_rg` double DEFAULT NULL,
  `cliente_cpf` double DEFAULT NULL,
  `cliente_datanasc` varchar(10) DEFAULT NULL,
  `telefone_id` int(11) NOT NULL,
  `email_id` int(11) NOT NULL,
  `end_id` int(11) NOT NULL,
  PRIMARY KEY (`cliente_id`,`end_id`,`email_id`,`telefone_id`) USING BTREE,
  KEY `FK_tab_cliente_1` (`telefone_id`),
  KEY `FK_tab_cliente_2` (`email_id`),
  KEY `FK_tab_cliente_3` (`end_id`),
  CONSTRAINT `FK_tab_cliente_1` FOREIGN KEY (`telefone_id`) REFERENCES `tab_telefone` (`telefone_id`),
  CONSTRAINT `FK_tab_cliente_2` FOREIGN KEY (`email_id`) REFERENCES `tab_email` (`email_id`),
  CONSTRAINT `FK_tab_cliente_3` FOREIGN KEY (`end_id`) REFERENCES `tab_endereco` (`end_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_cliente`
--

/*!40000 ALTER TABLE `tab_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_cliente` ENABLE KEYS */;


--
-- Definition of table `tab_email`
--

DROP TABLE IF EXISTS `tab_email`;
CREATE TABLE `tab_email` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_email`
--

/*!40000 ALTER TABLE `tab_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_email` ENABLE KEYS */;


--
-- Definition of table `tab_endereco`
--

DROP TABLE IF EXISTS `tab_endereco`;
CREATE TABLE `tab_endereco` (
  `end_id` int(11) NOT NULL AUTO_INCREMENT,
  `end_logradouro` varchar(100) DEFAULT NULL,
  `end_numero` int(11) DEFAULT NULL,
  `end_complemento` varchar(20) DEFAULT NULL,
  `end_cep` int(11) DEFAULT NULL,
  `end_bairro` varchar(30) DEFAULT NULL,
  `end_cidade` varchar(20) DEFAULT NULL,
  `end_estado` varchar(10) DEFAULT NULL,
  `end_tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`end_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_endereco`
--

/*!40000 ALTER TABLE `tab_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_endereco` ENABLE KEYS */;


--
-- Definition of table `tab_itemcarrinho`
--

DROP TABLE IF EXISTS `tab_itemcarrinho`;
CREATE TABLE `tab_itemcarrinho` (
  `itemcarr_id` int(11) NOT NULL AUTO_INCREMENT,
  `itemcarr_quantidade` int(11) DEFAULT NULL,
  `produto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`itemcarr_id`,`produto_id`,`pedido_id`) USING BTREE,
  KEY `FK_tab_itemcarrinho_1` (`produto_id`),
  KEY `FK_tab_itemcarrinho_2` (`pedido_id`),
  CONSTRAINT `FK_tab_itemcarrinho_1` FOREIGN KEY (`produto_id`) REFERENCES `tab_produto` (`produto_id`),
  CONSTRAINT `FK_tab_itemcarrinho_2` FOREIGN KEY (`pedido_id`) REFERENCES `tab_carrinhocompras` (`pedido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_itemcarrinho`
--

/*!40000 ALTER TABLE `tab_itemcarrinho` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_itemcarrinho` ENABLE KEYS */;


--
-- Definition of table `tab_login`
--

DROP TABLE IF EXISTS `tab_login`;
CREATE TABLE `tab_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_senha` varchar(10) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `login_descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`login_id`,`cliente_id`) USING BTREE,
  KEY `FK_tab_login_1` (`cliente_id`),
  CONSTRAINT `FK_tab_login_1` FOREIGN KEY (`cliente_id`) REFERENCES `tab_cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_login`
--

/*!40000 ALTER TABLE `tab_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_login` ENABLE KEYS */;


--
-- Definition of table `tab_oferta`
--

DROP TABLE IF EXISTS `tab_oferta`;
CREATE TABLE `tab_oferta` (
  `oferta_id` int(11) NOT NULL AUTO_INCREMENT,
  `oferta_desconto` double DEFAULT NULL,
  `produto_id` int(11) NOT NULL,
  PRIMARY KEY (`oferta_id`,`produto_id`) USING BTREE,
  KEY `FK_tab_oferta_1` (`produto_id`),
  CONSTRAINT `FK_tab_oferta_1` FOREIGN KEY (`produto_id`) REFERENCES `tab_produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_oferta`
--

/*!40000 ALTER TABLE `tab_oferta` DISABLE KEYS */;
INSERT INTO `tab_oferta` (`oferta_id`,`oferta_desconto`,`produto_id`) VALUES 
 (9,8.09,1);
/*!40000 ALTER TABLE `tab_oferta` ENABLE KEYS */;


--
-- Definition of table `tab_produto`
--

DROP TABLE IF EXISTS `tab_produto`;
CREATE TABLE `tab_produto` (
  `produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_titulo` varchar(100) DEFAULT NULL,
  `produto_descricao` varchar(300) DEFAULT NULL,
  `produto_imagem` varchar(50) DEFAULT NULL,
  `produto_valor` double DEFAULT NULL,
  `subcat_id` int(11) NOT NULL,
  PRIMARY KEY (`produto_id`,`subcat_id`) USING BTREE,
  KEY `FK_tab_produto_1` (`subcat_id`),
  CONSTRAINT `FK_tab_produto_1` FOREIGN KEY (`subcat_id`) REFERENCES `tab_subcategoria` (`subcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_produto`
--

/*!40000 ALTER TABLE `tab_produto` DISABLE KEYS */;
INSERT INTO `tab_produto` (`produto_id`,`produto_titulo`,`produto_descricao`,`produto_imagem`,`produto_valor`,`subcat_id`) VALUES 
 (1,'Cevada SUPERBOM Pacote 500g','Ingredientes: 100% Cevada. CONTÉM GLÚTEN','cafecevada.jpg',8.99,127),
 (2,'Café Torrado e Moído PILÃO Pacote 250g','Café Torrado e Moído PILÃO Pacote 250g','cafepilao.jpg',15.99,127),
 (3,'Café Pelé gourmet','Café Pelé gourmet torrado e moído. Ingredientes:100% café. Não contém glúten.','cafepele.jpg',11.99,127),
 (4,'Água Sanitária BRILHANTE 1 Litro','Composição: Princípio ativo, estabilizante, alcalinizante e água','aguasanitariabrilhante.jpg',4.44,1),
 (5,'Água Sanitária SUPER CANDIDA 2 Litros','Composição: hipoclorito de sódio, hidróxido de sódio, cloreto de sódio e água. Teor de cloro ativo: 2,0% a 2,5% p/p. PRODUTO À BASE DE CLORO.','candida.jpg',4.27,1),
 (6,'Água Sanitária QUÁLITA 5 Litros','Composição: Hipoclorito de sódio, alcalinizante, estabilizante e veículo. Princípio ativo: 2,0% e 2,5% (p/p) de cloro ativo.','anqualita.jpg',7.48,1),
 (7,'Água Sanitária ESCOLHA ECONÔMICA 5 Litros','Composição: Hipoclorito de sódio, estabilizante e água. Componente ativo: hipoclorito de sódio - 2,0% a 2,5% p/p de cloro ativo.','anescolha.jpg',5.34,1),
 (8,'Café Solúvel Matinal NESCAFÉ Vidro 50g','Ingredientes: Café solúvel granulado.','nescafe.jpg',4.16,127),
 (9,'Água Sanitária CANDURA 1 Litro','Composição: Hipodorito de sódio, carbonato de sódio e água q.s.p. Cloro ativo de 2,0 a 2,5% P/P.','candura.jpg',2.14,1),
 (10,'Álcool em Gel COOPERALCOOL 500ml','Composição: Princípio ativo: álcool etílico 70% espessante, neutralizante, desnaturante e água.','cooperalcool.jpg',5.45,2),
 (11,'Álcool em Gel MINALCOOL 500ml','Composição: Álcool etílico hidratado 65° INPM; em gel, neutro.','minalcool.jpg',4.91,2),
 (12,'Álcool Gel QUALITÁ 500g','Composição: Álcool etílico, polímero, benzoato de denatônio, neutralizante e água.','qualita.jpg',4.65,2),
 (13,'Álcool Líquido Eucalipto COOPERALCOOL 1 Litro','Composição: Álcool etílico hidratado, essência. NÃO CONTÉM DESNATURANTE.','cooperalcoolliq.jpg',4.49,2),
 (14,'Álcool Líquido Evolution Eucalipto ZULU 1 Litro','Composição: Álcool elítico, desnaturante, essência e veículo.GRADUAÇÃO ALCOÓLICA 46º INPM.','alcoolzulu.jpg',5.87,2),
 (15,'Álcool Líquido Evolution Tradicional ZULU 1 Litro','Composição: Álcool etílico diluído, desnaturante e veículo.GRADUAÇÃO ALCOÓLICA 46º INPM.','evolutiontradzulu.jpg',5.87,2),
 (16,'Álcool Líquido QUALITÁ 1 Litro','Composição: Álcool etílico, benzoato de denatônio e água.','qualitaliq1l.jpg',4.7,2),
 (17,'Álcool Líquido QUALITÁ 500ml','Composição: Álcool etílico, benzoato de denatônio e água.','qualitaliq.jpg',3.26,2),
 (18,'Álcool Líquido Tradicional MINÁLCOOL 1 Litro','Composição: Álcool etílico hidratado 92,8º INPM','minalcooltrd1l.jpg',5.98,2),
 (19,'Álcool Líquido Tradicional MINÁLCOOL 500m','Composição: Álcool etílico hidratado 92,8º INPM','minalcooltrd.jpg',3.41,2),
 (20,'Álcool LíquidoTradicional COPERALCOOL 1 Litro','Informação Adicional: Álcool etílico hidratado 92,8% INPM','cooperalcooltrad.jpg',4.49,2),
 (153,'Tira Mancha Multi - Uso VANISH Max Poder O2 900g','Composição: Percarbonato de sódio, coadjuvantes','manvanishthdjmulti.jpg',27.8,4),
 (154,'Tira Mancha Multi - Uso VANISH Poder O2 450g','Composição: Pecarbonato de Sódio, coadjuvantes.','manvanishthdj.jpg',13.9,4),
 (155,'Tira Mancha Multi - Uso VANISH Poder O2 Withe 450g','Composição: Percarbonato de sódio, tensoativos aniônicos, tensoativo não-iônico, enzimas, branqueador óptico, pigmento e coadjuvante.','manvanishthd.jpg',13.8,4),
 (156,'Tira Mancha Multi - Uso VANISH Poder O2 Withe 900g','Composição: Percarbonato de sódio, tensoativos aniônicos, tensoativo não-iônico, enzimas, branqueador óptico, pigmento e coadjuvantes.','manvanish.jpg',27.8,4),
 (157,'Tira Mancha QUALITÁ 450g','Composição: Percabonato de sódio, coadjuvantes, estabilizante, alcalinizante e corante.','manqualita.jpg',10.49,4),
 (158,'Tira Mancha SEMORIN 100ml','Composição: Tripolifosfato de sódio, tolueno sulfonato de sódio, ácido dodecil benzeno sulfônico linear, soda caústica, lauril éter sulfato de sódio, cocamida DEA, EDTA, formol, perfume e água.','semorin.jpg',5.87,4),
 (159,'Tira Mancha VANTAGE 100ml','Composição: Linear alquilbenzeno sulfonato de sódio, coadjuvantes, solvente, sequestrante, conservante, fragrância e água.','',0.34,4),
 (160,'Sabão de coco AMAZON H2O Caixa com 5 Unidades 500g','Composição: òleo de coco de babaçú, hidróxido de sódio, carboato de sódio, cloreto de sódio e água. Princípio Ativo: Ácido graxos de óleo de coco','amzon.jpg',4.98,5),
 (161,'Sabão de coco URCA Premium 200g','Composição: Óleo de coco babaçu, hidróxido de sódio, cloreto de sódio e água.','urcasab.jpg',1.55,5),
 (162,'Sabão em Barra Azul QUALITÁ 1kg com 5 Unidades','Composição: Sebo industrial, massa base de sabão de coco, alcalinizante, coadjuvantes, sequestrante, corante, branqueador óptico, essência e água.','qualitasab.jpg',5.23,5),
 (163,'Sabão em Barra Branqueador ACE Pacote com 5 Unidades de 200g','Composição: Sabão base de sódio, glicerina, alcalhizante, cloreto de sódio, carbonato de sódio, carbonato de cálcio etileno hidroxi-difosfônico, branqueador óptico, corante, perfume, silicone, bentotina e água.','sabacebarra.jpg',5.34,5),
 (164,'Sabão em Barra de Coco QUALITÁ 200g','Composição: Óleo de coco babaçu, hidróxido de sódio, carbonato de sódio, cloreto de sódio, branqueador óptico e água. Princípio ativo: Ácidos graxos de óleo de coco.','sabbarraqualita.jpg',1.49,5),
 (165,'Sabão em Barra de Coco QUALITÁ 1kg com 5 Unidades','Composição: Óleo de coco babaçu, hidróxido de sódio, carbonato de sódio, cloreto de sódio, branqueador óptico e água. Princípio ativo: Ácidos graxos de óleo de coco.','sabbarraqualitacin.jpg',5.77,5),
 (166,'Sabão em Barra de Coco UFE Pacote com 5 Unidades de 200g','Composição: Óleo de coco, açúcar, hidróxido de sódio, cloreto de sódio, hipossulfito de sódio e água.','uff.jpg',11.66,5),
 (167,'Sabão em Barra de Coco URCA Pacote com 5 Unidades de 200g','Composição: Óleo de coco de babaçu, hidróxido de sódio, carbonato de sódio, cloreto de sódio e água.','barraurcasab.jpg',6.41,5),
 (168,'Sabão em Barra Glicerinado Multi - Uso LIMPOL Pacote com 5 Unidades de 200g','Composição: Sebo bovino, óleo de babaçu, hidróxido de sódio, glicerina, carga, conservante, sequestrantes, corantes, fragrância e veículo.','barralimpol.jpg',6.2,5),
 (169,'Sabão em Barra Neutro YPÊ Pacote com 5 Unidades de 200g','Composição: Sabão base de ácido graxos, glicerina, conservante, sal inorgânico e água.','barraype.jpg',5.02,5),
 (170,'Sabão em Barra Multi Ativo de Limão YPÊ Pacote com 5 Unidades de 200g','Composição: Sabão de ácido graxos de coco/babaçu, sabão de ácidos graxos de sebo, sabão de ácidos graxos de soja, cloreto de sódio, glicerina, alquil benzeno sulfonato de sódio, linear, perfume, EDTA EHDP, corante e água','barraypek.jpg',5.34,5),
 (171,'Sabão em Barra Multi Ativo Azul YPÊ Pacote com 5 Unidades de 200g','Composição: Sabão de ácido graxos de coco/babaçu, sabão de ácidos graxos de sebo, sabão de ácidos graxos de soja, cloreto de sódio, glicerina, alquil benzeno sulfonato de sódio, linear, perfume, EDTA EHDP, corante e água.','barraynpek.jpg',5.34,5),
 (172,'Sabão em Pó ACE Básico Naturals Maciez Pacote 1Kg','Composição: Linear alquil benzeno sulfonato de sódio, coadjuvantes, branqueador óptico, corantes, fragrância (com extrato natural ), amaciante, carga e água.','sabpoacelsak.jpg',3.95,6),
 (173,'Sabão em Pó ACE Básico Pacote 1Kg','Composição: Linear alquil benzeno sulfonato de sódio, coadjuvantes, branqueador óptico, corantes, perfume (com extratos naturais), carga e água.','kaosabpoace.jpg',3.95,6),
 (174,'Sabão em Pó ACE Básico Pacote 2 Kg','Composição: Linear alquil benzeno sulfonato de sódio, coadjuvantes, branqueador óptico, corantes, perfume (com extratos naturais), carga e água. ','sabpoacesksok.jpg',7.48,6),
 (175,'Sabão em Pó ACE Naturals Coco Pacote 1Kg','Composição: Linear alquil benzeno sulfonato de sódio, coadjuvantes, agente antiredepositante, branqueador óptico, corante, sabão de coco, fragrância (com extrato natural), carga e água.','sabpoace.jpg',3.95,6),
 (176,'Sabão em Pó AMAZON H2O Caixa 1kg','Composição: Óleo de coco, hidróxido de sódio, carboximetilcelulose de sódio, carbonato de sódio, branqueador ótico, sulfato de sódio, silicato de sódio, sequestrante, pigmento verde, essência e água. Principios ativo: Ácidos graxos de óleo de coco','sabpoamazon.jpg',5.55,6),
 (177,'Sabão em Pó ARIEL Caixa 1Kg','Composição: Linear alquil benzeno sulfonato de sódio, coadjuvantes, sinergistas, sequestrantes, atenuador de espuma, agentes anti-redepositantes, branqueador óptico e químico, enzimas, corante, perfume, carga e água.','sabpoarielsks.jpg',4.98,6),
 (178,'Sabão em Pó ARIEL com Oxi Barras Caixa 1kg','Composição: Linear alquil benzeno sulfonato de sódio, alquil dimetil hidroxietil cloreto de amônio, tensoativo não iônico e aniônico polialquiletoxilado, coadjuvantes, branqueadores ótico e químico, agentes anti-redepositantes, corantes, enzimas, sinergista, alvejantes, fragrância, carga e água.','sabpoariel.jpg',4.98,6),
 (179,'Sabão em Pó OMO Aloe Vera com um Toque de Comfort Caixa 1Kg','Composição: Tensoativo aniônico, coadjuvantes, sinergista, branqueador óptico, enzima, tamponantes, corantes, essência, carga e água.','sabpoomojjjkg.jpg',5.18,6),
 (180,'Sabão em Pó OMO Pétalas de Violeta & Ylang Ylang com um Toque de Comfort Caixa 1Kg','Composição: Tensoativo aniônico, coadjuvantes, sinergista, branqueador óptico, enzima, tamponantes, corantes, essência, carga e água.','sabpoomojjg.jpg',5.18,6),
 (181,'Sabão em Pó OMO Comfort Classic Caixa 1kg','Composição: Tensoativo aniônico, tamponantes, coadjuvantes, sinergista, corantes, enzimas, branqueador óptico, fragrância, água, alvejante e carga.','sabpoomo.jpg',5.18,6),
 (182,'Desinfetante Bruto LYSOCLIN 1 Litro','Composição Cloreto benzalcôneo, tensoativo, espessante veículo e essência. Principio ativo: cloreto benzalcôneo. Informação Adicional: Limpa e desinfeta, elimina germes, bactérias e fungos que causam doenças e mau cheiro.','bombrutojja.jpg',6.3,3),
 (183,'Desinfetante Bruto LYSOFORM 1 Litro','Composição. Formol a 37%; dodecilbenzeno sulfonato de sódio à 12%; essência de eucalipto; água. Informação Adicional:mata germes e bactéria, limpa, desinfeta e elimina o mau cheiro.','bombruto.jpg',6.41,3),
 (184,'Desinfetante Citrus Fresh Eleminador de Odor PATO Power 500ml','Composição: Ativo, água, alcalinizante, lauril éter sulfato de sódio, tensoativo não iônico, corantes, espessantes e fragrância. Princípio ativo: ácido lático-2,024%.','defpatohj.jpg',8.44,3),
 (185,'Desinfetante Citrus Lavanda PINHO SOL 500ml','Composição. Água, ingrediente ativo, formol, sabão trietanolamina, álcool etílico, perfume, EDTA e corante Cl 60730. Informação Adicional: Desinfeta, limpa e elimina bactérias, germes e fungos.','pinhosolcitrus.jpg',2.88,3),
 (186,'Desinfetante Citrus Limão PINHO SOL 500ml','Composição. Água, ingrediente ativo, preservante, sabão, solvente, perfumes e corantes (Cl 42090 e Cl 19140) artificiais de limão. Informação Adicional: Limpa e elimina 99% das bactérias, germes e fungos.','pinhosol.jpg',2.98,3),
 (187,'Desinfetante Cloro com Cristais de Limpeza PATO Purific 500ml','Composição. Principio ativo: Hipoclorito de sódio mínimo 1%, hidróxido de sódio, tensoativos aniônicos, tamponante, coadjuvante, perfume, água e espessante. informação Adicional: Limpa profundamente o vaso sanitário.','defpato.jpg',5.34,3),
 (188,'Desinfetante com Cloro Ativo HARPIC 500ml','Hipoclorito de sódio, surfactante aniônico, hidróxido de sódio, espessante, água, corante e perfume. informação Adicional: Limpa, perfuma e elimina manchas do vaso sanitário.','hapic.jpg',4.91,3),
 (189,'Desinfetante Eucalipto e Capim Santo QUALITÁ 2 Litros','Composição: Ativo, copolímero, acrílico, tensoativo não iônico, conservante, fragrância e água. Princípio ativo: Cloreto de dialquil dimetil benzil amônio-0,15%.','desqualita.jpg',3.73,3),
 (190,'Desinfetante Crystallino CRÉO Lata 750ml','Ingredientes: Ativo, solvente, conservante, auxiliar emulsificante, surfactante e água.','cristalyno.jpg',6.62,3),
 (191,'Desinfetante Eucalipto KALIPTO 2 Litros','Composição: Tensoativo catiônico, sequestrante, preservante, opacificante, controlador de pH, fragrância e veículo.','kalipto.jpg',3.99,3),
 (192,'Desinfetante Eucalipto SANOL 2 Litros','Composição. Tensoativo não iônico, tensoativo catiônico, copolímero acrílico, preservante, corante, perfume e água. Informação Adicional:Desinfeta e perfuma.','sagnol.jpg',3.63,3),
 (193,'Alecrim Orgânico NAMASTÊ 15g','Alecrim Orgânico NAMASTÊ 15g','3013380_a1.jpg',2.49,157),
 (194,'Aniz Estrelado CIA DAS ERVAS 11g','Ingredientes: Aniz estrelado.','2360287_a1.jpg',11.01,157),
 (195,'Bicarbonato de Sódio KITANO Pacote 30g','Ingredientes: Bicarbonato de sódia.NÃO CONTÉM GLÚTEN.','249263_a1.jpg',0.7,157),
 (196,'Esponja SCOTCH BRITE Unidade','Composição.Espuma de poliuretano com bactericida e fibra sintética com abrasivo.','126571_a1.jpg',1.68,146),
 (197,'Pano para Limpeza Leve Verde ALKLIN','Composição:100% viscose e resina.','5985418_a1.jpg',4.4,149),
 (198,'Vassoura Nylon Plus Pelo V-9 CONDOR','Composição:Pigmento, matéria sintética e metal.','217064_a1.jpg',8.7,148),
 (199,'Bombom Alpino NESTLÉ Caixa 104g','CONTÉM GLÚTEN.','123143_a1.jpg',6.37,134),
 (200,'Bombom de Avelã Talento GAROTO Pacote 189g','CONTÉM GLUTÉN.','4225324_a1.jpg',15.94,134),
 (201,'Bala Butter Toffee de Chocolate ARCOR Pacote 160g','CONTÉM GLUTÉN.','7089589_a1.jpg',3.2,133),
 (202,'Chá de Canela LEÃO 40g Caixa com 25 Saquinhos','NÃO CONTÉM GLÚTEN.','6129583_a1.jpg',3.26,127),
 (203,'Chá Mate Solúvel LEÃO 50g','Ingredientes:Contém 100% de mate solúvel.NÃO CONTÉM GLÚTEN.','373739_a1.jpg',9.51,127),
 (204,'Leite Condensado Moça NESTLÉ Lata 395g','Ingredientes:Leite integral, açúcar e lactose.NÃO CONTÉM GLÚTEN.','249966_a1.jpg',3.29,131),
 (205,'Creme de Leite PARMALAT 200g','NÃO CONTÉM GLÚTEN.','5737604_a1.jpg',1.59,130),
 (206,'Iogurte com Ameixa e Aveia Activia DANONE 600g','CONTÉM GLÚTEN. PODE CONTER TRAÇOS DE CASTANHA DE CAJU.','6276843_a1.jpg',4.74,32),
 (207,'Iogurte com Ameixa e Aveia Activia DANONE 600g','CONTÉM GLÚTEN. PODE CONTER TRAÇOS DE CASTANHA DE CAJU.','6276843_a1.jpg',4.74,32),
 (208,'Iogurte com Polpa de Ameixa Activia DANONE 400g','CONTÉM GLÚTEN. Pode conter traços de castanha de caju.','8376886_a1.jpg',3.99,32),
 (209,'Iogurte com Polpa de Ameixa Activia DANONE 400g','CONTÉM GLÚTEN. Pode conter traços de castanha de caju.','8376886_a1.jpg',3.99,32),
 (210,'Requeijão CATUPIRY Forma 410g','NÃO CONTÉM GLÚTEN.','571920_a1.jpg',13.2,25),
 (211,'Requeijão Cremoso Tradicional BATAVO 200g','NÃO CONTÉM GLÚTEN.','7077050_a1.jpg',3.59,25),
 (212,'Abacaxi Hawai Super Unidade','NÃO CONTÉM GLÚTEN.','4612889_a1.jpg',4.95,104),
 (213,'Abacaxi Pérola Unidade','NÃO CONTÉM GLÚTEN.','4612896_a1.jpg',4.98,104),
 (214,'Tomate Caqui Bandeja 1,5kg','Tomate caqui. NÃO CONTÉM GLÚTEN.','41324_a1.jpg',10.19,100),
 (215,'Alface Americana Bola com 2 Unidades','Alface Americana','5482047_a1.jpg',4.98,95),
 (216,'Arroz 7 Grãos Integral RÁRIS 500g','CONTÉM GLÚTEN.','8585561_a1.jpg',8.61,90),
 (217,'Arroz Agulhinha Tipo 1 CAMIL Pacote 1 kg','NÃO CONTÉM GLÚTEN.','300438_a1.jpg',2.94,90),
 (218,'Feijão Bolinha CAMIL Pacote 500g','NÃO CONTÉM GLÚTEN.','4554622_a1.jpg',5.4,91),
 (219,'Feijão Carioca Orgânico VIAPAXBIO 1kg','Feijão Orgânico','6277307_a1.jpg',10.97,91),
 (220,'Farinha de Trigo Branca Orgânica VIAPAXBIO 1kg','Farinha de trigo orgânica. CONTÉM GLÚTEN.','5961146_a1.jpg',10.97,92),
 (221,'Farinha de Milho Amarela YOKI Pacote 500g','Farinha de milho amarela. CONTÉM GLÚTEN.','249157_a1.jpg',1.98,89),
 (222,'Farinha de Milho Cozida QUALITÁ 500g','Farinha de milho pré-cozida enriquecida com ferro e ácido fólico. NÃO CONTÉM GLÚTEN.','3851296_a1.jpg',1.12,89),
 (223,'Fubá de Milho QUALITÁ Pacote 500g','Fubá de milho enriquecido com ferro e ácido fólico. NÃO CONTÉM GLÚTEN.','6374303_a1.jpg',1.31,88),
 (224,'Fubá de Milho YOKI Pacote 1kg','Farinha de milho.','249508_a1.jpg',2.3,88),
 (225,'Fubá de Milho YOKI Pacote 500g','Farinha de milho.','249515_a1.jpg',1.44,88),
 (226,'Biscoito BAUDUCCO Água e Sal 200g','CONTÉM GLÚTEN.','4343318_a1.jpg',1.38,85),
 (227,'Biscoito NESTLÉ Tostines Água 200g','CONTÉM GLÚTEN.','249362_a1.jpg',2.45,85),
 (228,'Biscoito PIRAQUÊ Água e Gergelim 240g','CONTÉM GLÚTEN.','1695106_a1.jpg',2.41,85),
 (229,'Biscoito ADRIA Mini Tortinhas 80g','CONTÉM GLÚTEN.','3851029_a1.jpg',1.92,87),
 (230,'Biscoito BAUDUCCO Recheado de Morango 140g','CONTÉM GLÚTEN.','5660667_a1.jpg',2.3,87),
 (231,'Lasanha a Bolonhesa FUGINI 400g','CONTÉM GLÚTEN.','5937363_a1.jpg',7.65,83),
 (232,'Macarrão Caseiro Gravata DE 500g','CONTÉM GLÚTEN.','441711_a1.jpg',4.44,83),
 (233,'Macarrão com Ovos Aletria RENATA 500g','CONTÉM GLÚTEN.','309141_a1.jpg',4.59,83),
 (234,'Sopa Americana de Brócolis CAMPBELL´S 305g','Sopa Pronta','287180_a1.jpg',7.65,84),
 (235,'Sopa Americana de Creme de Cebola CAMPBELL´S 305g','Sopa Pronta','4064329_a1.jpg',7.65,84),
 (236,'Ervilha Extra Fina BONDUELLE Lata 140g','CONTÉM GLÚTEN.','3997352_a1.jpg',4.48,81),
 (237,'Ervilha QUALITÁ Lata 200g','Ervilha, água, açúcar e sal. NÃO CONTÉM GLÚTEN.','5982240_a1.jpg',1.38,81),
 (238,'Milho Verde Embalado à Vácuo BONDUELLE Lata 285g','Milho verde em grão, água, acúcar, sal. NÃO CONTÉM GLÚTEN.','286695_a1.jpg',6.62,80),
 (239,'Milho Verde QUALITÁ Lata 200g','Milho, água e sal. NÃO CONTÉM GLÚTEN.','5982257_a1.jpg',1.55,80),
 (240,'Palmito Preto GINI Lata 500g','Palmito de pupunha, água, sal, acidulante ácido cítrico. NÃO CONTÉM GLÚTEN.','7217074_a1.jpg',21.71,82),
 (241,'Óleo de Soja LIZA Pet 900ml','Óleo refinado de soja e antioxidante ácido cítrico. NÃO CONTÉM GLÚTEN.','1230147_a1.jpg',2.77,79),
 (242,'Alcatra Bombom Bandeja 500g','Ingredientes:Carne bovina - Alcatra.','carnpe.jpg',15.85,16),
 (243,'Acém em Pedaço Resfriado Bandeja 500g','Ingredientes: Carne bovina - Acém.','carnpeda.jpg',5.71,15);
/*!40000 ALTER TABLE `tab_produto` ENABLE KEYS */;


--
-- Definition of table `tab_subcategoria`
--

DROP TABLE IF EXISTS `tab_subcategoria`;
CREATE TABLE `tab_subcategoria` (
  `subcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcat_descricao` varchar(30) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`subcat_id`,`categoria_id`) USING BTREE,
  KEY `FK_tab_subcategoria_1` (`categoria_id`),
  CONSTRAINT `FK_tab_subcategoria_1` FOREIGN KEY (`categoria_id`) REFERENCES `tab_categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_subcategoria`
--

/*!40000 ALTER TABLE `tab_subcategoria` DISABLE KEYS */;
INSERT INTO `tab_subcategoria` (`subcat_id`,`subcat_descricao`,`categoria_id`) VALUES 
 (1,'Água Sanitária',1),
 (2,'Álcool',1),
 (3,'Desinfetante',1),
 (4,'Amoníaco',1),
 (5,'Sabão em Pedra',1),
 (6,'Sabão em Pó',1),
 (7,'Pré Lavagem',1),
 (8,'Amaciante',1),
 (9,'Removedor',1),
 (10,'Lustra Móveis',1),
 (11,'Esponja de Aço',1),
 (12,'Detergente',1),
 (13,'Carne Moída',2),
 (14,'Carne Churrasco',2),
 (15,'Carne em Bife',2),
 (16,'Carne em Pedaço',2),
 (17,'Miúdos',2),
 (18,'Carne Suína',2),
 (19,'Frango Inteiro',2),
 (20,'Cortes Frango',2),
 (21,'Mussarela',16),
 (22,'Presunto',16),
 (23,'Queijo Prato',16),
 (24,'Manteiga',16),
 (25,'Requeijão',16),
 (26,'Mortadela',16),
 (27,'Salsicha',16),
 (28,'Salame',16),
 (29,'Queijo Fresco',16),
 (30,'Queijo Ralado',16),
 (31,'Queijo Pedaços',16),
 (32,'Iogurte',16),
 (33,'Bacon',16),
 (34,'Massa Pastel',16),
 (35,'Massa Pizza',16),
 (36,'Linguiça',16),
 (37,'Azeitona',16),
 (38,'Bacalhau',16),
 (39,'Pão em Forma',4),
 (40,'Pão Italiano',4),
 (41,'Farinha de Rosca',4),
 (42,'Pão Francês',4),
 (43,'Doces',4),
 (44,'Salgados',4),
 (45,'Bolo',4),
 (46,'Mistura p/ Bolo',5),
 (47,'Leite de Côco',5),
 (48,'Côco Ralado',5),
 (49,'Gelatina',5),
 (50,'Pudim e Flan',5),
 (51,'Goiabada',6),
 (52,'Geléia',6),
 (53,'Pêssego/Calda',6),
 (54,'Doce de Leite',6),
 (55,'Mel',6),
 (56,'Cereja/Calda',6),
 (57,'Sabonete',7),
 (58,'Shampoo',7),
 (59,'Shampoo',7),
 (60,'Papel Higiênico',7),
 (61,'Creme Dental',7),
 (62,'Escova Dental',7),
 (63,'Fio Dental',7),
 (64,'Desodorante',7),
 (65,'Talco',7),
 (66,'Algodão',7),
 (67,'Absorvente',7),
 (68,'Cotonete',7),
 (69,'Refrigerantes',8),
 (70,'Água Mineral',8),
 (71,'Cerveja',8),
 (72,'Sucos',8),
 (73,'Refrescos em Pó',8),
 (74,'Aperitivos',8),
 (75,'Extrato de Tomate',9),
 (76,'Purê de Tomate',9),
 (77,'Polpa de Tomate',9),
 (78,'Molho Pimenta',9),
 (79,'Óleo de Soja',10),
 (80,'Milho Verde',10),
 (81,'Ervilha',10),
 (82,'Palmito',10),
 (83,'Macarrão',11),
 (84,'Sopa Pronta',11),
 (85,'Água e Sal',12),
 (86,'Cream Cracker',12),
 (87,'Recheados',12),
 (88,'Fubá',13),
 (89,'Farinha de Milho',13),
 (90,'Arroz',14),
 (91,'Feijão',14),
 (92,'Farinha de Trigo',14),
 (93,'Açúcar',14),
 (94,'Sal',14),
 (95,'Alface',15),
 (96,'Batata',15),
 (97,'Cebola',15),
 (98,'Cenoura',15),
 (99,'Pimentão',15),
 (100,'Tomate',15),
 (101,'Vagem',15),
 (102,'Chuchu',15),
 (103,'Abacate',15),
 (104,'Abacaxi',15),
 (105,'Banana',15),
 (106,'Laranja',15),
 (107,'Limão',15),
 (108,'Mamão',15),
 (109,'Maracujá',15),
 (110,'Maçã',15),
 (111,'Melancia',15),
 (112,'Alho',15),
 (113,'Ovos',15),
 (114,'Repolho',15),
 (115,'Mandioca',15),
 (116,'Sorvete',3),
 (117,'Massa Pronta',3),
 (118,'Batata Frita',3),
 (119,'Hamburguer',3),
 (120,'Frango',3),
 (121,'Croquete',3),
 (122,'Filé de Peixe',3),
 (123,'Camarão',3),
 (124,'Suco em Lata',3),
 (125,'Achocolatado',17),
 (126,'Café',17),
 (127,'Chá',17),
 (128,'Flocos de Milho',17),
 (129,'Leite em Pó',17),
 (130,'Creme de Leite',17),
 (131,'Leite Condensado',17),
 (132,'Chocolate',18),
 (133,'Balas',18),
 (134,'Bombons',18),
 (135,'Doces',18),
 (136,'Luvas Descartáveis',19),
 (137,'Papel Alumínio',19),
 (138,'Filtro p/ Café',19),
 (139,'Guardanapo',19),
 (140,'Papel Toalha',19),
 (141,'Lâmpada',19),
 (142,'Fósforo',19),
 (143,'Vela',19),
 (144,'Pilha',19),
 (145,'Saco p/ Lixo',19),
 (146,'Esponja',19),
 (147,'Rodo',19),
 (148,'Vassoura',19),
 (149,'Pano p/ Limpeza',19),
 (150,'Catchup',20),
 (151,'Mostarda',20),
 (152,'Molho Inglês',20),
 (153,'Maionese',20),
 (154,'Caldos',20),
 (155,'Pimenta',20),
 (156,'Azeite',20),
 (157,'Temperos',20);
/*!40000 ALTER TABLE `tab_subcategoria` ENABLE KEYS */;


--
-- Definition of table `tab_telefone`
--

DROP TABLE IF EXISTS `tab_telefone`;
CREATE TABLE `tab_telefone` (
  `telefone_id` int(11) NOT NULL AUTO_INCREMENT,
  `telefone_numero` int(11) DEFAULT NULL,
  `telefone_ddd` int(11) DEFAULT NULL,
  `telefone_tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`telefone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tab_telefone`
--

/*!40000 ALTER TABLE `tab_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_telefone` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
