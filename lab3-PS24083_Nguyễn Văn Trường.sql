-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`VanPhong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VanPhong` (
  `maVP` VARCHAR(5) NOT NULL,
  `diaDiem` VARCHAR(255) NULL,
  PRIMARY KEY (`maVP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NhanVien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NhanVien` (
  `maNV` VARCHAR(5) NOT NULL,
  `tenNV` VARCHAR(45) NULL,
  `VanPhong_maVP` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`maNV`, `VanPhong_maVP`),
  INDEX `fk_NhanVien_VanPhong_idx` (`VanPhong_maVP` ASC) VISIBLE,
  CONSTRAINT `fk_NhanVien_VanPhong`
    FOREIGN KEY (`VanPhong_maVP`)
    REFERENCES `mydb`.`VanPhong` (`maVP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NhanThan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NhanThan` (
  `tenNT` VARCHAR(45) NULL,
  `ngaySinh` DATE NULL,
  `NhanVien_maNV` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`NhanVien_maNV`),
  CONSTRAINT `fk_NhanThan_NhanVien1`
    FOREIGN KEY (`NhanVien_maNV`)
    REFERENCES `mydb`.`NhanVien` (`maNV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ChuSoHuu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ChuSoHuu` (
  `maCSH` VARCHAR(5) NOT NULL,
  `tenCSH` VARCHAR(45) NULL,
  `diaChiCSH` VARCHAR(255) NULL,
  `soDienThoai` INT(12) NULL,
  PRIMARY KEY (`maCSH`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BDS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BDS` (
  `maBDS` VARCHAR(5) NOT NULL,
  `diaChiBDS` VARCHAR(255) NULL,
  `VanPhong_maVP` VARCHAR(5) NOT NULL,
  `ChuSoHuu_maCSH` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`maBDS`, `VanPhong_maVP`, `ChuSoHuu_maCSH`),
  INDEX `fk_BDS_VanPhong1_idx` (`VanPhong_maVP` ASC) VISIBLE,
  INDEX `fk_BDS_ChuSoHuu1_idx` (`ChuSoHuu_maCSH` ASC) VISIBLE,
  CONSTRAINT `fk_BDS_VanPhong1`
    FOREIGN KEY (`VanPhong_maVP`)
    REFERENCES `mydb`.`VanPhong` (`maVP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BDS_ChuSoHuu1`
    FOREIGN KEY (`ChuSoHuu_maCSH`)
    REFERENCES `mydb`.`ChuSoHuu` (`maCSH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TruongPhong`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TruongPhong` (
  `VanPhong_maVP` VARCHAR(5) NOT NULL,
  `NhanVien_maNV` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`VanPhong_maVP`, `NhanVien_maNV`),
  INDEX `fk_TruongPhong_NhanVien1_idx` (`NhanVien_maNV` ASC) VISIBLE,
  UNIQUE INDEX `VanPhong_maVP_UNIQUE` (`VanPhong_maVP` ASC) VISIBLE,
  UNIQUE INDEX `NhanVien_maNV_UNIQUE` (`NhanVien_maNV` ASC) VISIBLE,
  CONSTRAINT `fk_TruongPhong_VanPhong1`
    FOREIGN KEY (`VanPhong_maVP`)
    REFERENCES `mydb`.`VanPhong` (`maVP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TruongPhong_NhanVien1`
    FOREIGN KEY (`NhanVien_maNV`)
    REFERENCES `mydb`.`NhanVien` (`maNV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
