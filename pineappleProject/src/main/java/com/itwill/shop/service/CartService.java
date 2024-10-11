package com.itwill.shop.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.daoimpl.CartDaoImpl;
import com.itwill.shop.domain.Cart;
import com.itwill.shop.domain.ProductSelected;
import com.itwill.shop.domain.ProductSelectedDetail;

public class CartService {
	
	private CartDao cartDao;
	
	public CartService() throws Exception {
		this.cartDao = new CartDaoImpl();
	}
	
	// 카트 및 선택된 제품 등록
	public int insertCart(Cart cart) throws Exception {
		
		// 선택된 제품 중복 여부 확인용 데이터 추출
		// 회원 번호 추출
		int customerNo = cart.getCustomer().getCustomerNo();
		// 제품 번호 추출
		int productNo = cart.getProduct().getProductNo();
		// 선택된 제품 리스트 추출
		// 선택된 제품 옵션 리스트 객체 생성
		List<Integer> productSelectedOptionNoList = new ArrayList<>();
		// 선택된 제품 옵션 리스트에 옵션 리스트 입력
		ProductSelected productSelected = cart.getProductSelectedList().get(0);
		for (ProductSelectedDetail productSelectedDetail : productSelected.getProductSelectedDetailList()) {
			productSelectedOptionNoList.add(productSelectedDetail.getProductOptionDetail().getProductOptionDetailNo());
		}
		
		// 중복 여부 확인
		if(!checkProductSelected(customerNo, productNo, productSelectedOptionNoList)) {
			// 미중복 시
			// 카트 등록
			cartDao.insertCart(cart);
			// 선택된 제품 등록
			cartDao.insertProductSelected(cart.getProductSelectedList().get(0));
			// 선택된 제품 옵션 리스트 등록
			for(ProductSelectedDetail productSelectedDetail : cart.getProductSelectedList().get(0).getProductSelectedDetailList()) {
				productSelectedDetail.getProductSelected().setProductSelectedNo(cart.getProductSelectedList().get(0).getProductSelectedNo());
				cartDao.insertProductSelectedDetail(productSelectedDetail);
			}
			
		} else {
			cartDao.updateByProductSelected();
		}
		
		// 등록된 카트 번호 반환
		return cart.getCartNo();
	}
	
	// 카트 중복 여부 반환
	public boolean checkProductSelected(Integer customerNo, Integer productNo, List<Integer> productSelectedList) throws Exception{
		// 회원 번호와 제품 번호 해쉬맵 입력
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("customerNo", customerNo);
	    paramMap.put("productNo", productNo);
	    
	    // 회원 번호와 제품 번호 기준으로 선택된 제품 번호 리스트 출력
	    List<Integer> productSelectedNoList = cartDao.findProductSelectedNoByCustomerNoProductNo(paramMap);
	    
	    // 선택된 제품 번호 별로 전부 중복 여부 체크
	    for (Integer productSelectedNo : productSelectedNoList) {
	    	// 회원 번호, 제품 번호, 선택된 제품 번호 해쉬맵 입력
	    	Map<String, Object> paramMapCheck = new HashMap<>();
		    paramMapCheck.put("customerNo", customerNo);
		    paramMapCheck.put("productNo", productNo);
		    paramMapCheck.put("productSelectedNo", productSelectedNo);
	    	
		    // 회원 번호, 제품 번호와 선택된 제품에 따른 제품 옵션 상세 번호 리스트 반환 
		    List<Integer> checkProductSelectedList = cartDao.checkProductSelected(paramMapCheck);
		    
		    // 옵션 리스트 NULL이면 false 반환
		    if(checkProductSelectedList==null||productSelectedList==null) {
		    	return false;
		    }
		    // 옵션 리스트 내 NULL 값 제거
		    checkProductSelectedList.removeIf(Objects::isNull);
		    productSelectedList.removeIf(Objects::isNull);
		    
		    // 비교를 위한 리스트 정렬
		    Collections.sort(checkProductSelectedList);
		    Collections.sort(productSelectedList);
	    	
		    // 반환된 리스트와 선택한 제품 옵션 상세 리스트 비교 결과 true시 true 반환
		    if(checkProductSelectedList.equals(productSelectedList))
		    	return true;
	    	
	    }
		
	    // 반환된 비교 결과 true가 없을 시 false 반환
		return false;
	}
	
	// 카트 옵션 수정 (추후 수정 예정)
	public int updateByproductSelected() throws Exception{
		return cartDao.updateByProductSelected();
	}
	
	// 카트 수량 증가
	public int updateCartQty(Integer cartNo, Integer cartQty) throws Exception{
		return cartDao.updateCartQty(cartNo, cartQty);
	}
	
	// 카트 수량 1개 증가
	public int increaseCartQty(Integer cartNo) throws Exception{
		return cartDao.increaseCartQtyByOne(cartNo);
	}
	
	// 카트 수량 1개 감소
	public int decreaseCartQty(Integer cartNo) throws Exception{
		return cartDao.decreaseCartQtyByOne(cartNo);
	}
	
	
	
	
	// 카트 번호 기준 카트 한개 삭제
	public int deleteByCartNo(int cartNo) throws Exception{
		return cartDao.deleteByCartNo(cartNo);
	}
	
	// 회원 번호 기준 카트 전체 삭제
	public int deleteByCustomerNo(int customerNo) throws Exception{
		return cartDao.deleteByCustomerNo(customerNo);
	}
	
	
	
	// 카트 전체 리스트 반환 (어드민)
	public List<Cart> findAll() throws Exception{
		List<Cart> cartList = cartDao.findAll();
		return cartList;
	}
	
	// 회원 번호 검색 카트 리스트 반환 (회원)
	public List<Cart> findByCustomerNo(int customerNo) throws Exception{
		List<Cart> cartList = cartDao.findByCustomerNo(customerNo);
		return cartList;
	}
	
	// 카트 번호 검색 카트 반환 (회원)
	public List<Cart> findByCartNo(int cartNo) throws Exception{
		List<Cart> cartList = cartDao.findByCartNo(cartNo);
		return cartList;
	}
}
