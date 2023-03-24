-- MySQL Script generated by MySQL Workbench
-- ven. 24 mars 2023 15:15:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Utilisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Utilisateur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Utilisateur` (
  `IdUtilisateur` INT NOT NULL AUTO_INCREMENT,
  `Mdp` VARCHAR(45) NOT NULL,
  `Login` VARCHAR(45) NOT NULL,
  `Pseudo` VARCHAR(45) NOT NULL,
  `Droit` INT NOT NULL,
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC) VISIBLE,
  PRIMARY KEY (`IdUtilisateur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recette`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Recette` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Recette` (
  `IdRecette` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `IdCréateur` INT NOT NULL,
  `Notemoy` DECIMAL NULL,
  `Nb_personne` INT NOT NULL,
  `Temps_prep` INT NOT NULL,
  `Temps_cuis` INT NULL,
  `Description` VARCHAR(180) NOT NULL,
  `Instruction` TEXT NOT NULL,
  PRIMARY KEY (`IdRecette`, `IdCréateur`),
  INDEX `Créateur_idx` (`IdCréateur` ASC) VISIBLE,
  CONSTRAINT `Créateur`
    FOREIGN KEY (`IdCréateur`)
    REFERENCES `mydb`.`Utilisateur` (`IdUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Commentaire`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Commentaire` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Commentaire` (
  `IdCommentaire` INT NOT NULL AUTO_INCREMENT,
  `Commentaire` VARCHAR(180) NULL,
  `Note` INT NOT NULL,
  `IdAuteur` INT NOT NULL,
  PRIMARY KEY (`IdCommentaire`, `IdAuteur`),
  INDEX `Auteur_idx` (`IdAuteur` ASC) VISIBLE,
  CONSTRAINT `Auteur`
    FOREIGN KEY (`IdAuteur`)
    REFERENCES `mydb`.`Utilisateur` (`IdUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ingrédient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ingrédient` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ingrédient` (
  `IdIngrédient` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Quantité` FLOAT NOT NULL,
  `Unité` VARCHAR(45) NOT NULL,
  `Prix` DECIMAL NOT NULL,
  `Recette` INT NOT NULL,
  PRIMARY KEY (`IdIngrédient`, `Recette`),
  INDEX `Recette_idx` (`Recette` ASC) VISIBLE,
  CONSTRAINT `IdRecette`
    FOREIGN KEY (`Recette`)
    REFERENCES `mydb`.`Recette` (`IdRecette`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
