package com.itwill.shop.service;

import java.util.List;

import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.dao.ProductOptionDao;
import com.itwill.shop.daoimpl.ProductDaoImpl;
import com.itwill.shop.daoimpl.ProductOptionDaoImpl;
import com.itwill.shop.domain.Product;

public class ProductService {
	
	private ProductDao productDao;
	private ProductOptionDao productOptionDao;
	
	public ProductService() throws Exception {
		this.productDao = new ProductDaoImpl();
		this.productOptionDao = new ProductOptionDaoImpl();
	}
	
	// 전체 제품 리스트 출력
	public List<Product> productListAll() throws Exception {
		return productDao.findAll();
	}
	
	
	// 판매 중인 전체 제품 리스트 출력
	public List<Product> productListOnSale() throws Exception {
		return productDao.findAllOnSale();
	}
	
	// 판매 중인 전체 제품 리스트 출력 (OOS 제외)
	public List<Product> productListOnSaleExclOOS() throws Exception {
		return productDao.findAllOnSaleExclOOS();
	}
	
	// 카테고리 검색 제품 리스트 출력 (OOS 포함) (=)
	public List<Product> productListByCategory(String productCategory) throws Exception {
		return productDao.findByCategoryOnSale(productCategory);
	}
	
	// 제품 이름 검색 제품 리스트 출력 (OOS 포함) (LIKE)
	public List<Product> productListByName(String productName) throws Exception {
		return productDao.findByNameOnSale(productName);
	}
	
	// 제품 상세 내용 출력
	public Product productDetail(Integer productNo) throws Exception {
		Product product = productDao.findByNo(productNo);
		product.setProductOptionList(productOptionDao.findByProductNo(productNo));
		return product;
	}
	
	// *어드민 전용
	// 전체 제품 리스트 출력
	public List<Product> productList() throws Exception {
		return productDao.findAll();
	}

}
