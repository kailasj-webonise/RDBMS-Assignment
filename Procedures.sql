                                                   
                                                   /*DATABASE USED POSTGRESSQL*/

DELIMITER //
CREATE or REPLACE FUNCTION payment_procedure(payment_mode varchar(20),payment_status varchar(20),transaction_date date,user_id int,disc_id int)
RETURNS void AS $$
DECLARE
disco integer; 
total integer;
final_amt integer;
per integer;
BEGIN
SELECT sum(variant_price) into total from cart;
select percentage into per from discounts where id=disc_id;
final_amt :=total- total*per/100;
disco=total*per/100;
insert into payments(modes,payment_status,transaction_date,user_id)values(payment_mode,payment_status,transaction_date,user_id);
PERFORM order_procedure(total,disco,user_id,disc_id,payment_status,final_amt);
END;
$$ LANGUAGE PLPGSQL;
DELIMITER ;


select payment_procedure('credit card','success',current_date,1,1);
__________________________________________________________________________________________

DELIMITER //
 CREATE or replace FUNCTION order_procedure(IN total int,IN discount int,IN user_id int,IN discount_id int,IN orderstatus varchar(100),IN final_amount int)
  RETURNS void AS $$
   BEGIN

     
   	insert into orders(order_price,discount_price,user_id,discount_id,order_status,total)values (total,discount,user_id,discount_id,orderstatus,final_amount);


IF orderstatus='success'
 THEN
PERFORM order_product_procedure();
END IF;
    
   END;
   $$ LANGUAGE PLPGSQL;
 DELIMITER ;
 
 __________________________________________________________________________________________

delimiter //
CREATE or replace FUNCTION order_product_procedure()
 RETURNS void AS $$
BEGIN
	INSERT INTO orderproduct(product_id,variant_id,variant_price,user_id)
	SELECT product_id,variant_id,variant_price,user_id
	FROM cart;
PERFORM empty_cart_function();
   END;
   $$ LANGUAGE PLPGSQL;
 DELIMITER ;

_____________________________________________________________________________________________

DELIMITER //
 CREATE or replace FUNCTION empty_cart_function()
 RETURNS void AS $$
   BEGIN
   	TRUNCATE TABLE cart;
   
   END;
    $$ LANGUAGE PLPGSQL;
 DELIMITER ;

______________________________________________________________________________________________










