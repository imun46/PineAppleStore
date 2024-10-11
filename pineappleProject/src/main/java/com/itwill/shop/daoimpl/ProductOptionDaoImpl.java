package com.itwill.shop.daoimpl;

import java.io.InputStream;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.dao.ProductOptionDao;
import com.itwill.shop.domain.ProductOption;
import com.itwill.shop.mapper.ProductOptionMapper;

public class ProductOptionDaoImpl implements ProductOptionDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public ProductOptionDaoImpl() {
		try {
			InputStream myBatisConfigInputStream = Resources.getResourceAsStream("mybatis-config-mapper-interface.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			this.sqlSessionFactory = sqlSessionFactoryBuilder.build(myBatisConfigInputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProductOption> findAll() throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductOptionMapper productOptionMapper = sqlSession.getMapper(ProductOptionMapper.class);
		List<ProductOption> productOptionList = productOptionMapper.findAll();
		sqlSession.close();
		return productOptionList;
	}

	@Override
	public List<ProductOption> findByProductNo(Integer productNo) throws Exception {
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		ProductOptionMapper productOptionMapper = sqlSession.getMapper(ProductOptionMapper.class);
		List<ProductOption> productOptionList = productOptionMapper.findByProductNo(productNo);
		sqlSession.close();
		return productOptionList;
	}


}