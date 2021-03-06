-- MySQL Script generated by MySQL Workbench
-- qua 29 nov 2017 22:30:40 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema RobotPlant
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RobotPlant
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RobotPlant` DEFAULT CHARACTER SET utf8 ;
USE `RobotPlant` ;

-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_plantacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_plantacao` (
  `id_plantacao` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_plantacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_planta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_planta` (
  `id_Planta` INT NOT NULL AUTO_INCREMENT,
  `tipo_amostra` VARCHAR(45) NOT NULL,
  `dt_plantacao` DATETIME NOT NULL,
  `plantacao_id_plantacao` INT NOT NULL,
  PRIMARY KEY (`id_Planta`),
  INDEX `fk_tb_Planta_tb_plantacao_idx` (`plantacao_id_plantacao` ASC),
  CONSTRAINT `fk_tb_Planta_tb_plantacao`
    FOREIGN KEY (`plantacao_id_plantacao`)
    REFERENCES `RobotPlant`.`tb_plantacao` (`id_plantacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_temperatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_temperatura` (
  `id_temperatura` INT NOT NULL AUTO_INCREMENT,
  `temperatura` DOUBLE NOT NULL,
  `hora_amostra` DATETIME NOT NULL,
  PRIMARY KEY (`id_temperatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_umidade_solo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_umidade_solo` (
  `id_umidade_solo` INT NOT NULL AUTO_INCREMENT,
  `umidade_solo` DOUBLE NOT NULL,
  `hora_amostra` DATETIME NOT NULL,
  PRIMARY KEY (`id_umidade_solo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_umidade_ar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_umidade_ar` (
  `id_umidade_ar` INT NOT NULL AUTO_INCREMENT,
  `umidade_ar` DOUBLE NOT NULL,
  `hora_amostra` DATETIME NOT NULL,
  PRIMARY KEY (`id_umidade_ar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`media_dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`media_dia` (
  `idmedia_dia` INT NOT NULL,
  PRIMARY KEY (`idmedia_dia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_ativacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_ativacao` (
  `id_ativacao` INT NOT NULL,
  `tempo_ativacao` DOUBLE NOT NULL,
  `hora_amostra` DATETIME NOT NULL,
  PRIMARY KEY (`id_ativacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_consumo_diario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_consumo_diario` (
  `id_consumo_diario` INT NOT NULL AUTO_INCREMENT,
  `qt_agua` DOUBLE NOT NULL,
  `qt_energia` DOUBLE NOT NULL,
  `qt_luminosidade` DOUBLE NOT NULL,
  PRIMARY KEY (`id_consumo_diario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_energia_armazenada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_energia_armazenada` (
  `id_energia_armazenada` INT NOT NULL AUTO_INCREMENT,
  `qt_energia` DOUBLE NOT NULL,
  PRIMARY KEY (`id_energia_armazenada`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_health`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_health` (
  `id_health` INT NOT NULL,
  PRIMARY KEY (`id_health`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_planta_temperatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_planta_temperatura` (
  `temperatura_id_temperatura` INT NOT NULL,
  `planta_id_planta` INT NOT NULL,
  PRIMARY KEY (`temperatura_id_temperatura`, `planta_id_planta`),
  INDEX `fk_tb_temperatura_has_tb_Planta_tb_Planta1_idx` (`planta_id_planta` ASC),
  INDEX `fk_tb_temperatura_has_tb_Planta_tb_temperatura1_idx` (`temperatura_id_temperatura` ASC),
  CONSTRAINT `fk_tb_temperatura_has_tb_Planta_tb_temperatura1`
    FOREIGN KEY (`temperatura_id_temperatura`)
    REFERENCES `RobotPlant`.`tb_temperatura` (`id_temperatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_temperatura_has_tb_Planta_tb_Planta1`
    FOREIGN KEY (`planta_id_planta`)
    REFERENCES `RobotPlant`.`tb_planta` (`id_Planta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_planta_umidadeSolo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_planta_umidadeSolo` (
  `umidade_solo_id_umidade_solo` INT NOT NULL,
  `planta_id_planta` INT NOT NULL,
  PRIMARY KEY (`umidade_solo_id_umidade_solo`, `planta_id_planta`),
  INDEX `fk_tb_umidade_solo_has_tb_Planta_tb_Planta1_idx` (`planta_id_planta` ASC),
  INDEX `fk_tb_umidade_solo_has_tb_Planta_tb_umidade_solo1_idx` (`umidade_solo_id_umidade_solo` ASC),
  CONSTRAINT `fk_tb_umidade_solo_has_tb_Planta_tb_umidade_solo1`
    FOREIGN KEY (`umidade_solo_id_umidade_solo`)
    REFERENCES `RobotPlant`.`tb_umidade_solo` (`id_umidade_solo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_umidade_solo_has_tb_Planta_tb_Planta1`
    FOREIGN KEY (`planta_id_planta`)
    REFERENCES `RobotPlant`.`tb_planta` (`id_Planta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_planta_umidadeAr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_planta_umidadeAr` (
  `umidade_ar_id_umidade_ar` INT NOT NULL,
  `planta_id_planta` INT NOT NULL,
  PRIMARY KEY (`umidade_ar_id_umidade_ar`, `planta_id_planta`),
  INDEX `fk_tb_umidade_ar_has_tb_Planta_tb_Planta1_idx` (`planta_id_planta` ASC),
  INDEX `fk_tb_umidade_ar_has_tb_Planta_tb_umidade_ar1_idx` (`umidade_ar_id_umidade_ar` ASC),
  CONSTRAINT `fk_tb_umidade_ar_has_tb_Planta_tb_umidade_ar1`
    FOREIGN KEY (`umidade_ar_id_umidade_ar`)
    REFERENCES `RobotPlant`.`tb_umidade_ar` (`id_umidade_ar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_umidade_ar_has_tb_Planta_tb_Planta1`
    FOREIGN KEY (`planta_id_planta`)
    REFERENCES `RobotPlant`.`tb_planta` (`id_Planta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_planta_ativacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_planta_ativacao` (
  `tb_ativacao_idativacao` INT NOT NULL,
  `tb_planta_id_planta` INT NOT NULL,
  PRIMARY KEY (`tb_ativacao_idativacao`, `tb_planta_id_planta`),
  INDEX `fk_tb_ativacao_has_tb_Planta_tb_Planta1_idx` (`tb_planta_id_planta` ASC),
  INDEX `fk_tb_ativacao_has_tb_Planta_tb_ativacao1_idx` (`tb_ativacao_idativacao` ASC),
  CONSTRAINT `fk_tb_ativacao_has_tb_Planta_tb_ativacao1`
    FOREIGN KEY (`tb_ativacao_idativacao`)
    REFERENCES `RobotPlant`.`tb_ativacao` (`id_ativacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_ativacao_has_tb_Planta_tb_Planta1`
    FOREIGN KEY (`tb_planta_id_planta`)
    REFERENCES `RobotPlant`.`tb_planta` (`id_Planta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_consumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_consumo` (
  `id_consumo` INT NOT NULL,
  `eficiencia_bomba` DOUBLE NULL,
  PRIMARY KEY (`id_consumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_configuracao_arduino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_configuracao_arduino` (
  `id_configuracao` INT NOT NULL,
  `temperatura_min` DOUBLE NULL,
  `umidade_ar_min` DOUBLE NULL,
  `umidade_solo_min` DOUBLE NULL,
  PRIMARY KEY (`id_configuracao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_comandos_arduino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_comandos_arduino` (
  `id_comandos` INT NOT NULL,
  `comando` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_comandos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_colheita_plantacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_colheita_plantacao` (
  `id_eficiencia` INT NOT NULL,
  `qtd_frutos` INT NULL,
  `data_colheita` DATETIME NULL,
  `tb_plantacao_id_plantacao` INT NOT NULL,
  PRIMARY KEY (`id_eficiencia`),
  INDEX `fk_tb_colheita_plantacao_tb_plantacao1_idx` (`tb_plantacao_id_plantacao` ASC),
  CONSTRAINT `fk_tb_colheita_plantacao_tb_plantacao1`
    FOREIGN KEY (`tb_plantacao_id_plantacao`)
    REFERENCES `RobotPlant`.`tb_plantacao` (`id_plantacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_gastos_plantacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_gastos_plantacao` (
  `gastos_plantacao_id_gastos_plantacao` INT NOT NULL,
  `plantacao_id_plantacao` INT NOT NULL,
  PRIMARY KEY (`gastos_plantacao_id_gastos_plantacao`, `plantacao_id_plantacao`),
  INDEX `fk_tb_gastos_plantacao_has_tb_plantacao_tb_plantacao1_idx` (`plantacao_id_plantacao` ASC),
  INDEX `fk_tb_gastos_plantacao_has_tb_plantacao_tb_gastos_plantacao_idx` (`gastos_plantacao_id_gastos_plantacao` ASC),
  CONSTRAINT `fk_tb_gastos_plantacao_has_tb_plantacao_tb_gastos_plantacao1`
    FOREIGN KEY (`gastos_plantacao_id_gastos_plantacao`)
    REFERENCES `RobotPlant`.`tb_gastos_plantacao` (`id_gastos_plantacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_gastos_plantacao_has_tb_plantacao_tb_plantacao1`
    FOREIGN KEY (`plantacao_id_plantacao`)
    REFERENCES `RobotPlant`.`tb_plantacao` (`id_plantacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RobotPlant`.`tb_receita_plantacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RobotPlant`.`tb_receita_plantacao` (
  `receita_plantacao_id_receita_plantacao` INT NOT NULL,
  `plantacao_id_plantacao` INT NOT NULL,
  PRIMARY KEY (`receita_plantacao_id_receita_plantacao`, `plantacao_id_plantacao`),
  INDEX `fk_tb_receita_plantacao_has_tb_plantacao_tb_plantacao1_idx` (`plantacao_id_plantacao` ASC),
  INDEX `fk_tb_receita_plantacao_has_tb_plantacao_tb_receita_plantac_idx` (`receita_plantacao_id_receita_plantacao` ASC),
  CONSTRAINT `fk_tb_receita_plantacao_has_tb_plantacao_tb_receita_plantacao1`
    FOREIGN KEY (`receita_plantacao_id_receita_plantacao`)
    REFERENCES `RobotPlant`.`tb_receita_plantacao` (`id_receita_plantacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_receita_plantacao_has_tb_plantacao_tb_plantacao1`
    FOREIGN KEY (`plantacao_id_plantacao`)
    REFERENCES `RobotPlant`.`tb_plantacao` (`id_plantacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
