
/* VIEW */

CREATE VIEW view_orders
AS SELECT orders.id as ID, payments.transaction_date,discounts.percentage as Discount_Percent,payments.modes as Payment_mode,payments.payment_status,orders.total as Total FROM payments,orders,discounts WHERE discounts.id=orders.discount_id and payments.user_id=orders.user_id;

______________________________________________________________________________________________

