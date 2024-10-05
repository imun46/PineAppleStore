--CUSTOMER insert
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX1','123456','김일일','2001-01-01','서울시 강남구','M','010-1111-1111','1111@naver.com','일등사람',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX2','123456','김투투','2001-02-02','서울시 강이구','W','010-2222-2222','2222@naver.com','이등사람',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX3','123456','김삼삼','2001-03-03','서울시 강삼구','W','010-3333-3333','3333@naver.com','삼사람사람',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX4','123456','김포포','2001-04-04','서울시 강포구','M','010-4444-4444','4444@naver.com','네명등사람',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX5','123456','김오오','2001-04-04','서울시 강오구','M','010-5555-5555','5555@naver.com','오식이등사람',sysdate);

--PRODUCT insert
insert into product values (product_product_no_seq.nextval,'아이폰14','950000','핸드폰','상세페이지','15.4cm 디스플레이','품절');
insert into product values (product_product_no_seq.nextval,'아이폰15','1090000','핸드폰','상세페이지','15.5cm 디스플레이','노품절');
insert into product values (product_product_no_seq.nextval,'아이폰16','1250000','핸드폰','상세페이지','15.5cm 디스플레이','품절');

--COUPON insert
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'30% 할인쿠폰','A123456','30','전자제품 전 품목 30% 할인 쿠폰입니다');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'25% 할인쿠폰','B123456','25','전자제품 전 품목 25% 할인 쿠폰입니다');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'20% 할인쿠폰','C123456','20','전자제품 전 품목 20% 할인 쿠폰입니다');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'15% 할인쿠폰','D123456','15','전자제품 전 품목 15% 할인 쿠폰입니다');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'10% 할인쿠폰','E123456','10','전자제품 전 품목 10% 할인 쿠폰입니다');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC)
VALUES (COUPON_COUPON_NO_SEQ.nextval,'5% 할인쿠폰','F123456','5','전자제품 전 품목 5% 할인 쿠폰입니다');


--CUSTOMER_COUPONS insert
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/09/30', '사용불가',1,1);
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/09/30', '사용불가',2,2);
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/10/31', '사용가능',3,3);
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/10/31', '사용가능',4,4);


--ORDERS insert
INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,'2024-10-04','2024-10-07',150000,125000,4,'서울시 강남구','배송중',1,1);
INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,'2024-10-01','2024-10-03',3000000,250000,10,'부산시 부산구','배송완료',1,2);
INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,'2024-10-02','2024-10-05',350000,300000,2,'광주시 광주구','배송중',1,3);
INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,'2023-10-04','2023-10-07',2000000,1200000,8,'열한시 손석구','배송완료',1,4);


--PRODUCT_IMAGE insert
INSERT INTO PRODUCT_IMAGE (PRODUCT_IMAGE_NO,PRODUCT_IMAGE_FILE,PRODUCT_NO)
VALUES (PRODUCT_IMAGE_PRODUCT_IMAGE_NO_SEQ.nextval,'image/111.jpg',1);
INSERT INTO PRODUCT_IMAGE (PRODUCT_IMAGE_NO,PRODUCT_IMAGE_FILE,PRODUCT_NO)
VALUES (PRODUCT_IMAGE_PRODUCT_IMAGE_NO_SEQ.nextval,'image/222.jpg',2);
INSERT INTO PRODUCT_IMAGE (PRODUCT_IMAGE_NO,PRODUCT_IMAGE_FILE,PRODUCT_NO)
VALUES (PRODUCT_IMAGE_PRODUCT_IMAGE_NO_SEQ.nextval,'image/333.jpg',3);

--CART insert
INSERT INTO Cart(cart_no, cart_qty, customer_no)
VALUES (cart_cart_no_seq.nextval , 3, 1);
INSERT INTO Cart(cart_no, cart_qty, customer_no)
VALUES (cart_cart_no_seq.nextval , 4, 2);
INSERT INTO Cart(cart_no, cart_qty, customer_no)
VALUES (cart_cart_no_seq.nextval , 5, 3);
INSERT INTO Cart(cart_no, cart_qty, customer_no)
VALUES (cart_cart_no_seq.nextval , 6, 4);



--PRODUCT_OPTION insert
insert into product_option values(product_option_product_option_no_seq.nextval,'용량',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'스마트케어',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'용량',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'스마트케어',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'용량',3);
insert into product_option values(product_option_product_option_no_seq.nextval,'스마트케어',3);
insert into product_option values(product_option_product_option_no_seq.nextval,'용량',3);




--PRODUCT_OPTION_DETAIL insert

insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'128GB',100000,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',200000,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'O',100000,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'X',100000,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'빨간색',0,3);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'파란색',0,3);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'노란색',0,3);



--PRODUCT_SELECTED insert
INSERT INTO PRODUCT_SELECTED(PRODUCT_SELECTED_NO,PRODUCT_NO,PRODUCT_OPTION_DETAIL_NO,CART_NO)
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,1,1,1);
INSERT INTO PRODUCT_SELECTED(PRODUCT_SELECTED_NO,PRODUCT_NO,PRODUCT_OPTION_DETAIL_NO,CART_NO)
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,2,2,2);
INSERT INTO PRODUCT_SELECTED(PRODUCT_SELECTED_NO,PRODUCT_NO,PRODUCT_OPTION_DETAIL_NO,CART_NO)
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,3,3,3);
INSERT INTO PRODUCT_SELECTED(PRODUCT_SELECTED_NO,PRODUCT_NO,PRODUCT_OPTION_DETAIL_NO,CART_NO)
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,1,4,4);

--review insert
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '리뷰1', '리뷰가 너무 재밌어요', '/image/review1', 5, 1, 1);
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '리뷰2', '쓸모가없어요', '/image/review2', 1, 1, 2);
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '리뷰3', '보통이에요', '/image/review3', 3, 1, 3);

--orders_items insert
insert into orders_items 
values(orders_items_orders_items_no_seq.nextval, 30000, 10000, 3, '옵션3', 1, 1);
insert into orders_items 
values(orders_items_orders_items_no_seq.nextval, 30000, 10000, 3, '옵션3', 2, 2);
insert into orders_items 
values(orders_items_orders_items_no_seq.nextval, 30000, 10000, 3, '옵션3', 3, 3);