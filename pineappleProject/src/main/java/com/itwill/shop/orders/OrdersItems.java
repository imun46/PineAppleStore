package com.itwill.shop.orders;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class OrdersItems {
	private Integer ordersItemsNo;//PK
	private Integer ordersItemsPrice;
	private Integer ordersItemsFinalprice;
	private Integer ordersItemsQty;
	private String ordersItemsOptions;
	private Integer ordersNo;//FK
	private Integer productNo;//FK
}
