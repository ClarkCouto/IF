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
-- Database: `aulajdbc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cpf`
--

CREATE TABLE `cpf` (
  `idcpf` int(11) NOT NULL,
  `numero` int(9) NOT NULL,
  `digito` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cpf`
--

INSERT INTO `cpf` (`idcpf`, `numero`, `digito`) VALUES
(1, 15988250, 89),
(2, 987654321, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empregado`
--

CREATE TABLE `empregado` (
  `idempregado` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `idcpf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `logradouro`, `complemento`, `uf`) VALUES
(1, 'Rua A', '1', 'RS'),
(2, 'Rua B', '2', 'SC'),
(3, 'Rua C', '3', 'PR'),
(4, 'Rua D', '4', 'SP'),
(5, 'Rua A', '1', 'RS'),
(6, 'Rua B', '2', 'SC'),
(7, 'Rua C', '3', 'PR'),
(8, 'Rua D', '4', 'SP'),
(9, 'Rua A', '1', 'RS'),
(10, 'Rua B', '2', 'SC'),
(11, 'Rua C', '3', 'PR'),
(12, 'Rua D', '4', 'SP'),
(13, 'Rua A', '1', 'RS'),
(14, 'Rua B', '2', 'SC'),
(15, 'Rua C', '3', 'PR'),
(16, 'Rua D', '4', 'SP'),
(17, 'Rua A', '1', 'RS'),
(18, 'Rua B', '2', 'SC'),
(19, 'Rua C', '3', 'PR'),
(20, 'Rua D', '4', 'SP'),
(21, 'Rua A', '1', 'RS'),
(22, 'Rua B', '2', 'SC'),
(23, 'Rua C', '3', 'PR'),
(24, 'Rua D', '4', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `idpessoa` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`idpessoa`, `nome`, `endereco`) VALUES
(5, 'Silvia', 'Rua X, 10'),
(6, 'Silvia 2', 'Rua X, 20'),
(7, 'Silvia 3', 'Rua X, 30'),
(8, 'Cris', 'Adão Baino, 701');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cpf`
--
ALTER TABLE `cpf`
  ADD PRIMARY KEY (`idcpf`);

--
-- Indexes for table `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`idempregado`),
  ADD KEY `idcpf` (`idcpf`);

--
-- Indexes for table `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idpessoa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cpf`
--
ALTER TABLE `cpf`
  MODIFY `idcpf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `empregado`
--
ALTER TABLE `empregado`
  MODIFY `idempregado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `idpessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `empregado`
--
ALTER TABLE `empregado`
  ADD CONSTRAINT `idcpf` FOREIGN KEY (`idcpf`) REFERENCES `cpf` (`idcpf`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
