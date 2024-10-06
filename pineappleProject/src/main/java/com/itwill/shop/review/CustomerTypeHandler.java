package com.itwill.shop.review;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.itwill.shop.customer.Customer;

public class CustomerTypeHandler extends BaseTypeHandler<Customer>{

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Customer parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setInt(i, parameter.getCustomerNo());
	}

	@Override
	public Customer getNullableResult(ResultSet rs, String columnName) throws SQLException {
		int customerNo = rs.getInt(columnName);
		return new Customer(customerNo, null, null, null, null, null,null , null, null, null, null, null);
	}

	@Override
	public Customer getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		int customerNo = rs.getInt(columnIndex);
		return new Customer(customerNo, null, null, null, null, null,null , null, null, null, null, null);
		
	}

	@Override
	public Customer getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		int customerNo = cs.getInt(columnIndex);
		return new Customer(customerNo, null, null, null, null, null,null , null, null, null, null, null);
	}

}
