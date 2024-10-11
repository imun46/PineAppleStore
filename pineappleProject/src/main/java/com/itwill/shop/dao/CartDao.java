package com.itwill.shop.dao;

import java.util.List;
import java.util.Map;

import com.itwill.shop.domain.Cart;
import com.itwill.shop.domain.ProductSelected;
import com.itwill.shop.domain.ProductSelectedDetail;

public interface CartDao {
	
	//create read update delete
	
	// 카트 등록
	int insertCart(Cart cart) throws Exception;
	
	// 선택된 제품 등록
	int insertProductSelected(ProductSelected productSelected) throws Exception;
	
	// 선택된 제품 옵션 등록
	int insertProductSelectedDetail(ProductSelectedDetail productSelectedDetail) throws Exception;
	
	// 카트 중복 체크용 제품 옵션 상세 번호 리스트 반환
	List<Integer> checkProductSelected(Map<String, Object> paramMap) throws Exception;
	
	// 카트 중복 체크용 선택된 제품 번호 리스트 반환
	List<Integer> findProductSelectedNoByCustomerNoProductNo(Map<String, Object> paramMap) throws Exception;
	
	// 선택된 제품 옵션 수정 (추후 추가 예정) 
	int updateByProductSelected() throws Exception;
	
	// 카트 수량 수정
	int updateCartQty(Integer cartNo, Integer cartQty) throws Exception;
	
	// 카트 수량 1개 증가
	int increaseCartQtyByOne(Integer cartNo) throws Exception;
	
	// 카트 수량 1개 감소
	int decreaseCartQtyByOne(Integer cartNo) throws Exception;
	
	
	// 카트 번호 기준 카트 한개 삭제
	int deleteByCartNo(Integer cartNo) throws Exception;
	
	// 회원 번호 기준 카트 전체 삭제
	int deleteByCustomerNo(Integer customerNo) throws Exception;
	
	
	// 카트 전체 리스트 반환 (어드민)
	List<Cart> findAll() throws Exception;
	
	// 회원 번호 검색 카트 리스트 반환 (회원)
	List<Cart> findByCustomerNo(Integer customerNo) throws Exception;
	
	// 카트 번호 검색 카트 한개 선택(회원)
	List<Cart> findByCartNo(Integer cartNo) throws Exception;
	
}
