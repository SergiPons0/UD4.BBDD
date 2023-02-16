-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex7.BBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex7.BBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex7.BBDD` ;
USE `Ex7.BBDD` ;

-- -----------------------------------------------------
-- Table `Ex7.BBDD`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7.BBDD`.`Empleat` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Data_Naixement` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Edat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7.BBDD`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7.BBDD`.`Ticket` (
  `ID` INT NOT NULL,
  `Nº_factura` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `hora` VARCHAR(45) NOT NULL,
  `Preu_IVA` VARCHAR(45) NOT NULL,
  `Empleat_DNI` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Identificador_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Ticket_Empleat_idx` (`Empleat_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleat`
    FOREIGN KEY (`Empleat_DNI`)
    REFERENCES `Ex7.BBDD`.`Empleat` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7.BBDD`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7.BBDD`.`Producte` (
  `Codi_intern` INT NOT NULL,
  `Codi_barres` VARCHAR(45) NOT NULL,
  `Preu_unitari` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  `IVA` VARCHAR(45) NOT NULL,
  `Preu_final` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codi_intern`),
  UNIQUE INDEX `Codi_intern_UNIQUE` (`Codi_intern` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7.BBDD`.`LineadeTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7.BBDD`.`LineadeTicket` (
  `ID` INT NOT NULL,
  `Ticket_ID` INT NOT NULL,
  `Producte_Codi_intern` INT NOT NULL,
  `Descripcio_producte` VARCHAR(45) NOT NULL,
  `Unitats_descompte` VARCHAR(45) NOT NULL,
  `Preu_unitari_(IVA)` VARCHAR(45) NOT NULL,
  `Preu_total` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_LineadeTicket_Ticket1_idx` (`Ticket_ID` ASC) VISIBLE,
  INDEX `fk_LineadeTicket_Producte1_idx` (`Producte_Codi_intern` ASC) VISIBLE,
  CONSTRAINT `fk_LineadeTicket_Ticket1`
    FOREIGN KEY (`Ticket_ID`)
    REFERENCES `Ex7.BBDD`.`Ticket` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LineadeTicket_Producte1`
    FOREIGN KEY (`Producte_Codi_intern`)
    REFERENCES `Ex7.BBDD`.`Producte` (`Codi_intern`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
