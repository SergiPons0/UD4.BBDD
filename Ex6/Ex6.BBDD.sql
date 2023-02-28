-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex6.BBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex6.BBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex6.BBDD` ;
USE `Ex6.BBDD` ;

-- -----------------------------------------------------
-- Table `Ex6.BBDD`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6.BBDD`.`Avion` (
  `ID` INT NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Capacidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex6.BBDD`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6.BBDD`.`Vuelo` (
  `ID` INT NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Destino` VARCHAR(45) NOT NULL,
  `Dia_llegada` VARCHAR(45) NOT NULL,
  `Dia_vuelta` VARCHAR(45) NOT NULL,
  `Hora_salida` VARCHAR(45) NOT NULL,
  `Hora_vuelta` VARCHAR(45) NOT NULL,
  `Avion_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Destino_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Vuelo_Avion1_idx` (`Avion_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Avion1`
    FOREIGN KEY (`Avion_ID`)
    REFERENCES `Ex6.BBDD`.`Avion` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex6.BBDD`.`Pasajero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6.BBDD`.`Pasajero` (
  `Pasaporte` VARCHAR(10) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Gmail` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Dirrecion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Pasaporte`),
  UNIQUE INDEX `DNI_UNIQUE` (`Pasaporte` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex6.BBDD`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex6.BBDD`.`Reserva` (
  `ID` INT NOT NULL,
  `Dia_Reserva` VARCHAR(45) NOT NULL,
  `Importe_tot` VARCHAR(45) NOT NULL,
  `Vuelo_ID` INT NOT NULL,
  `Pasajero_Pasaporte` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Vuelo1_idx` (`Vuelo_ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Pasajero1_idx` (`Pasajero_Pasaporte` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Vuelo1`
    FOREIGN KEY (`Vuelo_ID`)
    REFERENCES `Ex6.BBDD`.`Vuelo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Pasajero1`
    FOREIGN KEY (`Pasajero_Pasaporte`)
    REFERENCES `Ex6.BBDD`.`Pasajero` (`Pasaporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
