package com.itwill.shop.orders;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class OrdersDaoImpl implements OrdersDao {
	SqlSessionFactory sqlSessionFactory;
	public OrdersDaoImpl() throws Exception {
		InputStream mybatisInputStream = Resources.getResourceAsStream("mybatis-config-mapper-interface");
		SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
		sqlSessionFactory = sqlSessionFactoryBuilder.build(mybatisInputStream);
	}
	@Override
	public int insert(Orders order) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Orders> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Orders> selectOrderByOrderItems() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int delete(int orderNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
