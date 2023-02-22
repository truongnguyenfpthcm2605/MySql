-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PS24083_Quanlykho
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PS24083_Quanlykho
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PS24083_Quanlykho` DEFAULT CHARACTER SET utf8 ;
USE `PS24083_Quanlykho` ;

-- -----------------------------------------------------
-- Table `PS24083_Quanlykho`.`loaihang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS24083_Quanlykho`.`loaihang` (
  `maLH` VARCHAR(5) NOT NULL,
  `loai` VARCHAR(45) NULL,
  PRIMARY KEY (`maLH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS24083_Quanlykho`.`mathang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS24083_Quanlykho`.`mathang` (
  `maMH` VARCHAR(5) NOT NULL,
  `tenMH` VARCHAR(45) NULL,
  `quicach` VARCHAR(45) NULL,
  `donvitinh` VARCHAR(45) NULL,
  `dongia` DOUBLE NULL,
  `loaihang_maLH` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`maMH`),
  INDEX `fk_mathang_loaihang_idx` (`loaihang_maLH` ASC) VISIBLE,
  CONSTRAINT `fk_mathang_loaihang`
    FOREIGN KEY (`loaihang_maLH`)
    REFERENCES `PS24083_Quanlykho`.`loaihang` (`maLH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS24083_Quanlykho`.`cuahang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS24083_Quanlykho`.`cuahang` (
  `maCH` VARCHAR(5) NOT NULL,
  `tenCH` VARCHAR(45) NULL,
  `diachi` VARCHAR(255) NULL,
  `sodienthooai` INT(12) NULL,
  `emaill` VARCHAR(45) NULL,
  PRIMARY KEY (`maCH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS24083_Quanlykho`.`phieuxuat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS24083_Quanlykho`.`phieuxuat` (
  `soPhieu` VARCHAR(10) NOT NULL,
  `ngaynhap` DATE NULL,
  `ngayxuat` DATE NULL,
  `nguoilap` VARCHAR(45) NULL,
  `cuahang_maCH` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`soPhieu`),
  INDEX `fk_phieuxuat_cuahang1_idx` (`cuahang_maCH` ASC) VISIBLE,
  CONSTRAINT `fk_phieuxuat_cuahang1`
    FOREIGN KEY (`cuahang_maCH`)
    REFERENCES `PS24083_Quanlykho`.`cuahang` (`maCH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PS24083_Quanlykho`.`chitietphieuxuat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PS24083_Quanlykho`.`chitietphieuxuat` (
  `mathang_maMH` VARCHAR(5) NOT NULL,
  `phieuxuat_soPhieu` VARCHAR(10) NOT NULL,
  `soluong` INT NULL,
  `ghichu` VARCHAR(255) NULL,
  PRIMARY KEY (`mathang_maMH`, `phieuxuat_soPhieu`),
  INDEX `fk_mathang_has_phieuxuat_phieuxuat1_idx` (`phieuxuat_soPhieu` ASC) VISIBLE,
  INDEX `fk_mathang_has_phieuxuat_mathang1_idx` (`mathang_maMH` ASC) VISIBLE,
  UNIQUE INDEX `phieuxuat_soPhieu_UNIQUE` (`phieuxuat_soPhieu` ASC) VISIBLE,
  UNIQUE INDEX `mathang_maMH_UNIQUE` (`mathang_maMH` ASC) VISIBLE,
  CONSTRAINT `fk_mathang_has_phieuxuat_mathang1`
    FOREIGN KEY (`mathang_maMH`)
    REFERENCES `PS24083_Quanlykho`.`mathang` (`maMH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mathang_has_phieuxuat_phieuxuat1`
    FOREIGN KEY (`phieuxuat_soPhieu`)
    REFERENCES `PS24083_Quanlykho`.`phieuxuat` (`soPhieu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
