-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Gen 31, 2017 alle 09:07
-- Versione del server: 5.6.26
-- Versione PHP: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dirscolastico`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `classi`
--

CREATE TABLE IF NOT EXISTS `classi` (
  `CodiceClasse` int(4) NOT NULL,
  `Classe` char(3) NOT NULL,
  `Specializzazione` set('biennio','inf','mec','ele','cat','lic') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `classi`
--

INSERT INTO `classi` (`CodiceClasse`, `Classe`, `Specializzazione`) VALUES
(1, '1B', 'inf'),
(2, '2B', 'inf'),
(3, '3B', 'inf'),
(4, '4B', 'inf'),
(5, '5B', 'inf'),
(6, '1A', 'inf'),
(7, '2A', 'inf'),
(8, '3A', 'inf'),
(9, '4A', 'inf'),
(10, '5A', 'inf'),
(11, '1A', 'mec'),
(12, '2A', 'mec'),
(13, '3A', 'mec'),
(14, '4A', 'mec'),
(15, '5A', 'mec'),
(16, '1A', 'ele'),
(17, '2A', 'ele'),
(18, '3A', 'ele'),
(19, '4A', 'ele'),
(20, '5A', 'ele'),
(21, '1A', 'cat'),
(22, '2A', 'cat'),
(23, '3A', 'cat'),
(24, '4A', 'cat'),
(25, '5A', 'cat'),
(26, '1A', 'lic'),
(27, '2A', 'lic'),
(28, '3A', 'lic'),
(29, '4A', 'lic'),
(30, '5A', 'lic'),
(31, '5C', 'inf');

-- --------------------------------------------------------

--
-- Struttura della tabella `insegnano`
--

CREATE TABLE IF NOT EXISTS `insegnano` (
  `CodiceProfessore` int(4) NOT NULL,
  `CodiceClasse` int(4) NOT NULL,
  `NuomeroOre` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `professori`
--

CREATE TABLE IF NOT EXISTS `professori` (
  `CodiceProfessore` int(4) NOT NULL,
  `Cognome` varchar(25) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `ClasseConcorso` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE IF NOT EXISTS `studenti` (
  `Matricola` int(11) NOT NULL,
  `Cognome` varchar(25) NOT NULL,
  `Nome` varchar(25) NOT NULL,
  `DataNascita` date NOT NULL,
  `CodiceClasse` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `studenti`
--

INSERT INTO `studenti` (`Matricola`, `Cognome`, `Nome`, `DataNascita`, `CodiceClasse`) VALUES
(1, 'BAGNO', 'LUCA', '1998-08-18', 31),
(2, 'BRUNO', 'DIEGO', '1998-11-25', 31);

-- --------------------------------------------------------

--
-- Struttura della tabella `valutazioni`
--

CREATE TABLE IF NOT EXISTS `valutazioni` (
  `CodiceValutazione` int(11) NOT NULL,
  `DataVal` date NOT NULL,
  `Voto` tinyint(4) NOT NULL,
  `Matricola` int(11) NOT NULL,
  `Materia` set('ITALIANO','MATEMATICA','INFORMATICA','RETI','INGLESE','TPSI','GESTIONE PROGETTO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`CodiceClasse`);

--
-- Indici per le tabelle `insegnano`
--
ALTER TABLE `insegnano`
  ADD PRIMARY KEY (`CodiceProfessore`,`CodiceClasse`),
  ADD KEY `CodiceClasse` (`CodiceClasse`);

--
-- Indici per le tabelle `professori`
--
ALTER TABLE `professori`
  ADD PRIMARY KEY (`CodiceProfessore`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`Matricola`),
  ADD KEY `codcl` (`CodiceClasse`);

--
-- Indici per le tabelle `valutazioni`
--
ALTER TABLE `valutazioni`
  ADD PRIMARY KEY (`CodiceValutazione`),
  ADD KEY `xmatr` (`Matricola`),
  ADD KEY `Matricola` (`Matricola`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `classi`
--
ALTER TABLE `classi`
  MODIFY `CodiceClasse` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT per la tabella `studenti`
--
ALTER TABLE `studenti`
  MODIFY `Matricola` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `valutazioni`
--
ALTER TABLE `valutazioni`
  MODIFY `CodiceValutazione` int(11) NOT NULL AUTO_INCREMENT;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `insegnano`
--
ALTER TABLE `insegnano`
  ADD CONSTRAINT `insegnano_ibfk_1` FOREIGN KEY (`CodiceProfessore`) REFERENCES `professori` (`CodiceProfessore`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `insegnano_ibfk_2` FOREIGN KEY (`CodiceClasse`) REFERENCES `classi` (`CodiceClasse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`CodiceClasse`) REFERENCES `classi` (`CodiceClasse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `valutazioni`
--
ALTER TABLE `valutazioni`
  ADD CONSTRAINT `valutazioni_ibfk_1` FOREIGN KEY (`Matricola`) REFERENCES `studenti` (`Matricola`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
