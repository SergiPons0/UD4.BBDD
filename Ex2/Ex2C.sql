-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex2C.BBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex2C.BBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex2C.BBDD` ;
USE `Ex2C.BBDD` ;

-- -----------------------------------------------------
-- Table `Ex2C.BBDD`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2C.BBDD`.`Matricula` (
  `ID` INT NOT NULL,
  `alumne` VARCHAR(45) NOT NULL,
  `Assignatura` VARCHAR(45) NOT NULL,
  `Fecha de validacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2C.BBDD`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2C.BBDD`.`Alumne` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Matricula_ID` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  INDEX `fk_Alumne_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Alumne_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `Ex2C.BBDD`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2C.BBDD`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2C.BBDD`.`Professors` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Titulacio` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2C.BBDD`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2C.BBDD`.`Departament` (
  `ID` INT NOT NULL,
  `Professors_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Nom_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Departament_Professors1_idx` (`Professors_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Departament_Professors1`
    FOREIGN KEY (`Professors_DNI`)
    REFERENCES `Ex2C.BBDD`.`Professors` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2C.BBDD`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2C.BBDD`.`Assignatura` (
  `Nom` INT NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `Professor` VARCHAR(45) NOT NULL,
  `Departament_Nom` INT NOT NULL,
  PRIMARY KEY (`Nom`),
  UNIQUE INDEX `Nom_UNIQUE` (`Nom` ASC) VISIBLE,
  INDEX `fk_Assignatura_Departament1_idx` (`Departament_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura_Departament1`
    FOREIGN KEY (`Departament_Nom`)
    REFERENCES `Ex2C.BBDD`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2C.BBDD`.`Matricula Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2C.BBDD`.`Matricula Assignatura` (
  `ID` VARCHAR(45) NOT NULL,
  `Matricula_ID` INT NOT NULL,
  `Assignatura_Nom` INT NOT NULL,
  `ID` INT NOT NULL,
  INDEX `fk_Matricula Assignatura_Matricula_idx` (`Matricula_ID` ASC) VISIBLE,
  INDEX `fk_Matricula Assignatura_Assignatura1_idx` (`Assignatura_Nom` ASC) VISIBLE,
  INDEX `fk_Matricula Assignatura_Professors1_idx` (`ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Matricula Assignaturacol_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula Assignatura_Matricula`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `Ex2C.BBDD`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula Assignatura_Assignatura1`
    FOREIGN KEY (`Assignatura_Nom`)
    REFERENCES `Ex2C.BBDD`.`Assignatura` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula Assignatura_Professors1`
    FOREIGN KEY (`ID`)
    REFERENCES `Ex2C.BBDD`.`Professors` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
