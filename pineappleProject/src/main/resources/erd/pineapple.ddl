DROP TABLE product_selected_detail CASCADE CONSTRAINTS;
DROP TABLE product_selected CASCADE CONSTRAINTS;
DROP TABLE product_option_detail CASCADE CONSTRAINTS;
DROP TABLE product_option CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE orders_items CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE customer_coupons CASCADE CONSTRAINTS;
DROP TABLE product_image CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;

CREATE TABLE customer(
		customer_no                   		NUMBER(10)		 NULL ,
		customer_id                   		VARCHAR2(100)		 NOT NULL,
		customer_password             		VARCHAR2(100)		 NOT NULL,
		customer_name                 		VARCHAR2(100)		 NOT NULL,
		customer_dob                  		DATE		 NULL ,
		customer_address              		VARCHAR2(300)		 NOT NULL,
		customer_gender               		VARCHAR2(50)		 NULL ,
		customer_phone                		VARCHAR2(100)		 NOT NULL,
		customer_email                		VARCHAR2(100)		 NULL ,
		customer_nickname             		VARCHAR2(200)		 NULL ,
		customer_joindate             		DATE		 DEFAULT sysdate		 NULL 
);

DROP SEQUENCE customer_customer_no_SEQ;

CREATE SEQUENCE customer_customer_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE coupon(
		coupon_no                     		NUMBER(10)		 NULL ,
		coupon_name                   		VARCHAR2(200)		 NOT NULL,
		coupon_id                     		VARCHAR2(100)		 NOT NULL,
		coupon_discount               		VARCHAR2(3)		 NOT NULL,
		coupon_desc                   		VARCHAR2(1000)		 NOT NULL
);

DROP SEQUENCE coupon_coupon_no_SEQ;

CREATE SEQUENCE coupon_coupon_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE product(
		product_no                    		NUMBER(10)		 NULL ,
		product_name                  		VARCHAR2(200)		 NOT NULL,
		product_price                 		NUMBER(10)		 NOT NULL,
		product_category              		VARCHAR2(100)		 NOT NULL,
		product_detailpage            		VARCHAR2(200)		 NULL ,
		product_desc                  		VARCHAR2(1000)		 NOT NULL,
		product_status                		VARCHAR2(50)		 NOT NULL
);

DROP SEQUENCE product_product_no_SEQ;

