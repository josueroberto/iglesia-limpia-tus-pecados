-- MySQL Script generated by MySQL Workbench
-- 08/25/14 23:26:52
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema iglesia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `iglesia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `iglesia` ;

-- -----------------------------------------------------
-- Table `iglesia`.`miembros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iglesia`.`miembros` (
  `codmiembro` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(20) NOT NULL,
  `apellidos` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(50) NULL,
  `ciudad` VARCHAR(30) NULL,
  `municipio` VARCHAR(40) NULL,
  `departamento` VARCHAR(40) NULL,
  `pais` VARCHAR(30) NULL,
  `dpi` VARCHAR(20) NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `email` VARCHAR(50) NULL,
  `telefono` VARCHAR(15) NULL,
  `celular` VARCHAR(15) NULL,
  `fecha_conversion` DATE NULL,
  PRIMARY KEY (`codmiembro`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `codmiembro_UNIQUE` ON `iglesia`.`miembros` (`codmiembro` ASC);

CREATE UNIQUE INDEX `dpi_UNIQUE` ON `iglesia`.`miembros` (`dpi` ASC);


-- -----------------------------------------------------
-- Table `iglesia`.`actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iglesia`.`actividad` (
  `codactividad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `descripcion` VARCHAR(50) NOT NULL,
  `tipo_actividad` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`codactividad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `iglesia`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iglesia`.`asistencia` (
  `codasistencia` INT NOT NULL AUTO_INCREMENT,
  `codmiembro` INT NULL,
  `codactividad` INT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`codasistencia`),
  CONSTRAINT `codmiembro`
    FOREIGN KEY (`codmiembro`)
    REFERENCES `iglesia`.`miembros` (`codmiembro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codactividad`
    FOREIGN KEY (`codactividad`)
    REFERENCES `iglesia`.`actividad` (`codactividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `codmiembro_idx` ON `iglesia`.`asistencia` (`codmiembro` ASC);

CREATE INDEX `codactividad_idx` ON `iglesia`.`asistencia` (`codactividad` ASC);


-- -----------------------------------------------------
-- Table `iglesia`.`Ingresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iglesia`.`Ingresos` (
  `codingreso` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `costo` FLOAT NULL,
  `costoadicional` FLOAT NULL,
  `codactividad` INT NULL,
  PRIMARY KEY (`codingreso`),
  CONSTRAINT `codactividad`
    FOREIGN KEY (`codactividad`)
    REFERENCES `iglesia`.`actividad` (`codactividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `codingreso_UNIQUE` ON `iglesia`.`Ingresos` (`codingreso` ASC);

CREATE INDEX `codactividad_idx` ON `iglesia`.`Ingresos` (`codactividad` ASC);


-- -----------------------------------------------------
-- Table `iglesia`.`egresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `iglesia`.`egresos` (
  `codegreso` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `costo` FLOAT NULL,
  `codactividad` INT NULL,
  PRIMARY KEY (`codegreso`),
  CONSTRAINT `codactividad`
    FOREIGN KEY (`codactividad`)
    REFERENCES `iglesia`.`actividad` (`codactividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `codegreso_UNIQUE` ON `iglesia`.`egresos` (`codegreso` ASC);

CREATE INDEX `codactividad_idx` ON `iglesia`.`egresos` (`codactividad` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
