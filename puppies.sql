-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema puppies
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `puppies` ;

-- -----------------------------------------------------
-- Schema puppies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `puppies` DEFAULT CHARACTER SET utf8mb3 ;
USE `puppies` ;

-- -----------------------------------------------------
-- Table `puppies`.`breed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puppies`.`breed` ;

CREATE TABLE IF NOT EXISTS `puppies`.`breed` (
  `breed_id` INT NOT NULL AUTO_INCREMENT,
  `breed` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`breed_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `puppies`.`kennel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puppies`.`kennel` ;

CREATE TABLE IF NOT EXISTS `puppies`.`kennel` (
  `kennel_id` INT NOT NULL AUTO_INCREMENT,
  `kennel_name` VARCHAR(50) NOT NULL,
  `location` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`kennel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `puppies`.`puppy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puppies`.`puppy` ;

CREATE TABLE IF NOT EXISTS `puppies`.`puppy` (
  `puppy_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `kennel_id` INT NOT NULL,
  `breed_id` INT NOT NULL,
  `date_of_birth` DATE,
  PRIMARY KEY (`puppy_id`),
  INDEX `fk_puppy_kennel1_idx` (`kennel_id` ASC) VISIBLE,
  INDEX `fk_puppy_breed1_idx` (`breed_id` ASC) VISIBLE,
  CONSTRAINT `fk_puppy_breed1`
    FOREIGN KEY (`breed_id`)
    REFERENCES `puppies`.`breed` (`breed_id`),
  CONSTRAINT `fk_puppy_kennel1`
    FOREIGN KEY (`kennel_id`)
    REFERENCES `puppies`.`kennel` (`kennel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `puppies`.`trick`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puppies`.`trick` ;

CREATE TABLE IF NOT EXISTS `puppies`.`trick` (
  `trick_id` INT NOT NULL AUTO_INCREMENT,
  `trick_name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`trick_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `puppies`.`puppy_trick`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `puppies`.`puppy_trick` ;

CREATE TABLE IF NOT EXISTS `puppies`.`puppy_trick` (
  `puppy_trick_id` INT NOT NULL AUTO_INCREMENT,
  `kennel_id` INT NOT NULL,
  `trick_id` INT NOT NULL,
  `puppy_id` INT NOT NULL,
  `skill_level` INT NOT NULL,
  PRIMARY KEY (`puppy_trick_id`),
  INDEX `fk_puppy_has_trick_kennel1_idx` (`kennel_id` ASC) VISIBLE,
  INDEX `fk_puppy_trick_trick1_idx` (`trick_id` ASC) VISIBLE,
  INDEX `fk_puppy_trick_puppy1_idx` (`puppy_id` ASC) VISIBLE,
  CONSTRAINT `fk_puppy_has_trick_kennel1`
    FOREIGN KEY (`kennel_id`)
    REFERENCES `puppies`.`kennel` (`kennel_id`),
  CONSTRAINT `fk_puppy_trick_puppy1`
    FOREIGN KEY (`puppy_id`)
    REFERENCES `puppies`.`puppy` (`puppy_id`),
  CONSTRAINT `fk_puppy_trick_trick1`
    FOREIGN KEY (`trick_id`)
    REFERENCES `puppies`.`trick` (`trick_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `breed` VALUES (1,'Boxer'),(2,'Golden Retriever'),(3,'German Shepherd'),(4,'Labrador Retriever'),(5,'French Bulldog'),(6,'Poodle'),(7,'Border Collie'),(8,'Dachshund'),(9,'Australian Shepherd'),(10,'Shiba Inu'),(11,'Siberian Husky');
INSERT INTO `kennel` VALUES (1,'Hyrule Puppies','Rexburg'),(2,'Kandy Kennel','Ammon'),(3,'Paws & Play','Idaho Falls'),(4,'Happy Tails Academy','Boise'),(5,'Good Boy Training Center','Pocatello'),(6,'Mountain View Kennels','Coeur dAlene');
INSERT INTO `puppy` (puppy_id, name, kennel_id, breed_id, date_of_birth) VALUES
(1,  'Mary Poppins', 2,  1, '2021-04-15'),
(2,  'Buddy',        1,  2, '2022-01-30'),
(3,  'Luna',         3,  3, '2020-06-25'),
(4,  'Max',          2,  4, '2023-07-12'),
(5,  'Charlie',      4,  5, '2021-09-03'),
(6,  'Daisy',        5,  6, '2020-11-20'),
(7,  'Rocky',        1,  7, '2022-05-05'),
(8,  'Milo',         2,  8, '2023-02-17'),
(9,  'Zoey',         3,  9, '2021-12-10'),
(10, 'Bailey',       4,  7, '2022-08-22'),
(11, 'Finn',         5, 10, '2023-10-05'),
(12, 'Cooper',       1,  2, '2022-03-08'),
(13, 'Nala',         2,  3, '2020-04-01'),
(14, 'Winston',      3,  4, '2022-09-14'),
(15, 'Ruby',         4,  5, '2023-01-20'),
(16, 'Jasper',       5,  6, '2021-06-30'),
(17, 'Oakley',       1,  7, '2020-08-25'),
(18, 'Penny',        2,  8, '2022-07-17'),
(19, 'Scout',        3,  9, '2023-03-12'),
(20, 'Maggie',       4, 10, '2021-11-05'),
(21, 'Tucker',       5, 11, '2022-10-28'),
(22, 'Shadow',       1,  2, '2023-05-09'),
(23, 'Mocha',        2,  3, '2021-07-07'),
(24, 'Remy',         3,  4, '2020-10-15'),
(25, 'Lexi',         4,  5, '2022-02-26'),
(26, 'Baxter',       5,  6, '2023-06-18'),
(27, 'Milo',         1,  7, '2021-03-30'),
(28, 'Chloe',        2,  8, '2020-12-22'),
(29, 'Rex',          3,  9, '2022-04-10'),
(30, 'Oliver',       4, 10, '2023-08-05');
INSERT INTO `trick` VALUES (1,'Sit'),(2,'Stay'),(3,'Roll Over'),(4,'Play Dead'),(5,'Fetch'),(6,'Shake Hands'),(7,'Spin'),(8,'High Five'),(9,'Beg'),(10,'Speak');
INSERT INTO `puppy_trick` VALUES (1,2,1,1,5),(2,1,2,2,3),(3,3,3,3,4),(4,2,4,4,6),(5,4,5,5,7),(6,5,6,6,2),(7,1,7,7,8),(8,2,8,8,3),(9,3,9,9,5),(10,4,10,10,4),(11,5,1,11,7),(12,1,2,12,6),(13,2,3,13,8),(14,3,4,14,3),(16,2,1,1,5),(17,1,2,2,3),(18,3,3,3,4),(19,2,4,4,6),(20,4,5,5,7),(21,5,6,6,2),(22,1,7,7,8),(23,2,8,8,3),(24,3,9,9,5),(25,4,10,10,4),(26,5,1,11,7),(27,1,2,12,6),(28,2,3,13,8),(29,3,4,14,3),(30,4,5,1,9),(32,5,7,16,4),(33,1,1,17,8),(34,2,2,18,5),(35,3,3,19,6),(36,4,4,20,7),(37,5,5,21,4),(38,1,6,22,3),(39,2,7,23,8),(40,3,8,24,9),(41,4,9,25,2);

