package com.itwill.shop.product;

<<<<<<< HEAD
import java.util.List;

public class ProductDaoImpl implements ProductDao {
=======
import java.io.InputStream;
import java.util.List;
>>>>>>> branch 'mjeong' of https://github.com/2024-07-JAVA-DEVELOPER-155/web-project-team1-pineapple.git

<<<<<<< HEAD
	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return null;
=======
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
	public List<Product> findAll() throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectAll();
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findAllOnSale() throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectAllOnSale();
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findAllOnSaleExclOOS() throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectAllOnSaleExclOOS();
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findByCategoryOnSale(String productCategory) throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectByCategoryOnSale(productCategory);
		sqlSession.close();
		return productList;
	}
	
	@Override
	public List<Product> findByNameOnSale(String productName) throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.selectByNameOnSale(productName);
		sqlSession.close();
		return productList;
	}
	
	@Override
	public Product findByNo(int productNo) throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Product product = productMapper.selectByNo(productNo);
		sqlSession.close();
		return product;
>>>>>>> branch 'mjeong' of https://github.com/2024-07-JAVA-DEVELOPER-155/web-project-team1-pineapple.git
	}
	
}
