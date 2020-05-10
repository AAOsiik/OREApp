CREATE TABLE `oreapp`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `recipeid` INT NOT NULL,
  `comment` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userid_idx` (`userid` ASC) VISIBLE,
  INDEX `recipeid_idx` (`recipeid` ASC) VISIBLE,
  CONSTRAINT `user`
    FOREIGN KEY (`userid`)
    REFERENCES `oreapp`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `recipe`
    FOREIGN KEY (`recipeid`)
    REFERENCES `oreapp`.`recipes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `oreapp`.`comments` (`id`, `userid`, `recipeid`, `comment`) VALUES ('1', '1', '1', 'You have very nice recipe!');

INSERT INTO `oreapp`.`comments` (`id`, `userid`, `recipeid`, `comment`) VALUES ('2', '2', '4', 'It is hard. But, my opinion... what matters! Delicious recipe!');


