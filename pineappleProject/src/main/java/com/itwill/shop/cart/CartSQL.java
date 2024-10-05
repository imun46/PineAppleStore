package com.itwill.shop.cart;


public class CartSQL {
	public static final String CART_INSERT = "insert into cart(cartNo, cartQty, customerNo) values(cart_cart_no_seq.nextval,?,?";
	public static final String CART_SELECT_BY_CUSTOMERID = "select c.*,p.* from cart c join product p on c.p_no=p,p_no where customerid=?";
	public static final String CART_SELECT_BY_CARTNO = "select * from cart c join product p on c.p_no=p.p_no where cartNo";
	public static final String CART_COUNT_BY_CUSTOMERID = "select count(*) as p_count from cart where customerid=? and productSelectedNo=?";
	public static final String CART_DELETE_BY_CUSTOMERID = "delete from cart where customerid=?";
	public static final String CART_DELECT_BY_CARTNO = "delete from cart where cartNo = ?";
	public static final String CART_UPDATE_BY_CART_NO = "update cart set cartQty=? where cartNo=?";
	public static final String CART_UPDATE_BY_PRODUCT_NO_CUSTOMERID = "update cart set cartQty=cartQty=? where customerid=? and productSelectedNo=?";

}
