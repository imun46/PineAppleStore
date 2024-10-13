package com.itwill.shop.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.domain.Customer;
import com.itwill.shop.mapper.ReviewMapper;
import com.itwill.shop.dao.ReviewDao;
import com.itwill.shop.domain.Product;
import com.itwill.shop.domain.Review;

public class ReviewDaoImpl implements ReviewDao {
   
   private SqlSessionFactory sqlSessionFactory;
   public ReviewDaoImpl() throws Exception{
      this.sqlSessionFactory =
            new SqlSessionFactoryBuilder()
            .build(Resources.getResourceAsStream("mybatis-config-mapper-interface.xml"));
   }
   
   // 리뷰 작성 (리뷰 번호 반환)
   @Override
   public int insertReview(Review review) throws Exception {
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
      reviewMapper.insertReview(review);
      sqlSession.close();
      return review.getReviewNo();
   }
   
   // 리뷰 수정
   @Override
   public int updateReview(Review review) throws Exception {
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
      int rowCount = reviewMapper.updateReview(review);
      sqlSession.close();
      return rowCount;
   }
   
   // 리뷰 삭제
   @Override
   public int deleteReview(Integer reviewNo) throws Exception {
      SqlSession sqlSession=sqlSessionFactory.openSession(true);
      ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
      int rowCount=reviewMapper.deleteReview(reviewNo);
      sqlSession.close();
      return rowCount;
   }

   // 회원 번호로 리뷰 리스트 반환 (회원)
   @Override
   public List<Review> findReviewByCustomerNo(Integer customerNo) throws Exception {
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
      List<Review> reviewList=reviewMapper.findReviewByCustomerNo(customerNo);
      sqlSession.close();
      return reviewList;
   }
   
   
   // 제품 번호로 리뷰 리스트 반환
   @Override
   public List<Review> findReviewByProductNo(Integer productNo) throws Exception {
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
      List<Review> reviewList=reviewMapper.findReviewByProductNo(productNo);
      sqlSession.close();
      return reviewList;
   }
   
   // 리뷰 번호로 리뷰 한개 반환
   @Override
   public Review findReviewByReviewNo(Integer reviewNo) throws Exception {
      SqlSession sqlSession = sqlSessionFactory.openSession(true);
      ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
      Review review=reviewMapper.findReviewByReviewNo(reviewNo);
      sqlSession.close();
      return review;
   }
   
   // 전체 리뷰 리스트 반환 (어드민)
   @Override
   public List<Review> findAll() throws Exception {
	      SqlSession sqlSession = sqlSessionFactory.openSession(true);
	      ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
	      List<Review> reviewList=reviewMapper.findAll();
	      sqlSession.close();
	      return reviewList;
   }
   
   // 제품 번호로 리뷰 별점 리스트 반환
   @Override
   public List<Integer> findRatingsByProductNo(Integer productNo) throws Exception {
	      SqlSession sqlSession = sqlSessionFactory.openSession(true);
	      ReviewMapper reviewMapper =sqlSession.getMapper(ReviewMapper.class);
	      List<Integer> ratingList = reviewMapper.findRatingsByProductNo(productNo);
	      sqlSession.close();
	      return ratingList;
   }
   
}
