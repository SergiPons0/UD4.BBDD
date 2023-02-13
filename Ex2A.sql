-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex2A.BBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex2A.BBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex2A.BBDD` ;
USE `Ex2A.BBDD` ;

-- -----------------------------------------------------
-- Table `Ex2A.BBDD`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2A.BBDD`.`Metge` (
  `NumCol·legiat` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumCol·legiat`),
  UNIQUE INDEX `NumCol·legiat_UNIQUE` (`NumCol·legiat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2A.BBDD`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2A.BBDD`.`Pacient` (
  `NumeroSegSocial` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumeroSegSocial`),
  UNIQUE INDEX `NumeroSegSocial_UNIQUE` (`NumeroSegSocial` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2A.BBDD`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2A.BBDD`.`Metge` (
  `NumCol·legiat` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumCol·legiat`),
  UNIQUE INDEX `NumCol·legiat_UNIQUE` (`NumCol·legiat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2A.BBDD`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2A.BBDD`.`Consulta` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Pacient_NumeroSegSocial` INT NOT NULL,
  `Metge_NumCol·legiat` INT NOT NULL,
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_NumeroSegSocial` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_NumCol·legiat` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Consultacol_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_NumeroSegSocial`)
    REFERENCES `Ex2A.BBDD`.`Pacient` (`NumeroSegSocial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_NumCol·legiat`)
    REFERENCES `Ex2A.BBDD`.`Metge` (`NumCol·legiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
