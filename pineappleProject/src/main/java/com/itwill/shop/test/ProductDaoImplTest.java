package com.itwill.shop.test;

import java.util.List;

import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductDao;
import com.itwill.shop.product.ProductDaoImpl;

public class ProductDaoImplTest {
	
	public static void main(String[] args) throws Exception  {
		ProductDao productDao = new ProductDaoImpl();
		
//		List<Product> productList = productDao.findAll();
//		
//		for(Product product : productList) {
//			System.out.println(product);
//		}
//		
//		System.out.println("");
//		
//		List<Product> productList1 = productDao.findAllOnSale();
//		
//		for(Product product : productList1) {
//			System.out.println(product);
//		}
//		
//		List<Product> productList2 = productDao.findAllOnSaleExclOOS();
//		
//		for(Product product : productList2) {
//			System.out.println(product);
//		}
//		
//		List<Product> productList3 = productDao.findByCategoryOnSale("핸드폰");
//		
//		for(Product product : productList3) {
//			System.out.println(product);
//		}
//		
//		List<Product> productList4 = productDao.findByNameOnSale("폰");
//		
//		for(Product product : productList4) {
//			System.out.println(product);
//		}
		
		
		Product productDetail = productDao.findByNo(1);
		System.out.println(productDetail);
		
	}
}
