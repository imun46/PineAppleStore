INSERT INTO Cart(cart_no, cart_qty, customer_no)
VALUES (cart_cart_no_seq.nextval , 3, 1);

-- 카트 중복 옵션 체크

SELECT COUNT(*) as count
FROM product_selected ps
JOIN product_option_detail pod 
ON ps.product_option_detail_no = pod.product_option_detail_no
JOIN  product_option po 
ON pod.product_option_no = po.product_option_no
WHERE  ps.product_no =1 AND po.product_option_no = 1 AND pod.product_option_detail_no = 1 AND ps.cart_no = 1; 

--카트 상품 옵션 변경
--- productseleted 옵션 변경

UPDATE product_selected ps
SET ps.product_option_detail_no = 4
WHERE ps.product_option_detail_no IN (
    SELECT pd.product_option_detail_no
    FROM product_option_detail pd
    JOIN product_option po
    ON pd.product_option_no = po.product_option_no
    WHERE po.product_no = 1
    AND po.product_option_no = 2
);

--카트 수량 증가
update cart
set cart_qty = cart_qty + 1
where cart_no = 1;

--카트 1개 삭제
delete from cart where cart_no = 1;

--카트 전체 삭제
delete from cart where customderNo =1;

--카트 전체 리스트(어드민)
SELECT * FROM cart 

--카트 리스트(회원)
SELECT * FROM cart WHERE customerNo=1;

--카트에서 상품 한개 선택 리스트(회원)
SELECT * FROM cart 
WHERE customerNo=1;