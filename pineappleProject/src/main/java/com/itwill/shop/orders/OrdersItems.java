package com.itwill.shop.orders;

import java.util.Date;

import com.itwill.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class OrdersItems {
	/****PK****/
	private Integer ordersItemsNo;
	private Integer ordersItemsprice;
	private Integer ordersItemsFinalprice;
	private Integer ordersItemsQty;
	private String ordersItemsOptions;
	
	/****FK****/
	private Orders orders;
	private Product product;
}
