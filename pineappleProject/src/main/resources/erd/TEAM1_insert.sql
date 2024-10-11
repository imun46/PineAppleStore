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





--PRODUCT insert
--판매 중(재고 있음) : 판매중
--판매 중(재고 없음) : OOS
--판매 중지		: 판매중지

--핸드폰, 노트북, 패드, 워치, 이어폰, 악세서리

--핸드폰
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이폰14','950000','phone','dp_iphone_14','phone14 description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이폰15','1090000','phone','dp_iphone_15','phone15 description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이폰16','1250000','phone','dp_iphone_16','phone16 description','판매중');

--노트북
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'맥북 에어','12500000','laptop','dp_laptop_air','air description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'맥북 프로','22500000','laptop','dp_laptop_pro','pro description','판매중');

--패드
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이패드','1250000','pad','dp_pad_basic','basic pad description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이패드 에어','1250000','pad','dp_pad_air','air pad description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이패드 프로','1250000','pad','dp_pad_pro','pro pad description','판매중');

--워치
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이워치','1250000','watch','dp_watch_basic','iwatch description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이워치 SE','1250000','watch','dp_watch_SE','iwatch SE description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이워치 Ultra','1250000','watch','dp_watch_Ultra','iwatch Ultra description','판매중');

--이어폰
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'에어팟','1250000','earphone','dp_airpod_basic','airpod description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'에어팟 프로','1250000','earphone','dp_airpod_pro','airpod pro description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'에어팟 맥스','1250000','earphone','dp_airpod_max','airpod max description','판매중');

--악세서리
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'USB C-type','1250000','accessories','dp_USB_C-type','USB C-type description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'매직 키보드','1250000','accessories','dp_magickeyboard','magickeyboard description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'핸드폰 케이스','1250000','accessories','dp_phone_case','phone case description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'워치 밴드','1250000','accessories','dp_watch_band_case','watch band description','판매중');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'핸드폰 강화필름','1250000','accessories','dp_phone_sp_case','phone screen protector description','판매중');


--PRODUCT_IMAGE insert
--핸드폰 사진
INSERT INTO product_image values (product_image_product_image_no_seq.nextval, 'product_1_image_1', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_1_image_2', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_1_image_3', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_2_image_1', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_2_image_2', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_3_image_1', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_3_image_2', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_3_image_3', 3);

--노트북 사진
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_4_image_1', 4);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_4_image_2', 4);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_5_image_1', 5);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_5_image_2', 5);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_5_image_3', 5);

--패드 사진
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_6_image_1', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_6_image_2', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_6_image_3', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_7_image_1', 7);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_7_image_2', 7);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_8_image_1', 8);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_8_image_2', 8);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_8_image_3', 8);

--워치 사진
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_9_image_1', 9);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_9_image_2', 9);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_10_image_1', 10);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_10_image_2', 10);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_11_image_1', 11);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_11_image_2', 11);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_11_image_3', 11);

--이어폰 사진
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_12_image_1', 12);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_13_image_1', 13);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_13_image_2', 13);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_14_image_1', 14);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_14_image_2', 14);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_14_image_3', 14);

--악세서리 사진
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_15_image_1', 15);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_15_image_2', 15);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_16_image_1', 16);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_16_image_2', 16);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_17_image_1', 17);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_17_image_2', 17);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_18_image_1', 18);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_18_image_2', 18);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_19_image_1', 19);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_19_image_2', 19);



--PRODUCT_OPTION insert
--핸드폰
insert into product_option values(product_option_product_option_no_seq.nextval,'모델',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'용량',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'모델',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'용량',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'모델',3);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',3);
insert into product_option values(product_option_product_option_no_seq.nextval,'용량',3);

--노트북
insert into product_option values(product_option_product_option_no_seq.nextval,'칩',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'메모리',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'램',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'사이즈',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'칩',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'메모리',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'램',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'사이즈',5);

--패드
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',6);
insert into product_option values(product_option_product_option_no_seq.nextval,'메모리',6);
insert into product_option values(product_option_product_option_no_seq.nextval,'램',6);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',7);
insert into product_option values(product_option_product_option_no_seq.nextval,'메모리',7);
insert into product_option values(product_option_product_option_no_seq.nextval,'램',7);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',8);
insert into product_option values(product_option_product_option_no_seq.nextval,'메모리',8);
insert into product_option values(product_option_product_option_no_seq.nextval,'램',8);

--워치
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',9);
insert into product_option values(product_option_product_option_no_seq.nextval,'사이즈',9);
insert into product_option values(product_option_product_option_no_seq.nextval,'케이스',9);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',10);
insert into product_option values(product_option_product_option_no_seq.nextval,'사이즈',10);
insert into product_option values(product_option_product_option_no_seq.nextval,'케이스',10);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',11);
insert into product_option values(product_option_product_option_no_seq.nextval,'사이즈',11);
insert into product_option values(product_option_product_option_no_seq.nextval,'케이스',11);

