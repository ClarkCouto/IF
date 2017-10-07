-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09-Abr-2017 às 15:22
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: 'bd'
--

-- --------------------------------------------------------

--
-- Estrutura da tabela 'pessoa'
--

CREATE TABLE pessoa (
  idpessoa int(11) NOT NULL,
  nome varchar(100) NOT NULL,
  endereco varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela 'pessoa'
--

INSERT INTO pessoa (idpessoa, nome, endereco) VALUES
(1, 'Silvia', 'Rua X, 10'),
(4, 'Eduardo', 'Rua Y, 30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table 'pessoa'
--
ALTER TABLE pessoa
  ADD PRIMARY KEY (idpessoa);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table 'pessoa'
--
ALTER TABLE pessoa
  MODIFY idpessoa int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
