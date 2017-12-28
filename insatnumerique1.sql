-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2017 at 08:31 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insatnumerique`
--

-- --------------------------------------------------------

--
-- Table structure for table `abscences`
--

CREATE TABLE `abscences` (
  `idAbscence` int(11) NOT NULL,
  `idEtudiant` varchar(8) NOT NULL,
  `idMatiere` int(11) NOT NULL,
  `date` date NOT NULL,
  `typeseance` varchar(50) NOT NULL,
  `abscent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

CREATE TABLE `etudiants` (
  `NINS` varchar(8) NOT NULL,
  `NCIN` varchar(8) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Filiere` varchar(50) NOT NULL,
  `Annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `matieres`
--

CREATE TABLE `matieres` (
  `IdMatiere` int(11) NOT NULL,
  `nomMatiere` varchar(50) NOT NULL,
  `matriculeProf` varchar(50) NOT NULL,
  `filiere` varchar(50) NOT NULL,
  `annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `idEtudiant` varchar(8) NOT NULL,
  `idMatiere` int(11) NOT NULL,
  `noteTP` float DEFAULT NULL,
  `noteDs` float DEFAULT NULL,
  `noteExam` float DEFAULT NULL,
  `eliminé` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profs`
--

CREATE TABLE `profs` (
  `matriculeProf` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `departement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abscences`
--
ALTER TABLE `abscences`
  ADD PRIMARY KEY (`idEtudiant`,`idMatiere`,`date`,`idAbscence`),
  ADD UNIQUE KEY `idAbscence` (`idAbscence`),
  ADD KEY `idMatiere` (`idMatiere`);

--
-- Indexes for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`NINS`);

--
-- Indexes for table `matieres`
--
ALTER TABLE `matieres`
  ADD PRIMARY KEY (`IdMatiere`),
  ADD KEY `matriculeProf` (`matriculeProf`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`idEtudiant`,`idMatiere`),
  ADD KEY `idMatiere` (`idMatiere`);

--
-- Indexes for table `profs`
--
ALTER TABLE `profs`
  ADD PRIMARY KEY (`matriculeProf`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abscences`
--
ALTER TABLE `abscences`
  MODIFY `idAbscence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `matieres`
--
ALTER TABLE `matieres`
  MODIFY `IdMatiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `abscences`
--
ALTER TABLE `abscences`
  ADD CONSTRAINT `abscences_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`NINS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `abscences_ibfk_2` FOREIGN KEY (`idMatiere`) REFERENCES `matieres` (`IdMatiere`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `matieres`
--
ALTER TABLE `matieres`
  ADD CONSTRAINT `matieres_ibfk_1` FOREIGN KEY (`matriculeProf`) REFERENCES `profs` (`matriculeProf`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiants` (`NINS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`idMatiere`) REFERENCES `matieres` (`IdMatiere`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
