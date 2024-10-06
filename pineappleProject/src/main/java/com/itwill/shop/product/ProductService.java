package com.itwill.shop.product;

import java.util.List;

public class ProductService {
	
	private ProductDao productDao;
	
	public ProductService() throws Exception {
		this.productDao = new ProductDaoImpl();
	}
	
	public List<Product> productListOnSale() throws Exception {
		return productDao.findAllOnSale();
	}
	
	
	public List<Product> productListOnSaleExclOOS() throws Exception {
		return productDao.findAllOnSaleExclOOS();
	}
	
	
	public List<Product> productListByCategory(String productCategory) throws Exception {
		return productDao.findByCategoryOnSale(productCategory);
	}
	
	
	public List<Product> productListByName(String productName) throws Exception {
		return productDao.findByNameOnSale(productName);
	}
	
	
	public Product productDetail(int productNo) throws Exception {
		return productDao.findByNo(productNo);
	}
	
	
	public List<Product> productList() throws Exception {
		return productDao.findAll();
	}
	
	
	
}
