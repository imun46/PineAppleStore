-- insert Orders + OrderItems
INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,sysdate,sysdate+3,150000,125000,4,'서울시 강남구','배송전',1,1);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, '색상: 검정, 용량: 256GB', ORDERS_ORDERS_NO_SEQ.currval, 1);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 25000, 1, '색상: 노랑, 용량: 256GB', ORDERS_ORDERS_NO_SEQ.currval, 2);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, '색상: 빨강, 용량: 256GB', ORDERS_ORDERS_NO_SEQ.currval, 3);

--select

-- 특정 유저 별 orders
select * from orders where customer_no = 1;

-- 특정 orders_no 별 orders + ordersItem
select o.orders_no, o.orders_date,o.orders_finalprice,o.orders_status, oi.orders_items_no,oi.orders_items_price,oi.orders_items_finalprice,oi.orders_items_qty,oi.orders_items_options,oi.product_no
from orders o
join orders_items oi
on o.orders_no = oi.orders_no
where o.orders_no = 7;

--delete
delete from orders where orders_no = 1;
 

