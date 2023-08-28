package com.novocozy.domain;

import java.util.Date;
import java.util.List;

public class ProductVO {
	
	private int product_num;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String product_cate;
	private Date product_date;
	private String product_deleted;
	private String product_content;
	
	private List<ProductImgVO> imgList;
	
	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_cate() {
		return product_cate;
	}

	public void setProduct_cate(String product_cate) {
		this.product_cate = product_cate;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public String getProduct_deleted() {
		return product_deleted;
	}

	public void setProduct_deleted(String product_deleted) {
		this.product_deleted = product_deleted;
	}
	
	public String getProduct_content() {
		return product_content;
	}
	
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	
	public List<ProductImgVO> getImgList() {
		return imgList;
	}

	public void setImgList(List<ProductImgVO> imgList) {
		this.imgList = imgList;
	}

	@Override
	public String toString() {
	    return "ProductVO [product_num=" + product_num + ", product_name=" + product_name
	            + ", product_price=" + product_price + ", product_stock=" + product_stock
	            + ", product_cate=" + product_cate
	            + ", product_date=" + product_date + ", product_deleted=" + product_deleted
	            + ", product_content=" + product_content  // 이 부분 수정
	            + ", imgList=" + imgList + "]";
	}

}
