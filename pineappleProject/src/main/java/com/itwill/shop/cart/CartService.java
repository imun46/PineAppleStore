package com.itwill.shop.cart;

import java.util.ArrayList;
import java.util.List;

public class CartService {
	
	private CartDao cartDao;
	
	public CartService() throws Exception {
		cartDao = new CartDaoImpl();
	}
	
	/*카트 등록*/
	public int insertCart(Cart cart) throws Exception {
		return cartDao.insert(cart);
	}
	
	/*카트 중복 수정*/
	public int countByproductNo(int cartNo, int productSelectedNo) throws Exception{
		return cartDao.countByProductNo(cartNo, productSelectedNo);
	}
	
	/*카트 옵션 수정*/
	int updateByproductSelected(int productOptionDetail) throws Exception{
		return cartDao.updateByproductSelected(productOptionDetail);
	}
	
	/*카트 수량 증가*/
	int update(Cart cart) throws Exception{
		return cartDao.update(cart);
	}
	
	/*카트 한개 삭제*/
	int deleteByCartNo(int cartNo) throws Exception{
		return cartDao.deleteByCartNo(cartNo);
	}
	
	/*카트 전체 삭제*/
	
	int deleteByCustomerNo(int customerNo) throws Exception{
		return cartDao.deleteByCustomerNo(customerNo);
	}
	
	/*카트 전체 리스트(어드민)*/
	List<Cart> findAll() throws Exception{
		List<Cart> cartList = cartDao.findAll();
		return cartList;
	}
	
	/*카트 리스트 (회원)*/
	List<Cart> findByCustomerNo(int customerNo) throws Exception{
		List<Cart> cartList = cartDao.findByCustomerNo(customerNo);
		return cartList;
	}
	
	/*카트 한개 선택(회원)*/
	List<Cart> findByCartNo(int cartNo) throws Exception{
		List<Cart> cartList = new ArrayList<>();
		return cartList;
	}
}
