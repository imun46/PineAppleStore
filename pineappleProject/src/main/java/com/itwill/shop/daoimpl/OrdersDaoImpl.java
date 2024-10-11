package com.itwill.shop.daoimpl;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.boot.autoconfigure.flyway.FlywayProperties.Sqlserver;

import com.itwill.shop.dao.OrdersDao;
import com.itwill.shop.domain.Orders;
import com.itwill.shop.domain.OrdersItems;
import com.itwill.shop.mapper.CartMapper;
import com.itwill.shop.mapper.OrdersMapper;

public class OrdersDaoImpl implements OrdersDao {
	SqlSessionFactory sqlSessionFactory;
	public OrdersDaoImpl() throws Exception {
		InputStream mybatisInputStream = Resources.getResourceAsStream("mybatis-config-mapper-interface.xml");
		SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
		sqlSessionFactory = sqlSessionFactoryBuilder.build(mybatisInputStream);
	}
	
	// 주문 등록
	@Override
	public int insertOrders(Orders order) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper =  sqlSession.getMapper(OrdersMapper.class);
		int rowCount = ordersMapper.insertOrders(order);
		sqlSession.close();
		return rowCount; 
	}
	
	// 주문 아이템 등록
	@Override
	public int insertOrdersItems(OrdersItems ordersItems) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper =  sqlSession.getMapper(OrdersMapper.class);
		int rowCount = ordersMapper.insertOrdersItems(ordersItems);
		sqlSession.close();
		return rowCount; 
	}
	
	// 배송 상태 변경 (어드민)
	@Override
	public int updateOrdersStatus(Map<String, Object> paramMap) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(OrdersMapper.class).updateOrdersStatus(paramMap);
		sqlSession.close();
		return rowCount;
	}
	
	// 구매 확정 (회원)
	@Override
	public int updateOrdersConfirm(Integer ordersNo) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(OrdersMapper.class).updateOrdersConfirm(ordersNo);
		sqlSession.close();
		return rowCount;
	}
	
	// 배송 시작 여부 확인
	public int checkOrdersStatusNotArrived(Integer ordersNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper =  sqlSession.getMapper(OrdersMapper.class);
		int rowCount = ordersMapper.checkOrdersStatusNotArrived(ordersNo);
		sqlSession.close();
		return rowCount; 
	}
		
	
	// 주문 취소 (회원)
	public int cancelOrdersByOrdersNo(Integer ordersNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper =  sqlSession.getMapper(OrdersMapper.class);
		int rowCount = ordersMapper.cancelOrdersByOrdersNo(ordersNo);
		sqlSession.close();
		return rowCount; 
	}
	
	
	
	

	// 주문 전체 리스트 반환 (어드민) (추후 구현 예정)
	@Override
	public List<Orders> findAll() throws Exception {
		return null;
	}
	
	// 주문 번호로 주문 + 주문 아이템 리스트 반환
	@Override
	public List<Orders> findByOrdersNo(Integer orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Orders> ordersList = sqlSession.getMapper(OrdersMapper.class).findByOrdersNo(orderNo);
		sqlSession.close();
		return ordersList;
	}

	// 주문 번호로 주문 + 주문 아이템 리스트 반환
	@Override
	public List<Orders> findByCustomerNo(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Orders> ordersList = sqlSession.getMapper(OrdersMapper.class).findByCustomerNo(customerNo);
		sqlSession.close();
		return ordersList;
	}
	
	// 주문 번호로 주문 삭제
	@Override
	public int deleteByOrdersNo(Integer orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrdersMapper ordersMapper = sqlSession.getMapper(OrdersMapper.class);
		int rowCount = ordersMapper.deleteByOrdersNo(orderNo);
		sqlSession.close();
		return rowCount;
	}


}
