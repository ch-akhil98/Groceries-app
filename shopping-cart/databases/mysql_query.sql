CREATE SCHEMA IF NOT EXISTS `shopping-cart` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `shopping-cart` ;

-- -----------------------------------------------------
-- Table `shopping-cart`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping-cart`.`product` ;

CREATE TABLE IF NOT EXISTS `shopping-cart`.`product` (
  `pid` VARCHAR(45) NOT NULL,
  `pname` VARCHAR(100) NULL DEFAULT NULL,
  `ptype` VARCHAR(20) NULL DEFAULT NULL,
  `pinfo` VARCHAR(350) NULL DEFAULT NULL,
  `pprice` DECIMAL(12,2) NULL DEFAULT NULL,
  `pquantity` INT NULL DEFAULT NULL,
  `image` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shopping-cart`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping-cart`.`orders` ;

CREATE TABLE IF NOT EXISTS `shopping-cart`.`orders` (
  `orderid` VARCHAR(45) NOT NULL,
  `prodid` VARCHAR(45) NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `shipped` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`orderid`, `prodid`),
  INDEX `productid_idx` (`prodid` ASC) VISIBLE,
  CONSTRAINT `productid`
    FOREIGN KEY (`prodid`)
    REFERENCES `shopping-cart`.`product` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shopping-cart`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping-cart`.`user` ;

CREATE TABLE IF NOT EXISTS `shopping-cart`.`user` (
  `email` VARCHAR(60) NOT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `mobile` BIGINT NULL DEFAULT NULL,
  `address` VARCHAR(250) NULL DEFAULT NULL,
  `pincode` INT NULL DEFAULT NULL,
  `password` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shopping-cart`.`transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping-cart`.`transactions` ;

CREATE TABLE IF NOT EXISTS `shopping-cart`.`transactions` (
  `transid` VARCHAR(45) NOT NULL,
  `username` VARCHAR(60) NULL DEFAULT NULL,
  `time` DATETIME NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`transid`),
  INDEX `truserid_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `truserid`
    FOREIGN KEY (`username`)
    REFERENCES `shopping-cart`.`user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transorderid`
    FOREIGN KEY (`transid`)
    REFERENCES `shopping-cart`.`orders` (`orderid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shopping-cart`.`user_demand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping-cart`.`user_demand` ;

CREATE TABLE IF NOT EXISTS `shopping-cart`.`user_demand` (
  `username` VARCHAR(60) NOT NULL,
  `prodid` VARCHAR(45) NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`username`, `prodid`),
  INDEX `prodid_idx` (`prodid` ASC) VISIBLE,
  CONSTRAINT `userdemailemail`
    FOREIGN KEY (`username`)
    REFERENCES `shopping-cart`.`user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prodid`
    FOREIGN KEY (`prodid`)
    REFERENCES `shopping-cart`.`product` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `shopping-cart`.`usercart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shopping-cart`.`usercart` ;

CREATE TABLE IF NOT EXISTS `shopping-cart`.`usercart` (
  `username` VARCHAR(60) NULL DEFAULT NULL,
  `prodid` VARCHAR(45) NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  INDEX `useremail_idx` (`username` ASC) VISIBLE,
  INDEX `prodidcart_idx` (`prodid` ASC) VISIBLE,
  CONSTRAINT `useremail`
    FOREIGN KEY (`username`)
    REFERENCES `shopping-cart`.`user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prodidcart`
    FOREIGN KEY (`prodid`)
    REFERENCES `shopping-cart`.`product` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `shopping-cart`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `shopping-cart`;
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(1,'apple','fruits','Fresh Apples directly from farm','30', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(2,'mango','fruits','Fresh mango directly from farm','40', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601')); 
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(3,'grapes','fruits','Fresh grapes directly from farm','50', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));  
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(4,'Tomato','vegetables','Fresh Tomatoes directly from farm','20', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(5,'Potato','vegetables','Fresh potatoes directly from farm','30', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(6,'Carrot','vegetables','Fresh Carrots directly from farm','40', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));            
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(8,'milk','dairy','Fresh milk directly from farm','80', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(9,'cheese','dairy','Fresh cheese directly from farm','90', '100' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(10,'yoghurt','dairy','Fresh yoghurt directly from farm','100', '90' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(11,'Coca Cola','cans','Refreshing the taste (100ml)','20', '20' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(12,'Thums up','cans','Refreshing the taste (100ml)','10', '20' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(13,'Kurkure','Snacks','Delightful You · Snack and Spread Happiness','10', '20' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));
insert into product(pid,pname,ptype,pinfo,pprice,pquantity,image) values(14,'Burgers','Snacks','Delightful You · Snack and Spread Happiness','50', '40' ,LOAD_FILE('https://www.istockphoto.com/photo/red-apple-gm184276818-17092601'));

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping-cart`.`orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `shopping-cart`;
INSERT INTO `shopping-cart`.`orders` (`orderid`, `prodid`, `quantity`, `amount`, `shipped`) VALUES ('TR10001', '1', 1, 30 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping-cart`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `shopping-cart`;
INSERT INTO `shopping-cart`.`user` (`email`, `name`, `mobile`, `address`, `pincode`, `password`) VALUES ('guest@gmail.com', 'Guest User', 9876543234, 'K.P Road, Gaya, Bihar - India', 879767, 'guest');
INSERT INTO `shopping-cart`.`user` (`email`, `name`, `mobile`, `address`, `pincode`, `password`) VALUES ('admin@gmail.com', 'Admin User', 9876543459, 'ABC Colony, Newtown, West Bengal', 786890, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping-cart`.`transactions`
-- -----------------------------------------------------
START TRANSACTION;
USE `shopping-cart`;
INSERT INTO `shopping-cart`.`transactions` (`transid`, `username`, `time`, `amount`) VALUES ('TR10001', 'guest@gmail.com', '2024-12-26 09:26:56', 125999);

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping-cart`.`user_demand`
-- -----------------------------------------------------
START TRANSACTION;
USE `shopping-cart`;
INSERT INTO `shopping-cart`.`user_demand` (`username`, `prodid`, `quantity`) VALUES ('guest@gmail.com', '1', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `shopping-cart`.`usercart`
-- -----------------------------------------------------
START TRANSACTION;
USE `shopping-cart`;
INSERT INTO `shopping-cart`.`usercart` (`username`, `prodid`, `quantity`) VALUES ('guest@gmail.com', '3', 2);

COMMIT;
