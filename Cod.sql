-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema urna
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema urna
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `urna` ;
USE `urna` ;

-- -----------------------------------------------------
-- Table `urna`.``
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`` (
  `store_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `manager_staff_id` TINYINT UNSIGNED NOT NULL,
  `address_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE INDEX `idx_unique_manager` (`manager_staff_id` ASC),
  INDEX `idx_fk_address_id` (`address_id` ASC),
  CONSTRAINT `fk_store_staff`
    FOREIGN KEY (`manager_staff_id`)
    REFERENCES `urna`.`` (``)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_store_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `urna`.`` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `urna`.`Partido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`Partido` (
  `PartidoID` INT NOT NULL,
  `Sigla` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Cor` VARCHAR(45) NOT NULL,
  `Número` INT NOT NULL,
  PRIMARY KEY (`PartidoID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`Acessos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`Acessos` (
  `AcessosID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Excluido` CHAR(1) NOT NULL,
  PRIMARY KEY (`AcessosID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`Cargo` (
  `CargosID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Digitos` INT NOT NULL,
  `Suplente` CHAR(1) NOT NULL,
  `Vice` CHAR(1) NOT NULL,
  `Excluido` CHAR(1) NOT NULL,
  PRIMARY KEY (`CargosID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`Eleitores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`Eleitores` (
  `EleitoresID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Inscricao` VARCHAR(12) NOT NULL,
  `Estado` VARCHAR(2) NOT NULL,
  `Zona` INT NOT NULL,
  `Secao` INT NOT NULL,
  `Data de nascimento` VARCHAR(45) NOT NULL,
  `Cancelado` CHAR(1) NOT NULL,
  `Falecido` CHAR(1) NOT NULL,
  `Inscricao` INT NOT NULL,
  PRIMARY KEY (`EleitoresID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`Candidatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`Candidatos` (
  `CandidatosID` INT NOT NULL,
  `Partido` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `NomeCompleto` VARCHAR(45) NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  `EstadoCivil` VARCHAR(45) NOT NULL,
  `GrauInstituiçao` VARCHAR(45) NOT NULL,
  `Coligacao` VARCHAR(45) NOT NULL,
  `DataNascimento` VARCHAR(45) NOT NULL,
  `Raca` VARCHAR(45) NOT NULL,
  `Nacionalidade` VARCHAR(45) NOT NULL,
  `Ocupaçao` VARCHAR(45) NOT NULL,
  `ComposiçaoColigaçao` VARCHAR(45) NOT NULL,
  `LimiteLegalPrimeirTurno` VARCHAR(45) NOT NULL,
  `LimiteLegalSegundoTurno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CandidatosID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`Eleicoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`Eleicoes` (
  `EleicaoID` INT NOT NULL AUTO_INCREMENT,
  `Ano` YEAR NOT NULL,
  `Data` DATE NOT NULL,
  `Tipo` CHAR(1) NOT NULL,
  `HoraInicio` TIME NOT NULL,
  `HoraFim` TIME NOT NULL,
  PRIMARY KEY (`EleicaoID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`VotoEleitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`VotoEleitor` (
  `Voto_EleitorID` INT NOT NULL,
  `EleitorInscricao` VARCHAR(12) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  `Zona` VARCHAR(4) NOT NULL,
  `Secao` VARCHAR(4) NOT NULL,
  `DataHora` DATETIME NOT NULL,
  `EleicaoID` INT NOT NULL,
  `ImportadorID` INT NULL,
  `VotoEleitorcol` VARCHAR(45) NULL,
  PRIMARY KEY (`Voto_EleitorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`VotoCandidatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`VotoCandidatos` (
  `Voto_CandidatoID` INT NOT NULL AUTO_INCREMENT,
  `Candidatos` VARCHAR(45) NOT NULL,
  `Estado` CHAR(2) NOT NULL,
  `Zona` VARCHAR(4) NOT NULL,
  `Secao` VARCHAR(4) NOT NULL,
  `DataHora` DATETIME NOT NULL,
  `EleicaoID` INT NOT NULL,
  `DeputadoFederal` VARCHAR(5) NOT NULL,
  `DeputadoEstadural` VARCHAR(4) NOT NULL,
  `Presidente` VARCHAR(2) NOT NULL,
  `Gov` VARCHAR(2) NOT NULL,
  `Sen` VARCHAR(3) NOT NULL,
  `EleicaoID` INT NOT NULL,
  `ImportadorID` INT NOT NULL,
  `VotoCandidatoscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Voto_CandidatoID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `urna`.`Importador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`Importador` (
  `ImportadorID` INT NOT NULL,
  `ImportadorID` INT NOT NULL,
  `DataHora` DATETIME NOT NULL,
  `Arquivo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ImportadorID`, `ImportadorID`))
ENGINE = InnoDB;

USE `urna` ;

-- -----------------------------------------------------
-- Placeholder table for view `urna`.`customer_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`customer_list` (`ID` INT, `name` INT, `address` INT, `zip code` INT, `phone` INT, `city` INT, `country` INT, `notes` INT, `SID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `urna`.`film_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`film_list` (`FID` INT, `title` INT, `description` INT, `category` INT, `price` INT, `length` INT, `rating` INT, `actors` INT);

-- -----------------------------------------------------
-- Placeholder table for view `urna`.`nicer_but_slower_film_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`nicer_but_slower_film_list` (`FID` INT, `title` INT, `description` INT, `category` INT, `price` INT, `length` INT, `rating` INT, `actors` INT);

-- -----------------------------------------------------
-- Placeholder table for view `urna`.`staff_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`staff_list` (`ID` INT, `name` INT, `address` INT, `zip code` INT, `phone` INT, `city` INT, `country` INT, `SID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `urna`.`sales_by_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`sales_by_store` (`store` INT, `manager` INT, `total_sales` INT);

-- -----------------------------------------------------
-- Placeholder table for view `urna`.`sales_by_film_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`sales_by_film_category` (`category` INT, `total_sales` INT);

-- -----------------------------------------------------
-- Placeholder table for view `urna`.`actor_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urna`.`actor_info` (`actor_id` INT, `first_name` INT, `last_name` INT, `film_info` INT);

-- -----------------------------------------------------
-- procedure rewards_report
-- -----------------------------------------------------

DELIMITER $$
USE `urna`$$


CREATE PROCEDURE `sakila`.`rewards_report` (
    IN min_monthly_purchases TINYINT UNSIGNED
    , IN min_dollar_amount_purchased DECIMAL(10,2) UNSIGNED
    , OUT count_rewardees INT
)
LANGUAGE SQL
NOT DETERMINISTIC 
READS SQL DATA
SQL SECURITY DEFINER
COMMENT 'Provides a customizable report on best customers'
proc: BEGIN
    
    DECLARE last_month_start DATE;
    DECLARE last_month_end DATE;

    /* Some sanity checks... */
    IF min_monthly_purchases = 0 THEN
        SELECT 'Minimum monthly purchases parameter must be > 0';
        LEAVE proc;
    END IF;
    IF min_dollar_amount_purchased = 0.00 THEN
        SELECT 'Minimum monthly dollar amount purchased parameter must be > $0.00';
        LEAVE proc;
    END IF;

    /* Determine start and end time periods */
    SET last_month_start = DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);
    SET last_month_start = STR_TO_DATE(CONCAT(YEAR(last_month_start),'-',MONTH(last_month_start),'-01'),'%Y-%m-%d');
    SET last_month_end = LAST_DAY(last_month_start);

    /* 
        Create a temporary storage area for 
        Customer IDs.  
    */
    CREATE TEMPORARY TABLE tmpCustomer (customer_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY);

    /* 
        Find all customers meeting the 
        monthly purchase requirements
    */
    INSERT INTO tmpCustomer (customer_id)
    SELECT p.customer_id 
    FROM payment AS p
    WHERE DATE(p.payment_date) BETWEEN last_month_start AND last_month_end
    GROUP BY customer_id
    HAVING SUM(p.amount) > min_dollar_amount_purchased
    AND COUNT(customer_id) > min_monthly_purchases;

    /* Populate OUT parameter with count of found customers */
    SELECT COUNT(*) FROM tmpCustomer INTO count_rewardees;

    /* 
        Output ALL customer information of matching rewardees.
        Customize output as needed.
    */
    SELECT c.* 
    FROM tmpCustomer AS t   
    INNER JOIN customer AS c ON t.customer_id = c.customer_id;

    /* Clean up */
    DROP TABLE tmpCustomer;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function get_customer_balance
-- -----------------------------------------------------

DELIMITER $$
USE `urna`$$


CREATE FUNCTION `sakila`.`get_customer_balance`(p_customer_id INT, p_effective_date DATETIME) RETURNS DECIMAL(5,2)
    DETERMINISTIC
    READS SQL DATA
BEGIN

       #OK, WE NEED TO CALCULATE THE CURRENT BALANCE GIVEN A CUSTOMER_ID AND A DATE
       #THAT WE WANT THE BALANCE TO BE EFFECTIVE FOR. THE BALANCE IS:
       #   1) RENTAL FEES FOR ALL PREVIOUS RENTALS
       #   2) ONE DOLLAR FOR EVERY DAY THE PREVIOUS RENTALS ARE OVERDUE
       #   3) IF A FILM IS MORE THAN RENTAL_DURATION * 2 OVERDUE, CHARGE THE REPLACEMENT_COST
       #   4) SUBTRACT ALL PAYMENTS MADE BEFORE THE DATE SPECIFIED

  DECLARE v_rentfees DECIMAL(5,2); #FEES PAID TO RENT THE VIDEOS INITIALLY
  DECLARE v_overfees INTEGER;      #LATE FEES FOR PRIOR RENTALS
  DECLARE v_payments DECIMAL(5,2); #SUM OF PAYMENTS MADE PREVIOUSLY

  SELECT IFNULL(SUM(film.rental_rate),0) INTO v_rentfees
    FROM film, inventory, rental
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;

  SELECT IFNULL(SUM(IF((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) > film.rental_duration,
        ((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) - film.rental_duration),0)),0) INTO v_overfees
    FROM rental, inventory, film
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;


  SELECT IFNULL(SUM(payment.amount),0) INTO v_payments
    FROM payment

    WHERE payment.payment_date <= p_effective_date
    AND payment.customer_id = p_customer_id;

  RETURN v_rentfees + v_overfees - v_payments;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure film_in_stock
-- -----------------------------------------------------

DELIMITER $$
USE `urna`$$


CREATE PROCEDURE `sakila`.`film_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id);

     SELECT FOUND_ROWS() INTO p_film_count;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure film_not_in_stock
-- -----------------------------------------------------

DELIMITER $$
USE `urna`$$


CREATE PROCEDURE `sakila`.`film_not_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
READS SQL DATA
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND NOT inventory_in_stock(inventory_id);

     SELECT FOUND_ROWS() INTO p_film_count;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inventory_held_by_customer
-- -----------------------------------------------------

DELIMITER $$
USE `urna`$$


CREATE FUNCTION `sakila`.`inventory_held_by_customer`(p_inventory_id INT) RETURNS INT
READS SQL DATA
BEGIN
  DECLARE v_customer_id INT;
  DECLARE EXIT HANDLER FOR NOT FOUND RETURN NULL;

  SELECT customer_id INTO v_customer_id
  FROM rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function inventory_in_stock
-- -----------------------------------------------------

DELIMITER $$
USE `urna`$$


CREATE FUNCTION `sakila`.`inventory_in_stock`(p_inventory_id INT) RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE v_rentals INT;
    DECLARE v_out     INT;

    #AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
    #FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED

    SELECT COUNT(*) INTO v_rentals
    FROM rental
    WHERE inventory_id = p_inventory_id;

    IF v_rentals = 0 THEN
      RETURN TRUE;
    END IF;

    SELECT COUNT(rental_id) INTO v_out
    FROM inventory LEFT JOIN rental USING(inventory_id)
    WHERE inventory.inventory_id = p_inventory_id
    AND rental.return_date IS NULL;

    IF v_out > 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `urna`.`customer_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `urna`.`customer_list`;
USE `urna`;
--
-- View structure for view `customer_list`
--

CREATE  OR REPLACE VIEW customer_list 
AS 
SELECT cu.customer_id AS ID, CONCAT(cu.first_name, _utf8' ', cu.last_name) AS name, a.address AS address, a.postal_code AS `zip code`,
	a.phone AS phone, city.city AS city, country.country AS country, IF(cu.active, _utf8'active',_utf8'') AS notes, cu.store_id AS SID 
FROM customer AS cu JOIN address AS a ON cu.address_id = a.address_id JOIN city ON a.city_id = city.city_id 
	JOIN country ON city.country_id = country.country_id;

-- -----------------------------------------------------
-- View `urna`.`film_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `urna`.`film_list`;
USE `urna`;
--
-- View structure for view `film_list`
--

CREATE  OR REPLACE VIEW film_list 
AS 
SELECT film.film_id AS FID, film.title AS title, film.description AS description, category.name AS category, film.rental_rate AS price,
	film.length AS length, film.rating AS rating, GROUP_CONCAT(CONCAT(actor.first_name, _utf8' ', actor.last_name) SEPARATOR ', ') AS actors 
FROM category LEFT JOIN film_category ON category.category_id = film_category.category_id LEFT JOIN film ON film_category.film_id = film.film_id
        JOIN film_actor ON film.film_id = film_actor.film_id 
	JOIN actor ON film_actor.actor_id = actor.actor_id 
GROUP BY film.film_id, category.name;

-- -----------------------------------------------------
-- View `urna`.`nicer_but_slower_film_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `urna`.`nicer_but_slower_film_list`;
USE `urna`;
--
-- View structure for view `nicer_but_slower_film_list`
--

CREATE  OR REPLACE VIEW nicer_but_slower_film_list 
AS 
SELECT film.film_id AS FID, film.title AS title, film.description AS description, category.name AS category, film.rental_rate AS price, 
	film.length AS length, film.rating AS rating, GROUP_CONCAT(CONCAT(CONCAT(UCASE(SUBSTR(actor.first_name,1,1)),
	LCASE(SUBSTR(actor.first_name,2,LENGTH(actor.first_name))),_utf8' ',CONCAT(UCASE(SUBSTR(actor.last_name,1,1)),
	LCASE(SUBSTR(actor.last_name,2,LENGTH(actor.last_name)))))) SEPARATOR ', ') AS actors 
FROM category LEFT JOIN film_category ON category.category_id = film_category.category_id LEFT JOIN film ON film_category.film_id = film.film_id
        JOIN film_actor ON film.film_id = film_actor.film_id
	JOIN actor ON film_actor.actor_id = actor.actor_id 
GROUP BY film.film_id, category.name;

-- -----------------------------------------------------
-- View `urna`.`staff_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `urna`.`staff_list`;
USE `urna`;
--
-- View structure for view `staff_list`
--

CREATE  OR REPLACE VIEW staff_list 
AS 
SELECT s.staff_id AS ID, CONCAT(s.first_name, _utf8' ', s.last_name) AS name, a.address AS address, a.postal_code AS `zip code`, a.phone AS phone,
	city.city AS city, country.country AS country, s.store_id AS SID 
FROM staff AS s JOIN address AS a ON s.address_id = a.address_id JOIN city ON a.city_id = city.city_id 
	JOIN country ON city.country_id = country.country_id;

-- -----------------------------------------------------
-- View `urna`.`sales_by_store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `urna`.`sales_by_store`;
USE `urna`;
--
-- View structure for view `sales_by_store`
--

CREATE  OR REPLACE VIEW sales_by_store
AS 
SELECT 
CONCAT(c.city, _utf8',', cy.country) AS store
, CONCAT(m.first_name, _utf8' ', m.last_name) AS manager
, SUM(p.amount) AS total_sales
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN store AS s ON i.store_id = s.store_id
INNER JOIN address AS a ON s.address_id = a.address_id
INNER JOIN city AS c ON a.city_id = c.city_id
INNER JOIN country AS cy ON c.country_id = cy.country_id
INNER JOIN staff AS m ON s.manager_staff_id = m.staff_id
GROUP BY s.store_id
ORDER BY cy.country, c.city;

-- -----------------------------------------------------
-- View `urna`.`sales_by_film_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `urna`.`sales_by_film_category`;
USE `urna`;
--
-- View structure for view `sales_by_film_category`
--
-- Note that total sales will add up to >100% because
-- some titles belong to more than 1 category
--

CREATE  OR REPLACE VIEW sales_by_film_category
AS 
SELECT 
c.name AS category
, SUM(p.amount) AS total_sales
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_sales DESC;

-- -----------------------------------------------------
-- View `urna`.`actor_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `urna`.`actor_info`;
USE `urna`;
--
-- View structure for view `actor_info`
--

CREATE  OR REPLACE DEFINER=CURRENT_USER SQL SECURITY INVOKER VIEW actor_info 
AS
SELECT      
a.actor_id,
a.first_name,
a.last_name,
GROUP_CONCAT(DISTINCT CONCAT(c.name, ': ',
		(SELECT GROUP_CONCAT(f.title ORDER BY f.title SEPARATOR ', ')
                    FROM sakila.film f
                    INNER JOIN sakila.film_category fc
                      ON f.film_id = fc.film_id
                    INNER JOIN sakila.film_actor fa
                      ON f.film_id = fa.film_id
                    WHERE fc.category_id = c.category_id
                    AND fa.actor_id = a.actor_id
                 )
             )
             ORDER BY c.name SEPARATOR '; ')
AS film_info
FROM sakila.actor a
LEFT JOIN sakila.film_actor fa
  ON a.actor_id = fa.actor_id
LEFT JOIN sakila.film_category fc
  ON fa.film_id = fc.film_id
LEFT JOIN sakila.category c
  ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name, a.last_name;
USE `urna`;

DELIMITER $$
USE `urna`$$

CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END$$

USE `urna`$$

CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) or (old.description != new.description)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END$$

USE `urna`$$

CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
