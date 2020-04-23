CREATE TABLE `oreapp`.`recipes` (
  `id` INT NOT NULL AUTO INCREMENT,
  `userid` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(256) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `difficulty` VARCHAR(20) NOT NULL,
  `tags` VARCHAR(45) NULL,
  `picture` VARCHAR(60) NULL,
  PRIMARY KEY (`id`),
  INDEX `userid_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `userid`
    FOREIGN KEY (`userid`)
    REFERENCES `oreapp`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
