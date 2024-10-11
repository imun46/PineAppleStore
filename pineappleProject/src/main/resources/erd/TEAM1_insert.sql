--CUSTOMER insert
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX1','123456','������','2001-01-01','����� ������','M','010-1111-1111','1111@naver.com','�ϵ���',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX2','123456','������','2001-02-02','����� ���̱�','W','010-2222-2222','2222@naver.com','�̵���',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX3','123456','����','2001-03-03','����� ���ﱸ','W','010-3333-3333','3333@naver.com','�������',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX4','123456','������','2001-04-04','����� ������','M','010-4444-4444','4444@naver.com','�׸����',sysdate);
INSERT INTO CUSTOMER (CUSTOMER_NO,CUSTOMER_ID,CUSTOMER_PASSWORD,CUSTOMER_NAME,CUSTOMER_DOB,CUSTOMER_ADDRESS,CUSTOMER_GENDER,CUSTOMER_PHONE,CUSTOMER_EMAIL,CUSTOMER_NICKNAME,CUSTOMER_JOINDATE) 
VALUES (CUSTOMER_CUSTOMER_NO_SEQ.nextval,'IDEX5','123456','�����','2001-04-04','����� ������','M','010-5555-5555','5555@naver.com','�����̵���',sysdate);


--COUPON insert
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'30% ��������','A123456','30','������ǰ �� ǰ�� 30% ���� �����Դϴ�');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'25% ��������','B123456','25','������ǰ �� ǰ�� 25% ���� �����Դϴ�');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'20% ��������','C123456','20','������ǰ �� ǰ�� 20% ���� �����Դϴ�');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'15% ��������','D123456','15','������ǰ �� ǰ�� 15% ���� �����Դϴ�');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC) 
VALUES (COUPON_COUPON_NO_SEQ.nextval,'10% ��������','E123456','10','������ǰ �� ǰ�� 10% ���� �����Դϴ�');
INSERT INTO COUPON (COUPON_NO,COUPON_NAME,COUPON_ID,COUPON_DISCOUNT,COUPON_DESC)
VALUES (COUPON_COUPON_NO_SEQ.nextval,'5% ��������','F123456','5','������ǰ �� ǰ�� 5% ���� �����Դϴ�');


--CUSTOMER_COUPONS insert
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/09/30', '���Ұ�',1,1);
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/09/30', '���Ұ�',2,2);
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/10/31', '��밡��',3,3);
insert into customer_coupons VALUES(CUSTOMER_COUPONS_CUSTOMER_COUPONS_NO_SEQ.nextval,'2024/10/31', '��밡��',4,4);





--PRODUCT insert
--�Ǹ� ��(��� ����) : �Ǹ���
--�Ǹ� ��(��� ����) : OOS
--�Ǹ� ����      : �Ǹ�����

--�ڵ���, ��Ʈ��, �е�, ��ġ, �̾���, �Ǽ�����

--�ڵ���
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'������14','950000','phone','dp_iphone_14','phone14 description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'������15','1090000','phone','dp_iphone_15','phone15 description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'������16','1250000','phone','dp_iphone_16','phone16 description','active');

--��Ʈ��
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'�ƺ� ����','12500000','laptop','dp_laptop_air','air description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'�ƺ� ����','22500000','laptop','dp_laptop_pro','pro description','active');

--�е�
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'�����е�','1250000','pad','dp_pad_basic','basic pad description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'�����е� ����','1250000','pad','dp_pad_air','air pad description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'�����е� ����','1250000','pad','dp_pad_pro','pro pad description','active');

--��ġ
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'���̿�ġ','1250000','watch','dp_watch_basic','iwatch description','OOS');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'���̿�ġ SE','1250000','watch','dp_watch_SE','iwatch SE description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'���̿�ġ Ultra','1250000','watch','dp_watch_Ultra','iwatch Ultra description','active');

--�̾���
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'������','1250000','earphone','dp_airpod_basic','airpod description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'������ ����','1250000','earphone','dp_airpod_pro','airpod pro description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'������ �ƽ�','1250000','earphone','dp_airpod_max','airpod max description','active');

--�Ǽ�����
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'USB C-type','1250000','accessories','dp_USB_C-type','USB C-type description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'���� Ű����','1250000','accessories','dp_magickeyboard','magickeyboard description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'�ڵ��� ���̽�','1250000','accessories','dp_phone_case','phone case description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'��ġ ���','1250000','accessories','dp_watch_band_case','watch band description','active');
INSERT INTO product VALUES (PRODUCT_PRODUCT_NO_SEQ.NEXTVAL,'�ڵ��� ��ȭ�ʸ�','1250000','accessories','dp_phone_sp_case','phone screen protector description','active');


