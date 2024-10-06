package com.itwill.shop.product;

import java.util.List;

public interface ProductDao {
	
//	전체 제품 리스트 찾기
<<<<<<< HEAD
	public List<Product> findAll();
	

=======
	public List<Product> findAll() throws Exception ;
	
//	판매 중인 제품 리스트 찾기
	public List<Product> findAllOnSale() throws Exception ;
	
	public List<Product> findAllOnSaleExclOOS() throws Exception ;
	
	public List<Product> findByCategoryOnSale(String productCategory) throws Exception ;
	
	public List<Product> findByNameOnSale(String productName) throws Exception ;
	
	public Product findByNo(int productNo) throws Exception ;
>>>>>>> branch 'mjeong' of https://github.com/2024-07-JAVA-DEVELOPER-155/web-project-team1-pineapple.git
	
}
