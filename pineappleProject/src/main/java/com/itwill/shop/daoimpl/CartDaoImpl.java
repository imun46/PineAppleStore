package com.itwill.shop.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.dao.CartDao;
import com.itwill.shop.domain.Cart;
import com.itwill.shop.domain.ProductSelected;
import com.itwill.shop.domain.ProductSelectedDetail;
import com.itwill.shop.mapper.CartMapper;

public class CartDaoImpl implements CartDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public CartDaoImpl() throws Exception{
		this.sqlSessionFactory=new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
	}
	
	// 카트 등록
	@Override
	public int insertCart(Cart cart) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int cartNo = cartMapper.insertCart(cart);
		sqlSession.close();
		return cartNo; 
	}
	
	// 선택된 제품 등록
	@Override
	public int insertProductSelected(ProductSelected productSelected) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int productSelectedNo = cartMapper.insertProductSelected(productSelected);
		sqlSession.close();
		return productSelectedNo;
	}
	
	// 선택된 제품 옵션 등록
	@Override
	public int insertProductSelectedDetail(ProductSelectedDetail productSelectedDetail) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int productSelectedNo = cartMapper.insertProductSelectedDetail(productSelectedDetail);
		sqlSession.close();
		return productSelectedNo;
	}
	
	
	// 카트 중복 체크용 제품 옵션 상세 번호 리스트 반환
	@Override
	public List<Integer> checkProductSelected(Map<String, Object> paramMap) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		List<Integer> productOptionDetailNoList = cartMapper.checkProductSelected(paramMap);
		sqlSession.close();
		return productOptionDetailNoList;
	}
	
	// 카트 중복 체크용 선택된 제품 번호 리스트 반환
	@Override
	public List<Integer> findProductSelectedNoByCustomerNoProductNo(Map<String, Object> paramMap) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		List<Integer> productOptionDetailNoList = cartMapper.findProductSelectedNoByCustomerNoProductNo(paramMap);
		sqlSession.close();
		return productOptionDetailNoList;
	}
	
	@Override
	public int updateByProductSelected() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 카트 수량 수정
	@Override
	public int updateCartQty(Integer cartNo, Integer cartQty) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("cartNo", cartNo);
	    paramMap.put("cartQty", cartQty);
		int rowCount = cartMapper.updateCartQty(paramMap);
		sqlSession.close();
		return rowCount;
	}
	
	// 카트 수량 1개 증가
	public int increaseCartQtyByOne(Integer cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.increaseCartQtyByOne(cartNo);
		sqlSession.close();
		return rowCount;
	}
	
	// 카트 수량 1개 감소
	public int decreaseCartQtyByOne(Integer cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.decreaseCartQtyByOne(cartNo);
		sqlSession.close();
		return rowCount;
	}
	
	
	// 카트 번호 기준 카트 삭제
	@Override
	public int deleteByCartNo(Integer cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.deleteByCartNo(cartNo);
		sqlSession.close();
		return rowCount;
	}
	
	// 회원 번호 기준 카트 삭제
	@Override
	public int deleteByCustomerNo(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.deleteByCustomerNo(customerNo);
		sqlSession.close();
		return rowCount;
	}
	
	// 전체 카트 리스트 반환 (어드민)
	@Override
	public List<Cart> findAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		List<Cart> cartList = cartMapper.findAll();
		sqlSession.close();
		return cartList;
		
	// 회원 번호 기준 카트 리스트 반환
	}
	@Override
	public List<Cart> findByCustomerNo(Integer customerNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		List<Cart> cartList = cartMapper.findByCustomerNo(customerNo);
		sqlSession.close();
		return cartList;
	}
	
	// 카트 번호 기준 카트 리스트 반환
	@Override
	public List<Cart> findByCartNo(Integer cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		CartMapper cartMapper = sqlSession.getMapper(CartMapper.class);
		List<Cart> cartList = cartMapper.findByCartNo(cartNo);
		sqlSession.close();
		return cartList;
	}
	
}
