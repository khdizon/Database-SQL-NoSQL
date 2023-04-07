-- MSDE631 SQL Project
-- Dr. Mike Bush
-- USER: Ken Dizon
-- V1 Date: 27th March 2023
-- Infomration: This file contains my SQL Script for developing an Inventory (sport medicine) database management system.

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SM_DBMS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SM_DBMS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SM_DBMS` DEFAULT CHARACTER SET utf8 ;
USE `SM_DBMS` ;

-- -----------------------------------------------------
-- Table `SM_DBMS`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_DBMS`.`Product` (
  `Product_id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `Price` FLOAT NULL,
  PRIMARY KEY (`Product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_DBMS`.`Clinic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_DBMS`.`Clinic` (
  `Clinic_id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zip` INT NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`Clinic_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_DBMS`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_DBMS`.`Customer` (
  `Customer_id` INT NOT NULL,
  `Start_date` DATE NULL,
  `First_name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Clinic_id` INT NULL,
  PRIMARY KEY (`Customer_id`),
  INDEX `Clinic_id_idx` (`Clinic_id` ASC) VISIBLE,
  CONSTRAINT `Clinic_id`
    FOREIGN KEY (`Clinic_id`)
    REFERENCES `SM_DBMS`.`Clinic` (`Clinic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_DBMS`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_DBMS`.`Orders` (
  `Order_id` INT NOT NULL,
  `Order_date` DATE NULL,
  `Customer_id` INT NULL,
  PRIMARY KEY (`Order_id`),
  INDEX `Customer_id_idx` (`Customer_id` ASC) VISIBLE,
  CONSTRAINT `Customer_id`
    FOREIGN KEY (`Customer_id`)
    REFERENCES `SM_DBMS`.`Customer` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_DBMS`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_DBMS`.`OrderDetails` (
  `OrderDetials_id` INT NOT NULL,
  `Product_id` INT NULL,
  `Order_id` INT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderDetials_id`),
  INDEX `Product_id_idx` (`Product_id` ASC) VISIBLE,
  INDEX `Order_id_idx` (`Order_id` ASC) VISIBLE,
  CONSTRAINT `Product_id`
    FOREIGN KEY (`Product_id`)
    REFERENCES `SM_DBMS`.`Product` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Order_id`
    FOREIGN KEY (`Order_id`)
    REFERENCES `SM_DBMS`.`Orders` (`Order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- Execute three INSERT commands to insert tuples into one of your relations. 
-- Show the response of MySQL and the relation that results when you issue a SELECT * command.

INSERT INTO Clinic (Clinic_id, Name, Address, City, State, Zip, Phone)
VALUES (1, 'Ruby Valley Medical Center', '19 Patmigan', 'Creede', 'Colorado', '81130', '(719) 658-2839');

INSERT INTO Clinic (Clinic_id, Name, Address, City, State, Zip, Phone)
VALUES (2, 'Wellness Hospital Center', '1890 Valley View Dr', 'Woodland Park', 'Colorado', ' 80863', '(970) 833-3899');

INSERT INTO Clinic (Clinic_id, Name, Address, City, State, Zip, Phone)
VALUES (3, 'Tulip Medical Center', '315 Lookout View Dr', 'Golden', 'Colorado', '80401', '(303) 278-9981');

# Test
SELECT * FROM Clinic;

-- Delete Data from a Table
DELETE FROM Clinic
WHERE Clinic_id = 1;
DELETE FROM Clinic
WHERE Clinic_id = 2;
DELETE FROM Clinic
WHERE Clinic_id = 3;


SET GLOBAL local_infile = true;
-- Input data from a text file into created tables
LOAD DATA LOCAL infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Generated_Data/clinic_data.txt' 
INTO TABLE Clinic
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Generated_Data/customer_data.txt' 
INTO TABLE Customer
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';
SELECT * FROM Customer LIMIT 30;

LOAD DATA LOCAL infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Generated_Data/orderdetails_data.txt' 
INTO TABLE OrderDetails
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Generated_Data/orders_data.txt' 
INTO TABLE Orders
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Generated_Data/product_data.txt' 
INTO TABLE Product
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';


