package com.itwill.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.shop.product.Product;

@Mapper
public interface ProductMapper {
	
	public List<Product> selectAll();
	
	public List<Product> selectAllOnSale();
	
	public List<Product> selectAllOnSaleExclOOS();
	
	public List<Product> selectByCategoryOnSale(String productCategory);
	
	public List<Product> selectByNameOnSale(String productName);
	
	public Product selectByNo(int productNo);
	
}
