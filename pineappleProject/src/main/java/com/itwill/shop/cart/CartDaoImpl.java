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
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
		
	}
	
	//cart 제품 존재여부
	
	@Override
	public int countByProductNo(String sCustomerId, int productSelectedNo) throws Exception{
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int count = cartMapper.countByProductNo(sCustomerId, productSelectedNo);
		return count;
		
	}
	
	//cart insert
	@Override
	public int insert(String sCustomerId, int productSelectedNo, int cartQty) throws Exception{
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int insertRowCount = cartMapper.insert(sCustomerId, productSelectedNo, cartQty);
		sqlSession.close();
		return insertRowCount;
		
		
	}
	
	//상품에서 카트 추가 업데이트
	@Override
	public int updateByProductNo(String sCustomerId, int productSelectNo, int cartQty) throws Exception{
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateByProductNo(sCustomerId, productSelectNo, cartQty);
		sqlSession.close();
		return rowCount;
	}
	
	//카트리스트 수정
		@Override
		public int updateByCartNo(int cartNo, int cartQty) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateByCartNo(cartNo, cartQty);
		sqlSession.close();
		return 0;
		}
	
	// cart pk delete
	@Override
	public int deleteByCartNo(int cartNo) throws Exception{
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int deleteRowCount = cartMapper.deleteByCartNo(cartNo);
		sqlSession.close();
		return deleteRowCount;
	}
	
	// cart delete
	@Override
	public int deleteByCustomerId(String sCustomerId) throws Exception{
		SqlSession sqlSession= sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int deleteRowCount = cartMapper.deleteByCustomerId(sCustomerId);
		sqlSession.close();
		return deleteRowCount;
	}
	
	@Override
	public Cart findByCartNo(int cartNo) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		Cart cart = cartMapper.findByCartNo(cartNo);
		sqlSession.close();
		return cart;
	}
	
	//카트리스트

	@Override
	public List<Cart> findByCustomerId(String customerId) throws Exception {
		List<Cart> cartList=new ArrayList<Cart>();
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		cartList=cartMapper.findByCustomerId(customerId);
		sqlSession.close();
		return cartList;
	}
	
	
	
	

}
