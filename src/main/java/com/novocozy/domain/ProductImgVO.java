package com.novocozy.domain;

public class ProductImgVO {
	
	private int img_num;
	private int product_num;
	private String img_name;
	private String img_url;
	
	public int getImg_num() {
		return img_num;
	}
	public void setImg_num(int img_num) {
		this.img_num = img_num;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	@Override
	public String toString() {
		return "ProductImgVO [img_num=" + img_num + ", product_num=" + product_num
				+ ", img_name=" + img_name + ", img_url=" + img_url +"]";
	}
}
