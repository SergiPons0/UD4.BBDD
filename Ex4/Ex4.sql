-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex4.BBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex4.BBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex4.BBDD` ;
USE `Ex4.BBDD` ;

-- -----------------------------------------------------
-- Table `Ex4.BBDD`.`TIpus de Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4.BBDD`.`TIpus de Polissa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4.BBDD`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4.BBDD`.`Vendedor` (
  `DNI/CIF` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Mobil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI/CIF`),
  UNIQUE INDEX `DNI/CIF_UNIQUE` (`DNI/CIF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4.BBDD`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4.BBDD`.`Client` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Movil` VARCHAR(45) NOT NULL,
  `Vip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4.BBDD`.`Pollissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4.BBDD`.`Pollissa` (
  `NumPolissa` INT NOT NULL AUTO_INCREMENT,
  `Import` VARCHAR(45) NOT NULL,
  `Data inici` VARCHAR(45) NOT NULL,
  `Data final` VARCHAR(45) NOT NULL,
  `Tipus_pagament` VARCHAR(45) NOT NULL,
  `TIpus de Polissa_ID` INT NOT NULL,
  `Client_DNI` VARCHAR(45) NOT NULL,
  `Vendedor_DNI/CIF` VARCHAR(45) NOT NULL,
  `Client_DNI1` VARCHAR(10) NOT NULL,
  INDEX `fk_Pollissa_TIpus de Polissa1_idx` (`TIpus de Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Pollissa_Vendedor1_idx` (`Vendedor_DNI/CIF` ASC) VISIBLE,
  UNIQUE INDEX `NumPolissa_UNIQUE` (`NumPolissa` ASC) VISIBLE,
  PRIMARY KEY (`NumPolissa`),
  INDEX `fk_Pollissa_Client1_idx` (`Client_DNI1` ASC) VISIBLE,
  CONSTRAINT `fk_Pollissa_TIpus de Polissa1`
    FOREIGN KEY (`TIpus de Polissa_ID`)
    REFERENCES `Ex4.BBDD`.`TIpus de Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pollissa_Vendedor1`
    FOREIGN KEY (`Vendedor_DNI/CIF`)
    REFERENCES `Ex4.BBDD`.`Vendedor` (`DNI/CIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pollissa_Client1`
    FOREIGN KEY (`Client_DNI1`)
    REFERENCES `Ex4.BBDD`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
