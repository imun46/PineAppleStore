package com.itwill.shop.dao;

import java.util.List;

import com.itwill.shop.domain.Product;

public interface ProductDao {
	
	// 전체 제품 리스트 반환
	public List<Product> findAll() throws Exception ;
	
	// 판매 중인 제품 리스트 반환
	public List<Product> findAllOnSale() throws Exception ;
	
	// 판매 중인 제품 리스트 반환 (OOS 제외)
	public List<Product> findAllOnSaleExclOOS() throws Exception ;
	
	// 카테고리 검색 제품 리스트 반환 (=)
	public List<Product> findByCategoryOnSale(String productCategory) throws Exception ;
	
	// 이름 검색 제품 리스트 반환 (LIKE)
	public List<Product> findByNameOnSale(String productName) throws Exception ;
	
	// 제품 번호 검색 제품 반환
	public Product findByNo(int productNo) throws Exception ;
	
}
