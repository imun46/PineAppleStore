package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.cart.Cart;
import com.itwill.shop.cart.ProductSelected;

public interface CartMapper {
	
	//카트 등록
	int insertCart(Cart cart) throws Exception;
	
	//카트 등록
	int insertProductSelected(ProductSelected productSelected) throws Exception;
	
	//카트 중복 체크
	int countByProductNo(int productNo, int productoptionNo, int productOptionDetailNo, int cartNo) throws Exception;
	
	//카트 옵션 수정
	int updateByproductSelected(int productNo, int productoptionNo, int productOptionDetailNo, int cartNo) throws Exception;
	
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
