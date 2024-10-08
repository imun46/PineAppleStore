package com.itwill.pineappleTest;

import java.util.ArrayList;
import java.util.List;

import com.itwill.shop.cart.Cart;
import com.itwill.shop.cart.CartDao;
import com.itwill.shop.cart.CartDaoImpl;
import com.itwill.shop.cart.CartService;
import com.itwill.shop.cart.ProductSelected;
import com.itwill.shop.customer.Customer;
import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductOption;
import com.itwill.shop.product.ProductOptionDetail;

public class CartServiceTest {
	public static void main(String[] args) throws Exception {
		CartDao cartDao = new CartDaoImpl();
		CartService cartService = new CartService();
		
		/* 카트 등록 */
//		List<ProductSelected> productSelecteds = new ArrayList<>();
//		productSelecteds.add(ProductSelected.builder()
//								.product(Product.builder()
//												.productNo(1)
//												.productName("아이폰14")
//												.productPrice(950000)
//												.build())
//								.productOptionDetail(ProductOptionDetail.builder()
//												.productOptionDetailNo(2)
//												.productOptionDetailName("Pro")
//												.productOptionDetailPrice(200000)
//												.productOption(ProductOption.builder()
//																	.productOptionNo(1)
//																	.productOptionType("모델")
//																	.build())
//												.build())
//								.cart(Cart.builder().cartNo(1).build())
//								.build());
//		Cart newCart = Cart.builder()
//						.cartQty(3)
//						.customer(Customer.builder().customerNo(2).build())
//						.productSelectedList(productSelecteds)
//						.build();
//		
//		System.out.println("카트 등록: " + cartDao.insertCart(newCart));
//		
//		/* 카트 수정  */ // 
//		List<ProductSelected> updateProductSelecteds = new ArrayList<>();
//		updateProductSelecteds.add(ProductSelected.builder()
//												.productSelectedNo(6)
//												.productOptionDetail(ProductOptionDetail.builder().productOptionDetailNo(39).build())
//												.product(Product.builder()
//																.productNo(5)
//																.build())
//												.build());
//		Cart updateCart = Cart.builder()
//							.cartNo(3)
//							.cartQty(4)
//							.productSelectedList(updateProductSelecteds)
//							.build();
//		
//		System.out.println("수정" + cartService.update(updateCart));
//		
		
		/* 카트 한개 삭제 */
//		System.out.println("한개 삭제" + cartDao.deleteByCartNo(1));
		
//		/* 카트 전체 삭제 */
//		System.out.println("전체 삭제 :" + cartDao.deleteByCustomerNo(1));
//		
		/* 카트 리스트(어드민)*/
//		List<Cart> cartList = cartDao.findAll();
//		for (Cart cart : cartList) {
//			System.out.println(cart);
//		}

		/* 카트 리스트(회원)*/ //확인 필요
//		List<Cart> cartListByNo = cartDao.findByCartNo(3);
//		for (Cart cart : cartListByNo) {
//			System.out.println("카트 번호: "+cart.getCartNo());
//			for (ProductSelected productSelected : cart.getProductSelectedList()) {
//				System.out.println(productSelected);
//			}
//			System.out.println();
//		}
		
//		/* 카트 한개 리스트(회원)*/
//		System.out.println(cartDao.deleteByCustomerNo(2));
	}
}
