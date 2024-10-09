package com.itwill.shop.review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.customer.Customer;
import com.itwill.shop.mapper.ReviewMapper;
import com.itwill.shop.product.Product;

public class ReviewDaoImpl implements ReviewDao {
	
	private SqlSessionFactory sqlSessionFactory;
	public ReviewDaoImpl() throws Exception{
		this.sqlSessionFactory =
				new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
	}
	@Override
	public int insert(Review review) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int insertRowCount = reviewMapper.insert(review);
		sqlSession.close();
		return insertRowCount;
	}

	@Override
	public int update(Review review) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
		int rowCount = reviewMapper.update(review);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int delete(Integer reviewNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int rowCount=reviewMapper.delete(reviewNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public List<Review> findMyReview(Integer customerNo) throws Exception {
		List<Review> reviewList= new ArrayList<Review>();
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
		reviewList=reviewMapper.findMyReview(customerNo);
		sqlSession.close();
		return reviewList;
	}

	@Override
	public List<Review> findProductReview(Integer productNo) throws Exception {
		List<Review> reviewList= new ArrayList<Review>();
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
		reviewList=reviewMapper.findProductReview(productNo);
		sqlSession.close();
		return reviewList;
	}
	@Override
	public Review findByReview(Integer reviewNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		Review review=reviewMapper.findByReview(reviewNo);
		return review;
	}
}
