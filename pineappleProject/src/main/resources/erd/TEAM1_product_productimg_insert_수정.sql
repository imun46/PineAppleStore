--PRODUCT insert
--판매 중(재고 있음) : 판매중
--판매 중(재고 없음) : OOS
--판매 중지      : 판매중지

--핸드폰, 노트북, 패드, 워치, 이어폰, 악세서리

--핸드폰
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이폰14','960000','phone','iPhone14_detail.jpg','phone14 description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이폰15','1400000','phone','iPhone15_detail.jpg','phone15 description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이폰16','1900000','phone','iPhone16_detail.jpg','phone16 description','active');

--노트북
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'맥북 에어','2160000','laptop','macbookAir_detail.jpg','air description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'맥북 프로','2640000','laptop','macbookAir_detail.jpg','pro description','active');

--패드
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이패드','872000','pad','iPad_detail.jpg','basic pad description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이패드 에어','1163000','pad','iPadAir_detail.jpg','air pad description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'아이패드 프로','1939000','pad','iPadPro_detail.jpg','pro pad description','active');

--워치
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'애플워치','639000','watch','appleWatch_detail.jpg','iwatch description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'애플워치 SE','312000','watch','appleWatchSe_detail.jpg','iwatch SE description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'애플워치 Ultra','1091000','watch','appleWatchUltra_detail.jpg','iwatch Ultra description','active');

--이어폰
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'에어팟','300000','earphone','airpod_detail.jpg','airpod description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'에어팟 프로','341000','earphone','airpod_detail.jpg','airpod pro description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'에어팟 맥스','745000','earphone','airpodPro_detail.jpg','airpod max description','active');

--악세서리
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'USB C-type','29000','accessories','cable_detail.jpg','USB C-type description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'매직 키보드','229000','accessories','magicKeyboard_detail.jpg','magickeyboard description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'핸드폰 케이스','55000','accessories','case_detail.jpg','phone case description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'워치 밴드','8900','accessories','strap_detail.jpg','watch band description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'핸드폰 강화필름','14000','accessories','film_detail.jpg','phone screen protector description','active');


--PRODUCT_IMAGE insert
--핸드폰 사진
----아이폰14
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone14(1).jpg', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone14(2).jpg', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone14(3).jpg', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone14(4).jpg', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone14(5).jpg', 1);
----아이폰15
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone15(1).jpg', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone15(2).jpg', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone15(3).jpg', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone15(4).jpg', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone15(5).jpg', 2);
----아이폰16
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone16(1).jpg', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone16(2).jpg', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone16(3).jpg', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone16(4).jpg', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPhone16(5).jpg', 3);

--노트북 사진
----맥북에어
insert into product_image values (product_image_product_image_no_seq.nextval, 'macbookAir(1).jpg', 4);
insert into product_image values (product_image_product_image_no_seq.nextval, 'macbookAir(2).jpg', 4);
insert into product_image values (product_image_product_image_no_seq.nextval, 'macbookAir(3).jpg', 4);
insert into product_image values (product_image_product_image_no_seq.nextval, 'macbookAir(4).jpg', 4);
----맥북프로
insert into product_image values (product_image_product_image_no_seq.nextval, 'macbookPro(1).jpg', 5);
insert into product_image values (product_image_product_image_no_seq.nextval, 'macbookPro(2).jpg', 5);
insert into product_image values (product_image_product_image_no_seq.nextval, 'macbookPro(3).jpg', 5);

--패드 사진
----아이패드
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPad(1).jpg', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPad(2).jpg', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPad(3).jpg', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPad(4).jpg', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPad(5).jpg', 6);
----아이패드에어
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadAir(1).jpg', 7);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadAir(2).jpg', 7);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadAir(3).jpg', 7);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadAir(4).jpg', 7);
----아이패드프로
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadPro(1).jpg', 8);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadPro(2).jpg', 8);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadPro(3).jpg', 8);
insert into product_image values (product_image_product_image_no_seq.nextval, 'iPadPro(4).jpg', 8);

--워치 사진
----애플워치
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatch(1).jpg', 9);
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatch(2).jpg', 9);
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatch(3).jpg', 9);
----애플워치SE
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatchSe(1).jpg', 10);
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatchSe(2).jpg', 10);
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatchSe(3).jpg', 10);
----애플워치Ultra
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatchUltra(1).jpg', 11);
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatchUltra(2).jpg', 11);
insert into product_image values (product_image_product_image_no_seq.nextval, 'appleWatchUltra(3).jpg', 11);

--이어폰 사진
----에어팟
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpod(1).jpg', 12);
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpod(2).jpg', 12);
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpod(3).jpg', 12);
----에어팟 프로
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpodPro(1).jpg', 13);
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpodPro(2).jpg', 13);
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpodPro(3).jpg', 13);
----에어팟 맥스
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpodMax(1).jpg', 14);
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpodMax(2).jpg', 14);
insert into product_image values (product_image_product_image_no_seq.nextval, 'airpodMax(3).jpg', 14);

--악세서리 사진
----USB C-type
insert into product_image values (product_image_product_image_no_seq.nextval, 'cable(1).jpg', 15);
insert into product_image values (product_image_product_image_no_seq.nextval, 'cable(2).jpg', 15);
----매직키보드
insert into product_image values (product_image_product_image_no_seq.nextval, 'magicKeyboard(1).jpg', 16);
insert into product_image values (product_image_product_image_no_seq.nextval, 'magicKeyboard(2).jpg', 16);
insert into product_image values (product_image_product_image_no_seq.nextval, 'magicKeyboard(3).jpg', 16);
insert into product_image values (product_image_product_image_no_seq.nextval, 'magicKeyboard(4).jpg', 16);
----핸드폰케이스
insert into product_image values (product_image_product_image_no_seq.nextval, 'case(1).jpg', 17);
insert into product_image values (product_image_product_image_no_seq.nextval, 'case(2).jpg', 17);
insert into product_image values (product_image_product_image_no_seq.nextval, 'case(3).jpg', 17);
----워치밴드
insert into product_image values (product_image_product_image_no_seq.nextval, 'strap(1).jpg', 18);
insert into product_image values (product_image_product_image_no_seq.nextval, 'strap(2).jpg', 18);
insert into product_image values (product_image_product_image_no_seq.nextval, 'strap(3).jpg', 18);
----핸드폰 강화필름
insert into product_image values (product_image_product_image_no_seq.nextval, 'film(1).jpg', 19);
insert into product_image values (product_image_product_image_no_seq.nextval, 'film(1).jpg', 19);


