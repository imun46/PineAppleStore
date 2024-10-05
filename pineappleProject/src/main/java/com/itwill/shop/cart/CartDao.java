package com.itwill.shop.cart;

import java.util.List;

public interface CartDao {
	
	//cart 제품 존재여부
	
	int countByProductNo(String sCustomerId, int productSelectedNo) throws Exception;
	
	//cart insert
	
	int insert(String sCustomerId, int productSelectedNo, int cartQty) throws Exception;
	
	//상품에서 카트 추가 업데이트
	
	int updateByProductNo(String sCustomerId, int productSelectNo, int cartQty) throws Exception;
	
	//카트리스트 수정
	
	int updateByCartNo(int cartNo, int cartQty) throws Exception;
	
	//cart pk delete
	
	int deleteByCartNo(int cartNo) throws Exception;
	
	// cart delete
	
	int deleteByCustomerId(String sCustomerId) throws Exception;
	
	Cart findByCartNo(int cartNo) throws Exception;
	
	//카트리스트
		
	List<Cart> findByCustomerId(String customerId) throws Exception;
	
	
}
