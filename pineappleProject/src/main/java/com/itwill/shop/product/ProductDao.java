package com.itwill.shop.product;

import java.util.List;

public interface ProductDao {
	
//	전체 제품 리스트 찾기
	public List<Product> findAll();
	
//	판매 중인 제품 리스트 찾기
	public List<Product> findAllOnSale();
	
	public List<Product> findAllOnSaleExclOOS();
	
	public List<Product> findByCategoryOnSale(String productCategory);
	
	public List<Product> findByNameOnSale(String productName);
	
	public Product findByNo(int productNo);
	
}
