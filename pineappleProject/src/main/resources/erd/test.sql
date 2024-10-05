SELECT * FROM product;

--제품 전체 리스트 (판매 중지 제품 포함)
SELECT p.product_no, p.product_name, p.product_price, p.product_category, p.product_desc, p.product_status,
       pi.product_image_no, pi.product_image_file
  FROM product p
  JOIN product_image pi
    ON p.product_no=pi.product_no;
트
--판매 중인 제품 전체 리스트
SELECT p.product_no, p.product_name, p.product_price, p.product_category, p.product_desc, p.product_status,
       pi.product_image_no, pi.product_image_file
  FROM product p
  JOIN product_image pi
    ON p.product_no=pi.product_no
 WHERE p.product_status!='inactive';


--제품 상세 (PK)
SELECT p.product_no, p.product_name, p.product_price, p.product_category, p.product_detailpage, p.product_desc, p.product_status,
       pi.product_image_no, pi.product_image_file,
       po.product_option_no, po.product_option_type,
       pod.product_option_detail_no, pod.product_option_detail_name, pod.product_option_detail_price
  FROM product p
  JOIN product_image pi
    ON p.product_no=pi.product_no
  JOIN product_option po
    ON p.product_no=po.product_no
  JOIN product_option_detail pod
    ON po.product_option_no=pod.product_option_no
 WHERE p.product_no=1;


