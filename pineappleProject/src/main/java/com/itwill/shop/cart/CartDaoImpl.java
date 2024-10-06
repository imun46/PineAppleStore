package com.itwill.shop.cart;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.CartMapper;



public class CartDaoImpl implements CartDao {
	
	private SqlSessionFactory sqlSessionFactory;
	public CartDaoImpl() throws Exception{
		this.sqlSessionFactory=new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
		
	}
	@Override
	public int insert(Cart cart) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).insert(cart);
		sqlSession.close();
		return rowCount; 
	}
	@Override
	public int countByProductNo(int cartNo, int productSelectedNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).countByProductNo(cartNo, productSelectedNo);
		sqlSession.close();
		return rowCount;
				
	}
	@Override
	public int updateByproductSelected(int productOptionDetail) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).updateByproductSelected(productOptionDetail, productOptionDetail, productOptionDetail);
		sqlSession.close();
		return rowCount;
	}
	@Override
	public int update(Cart cart) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).update(cart);
		sqlSession.close();
		return rowCount;
	}
	@Override
	public int deleteByCartNo(int cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).deleteByCartNo(cartNo);
		sqlSession.close();
		return rowCount;
	}
	@Override
	public int deleteByCustomerNo(int customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).deleteByCustomerNo(customerNo);
		sqlSession.close();
		return rowCount;
	}
	
	@Override
	public Cart findByCartNo(int cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Cart cart = sqlSession.getMapper(CartMapper.class).findByCartNo(cartNo);
		sqlSession.close();
		return cart;
	}
	
	@Override
	public List<Cart> findAll() throws Exception {
		
		List<Cart> cartList = new ArrayList<Cart>();
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		cartList=cartMapper.findAll();
		sqlSession.close();
		return cartList;
	}
	@Override
	public List<Cart> findByCustomerNo(int customerNo) throws Exception {
		List<Cart> cartList = new ArrayList<Cart>();
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		cartList=cartMapper.findByCustomerNo(customerNo);
		sqlSession.close();
		return cartList;
	}
	

}