--PRODUCT_IMAGE insert
--�ڵ��� ����
INSERT INTO product_image values (product_image_product_image_no_seq.nextval, 'product_1_image_1', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_1_image_2', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_1_image_3', 1);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_2_image_1', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_2_image_2', 2);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_3_image_1', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_3_image_2', 3);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_3_image_3', 3);

--��Ʈ�� ����
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_4_image_1', 4);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_4_image_2', 4);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_5_image_1', 5);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_5_image_2', 5);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_5_image_3', 5);

--�е� ����
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_6_image_1', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_6_image_2', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_6_image_3', 6);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_7_image_1', 7);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_7_image_2', 7);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_8_image_1', 8);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_8_image_2', 8);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_8_image_3', 8);

--��ġ ����
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_9_image_1', 9);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_9_image_2', 9);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_10_image_1', 10);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_10_image_2', 10);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_11_image_1', 11);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_11_image_2', 11);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_11_image_3', 11);

--�̾��� ����
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_12_image_1', 12);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_13_image_1', 13);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_13_image_2', 13);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_14_image_1', 14);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_14_image_2', 14);
insert into product_image values (product_image_product_image_no_seq.nextval, 'product_14_image_3', 14);

--�Ǽ����� ����
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
--�ڵ���
insert into product_option values(product_option_product_option_no_seq.nextval,'��',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'�뷮',1);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'�뷮',2);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',3);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',3);
insert into product_option values(product_option_product_option_no_seq.nextval,'�뷮',3);

--��Ʈ��
insert into product_option values(product_option_product_option_no_seq.nextval,'Ĩ',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'�޸�',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'������',4);
insert into product_option values(product_option_product_option_no_seq.nextval,'Ĩ',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'�޸�',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',5);
insert into product_option values(product_option_product_option_no_seq.nextval,'������',5);

--�е�
insert into product_option values(product_option_product_option_no_seq.nextval,'����',6);
insert into product_option values(product_option_product_option_no_seq.nextval,'�޸�',6);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',6);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',7);
insert into product_option values(product_option_product_option_no_seq.nextval,'�޸�',7);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',7);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',8);
insert into product_option values(product_option_product_option_no_seq.nextval,'�޸�',8);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',8);

--��ġ
insert into product_option values(product_option_product_option_no_seq.nextval,'����',9);
insert into product_option values(product_option_product_option_no_seq.nextval,'������',9);
insert into product_option values(product_option_product_option_no_seq.nextval,'���̽�',9);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',10);
insert into product_option values(product_option_product_option_no_seq.nextval,'������',10);
insert into product_option values(product_option_product_option_no_seq.nextval,'���̽�',10);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',11);
insert into product_option values(product_option_product_option_no_seq.nextval,'������',11);
insert into product_option values(product_option_product_option_no_seq.nextval,'���̽�',11);

--�̾���

--�Ǽ�����
insert into product_option values(product_option_product_option_no_seq.nextval,'�ø���',17);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',17);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',17);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',18);
insert into product_option values(product_option_product_option_no_seq.nextval,'������',18);
insert into product_option values(product_option_product_option_no_seq.nextval,'����',18);
insert into product_option values(product_option_product_option_no_seq.nextval,'�ø���',19);
insert into product_option values(product_option_product_option_no_seq.nextval,'��',19);

--PRODUCT_OPTION_DETAIL insert
--�ڵ���
--�ڵ���: ������14
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',200000,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',300000,1);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Gold',0,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Black',0,2);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,3);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,3);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'1T',500000,3);
--�ڵ���: ������15
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,4);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',200000,4);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',300000,4);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,5);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Gold',0,5);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Black',0,5);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,6);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,6);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'1T',500000,6);
--�ڵ���: ������16
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,7);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',200000,7);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',300000,7);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,8);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Gold',0,8);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Black',0,8);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'256GB',0,9);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'512GB',300000,9);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'1T',500000,9);

--��Ʈ��
--��Ʈ��: 
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

--�е�
--�е�: �⺻
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,20);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,20);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'64GB',0,21);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'128GB',300000,21);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,22);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',200000,22);

--�е�: ����
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,23);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,23);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'64GB',0,24);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'128GB',400000,24);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,25);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',300000,25);

--�е�: ����
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,26);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,26);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'64GB',0,27);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'128GB',500000,27);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16GB',0,28);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'32GB',400000,28);


--��ġ
--��ġ: �⺻
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,29);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,29);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,30);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',100000,30);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',200000,30);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Aluminum',200000,31);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Titanium',300000,31);

--��ġ: ����
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,32);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,32);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,33);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',200000,33);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',300000,33);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Aluminum',300000,34);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Titanium',400000,34);

