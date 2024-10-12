package com.itwill.pineappleTest;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.daoimpl.CartDaoImpl;
import com.itwill.shop.domain.Cart;
import com.itwill.shop.domain.Customer;
import com.itwill.shop.domain.Product;
import com.itwill.shop.domain.ProductImage;
import com.itwill.shop.domain.ProductOptionDetail;
import com.itwill.shop.domain.ProductSelected;
import com.itwill.shop.domain.ProductSelectedDetail;
import com.itwill.shop.service.CartService;

public class CartServiceTest {

	public static void main(String[] args) throws Exception {
		
		CartService cartService = new CartService();
		
		/***************** 카트 중복 여부 서비스 메서드 체크 ********************/
		// 이미 있는 선택된 제품 옵션 리스트 작성
//		List<Integer> receivedPODNList = new ArrayList<Integer>();
//		receivedPODNList.add(2);
//		receivedPODNList.add(5);
//		receivedPODNList.add(8);
//		int customerNo = 1;
//		int productNo = 1;
//		int productSelectedNo = 1;
//		// 이미 존재하는 회원 번호, 제품 번호, 제품 옵션 상세 번호 리스트 입력
//		boolean checkDuplicate = cartService.checkProductSelected(customerNo, productNo, productSelectedNo, receivedPODNList);
//		// 존재 여부 반환
//		System.out.println(checkDuplicate);
		
		
		/***************** 카트 등록 메서드 체크 ********************/
		// 새로운 제품 카트 넣기
		// 회원 번호, 제품 번호, 수량 및 제품 옵션 상세 번호 지정
//		int customerNo = 1;
//		int productNo = 1;
//		int cartQty = 1;
//		int productOptionDetailNo1 = 1;
//		int productOptionDetailNo2 = 3;
//		int productOptionDetailNo3 = 8;
//		ProductSelected productSelected = new ProductSelected();
//		// 선택된 제품 옵션 내용 입력
//		ProductSelectedDetail productSelectedDetail1 = ProductSelectedDetail.builder()
//				.productOptionDetail(ProductOptionDetail.builder().productOptionDetailNo(productOptionDetailNo1).build())
//				.productSelected(productSelected)
//				.build();
//		ProductSelectedDetail productSelectedDetail2 = ProductSelectedDetail.builder()
//				.productOptionDetail(ProductOptionDetail.builder().productOptionDetailNo(productOptionDetailNo2).build())
//				.productSelected(productSelected)
//				.build();
//		ProductSelectedDetail productSelectedDetail3 = ProductSelectedDetail.builder()
//				.productOptionDetail(ProductOptionDetail.builder().productOptionDetailNo(productOptionDetailNo3).build())
//				.productSelected(productSelected)
//				.build();
//		List<ProductSelectedDetail> productSelectedDetailList = new ArrayList<>();
//		productSelectedDetailList.add(productSelectedDetail1);
//		productSelectedDetailList.add(productSelectedDetail2);
//		productSelectedDetailList.add(productSelectedDetail3);
//		
//		// 선택된 제품 내용 입력
//		ProductSelected productSelected1 = 
//				ProductSelected.builder()
//				.productSelectedDetailList(productSelectedDetailList)
//				.build();
//		List<ProductSelected> productSelectedList = new ArrayList<>();
//		productSelectedList.add(productSelected1);
//		
//		// 카트 객체 생성
//		Cart newCart = Cart.builder()
//							.cartNo(0)
//							.cartQty(cartQty)
//							.customer(Customer.builder()
//												.customerNo(customerNo)
//												.build())
//							.product(Product.builder().productNo(productNo).build())
//							.productSelectedList(productSelectedList)
//						.build();
//		// 카트 등록 진행
//		int newCartInt = cartService.insertCart(newCart);
//		
//		// 카트 등록 후 카트 번호 반환, 실패 시 0 반환
//		System.out.println("입력된 cart_no:"+newCartInt);
		
		
		/************* 카트 수량 증가 *************/
		// 카트 번호, 카트 수량 지정
//		int cartNo = 1;
//		int cartQty = 5;
//		
//		int rowCount = cartService.updateCartQty(cartNo, cartQty);
//		System.out.println(rowCount);
		
		
		/************ 카트 수량 1개 증감 ***********/
		// 카트 번호, 카트 수량 지정
//		int cartNo = 1;
//		
//		int rowCount = cartService.increaseCartQty(cartNo);
//		int rowCount = cartService.decreaseCartQty(cartNo);
//		System.out.println(rowCount);
		
		
		/************* 카트 리스트 반환 메서드 **************/
		// 회원, 카트 번호 지정
		int customerNo = 1;
		int cartNo = 1;
		
//		List<Cart> cartList = cartService.findAll();
		List<Cart> cartListCustomerNo = cartService.findByCustomerNo(customerNo);
//		List<Cart> cartListCartNo = cartService.findByCartNo(cartNo);
		
		// 회원 번호 기준 카트 리스트
		for (Cart cart : cartListCustomerNo) {
			System.out.println("CartNo="+cart.getCartNo());
			System.out.println("CartQty="+cart.getCartQty());
			System.out.println("ProductNo="+cart.getProduct().getProductNo());
			System.out.println("ProductName="+cart.getProduct().getProductName());
			System.out.println("ProductPrice="+cart.getProduct().getProductPrice());
			System.out.println("Product Images");
			for (ProductImage productImage : cart.getProduct().getProductImageList()) {
				System.out.println(productImage.getProductImageFile());
			}
			System.out.println("ProductOptions");
			for (ProductSelected productSelected : cart.getProductSelectedList()) {
				for (ProductSelectedDetail productSelectedDetail : productSelected.getProductSelectedDetailList()) {
					System.out.println("ProductOptionType"+productSelectedDetail.getProductOptionDetail().getProductOption().getProductOptionType());
					System.out.println("ProductOptionDetail"+productSelectedDetail.getProductOptionDetail().getProductOptionDetailName());
					System.out.println("ProductOptionPrice"+productSelectedDetail.getProductOptionDetail().getProductOptionDetailPrice());
				}
			}
			System.out.println("**********************************");
		}
//		// 카트 번호 기준 카트 리스트
//		for (Cart cart : cartListCartNo) {
//			System.out.println("CartNo="+cart.getCartNo());
//			System.out.println("CartQty="+cart.getCartQty());
//			System.out.println("ProductNo="+cart.getProduct().getProductNo());
//			System.out.println("ProductName="+cart.getProduct().getProductName());
//			System.out.println("ProductPrice="+cart.getProduct().getProductPrice());
//			System.out.println("Product Images");
//			for (ProductImage productImage : cart.getProduct().getProductImageList()) {
//				System.out.println(productImage.getProductImageFile());
//			}
//			System.out.println("ProductOptions");
//			for (ProductSelected productSelected : cart.getProductSelectedList()) {
//				for (ProductSelectedDetail productSelectedDetail : productSelected.getProductSelectedDetailList()) {
//					System.out.println("ProductOptionType"+productSelectedDetail.getProductOptionDetail().getProductOption().getProductOptionType());
//					System.out.println("ProductOptionDetail"+productSelectedDetail.getProductOptionDetail().getProductOptionDetailName());
//					System.out.println("ProductOptionPrice"+productSelectedDetail.getProductOptionDetail().getProductOptionDetailPrice());
//				}
//			}
//			System.out.println("**********************************");
//		}
		
		
		
		
	}

}
