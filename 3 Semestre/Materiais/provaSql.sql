-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Abr-2017 às 03:06
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
-- Estrutura da tabela `voo`
--

CREATE TABLE `voo` (
  `idVoo` int(11) NOT NULL,
  `ciaAerea` varchar(100) NOT NULL,
  `horarioSaida` varchar(10) NOT NULL,
  `horarioChegada` varchar(10) NOT NULL,
  `idRota` int(11) NOT NULL,
  `idData` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `rota`
--

CREATE TABLE `rota` (
  `idRota` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
--
-- Indexes for table `voo`
--

ALTER TABLE `voo`
  ADD PRIMARY KEY (`idVoo`),
  ADD KEY `idRota` (`idRota`),
  ADD KEY `idData` (`idData`);

--
-- Indexes for table `rota`
--
ALTER TABLE `rota`
  ADD PRIMARY KEY (`idRota`);
  
--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`idData`);
--
-- AUTO_INCREMENT for table `voo`
--
ALTER TABLE `voo`
  MODIFY `idVoo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rota`
--
ALTER TABLE `rota`
  MODIFY `idRota` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limitadores para a tabela `voo`
--
ALTER TABLE `voo`
  ADD CONSTRAINT `idRota` FOREIGN KEY (`idRota`) REFERENCES `rota` (`idRota`);
ALTER TABLE `voo`
  ADD CONSTRAINT `idData` FOREIGN KEY (`idData`) REFERENCES `data` (`idData`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
