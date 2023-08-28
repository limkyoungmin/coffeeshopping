package com.novocozy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novocozy.domain.ProductImgVO;
import com.novocozy.domain.ProductVO;
import com.novocozy.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDao;
	
    @Override
    public void createProduct(ProductVO productVo, List<ProductImgVO> imgList) throws Exception {
        // 상품 정보 데이터베이스에 저장
        productDao.insertProduct(productVo);

        // 상품 이미지 정보 데이터베이스에 저장
        for (ProductImgVO imgVO : imgList) {
            imgVO.setProduct_num(productVo.getProduct_num());
            productDao.insertProductImg(imgVO);
        }
    }
	
	@Override
	public List<ProductVO> productList(int offset, int pageSize) throws Exception {
		return productDao.productList(offset, pageSize);
	}

	@Override
	public int countList() throws Exception {
	    return productDao.countList();
	}
	
	@Override
    public ProductVO productDetail(int product_num) throws Exception {
        return productDao.productDetail(product_num);
    }
	
	@Override
	public void productUpdate(ProductVO productVo, List<ProductImgVO> imgList) throws Exception {
		
	    productDao.productUpdate(productVo);

	    if (imgList != null && !imgList.isEmpty()) {
	        productDao.deleteProductImages(productVo.getProduct_num()); // Delete existing images
	        for (ProductImgVO imgVO : imgList) {
	            imgVO.setProduct_num(productVo.getProduct_num());
	            productDao.insertProductImg(imgVO); // Insert new images
	        }
	    }
	}
	
	@Override
	public void productDelete(int product_num) throws Exception {
		productDao.productDelete(product_num);
	}
	
	@Override
	public List<ProductVO> productCoffeeList() throws Exception {
		
	    return productDao.productCoffeeList();
    }
	
	@Override
	public List<ProductVO> productFoodList() throws Exception {
		
	    return productDao.productFoodList();
    }
	
	@Override
	public List<ProductVO> productGoodsList() throws Exception {
		return productDao.productGoodsList();
	}
	
	@Override
	public List<ProductVO> productMachineList() throws Exception {
		return productDao.productMachineList();
	}
}
