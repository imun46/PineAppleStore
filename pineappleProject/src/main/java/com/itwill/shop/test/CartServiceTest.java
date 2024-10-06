package com.itwill.shop.test;

import com.itwill.shop.cart.CartDao;
import com.itwill.shop.cart.CartDaoImpl;

public class CartServiceTest {
	public static void main(String[] args) throws Exception {
		CartDao cartDao = new CartDaoImpl();
		
//		System.out.println(cartDao.findAll());
		
		System.out.println(cartDao.findByCartNo(1));
		
		System.out.println(cartDao.deleteByCustomerNo(1));
	}
}
