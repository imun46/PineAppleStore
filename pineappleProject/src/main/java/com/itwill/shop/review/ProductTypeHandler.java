package com.itwill.shop.review;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.itwill.shop.product.Product;

public class ProductTypeHandler extends BaseTypeHandler<Product>{

	
	
	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Product parameter, JdbcType jdbcType) throws SQLException {
	    ps.setInt(i, parameter.getProductNo()); // ProductNo를 SQL 인티저로 설정
	}

	@Override
	public Product getNullableResult(ResultSet rs, String columnName) throws SQLException {
		int productNo = rs.getInt(columnName);
		return new Product(productNo, null, null, null, null, null, null, null);
	   
	}

	@Override
	public Product getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		int productNo = rs.getInt(columnIndex);
		return new Product(productNo, null, null, null, null, null, null, null);
		
	}
	

	@Override
	public Product getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		int productNo = cs.getInt(columnIndex);
		return new Product(productNo, null, null, null, null, null, null, null);
		
	}

}
