-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10-Maio-2017 às 03:28
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prova`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `data`
--

CREATE TABLE `data` (
  `idData` int(11) NOT NULL,
  `dia` int(2) NOT NULL,
  `mes` int(2) NOT NULL,
  `ano` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `data`
--

INSERT INTO `data` (`idData`, `dia`, `mes`, `ano`) VALUES
(5, 1, 11, 2017),
(6, 5, 12, 2016),
(7, 1, 7, 2015),
(8, 1, 8, 2012),
(9, 1, 11, 2017),
(10, 5, 12, 2016),
(11, 1, 7, 2015),
(12, 1, 8, 2012),
(13, 1, 11, 2017),
(14, 5, 12, 2016),
(15, 1, 7, 2015),
(16, 1, 8, 2012),
(17, 1, 11, 2017),
(18, 5, 12, 2016),
(19, 1, 7, 2015),
(20, 1, 8, 2012),
(21, 1, 11, 2017),
(22, 5, 12, 2016),
(23, 1, 7, 2015),
(24, 1, 8, 2012);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rota`
--

CREATE TABLE `rota` (
  `idRota` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rota`
--

INSERT INTO `rota` (`idRota`, `nome`, `descricao`) VALUES
(5, 'POA-MCO', 'Rota Porto Alegre - Orlando'),
(6, 'GIG-MIA', 'Rota Galeão - Miami'),
(7, 'GIG-BSB', 'Rota Galeão-Brasília'),
(8, 'POA-GIG', 'Rota Porto Alegre - Galeão'),
(9, 'POA-MCO', 'Rota Porto Alegre - Orlando'),
(10, 'GIG-MIA', 'Rota Galeão - Miami'),
(11, 'GIG-BSB', 'Rota Galeão-Brasília'),
(12, 'POA-GIG', 'Rota Porto Alegre - Galeão'),
(13, 'POA-MCO', 'Rota Porto Alegre - Orlando'),
(14, 'GIG-MIA', 'Rota Galeão - Miami'),
(15, 'GIG-BSB', 'Rota Galeão-Brasília'),
(16, 'POA-GIG', 'Rota Porto Alegre - Galeão'),
(17, 'POA-MCO', 'Rota Porto Alegre - Orlando'),
(18, 'GIG-MIA', 'Rota Galeão - Miami'),
(19, 'GIG-BSB', 'Rota Galeão-Brasília'),
(20, 'POA-GIG', 'Rota Porto Alegre - Galeão'),
(21, 'POA-MCO', 'Rota Porto Alegre - Orlando'),
(22, 'GIG-MIA', 'Rota Galeão - Miami'),
(23, 'GIG-BSB', 'Rota Galeão-Brasília'),
(24, 'POA-GIG', 'Rota Porto Alegre - Galeão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voo`
--

CREATE TABLE `voo` (
  `idVoo` int(11) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `ciaAerea` varchar(100) NOT NULL,
  `horarioSaida` varchar(10) NOT NULL,
  `horarioChegada` varchar(10) NOT NULL,
  `idRota` int(11) NOT NULL,
  `idData` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `voo`
--

INSERT INTO `voo` (`idVoo`, `numero`, `ciaAerea`, `horarioSaida`, `horarioChegada`, `idRota`, `idData`) VALUES
(1, 1001, 'Delta', '10:00', '12:00', 13, 13),
(2, 1002, 'Delta', '11:00', '21:00', 14, 14),
(3, 1003, 'Azul', '09:00', '12:00', 15, 15),
(4, 1004, 'Ethiad', '05:00', '07:00', 16, 16),
(5, 1001, 'Delta', '10:00', '12:00', 17, 17),
(6, 1002, 'Delta', '11:00', '21:00', 18, 18),
(7, 1003, 'Azul', '09:00', '12:00', 19, 19),
(8, 1004, 'Ethiad', '05:00', '07:00', 20, 20),
(9, 1, 'Delta', '10:00', '12:00', 21, 21),
(10, 2, 'Delta', '11:00', '21:00', 22, 22),
(11, 3, 'Azul', '09:00', '12:00', 23, 23),
(12, 4, 'Ethiad', '05:00', '07:00', 24, 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`idData`);

--
-- Indexes for table `rota`
--
ALTER TABLE `rota`
  ADD PRIMARY KEY (`idRota`);

--
-- Indexes for table `voo`
--
ALTER TABLE `voo`
  ADD PRIMARY KEY (`idVoo`),
  ADD KEY `idRota` (`idRota`),
  ADD KEY `idData` (`idData`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `rota`
--
ALTER TABLE `rota`
  MODIFY `idRota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `voo`
--
ALTER TABLE `voo`
  MODIFY `idVoo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `voo`
--
ALTER TABLE `voo`
  ADD CONSTRAINT `idData` FOREIGN KEY (`idData`) REFERENCES `data` (`idData`),
  ADD CONSTRAINT `idRota` FOREIGN KEY (`idRota`) REFERENCES `rota` (`idRota`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
