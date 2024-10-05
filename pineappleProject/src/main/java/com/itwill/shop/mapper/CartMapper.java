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
	
	
		int countByProductNo(String sCustomerId, int productSelectedNo) throws Exception;
		
		
		int insert(String sCustomerId, int productSelectedNo, int cartQty) throws Exception;
		
		int updateByProductNo(String sCustomerId, int productSelectNo, int cartQty) throws Exception;
		
		
		int updateByCartNo(int cartNo, int cartQty) throws Exception;
		
		
		List<Cart> findByCustomerId(String customerId) throws Exception;
		
		
		int deleteByCartNo(int cartNo) throws Exception;
		
		int deleteByCustomerId(String sCustomerId) throws Exception;
		
		Cart findByCartNo(int cartNo) throws Exception;


		
	

	
	
}
