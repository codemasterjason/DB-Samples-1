-- MySQL Script generated by MySQL Workbench
-- Sun May  8 20:26:28 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema commerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `commerce` ;

-- -----------------------------------------------------
-- Schema commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `commerce` DEFAULT CHARACTER SET utf8 ;
USE `commerce` ;

-- -----------------------------------------------------
-- Table `commerce`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerce`.`customer` ;

CREATE TABLE IF NOT EXISTS `commerce`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_first` VARCHAR(255) NOT NULL,
  `name_last` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commerce`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerce`.`product` ;

CREATE TABLE IF NOT EXISTS `commerce`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` JSON NOT NULL,
  `price` DECIMAL UNSIGNED NOT NULL COMMENT '정가.',
  `hide` CHAR(1) NOT NULL DEFAULT 'N',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commerce`.`store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerce`.`store` ;

CREATE TABLE IF NOT EXISTS `commerce`.`store` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  `discount` DECIMAL UNSIGNED NOT NULL COMMENT '할인가',
  `hide` CHAR(1) NOT NULL DEFAULT 'N',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_store_product1_idx` (`product_id` ASC),
  CONSTRAINT `fk_store_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `commerce`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commerce`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerce`.`order` ;

CREATE TABLE IF NOT EXISTS `commerce`.`order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `store_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  `cancel` CHAR(1) NOT NULL DEFAULT 'N',
  `hide` CHAR(1) NOT NULL DEFAULT 'N',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_order_customer_idx` (`customer_id` ASC),
  INDEX `fk_order_store1_idx` (`store_id` ASC),
  CONSTRAINT `fk_order_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `commerce`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `commerce`.`store` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `commerce`.`notice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerce`.`notice` ;

CREATE TABLE IF NOT EXISTS `commerce`.`notice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `body` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO manager;
 DROP USER manager;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'manager' IDENTIFIED BY 'sample.manager';

GRANT ALL ON `commerce`.* TO 'manager';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO developer;
 DROP USER developer;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'developer' IDENTIFIED BY 'sample.dev';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE, ALTER, CREATE, INDEX, DROP ON TABLE `commerce`.* TO 'developer';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `commerce`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `commerce`;
INSERT INTO `commerce`.`customer` (`id`, `name_first`, `name_last`, `email`, `password`, `created_at`, `updated_at`) VALUES (1, 'Jason', 'Park', 'jasonpublic@outlook.com', '1234', DEFAULT, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `commerce`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `commerce`;
INSERT INTO `commerce`.`product` (`id`, `name`, `description`, `price`, `hide`, `created_at`, `updated_at`) VALUES (1, 'Table', '{\"string\":\"Hello World\"}', 30000, DEFAULT, DEFAULT, DEFAULT);

COMMIT;

