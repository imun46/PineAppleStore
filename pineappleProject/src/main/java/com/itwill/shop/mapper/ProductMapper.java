package com.itwill.shop.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.shop.product.Product;

@Mapper
public interface ProductMapper {
	
	public List<Product> selectAll() throws Exception ;
	
	public List<Product> selectAllOnSale() throws Exception ;
	
	public List<Product> selectAllOnSaleExclOOS() throws Exception ;
	
	public List<Product> selectByCategoryOnSale(String productCategory) throws Exception ;
	
	public List<Product> selectByNameOnSale(String productName) throws Exception ;
	
	public Product selectByNo(int productNo) throws Exception ;
	
}
