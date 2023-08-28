package com.novocozy.service;

import java.util.List;

import com.novocozy.domain.ProductImgVO;
import com.novocozy.domain.ProductVO;


public interface ProductService {
	public void createProduct(ProductVO productVo, List<ProductImgVO> imgList) throws Exception;
	public List<ProductVO> productList(int offset, int pageSize) throws Exception;
	public ProductVO productDetail(int product_num) throws Exception;
	public void productUpdate(ProductVO productVo, List<ProductImgVO> imgList) throws Exception;
	public void productDelete(int product_num) throws Exception;
	public int countList() throws Exception;
	public List<ProductVO> productCoffeeList() throws Exception;
	public List<ProductVO> productFoodList() throws Exception;
	public List<ProductVO> productGoodsList() throws Exception;
	public List<ProductVO> productMachineList() throws Exception;
}
