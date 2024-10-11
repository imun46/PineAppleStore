package com.itwill.pineappleTest;

import java.util.List;

import com.itwill.shop.domain.Product;
import com.itwill.shop.domain.ProductOption;
import com.itwill.shop.domain.ProductOptionDetail;
import com.itwill.shop.service.ProductService;

public class ProductServiceTest {

	public static void main(String[] args) throws Exception {
		
		// ProductService 객체 생성
		ProductService productService = new ProductService();
		
		/********** 전체 제품 리스트 출력 메스드 확인 *************/
//		List<Product> productsAll = productService.productListAll();
//		// 제품 리스트 출력
//		for (Product product : productsAll) {
//			System.out.println(product);
//		}
		
		/********** 판매 중인 전체 제품 리스트 출력 메스드 확인 *************/
//		List<Product> productsAllOnSale = productService.productListOnSale();
//		// 제품 리스트 출력
//		for (Product product : productsAllOnSale) {
//			System.out.println(product);
//		}
		
		/********** 판매 중인 전체 제품 리스트 (OOS 제외) 출력 메스드 확인 *************/
//		List<Product> productsAllOnSaleExclOOS = productService.productListOnSaleExclOOS();
//		// 제품 리스트 출력
//		for (Product product : productsAllOnSaleExclOOS) {
//			System.out.println(product);
//		}
		
		/********** 카테고리 검색 (LIKE) 판매 중인 전체 제품 리스트 (OOS 포함) 출력 메스드 확인 *************/
		// 검색 카테고리 선정
//		String category = "laptop";
//		List<Product> productListCategory = productService.productListByCategory(category);
//		// 제품 리스트 출력
//		for (Product product : productListCategory) {
//			System.out.println(product);
//		}
		
		/********** 이름 검색 판매 중인 전체 제품 리스트 (OOS 포함) 출력 메스드 확인 *************/
		// 검색 이름 선정
//		String productName = "맥스";
//		List<Product> productListName = productService.productListByName(productName);
//		// 제품 리스트 출력
//		for (Product product : productListName) {
//			System.out.println(product);
//		}
		
		/********** 제품 상세 내용 출력 메스드 확인 *************/
		// 제품 번호 선정
		int productNo = 1;
		Product productDetail = productService.productDetail(productNo);
		// 제품 정보 출력
		System.out.println("제품명: "+productDetail.getProductName());
		System.out.println("제품 전체 내용: "+productDetail);
		
		for (ProductOption productOption : productDetail.getProductOptionList()) {
			System.out.println("제품 옵션 이름: "+productOption.getProductOptionType());
			for (ProductOptionDetail productOptionDetail : productOption.getProductOptionDetailList()) {
				System.out.println("제품 옵션 상세: "+productOptionDetail);
			}
		}
		
	}

}
