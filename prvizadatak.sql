-- MySQL Script generated by MySQL Workbench
-- Fri Mar  9 19:56:41 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema product
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema drustvena_mreza
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema drustvena_mreza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `drustvena_mreza` ;
USE `drustvena_mreza` ;

-- -----------------------------------------------------
-- Table `drustvena_mreza`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drustvena_mreza`.`korisnik` (
  `idkorisnik` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `datum_rodjenja` DATE NOT NULL,
  `drzava_rodjenja` VARCHAR(45) NOT NULL,
  `email_adresa` VARCHAR(45) NOT NULL,
  `korisnicko_ime` VARCHAR(45) NOT NULL,
  `kratka_biografija` TEXT(100) NOT NULL,
  `fotografija` BLOB NOT NULL,
  PRIMARY KEY (`idkorisnik`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drustvena_mreza`.`prijateljstva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drustvena_mreza`.`prijateljstva` (
  `idprijateljstva` INT NOT NULL AUTO_INCREMENT,
  `korisnik1_id` INT NOT NULL,
  `korisnik2_id` INT NOT NULL,
  `prijateljstvo_id` INT NOT NULL,
  PRIMARY KEY (`idprijateljstva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drustvena_mreza`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drustvena_mreza`.`status` (
  `idstatus` INT NOT NULL AUTO_INCREMENT,
  `naslov` TINYTEXT NOT NULL,
  `datum_vrijeme` DATETIME NOT NULL,
  `tekst` VARCHAR(45) NULL,
  `slika` BLOB NULL,
  PRIMARY KEY (`idstatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drustvena_mreza`.`korisnik_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drustvena_mreza`.`korisnik_status` (
  `idkorisnik_status` INT NOT NULL AUTO_INCREMENT,
  `korisnik_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`idkorisnik_status`),
  INDEX `korisnik_status_idx` (`korisnik_id` ASC),
  INDEX `status_korisnik_idx` (`status_id` ASC),
  CONSTRAINT `korisnik_status`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `drustvena_mreza`.`korisnik` (`idkorisnik`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `status_korisnik`
    FOREIGN KEY (`status_id`)
    REFERENCES `drustvena_mreza`.`status` (`idstatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drustvena_mreza`.`korisnik_prijateljstvo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drustvena_mreza`.`korisnik_prijateljstvo` (
  `idkorisnik_prijateljstvo` INT NOT NULL AUTO_INCREMENT,
  `friendship1` INT NOT NULL,
  `friendship2` INT NOT NULL,
  `korisnik_id` INT NOT NULL,
  `prijateljstvo_id` INT NOT NULL,
  PRIMARY KEY (`idkorisnik_prijateljstvo`),
  INDEX `fk_prijatkorisnik_idx` (`prijateljstvo_id` ASC),
  INDEX `fk_korisnikprijat_idx` (`korisnik_id` ASC),
  CONSTRAINT `fk_korisnikprijat`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `drustvena_mreza`.`korisnik` (`idkorisnik`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prijatkorisnik`
    FOREIGN KEY (`prijateljstvo_id`)
    REFERENCES `drustvena_mreza`.`prijateljstva` (`idprijateljstva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