--이어폰

--악세서리
insert into product_option values(product_option_product_option_no_seq.nextval,'시리즈',17);
insert into product_option values(product_option_product_option_no_seq.nextval,'모델',17);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',17);
insert into product_option values(product_option_product_option_no_seq.nextval,'모델',18);
insert into product_option values(product_option_product_option_no_seq.nextval,'사이즈',18);
insert into product_option values(product_option_product_option_no_seq.nextval,'색상',18);
insert into product_option values(product_option_product_option_no_seq.nextval,'시리즈',19);
insert into product_option values(product_option_product_option_no_seq.nextval,'모델',19);

--PRODUCT_OPTION_DETAIL insert
--핸드폰
--핸드폰: 아이폰14
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',200000,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',300000,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Gold',0,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Black',0,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,3);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,3);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'1T',500000,3);
--핸드폰: 아이폰15
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,4);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',200000,4);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',300000,4);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,5);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Gold',0,5);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Black',0,5);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,6);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,6);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'1T',500000,6);
--핸드폰: 아이폰16
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,7);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',200000,7);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',300000,7);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,8);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Gold',0,8);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Black',0,8);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,9);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,9);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'1T',500000,9);

--노트북
--노트북: 
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M2',0,10);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M3',500000,10);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,11);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,11);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Starlight White',0,11);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,12);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,12);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,13);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',250000,13);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'13inch',0,14);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'15inch',300000,14);

insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M2',0,15);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M3',700000,15);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,16);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,16);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Starlight White',0,16);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Black',0,16);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,17);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',500000,17);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,18);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',400000,18);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'13inch',0,19);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'15inch',600000,19);

--패드
--패드: 기본
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,20);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,20);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'64GB',0,21);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'128GB',300000,21);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,22);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',200000,22);

--패드: 에어
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,23);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,23);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'64GB',0,24);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'128GB',400000,24);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,25);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',300000,25);

--패드: 프로
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,26);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,26);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'64GB',0,27);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'128GB',500000,27);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,28);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',400000,28);


--워치
--워치: 기본
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,29);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,29);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,30);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',100000,30);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',200000,30);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Aluminum',200000,31);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Titanium',300000,31);

--워치: 프로
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,32);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,32);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,33);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',200000,33);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',300000,33);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Aluminum',300000,34);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Titanium',400000,34);

--워치: 맥스
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,35);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,35);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,36);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',300000,36);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',500000,36);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Aluminum',500000,37);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Titanium',700000,37);


--이어폰
--없음


--악세서리
--핸드폰 케이스
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'14',0,38);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'15',100000,38);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16',200000,38);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,39);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',100000,39);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',200000,39);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Black',0,40);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Green',0,40);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pink',0,40);

--워치 밴드
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,41);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'SE',100000,41);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Ultra',200000,41);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,42);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',100000,42);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',300000,42);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Black',0,43);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Green',0,43);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pink',0,43);


--핸드폰 강화필름
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'14',0,44);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'15',100000,44);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16',200000,44);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,45);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',100000,45);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',200000,45);





--ORDERS + OrderItems insert
--배송 전 : 배송전
--배송 중 : 배송중
--배송 완료: 배송완
--취소 	: 취소
INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,sysdate,sysdate+3,150000,125000,4,'서울시 강남구','배송전',1,1);

INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 1);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 25000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 2);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 3);


INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,sysdate,sysdate+3,150000,125000,4,'서울시 강남구','배송완',2,1);

INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 1);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 25000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 2);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 3);



--CART insert
INSERT INTO Cart(cart_no, cart_qty, customer_no)
VALUES (cart_cart_no_seq.nextval , 3, 1);



--PRODUCT_SELECTED insert
--1번 회원 카트
--CART insert
--1번 회원 카트
INSERT INTO Cart(cart_no, cart_qty, customer_no)
VALUES (cart_cart_no_seq.nextval , 2, 1);
INSERT INTO PRODUCT_SELECTED(PRODUCT_SELECTED_NO,PRODUCT_NO,PRODUCT_OPTION_DETAIL_NO,CART_NO)
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,1,1,cart_cart_no_seq.currval);
INSERT INTO PRODUCT_SELECTED(PRODUCT_SELECTED_NO,PRODUCT_NO,PRODUCT_OPTION_DETAIL_NO,CART_NO)
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,1,5,cart_cart_no_seq.currval);
INSERT INTO PRODUCT_SELECTED(PRODUCT_SELECTED_NO,PRODUCT_NO,PRODUCT_OPTION_DETAIL_NO,CART_NO)
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,1,8,cart_cart_no_seq.currval);




--review insert
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '리뷰1', '리뷰가 너무 재밌어요', '/image/review1', 5, 1, 1);
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '리뷰2', '쓸모가없어요', '/image/review2', 1, 1, 2);
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '리뷰3', '보통이에요', '/image/review3', 3, 1, 3);
