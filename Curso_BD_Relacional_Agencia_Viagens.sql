-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-169975-db.mariadb-169975:10025
-- Generation Time: Apr 27, 2024 at 09:50 PM
-- Server version: 11.1.2-MariaDB-1:11.1.2+maria~ubu2004
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viagens`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do destino',
  `descricao` varchar(255) NOT NULL COMMENT 'Descrição do destino'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `descricao`) VALUES
(1, 'João Pessoa', 'Capital da Paraíba'),
(2, 'Rio de Janeiro', 'Cidade Maravilhosa'),
(3, 'Porto Alegre', 'Capital do Rio Grande do Sul');

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT 'Referência à ID do Usuário que fez a reserva',
  `id_destino` int(11) DEFAULT NULL COMMENT 'Referência à ID do Destino da reserva',
  `data` date DEFAULT NULL COMMENT 'Data da reserva',
  `status` varchar(255) DEFAULT 'pendente' COMMENT 'Status da reserva: confirmada, pendente, cancelada, etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservas`
--

INSERT INTO `reservas` (`id`, `id_usuario`, `id_destino`, `data`, `status`) VALUES
(1, 1, 1, '2024-11-11', 'pendente'),
(2, 3, 3, '2024-05-20', 'confirmado'),
(4, 1, 1, '2024-11-11', 'pendente');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'Nome do usuário',
  `email` varchar(100) NOT NULL COMMENT 'Email do usuário',
  `endereco` varchar(50) NOT NULL COMMENT 'Endereço do usuário',
  `dataNascimento` date NOT NULL COMMENT 'Data de nascimento do usuário'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `endereco`, `dataNascimento`) VALUES
(1, 'João', 'teste@gmail.com', 'Rua Politeama, 111, Feira de Santana - BA', '2000-06-26'),
(2, 'Pedro', 'pedro@email.com', 'Rua Amambai, 54, Feira de Santana - BA', '1999-05-20'),
(3, 'Laura', 'laura@email.com', 'Rua Porto, 12, Porto Alegre - PA', '2000-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservas_destinos` (`id_destino`),
  ADD KEY `fk_usuarios` (`id_usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reservas_destinos` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id`),
  ADD CONSTRAINT `fk_reservas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
