


CREATE TABLE products (
	product_id int NOT NULL AUTO_INCREMENT,
	product_name varchar(50) NOT NULL,
	product_price int NOT NULL ,
	PRIMARY KEY (product_id),
        CONSTRAINT price_chk CHECK (product_price ~ '^[0-9]*$')
          );

