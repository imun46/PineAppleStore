---------- select  customer -----------

-- 사용자 시퀀스 값 넣어주기
select customer_customer_no_seq.nextval from dual; 

-- (어드민전용)전체 사용자 리스트 출력
select * from customer; 

-- 사용자 유저 이름으로 아이디로 찾기
select * from customer where customer_id = 'IDEX1';
-- 사용자 유저 이름으로 번호로 찾기
select * from customer where customer_no = 1;

-- 사용자 중복 체크
select  count(*) from customer where customer_id = 'IDEX3';



------------ delete customer ----------------
-- (어드민전용) 전체 사용자 삭제
delete from customer;

-- 사용자 아이디로 삭제
delete from customer where customer_id = 'IDEX1';

-- 사용자 번호로 삭제
delete from customer where customer_no = 18;

------------ update customer -------------------


-- 사용자 정보 변경
update customer set 
customer_password = 123123 , 
customer_address = '아이티윌 강남' , 
customer_gender ='F', 
customer_phone ='010-3333-2221' ,
customer_email = 'alsdyd0506@naver.com',
customer_nickname = '야오밍'
where customer_no = 1;


















