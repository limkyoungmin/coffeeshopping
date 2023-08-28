package com.novocozy.domain;

import java.util.List;

public class OrderItemVO {
	private int index;

	private int cart_num;
	private String users_id;
	private int product_num;
	private ProductVO productVO;
	private int product_count;
	private List<ProductImgVO> imgList;
	
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public String getUsers_id() {
		return users_id;
	}
	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public List<ProductImgVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ProductImgVO> imgList) {
		this.imgList = imgList;
	}
	
	@Override
	public String toString() {
		return "OrderItemVO [cart_num=" + cart_num + ", users_id=" + users_id + ", product_num=" + product_num
				+ ", productVO=" + productVO + ", product_count=" + product_count + ", imgList=" + imgList + "]";
	}
}