CREATE SEQUENCE product_product_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE review(
		review_no                     		NUMBER(10)		 NULL ,
		review_title                  		VARCHAR2(200)		 NULL ,
		review_content                		VARCHAR2(1000)		 NULL ,
		review_image                  		VARCHAR2(200)		 NULL ,
		review_rating                 		NUMBER(1)		 NOT NULL,
		review_date                   		DATE		 DEFAULT sysdate		 NOT NULL,
		product_no                    		NUMBER(10)		 NOT NULL,
		customer_no                   		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE review_review_no_SEQ;

CREATE SEQUENCE review_review_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_image(
		product_image_no              		NUMBER(10)		 NULL ,
		product_image_file            		VARCHAR2(200)		 NOT NULL,
		product_no                    		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE product_image_product_image_no_SEQ;

CREATE SEQUENCE product_image_product_image_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE customer_coupons(
		customer_coupons_no           		NUMBER(10)		 NULL ,
		customer_coupons_enddate      		DATE		 NOT NULL,
		customer_coupons_status       		VARCHAR2(50)		 NOT NULL,
		coupon_no                     		NUMBER(10)		 NOT NULL,
		customer_no                   		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE customer_coupons_customer_coupons_no_SEQ;

CREATE SEQUENCE customer_coupons_customer_coupons_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orders(
		orders_no                     		NUMBER(10)		 NULL ,
		orders_date                   		DATE		 DEFAULT sysdate		 NOT NULL,
		orders_arrivaldate            		DATE		 NULL ,
		orders_totprice               		NUMBER(10)		 NOT NULL,
		orders_finalprice             		NUMBER(10)		 NOT NULL,
		orders_totqty                 		NUMBER(10)		 NULL ,
		orders_address                		VARCHAR2(300)		 NOT NULL,
		orders_status                 		VARCHAR2(50)		 NOT NULL,
		customer_no                   		NUMBER(10)		 NOT NULL,
		customer_coupons_no           		NUMBER(10)		 NULL 
);

DROP SEQUENCE orders_orders_no_SEQ;

CREATE SEQUENCE orders_orders_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orders_items(
		orders_items_no               		NUMBER(10)		 NULL ,
		orders_items_price            		NUMBER(10)		 NOT NULL,
		orders_items_finalprice       		NUMBER(10)		 NOT NULL,
		orders_items_qty              		NUMBER(10)		 NOT NULL,
		orders_items_options          		VARCHAR2(500)		 NOT NULL,
		orders_no                     		NUMBER(10)		 NOT NULL,
		product_no                    		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE orders_items_orders_items_no_SEQ;

CREATE SEQUENCE orders_items_orders_items_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(10)		 NOT NULL,
		customer_no                   		NUMBER(10)		 NOT NULL,
		product_no                    		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_option(
		product_option_no             		NUMBER(10)		 NULL ,
		product_option_type           		VARCHAR2(200)		 NOT NULL,
		product_no                    		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE product_option_product_option_no_SEQ;

CREATE SEQUENCE product_option_product_option_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_option_detail(
		product_option_detail_no      		NUMBER(10)		 NULL ,
		product_option_detail_name    		VARCHAR2(200)		 NOT NULL,
		product_option_detail_price   		NUMBER(10)		 NOT NULL,
		product_option_no             		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE product_option_detail_product_option_detail_no_SEQ;

CREATE SEQUENCE product_option_detail_product_option_detail_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_selected(
		product_selected_no           		NUMBER(10)		 NULL ,
		cart_no                       		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE product_selected_product_selected_no_SEQ;

CREATE SEQUENCE product_selected_product_selected_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_selected_detail(
		product_selected_detail_no    		NUMBER(10)		 NULL ,
		product_selected_no           		NUMBER(10)		 NOT NULL,
		product_option_detail_no      		NUMBER(10)		 NOT NULL
);

DROP SEQUENCE product_selected_detail_product_selected_detail_no_SEQ;

CREATE SEQUENCE product_selected_detail_product_selected_detail_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;





ALTER TABLE customer ADD CONSTRAINT IDX_customer_PK PRIMARY KEY (customer_no);
ALTER TABLE customer ADD CONSTRAINT IDX_customer_UNIQUE_id UNIQUE (customer_id);
ALTER TABLE customer ADD CONSTRAINT IDX_customer_UNIQUE_nickname UNIQUE (customer_nickname);
ALTER TABLE customer ADD CONSTRAINT IDX_customer_UNIQUE_phone UNIQUE (customer_phone);


ALTER TABLE coupon ADD CONSTRAINT IDX_coupon_PK PRIMARY KEY (coupon_no);
ALTER TABLE coupon ADD CONSTRAINT IDX_coupon_UNIQUE UNIQUE (coupon_id);


ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (product_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_UNIQUE_name UNIQUE (product_name);


ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (review_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (customer_no) REFERENCES customer (customer_no) ON DELETE CASCADE;

ALTER TABLE product_image ADD CONSTRAINT IDX_product_image_PK PRIMARY KEY (product_image_no);
ALTER TABLE product_image ADD CONSTRAINT IDX_product_image_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;

ALTER TABLE customer_coupons ADD CONSTRAINT IDX_customer_coupons_PK PRIMARY KEY (customer_coupons_no);
ALTER TABLE customer_coupons ADD CONSTRAINT IDX_customer_coupons_FK0 FOREIGN KEY (coupon_no) REFERENCES coupon (coupon_no) ON DELETE CASCADE;
ALTER TABLE customer_coupons ADD CONSTRAINT IDX_customer_coupons_FK1 FOREIGN KEY (customer_no) REFERENCES customer (customer_no) ON DELETE CASCADE;

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (orders_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (customer_no) REFERENCES customer (customer_no) ON DELETE CASCADE;
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK1 FOREIGN KEY (customer_coupons_no) REFERENCES customer_coupons (customer_coupons_no) ON DELETE CASCADE;

ALTER TABLE orders_items ADD CONSTRAINT IDX_orders_items_PK PRIMARY KEY (orders_items_no);
ALTER TABLE orders_items ADD CONSTRAINT IDX_orders_items_FK0 FOREIGN KEY (orders_no) REFERENCES orders (orders_no) ON DELETE CASCADE;
ALTER TABLE orders_items ADD CONSTRAINT IDX_orders_items_FK1 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (customer_no) REFERENCES customer (customer_no) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;

ALTER TABLE product_option ADD CONSTRAINT IDX_product_option_PK PRIMARY KEY (product_option_no);
ALTER TABLE product_option ADD CONSTRAINT IDX_product_option_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;

ALTER TABLE product_option_detail ADD CONSTRAINT IDX_product_option_detail_PK PRIMARY KEY (product_option_detail_no);
ALTER TABLE product_option_detail ADD CONSTRAINT IDX_product_option_detail_FK0 FOREIGN KEY (product_option_no) REFERENCES product_option (product_option_no) ON DELETE CASCADE;

ALTER TABLE product_selected ADD CONSTRAINT IDX_product_selected_PK PRIMARY KEY (product_selected_no);
ALTER TABLE product_selected ADD CONSTRAINT IDX_product_selected_FK0 FOREIGN KEY (cart_no) REFERENCES cart (cart_no) ON DELETE CASCADE;

ALTER TABLE product_selected_detail ADD CONSTRAINT IDX_product_selected_detail_PK PRIMARY KEY (product_selected_detail_no);
ALTER TABLE product_selected_detail ADD CONSTRAINT IDX_product_selected_detail_FK0 FOREIGN KEY (product_selected_no) REFERENCES product_selected (product_selected_no) ON DELETE CASCADE;
ALTER TABLE product_selected_detail ADD CONSTRAINT IDX_product_selected_detail_FK1 FOREIGN KEY (product_option_detail_no) REFERENCES product_option_detail (product_option_detail_no) ON DELETE CASCADE;

