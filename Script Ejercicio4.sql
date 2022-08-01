-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ejercicio3
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ejercicio3` ;

-- -----------------------------------------------------
-- Schema ejercicio3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ejercicio3` DEFAULT CHARACTER SET utf8 ;
USE `ejercicio3` ;

-- -----------------------------------------------------
-- Table `ejercicio3`.`REGION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`REGION` (
  `Nombre_region` VARCHAR(100) NOT NULL,
  `Nmbre` VARCHAR(45) NULL,
  `REGIONcol` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre_region`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`Provincia` (
  `codigo` INT NOT NULL,
  `Provinciacol` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`Empleado` (
  `Nombre_localidad` INT NOT NULL,
  `LOCALIDADcol` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre_localidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`LOCALIDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`LOCALIDAD` (
  `ID_empleado` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Telefono` VARCHAR(9) NULL,
  `Salario` INT NULL,
  PRIMARY KEY (`ID_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`ALUMNO` (
  `Nombre_alumno` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre_alumno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`MODULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`MODULO` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`NOTAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`NOTAS` (
  `idNOTAS` INT NOT NULL,
  `Nombre_Alum` VARCHAR(45) NULL,
  `ALUMNO_Nombre_alumno` INT NOT NULL,
  PRIMARY KEY (`idNOTAS`, `ALUMNO_Nombre_alumno`),
  CONSTRAINT `fk_NOTAS_ALUMNO1`
    FOREIGN KEY (`ALUMNO_Nombre_alumno`)
    REFERENCES `ejercicio3`.`ALUMNO` (`Nombre_alumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`UF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`UF` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `MODULO_Codigo` INT NOT NULL,
  `NOTAS_idNOTAS` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  CONSTRAINT `fk_UF_MODULO`
    FOREIGN KEY (`MODULO_Codigo`)
    REFERENCES `ejercicio3`.`MODULO` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UF_NOTAS1`
    FOREIGN KEY (`NOTAS_idNOTAS`)
    REFERENCES `ejercicio3`.`NOTAS` (`idNOTAS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejercicio3`.`MODULO_has_ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejercicio3`.`MODULO_has_ALUMNO` (
  `MODULO_Codigo` INT NOT NULL,
  `ALUMNO_Nombre_alumno` INT NOT NULL,
  PRIMARY KEY (`MODULO_Codigo`, `ALUMNO_Nombre_alumno`),
  CONSTRAINT `fk_MODULO_has_ALUMNO_MODULO1`
    FOREIGN KEY (`MODULO_Codigo`)
    REFERENCES `ejercicio3`.`MODULO` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MODULO_has_ALUMNO_ALUMNO1`
    FOREIGN KEY (`ALUMNO_Nombre_alumno`)
    REFERENCES `ejercicio3`.`ALUMNO` (`Nombre_alumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `ejercicio3`.`REGION`
-- -----------------------------------------------------
START TRANSACTION;
USE `ejercicio3`;
INSERT INTO `ejercicio3`.`REGION` (`Nombre_region`, `Nmbre`, `REGIONcol`) VALUES ('catalunya', 'barcelona', 'barcelona');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ejercicio3`.`MODULO`
-- -----------------------------------------------------
START TRANSACTION;
USE `ejercicio3`;
INSERT INTO `ejercicio3`.`MODULO` (`Codigo`, `Nombre`) VALUES (m1, 'POO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ejercicio3`.`UF`
-- -----------------------------------------------------
START TRANSACTION;
USE `ejercicio3`;
INSERT INTO `ejercicio3`.`UF` (`Codigo`, `Nombre`, `MODULO_Codigo`, `NOTAS_idNOTAS`) VALUES (Uf1, 'BD', m1, DEFAULT);
INSERT INTO `ejercicio3`.`UF` (`Codigo`, `Nombre`, `MODULO_Codigo`, `NOTAS_idNOTAS`) VALUES (uf2, 'ytrdr', m1, DEFAULT);

COMMIT;

