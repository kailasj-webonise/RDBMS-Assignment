
/*report*/

select o.id,v.color,v.price,o.total,u.name,u.email from orders o,variants v,users u,orderproduct op,payments p where  o.id=p.user_id and op.variant_id=v.id and p.transaction_date between '2018-09-20' AND '2018-10-19';

______________________________________________________________________________________________

