package com.itwill.pineappleTest;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.List;

import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		
		ProductService productService = new ProductService();
		
//		판매 중인 제품 리스팅
//		List<Product> productListAll = productService.productListOnSale();
//		for (Product product : productListAll) {
//			System.out.println(product);
//		}
		
//		카테고리 선택 시 제품 리스팅
//		List<Product> productListCategory = productService.productListByCategory("phone");
//		for (Product product : productListCategory) {
//			System.out.println(product);
//		}
		
//		이름으로 제품 검색
//		List<Product> productListSearchByName = productService.productListByName("폰");
//		for (Product product : productListSearchByName) {
//			System.out.println(product);
//		}
		
//		제품 상세페이지
//		Product productDetail = productService.productDetail(1);
//		System.out.println(productDetail);
		
		
	}

}
