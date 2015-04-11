SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `eshop` ;
CREATE SCHEMA IF NOT EXISTS `eshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `eshop` ;

-- -----------------------------------------------------
-- Table `eshop`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`customer` ;

CREATE  TABLE IF NOT EXISTS `eshop`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `phone` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NOT NULL ,
  `city_region` VARCHAR(2) NOT NULL ,
  `cc_number` VARCHAR(19) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'Maintains customer details.';


-- -----------------------------------------------------
-- Table `eshop`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`category` ;

CREATE  TABLE IF NOT EXISTS `eshop`.`category` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'Maintains category details.';


-- -----------------------------------------------------
-- Table `eshop`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`customer_order` ;

CREATE  TABLE IF NOT EXISTS `eshop`.`customer_order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `amount` DECIMAL(6,2) NOT NULL ,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `confirmation_number` INT UNSIGNED NOT NULL ,
  `status` VARCHAR(45) NOT NULL ,
  `customer_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_customer_order_customer1_idx` (`customer_id` ASC) ,
  CONSTRAINT `fk_customer_order_customer1`
    FOREIGN KEY (`customer_id` )
    REFERENCES `eshop`.`customer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Maintains order details.';


-- -----------------------------------------------------
-- Table `eshop`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`product` ;

CREATE  TABLE IF NOT EXISTS `eshop`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `price` DECIMAL(5,2) NOT NULL ,
  `description` TINYTEXT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `category_id` TINYINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_product_category_idx` (`category_id` ASC) ,
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id` )
    REFERENCES `eshop`.`category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Maintains product details.';


-- -----------------------------------------------------
-- Table `eshop`.`ordered_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshop`.`ordered_product` ;

CREATE  TABLE IF NOT EXISTS `eshop`.`ordered_product` (
  `customer_order_id` INT UNSIGNED NOT NULL ,
  `product_id` INT UNSIGNED NOT NULL ,
  `quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`customer_order_id`, `product_id`) ,
  INDEX `fk_customer_order_has_product_product1_idx` (`product_id` ASC) ,
  INDEX `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id` ASC) ,
  CONSTRAINT `fk_ordered_product_customer_order`
    FOREIGN KEY (`customer_order_id` )
    REFERENCES `eshop`.`customer_order` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product`
    FOREIGN KEY (`product_id` )
    REFERENCES `eshop`.`product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `eshop` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
