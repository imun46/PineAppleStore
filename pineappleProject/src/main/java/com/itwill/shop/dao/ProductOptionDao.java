package com.itwill.shop.dao;

import java.util.List;

import com.itwill.shop.domain.ProductOption;

public interface ProductOptionDao {
	
	// 전체 옵션 리스트 반환
	public List<ProductOption> findAll() throws Exception;
	
	// 제품 번호 검색 옵션 리스트 반환
	public List<ProductOption> findByProductNo(Integer productNo) throws Exception;
	
}
