package com.itwill.shop.orders;

import java.util.Date;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.customer.CustomerCoupons;
import com.itwill.shop.product.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Orders {
	private Integer ordersNo;//PK
	private Date ordersDate;
	private Date ordersArrivaldate;
	private Integer ordersTotprice;
	private Integer ordersFinalprice;
	private Integer ordersTotqty;
	private String ordersAddress;
	private String ordersStatus;
	private Customer customerNo;//FK
	private CustomerCoupons customerCouponsNo;//FK
}