--��ġ: �ƽ�
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Space Gray',0,35);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Silver',0,35);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,36);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',300000,36);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',500000,36);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Aluminum',500000,37);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Titanium',700000,37);


--�̾���
--����


--�Ǽ�����
--�ڵ��� ���̽�
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'14',0,38);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'15',100000,38);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16',200000,38);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,39);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',100000,39);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',200000,39);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Black',0,40);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Green',0,40);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pink',0,40);

--��ġ ���
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,41);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'SE',100000,41);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Ultra',200000,41);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'S',0,42);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'M',100000,42);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'L',300000,42);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Black',0,43);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Green',0,43);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pink',0,43);


--�ڵ��� ��ȭ�ʸ�
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'14',0,44);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'15',100000,44);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'16',200000,44);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Basic',0,45);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro',100000,45);
insert into product_option_detail values (product_option_detail_product_option_detail_no_seq.nextval,'Pro Max',200000,45);





--ORDERS + OrderItems insert
--��� �� : �����
--��� �� : �����
--��� �Ϸ�: ��ۿ�
--���    : ���
INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,sysdate,sysdate+3,150000,125000,4,'����� �����','�����',1,1);

INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 1);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 35000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 2);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 50000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 3);


INSERT INTO ORDERS (ORDERS_NO,ORDERS_DATE,ORDERS_ARRIVALDATE,ORDERS_TOTPRICE,ORDERS_FINALPRICE,ORDERS_TOTQTY,ORDERS_ADDRESS,ORDERS_STATUS,CUSTOMER_NO,CUSTOMER_COUPONS_NO) 
VALUES (ORDERS_ORDERS_NO_SEQ.nextval,sysdate,sysdate+3,150000,125000,4,'����� ������','��ۿ�',2,1);

INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 1);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 25000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 2);
INSERT INTO orders_items (ORDERS_ITEMS_NO,ORDERS_ITEMS_PRICE,ORDERS_ITEMS_FINALPRICE,ORDERS_ITEMS_QTY,ORDERS_ITEMS_OPTIONS,ORDERS_NO,PRODUCT_NO)
values(orders_items_orders_items_no_seq.nextval, 30000, 20000, 1, 'description', ORDERS_ORDERS_NO_SEQ.currval, 3);



--cart  qty = 2, customer_no = 1, product_no = 1
INSERT INTO cart(cart_no, cart_qty, customer_no, product_no)
VALUES (cart_cart_no_seq.nextval ,2, 1, 1);
--product_selected 
INSERT INTO product_selected
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,cart_cart_no_seq.currval);
--product_selected_detail product_option_detail_no = 1, 5, 8
INSERT INTO product_selected_detail(product_selected_detail_no, product_selected_no, product_option_detail_no)
VALUES (product_selected_detail_product_selected_detail_no_SEQ.nextval,PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.currval,1);
INSERT INTO product_selected_detail(product_selected_detail_no, product_selected_no, product_option_detail_no)
VALUES (product_selected_detail_product_selected_detail_no_SEQ.nextval,PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.currval,5);
INSERT INTO product_selected_detail(product_selected_detail_no, product_selected_no, product_option_detail_no)
VALUES (product_selected_detail_product_selected_detail_no_SEQ.nextval,PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.currval,8);


--cart  qty = 1, customer_no = 2, product_no = 1
INSERT INTO cart(cart_no, cart_qty, customer_no, product_no)
VALUES (cart_cart_no_seq.nextval , 1, 2, 1);
--product_selected 
INSERT INTO product_selected
VALUES (PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.nextval,cart_cart_no_seq.currval);
--product_selected_detail product_option_detail_no = 1, 4, 7
INSERT INTO product_selected_detail(product_selected_detail_no, product_selected_no, product_option_detail_no)
VALUES (product_selected_detail_product_selected_detail_no_SEQ.nextval,PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.currval,1);
INSERT INTO product_selected_detail(product_selected_detail_no, product_selected_no, product_option_detail_no)
VALUES (product_selected_detail_product_selected_detail_no_SEQ.nextval,PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.currval,4);
INSERT INTO product_selected_detail(product_selected_detail_no, product_selected_no, product_option_detail_no)
VALUES (product_selected_detail_product_selected_detail_no_SEQ.nextval,PRODUCT_SELECTED_PRODUCT_SELECTED_NO_SEQ.currval,7);






--review insert
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '����1', '���䰡 �ʹ� ��վ��', '/image/review1', 5, 1, 1);
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '����2', '���𰡾����', '/image/review2', 1, 1, 2);
INSERT INTO Review (review_no, review_title, review_content, review_image, review_rating, product_no, customer_no) 
VALUES (Review_review_no_SEQ.nextval, '����3', '�����̿���', '/image/review3', 3, 1, 3);
