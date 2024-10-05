package com.itwill.shop.product;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.mapper.ProductMapper;

public class ProductDaoImpl implements ProductDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public ProductDaoImpl() {
		try {
			InputStream myBatisConfigInputStream = Resources.getResourceAsStream("mybatis-config-mapper-interface.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			this.sqlSessionFactory = sqlSessionFactoryBuilder.build(myBatisConfigInputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Product> findAll() {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectAll();
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findAllOnSale() {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectAllOnSale();
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findAllOnSaleExclOOS() {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectAllOnSaleExclOOS();
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findByCategoryOnSale(String productCategory) {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectByCategoryOnSale(productCategory);
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findByNameOnSale(String productName) {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectByNameOnSale(productName);
		sqlSession.close();
		return productList;
	}
	
	@Override
	public Product findByNo(int productNo) {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Product product = productMapper.selectByNo(productNo);
		sqlSession.close();
		return product;
	}
	
	
}
