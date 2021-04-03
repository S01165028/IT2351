-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema assignment_5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assignment_5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignment_5` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema ryanhalter_guitar_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ryanhalter_guitar_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ryanhalter_guitar_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `assignment_5` ;

-- -----------------------------------------------------
-- Table `assignment_5`.`classes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment_5`.`classes` ;

CREATE TABLE IF NOT EXISTS `assignment_5`.`classes` (
  `class_id` INT NOT NULL AUTO_INCREMENT,
  `class_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`class_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment_5`.`majors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment_5`.`majors` ;

CREATE TABLE IF NOT EXISTS `assignment_5`.`majors` (
  `major_id` INT NOT NULL AUTO_INCREMENT,
  `major_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`major_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment_5`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment_5`.`students` ;

CREATE TABLE IF NOT EXISTS `assignment_5`.`students` (
  `student_id` VARCHAR(5) NOT NULL,
  `student_first_name` VARCHAR(45) NOT NULL,
  `student_last_name` VARCHAR(90) NOT NULL,
  `student_email` VARCHAR(90) NOT NULL,
  `student_address` VARCHAR(90) NOT NULL,
  `major_id` INT NOT NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_students_majors_idx` (`major_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_majors`
    FOREIGN KEY (`major_id`)
    REFERENCES `assignment_5`.`majors` (`major_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignment_5`.`students_classes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment_5`.`students_classes` ;

CREATE TABLE IF NOT EXISTS `assignment_5`.`students_classes` (
  `student_id` VARCHAR(5) NOT NULL,
  `class_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `class_id`),
  INDEX `fk_students_has_classes_classes1_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_has_classes_classes1`
    FOREIGN KEY (`class_id`)
    REFERENCES `assignment_5`.`classes` (`class_id`),
  CONSTRAINT `fk_students_has_classes_students1`
    FOREIGN KEY (`student_id`)
    REFERENCES `assignment_5`.`students` (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `ryanhalter_guitar_shop` ;

-- -----------------------------------------------------
-- Table `ryanhalter_guitar_shop`.`customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ryanhalter_guitar_shop`.`customers` ;

CREATE TABLE IF NOT EXISTS `ryanhalter_guitar_shop`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `email_address` VARCHAR(255) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `first_name` VARCHAR(60) NOT NULL,
  `last_name` VARCHAR(60) NOT NULL,
  `shipping_address_id` INT NULL DEFAULT NULL,
  `billing_address_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_address` (`email_address` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ryanhalter_guitar_shop`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ryanhalter_guitar_shop`.`addresses` ;

CREATE TABLE IF NOT EXISTS `ryanhalter_guitar_shop`.`addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `line1` VARCHAR(60) NOT NULL,
  `line2` VARCHAR(60) NULL DEFAULT NULL,
  `city` VARCHAR(40) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  `phone` VARCHAR(12) NOT NULL,
  `disabled` TINYINT(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  INDEX `addresses_fk_customers` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `addresses_fk_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ryanhalter_guitar_shop`.`customers` (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ryanhalter_guitar_shop`.`administrators`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ryanhalter_guitar_shop`.`administrators` ;

CREATE TABLE IF NOT EXISTS `ryanhalter_guitar_shop`.`administrators` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `email_address` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`admin_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ryanhalter_guitar_shop`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ryanhalter_guitar_shop`.`categories` ;

CREATE TABLE IF NOT EXISTS `ryanhalter_guitar_shop`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ryanhalter_guitar_shop`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ryanhalter_guitar_shop`.`orders` ;

CREATE TABLE IF NOT EXISTS `ryanhalter_guitar_shop`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATETIME NOT NULL,
  `ship_amount` DECIMAL(10,2) NOT NULL,
  `tax_amount` DECIMAL(10,2) NOT NULL,
  `ship_date` DATETIME NULL DEFAULT NULL,
  `ship_address_id` INT NOT NULL,
  `card_type` VARCHAR(50) NOT NULL,
  `card_number` CHAR(16) NOT NULL,
  `card_expires` CHAR(7) NOT NULL,
  `billing_address_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `orders_fk_customers` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `orders_fk_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ryanhalter_guitar_shop`.`customers` (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ryanhalter_guitar_shop`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ryanhalter_guitar_shop`.`products` ;

CREATE TABLE IF NOT EXISTS `ryanhalter_guitar_shop`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `product_code` VARCHAR(10) NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `list_price` DECIMAL(10,2) NOT NULL,
  `discount_percent` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `date_added` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_code` (`product_code` ASC) VISIBLE,
  INDEX `products_fk_categories` (`category_id` ASC) VISIBLE,
  CONSTRAINT `products_fk_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `ryanhalter_guitar_shop`.`categories` (`category_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ryanhalter_guitar_shop`.`order_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ryanhalter_guitar_shop`.`order_items` ;

CREATE TABLE IF NOT EXISTS `ryanhalter_guitar_shop`.`order_items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `item_price` DECIMAL(10,2) NOT NULL,
  `discount_amount` DECIMAL(10,2) NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `items_fk_orders` (`order_id` ASC) VISIBLE,
  INDEX `items_fk_products` (`product_id` ASC) VISIBLE,
  CONSTRAINT `items_fk_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `ryanhalter_guitar_shop`.`orders` (`order_id`),
  CONSTRAINT `items_fk_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `ryanhalter_guitar_shop`.`products` (`product_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
