-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex5.BBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex5.BBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex5.BBDD` ;
USE `Ex5.BBDD` ;

-- -----------------------------------------------------
-- Table `Ex5.BBDD`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.BBDD`.`Client` (
  `Usuario` INT NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Poblacio` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Usuario`),
  UNIQUE INDEX `DNI_UNIQUE` (`Usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex5.BBDD`.`TipusVehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.BBDD`.`TipusVehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex5.BBDD`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.BBDD`.`Vehicle` (
  `Matricula` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Client_Usuario` INT NOT NULL,
  `TipusVehicle_ID` INT NOT NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE,
  INDEX `fk_Vehicle_Client2_idx` (`Client_Usuario` ASC) VISIBLE,
  INDEX `fk_Vehicle_TipusVehicle1_idx` (`TipusVehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client2`
    FOREIGN KEY (`Client_Usuario`)
    REFERENCES `Ex5.BBDD`.`Client` (`Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_TipusVehicle1`
    FOREIGN KEY (`TipusVehicle_ID`)
    REFERENCES `Ex5.BBDD`.`TipusVehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex5.BBDD`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.BBDD`.`Vehicle` (
  `Matricula` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Client_Usuario` INT NOT NULL,
  `TipusVehicle_ID` INT NOT NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE,
  INDEX `fk_Vehicle_Client2_idx` (`Client_Usuario` ASC) VISIBLE,
  INDEX `fk_Vehicle_TipusVehicle1_idx` (`TipusVehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client2`
    FOREIGN KEY (`Client_Usuario`)
    REFERENCES `Ex5.BBDD`.`Client` (`Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_TipusVehicle1`
    FOREIGN KEY (`TipusVehicle_ID`)
    REFERENCES `Ex5.BBDD`.`TipusVehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex5.BBDD`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.BBDD`.`Cita` (
  `ID` INT NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Vehicle_Matricula` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_Matricula`)
    REFERENCES `Ex5.BBDD`.`Vehicle` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
