package com.itwill.shop.product;



import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductOption {
	private Integer productOptionNo;//PK
	private String productOptionType;
	
	private Product product;	//FK
	private List<ProductOptionDetail> productOptionDetailList;
}
