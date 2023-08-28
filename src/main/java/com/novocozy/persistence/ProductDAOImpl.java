package com.novocozy.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.novocozy.domain.ProductImgVO;
import com.novocozy.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.novocozy.mappers.ProductMapper";
	
	@Override
	public int insertProduct(ProductVO productVo) throws Exception {
	    return session.insert(namespace + ".insertProduct", productVo);
	}
	
    // 상품 이미지와 관련된 메서드 구현
    @Override
    public void insertProductImg(ProductImgVO imgVO) throws Exception {
        session.insert(namespace + ".productImgWrite", imgVO);
    }
    
	@Override
	public List<ProductVO> productList(int offset, int pageSize) throws Exception {
		return session.selectList(namespace + ".productList", Map.of("offset", offset, "pageSize", pageSize));
	}
	
	@Override
	public int countList() throws Exception {
	    return session.selectOne(namespace + ".countList");
	}
	
    @Override
    public ProductVO productDetail(int product_num) throws Exception {
        return session.selectOne(namespace + ".productDetail", product_num);
    }
	
	@Override
	public void productUpdate(ProductVO productVo) throws Exception {
		session.update(namespace + ".productUpdate", productVo);
	}
	
    @Override
    public void deleteProductImages(int product_num) throws Exception {
        session.delete(namespace + ".deleteProductImages", product_num);
    }
    
	@Override
	public void productDelete(int product_num) throws Exception {
		session.update(namespace + ".productDelete", product_num);
	}
	
    @Override 
    public List<ProductVO> productCoffeeList() throws Exception {
        return session.selectList(namespace + ".productCoffeeList");
    }
    
    @Override 
    public List<ProductVO> productFoodList() throws Exception {
        return session.selectList(namespace + ".productFoodList");
    }
    
    @Override 
    public List<ProductVO> productGoodsList() throws Exception{
        return session.selectList(namespace + ".productGoodsList");
    }
    
    @Override 
    public List<ProductVO> productMachineList() throws Exception{
        return session.selectList(namespace + ".productMachineList");
    }
}
