CREATE TABLE orders (
	order_id varchar(10) NOT NULL UNIQUE,
	order_cost double,
	PRIMARY KEY (order_id),
	user_FK int,
 	FOREIGN KEY (user_FK) REFERENCES users (user_id),
	CONSTRAINT order_chk CHECK (LENGTH(order_id)>=8),
	CONSTRAINT order_chkk CHECK (LENGTH(order_id)<=10)
);
