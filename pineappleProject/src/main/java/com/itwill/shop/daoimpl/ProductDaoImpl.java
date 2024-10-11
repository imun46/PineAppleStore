package com.itwill.shop.daoimpl;

import java.io.InputStream;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.dao.ProductDao;
import com.itwill.shop.domain.Product;
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
	public List<Product> findAll() throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAll();
		sqlSession.close();
		return productList;
	}

	@Override
	public List<Product> findAllOnSale() throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAllOnSale();
		sqlSession.close();
		return productList;
	}

	@Override
	public List<Product> findAllOnSaleExclOOS() throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAllOnSaleExclOOS();
		sqlSession.close();
		return productList;
	}

	@Override
	public List<Product> findByCategoryOnSale(String productCategory) throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByCategoryOnSale(productCategory);
		sqlSession.close();
		return productList;
	}

	@Override
	public List<Product> findByNameOnSale(String productName) throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findByNameOnSale(productName);
		sqlSession.close();
		return productList;
	}

	@Override
	public Product findByNo(int productNo) throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Product product = productMapper.findByNo(productNo);
		sqlSession.close();
		return product;
	}
	
}