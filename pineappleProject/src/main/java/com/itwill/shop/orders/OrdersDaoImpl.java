package com.itwill.shop.orders;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.boot.autoconfigure.flyway.FlywayProperties.Sqlserver;

import com.itwill.shop.mapper.OrdersMapper;

public class OrdersDaoImpl implements OrdersDao {
	SqlSessionFactory sqlSessionFactory;
	public OrdersDaoImpl() throws Exception {
		InputStream mybatisInputStream = Resources.getResourceAsStream("mybatis-config-mapper-interface.xml");
		SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
		sqlSessionFactory = sqlSessionFactoryBuilder.build(mybatisInputStream);
	}
	
	@Override
	public int insertOrder(Orders order) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper =  sqlSession.getMapper(OrdersMapper.class);
		
		ordersMapper.insertOrder(order);
		for(OrdersItems orderItems:order.getOrderItemList()) {
			ordersMapper.insertOrderItem(orderItems);
		}
		
		sqlSession.close();
		return 1; 
	}
	
	@Override
	public List<Orders> findAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper = sqlSession.getMapper(OrdersMapper.class);
		List<Orders> orderList = ordersMapper.selectAll();
		sqlSession.close();
		return orderList;
	}
	
	@Override
	public List<Orders> findByOrderNo(int orderNo) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper = sqlSession.getMapper(OrdersMapper.class);
		List<Orders> orderList = ordersMapper.selectByOrderNo(orderNo);
		return orderList;
	}
	
	@Override
	public int deleteOrder(int orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper = sqlSession.getMapper(OrdersMapper.class);
		return ordersMapper.delete(orderNo);
	}

	

	
}
