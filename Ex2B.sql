-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex2B.BBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex2B.BBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex2B.BBDD` ;
USE `Ex2B.BBDD` ;

-- -----------------------------------------------------
-- Table `Ex2B.BBDD`.`Tipos de Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B.BBDD`.`Tipos de Tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2B.BBDD`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B.BBDD`.`Cine` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Num. de Sales` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2B.BBDD`.`Entrada del Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B.BBDD`.`Entrada del Cine` (
  `ID` INT NOT NULL,
  `Tipos de Tarifa_ID` INT NOT NULL,
  `Cine_ID` INT NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Dia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `idEntrada del Cine_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Entrada del Cine_Tipos de Tarifa_idx` (`Tipos de Tarifa_ID` ASC) VISIBLE,
  INDEX `fk_Entrada del Cine_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Entrada del Cine_Tipos de Tarifa`
    FOREIGN KEY (`Tipos de Tarifa_ID`)
    REFERENCES `Ex2B.BBDD`.`Tipos de Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrada del Cine_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Ex2B.BBDD`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2B.BBDD`.`Pel·licula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B.BBDD`.`Pel·licula` (
  `ID` INT NOT NULL,
  `Titol` VARCHAR(45) NOT NULL,
  `Genere` VARCHAR(45) NOT NULL,
  `Per a` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2B.BBDD`.`Projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B.BBDD`.`Projeccio` (
  `Cine_ID` INT NOT NULL,
  `Pel·licula_ID` INT NOT NULL,
  `Data` INT NOT NULL,
  `Sala` VARCHAR(45) NOT NULL,
  INDEX `fk_Projeccio_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  INDEX `fk_Projeccio_Pel·licula1_idx` (`Pel·licula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccio_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Ex2B.BBDD`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Pel·licula1`
    FOREIGN KEY (`Pel·licula_ID`)
    REFERENCES `Ex2B.BBDD`.`Pel·licula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
