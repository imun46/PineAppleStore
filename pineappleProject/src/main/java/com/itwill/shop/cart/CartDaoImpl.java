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
	public int insertCart(Cart cart) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		
		int rowCount = cartMapper.insertCart(cart);
		for(ProductSelected productSelected : cart.getProductSelectedList()) {
			cartMapper.insertProductSelected(productSelected);
		}
		
		sqlSession.close();
		return rowCount; 
	}
	
	@Override
	public int insertProductSelected(ProductSelected productSelected) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).insertProductSelected(productSelected);
		sqlSession.close();
		return rowCount; 
	}
	
	@Override
	public int countByProductNo(int cartNo, int productSelectedNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).countByProductNo(productSelectedNo, productSelectedNo, productSelectedNo, cartNo);
		sqlSession.close();
		return rowCount;
				
	}
	@Override
	public int updateByproductSelected(int productOptionDetail) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rowCount = sqlSession.getMapper(CartMapper.class).updateByproductSelected(productOptionDetail, productOptionDetail, productOptionDetail, productOptionDetail);
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
	public List<Cart> findByCartNo(int cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Cart> cartList = sqlSession.getMapper(CartMapper.class).findByCartNo(cartNo);
		sqlSession.close();
		return cartList;
	}
	
	@Override
	public List<Cart> findAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		List<Cart> cartList=cartMapper.findAll();
		sqlSession.close();
		return cartList;
	}
	@Override
	public List<Cart> findByCustomerNo(int customerNo) throws Exception {
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		List<Cart> cartList=cartMapper.findByCustomerNo(customerNo);
		sqlSession.close();
		return cartList;
	}
	

}
