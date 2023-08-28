package com.novocozy.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.novocozy.domain.ProductImgVO;
import com.novocozy.domain.ProductVO;

@Mapper
public interface ProductMapper {
	public int insertProduct(ProductVO productVo) throws Exception;
	public void insertProductImg(ProductImgVO imgVO) throws Exception;
	public List<ProductVO> productList(int offset, int pageSize) throws Exception;
	public ProductVO productDetail(int product_num) throws Exception;
	public void productUpdate(ProductVO productVo) throws Exception;
	public void deleteProductImages(int product_num) throws Exception;
	public void productDelete(int product_num) throws Exception;
	public int countList() throws Exception;
	public List<ProductVO> productCoffeeList() throws Exception;
	public List<ProductVO> productFoodList() throws Exception;
	public List<ProductVO> productGoodsList() throws Exception;
	public List<ProductVO> productMachineList() throws Exception;
}
