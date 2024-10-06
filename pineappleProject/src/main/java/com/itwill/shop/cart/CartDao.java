package com.itwill.shop.cart;

import java.util.List;

public interface CartDao {
	
	//create read update delete
	
	//카트 등록
	int insert(Cart cart) throws Exception;
	
	//카트 중복 체크
	int countByProductNo(int cartNo, int productSelectedNo) throws Exception;
	
	//카트 옵션 수정
	int updateByproductSelected(int productOptionDetail) throws Exception;
	
	//카트 수량 증가
	int update(Cart cart) throws Exception;
	
	//카트 한개 삭제
	int deleteByCartNo(int cartNo) throws Exception;
	
	//카트 전체 삭제
	
	int deleteByCustomerNo(int customerNo) throws Exception;
	
	
	//카트 전체 리스트(어드민)
	List<Cart> findAll() throws Exception;
	
	//카트 리스트 (회원)
	List<Cart> findByCustomerNo(int customerNo) throws Exception;
	
	//카트 한개 선택(회원)
	List<Cart> findByCartNo(int cartNo) throws Exception;
	
}
