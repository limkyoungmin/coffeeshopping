package com.novocozy.domain;

import java.util.Arrays;
import java.util.List;

public class OrderDetailVO {
	
	private int[] Inorder_detail_num;
	private int[] Inorder_num;
	private int[] Inproduct_num;
	private String[] Inproduct_name;
	private int[] Inproduct_count;
	private int[] Inproduct_price;
	private char[] Inrefund_yn;
	

	private int order_detail_num;
	private int order_num;
	private int product_num;
	private String product_name;
	private int product_count;
	private int product_price;
	private char refund_yn;
	
	private List<ProductImgVO> imgList;
	private OrderVO orderVO;

	public int[] getInorder_detail_num() {
		return Inorder_detail_num;
	}

	public void setInorder_detail_num(int[] inorder_detail_num) {
		Inorder_detail_num = inorder_detail_num;
	}

	public int[] getInorder_num() {
		return Inorder_num;
	}

	public void setInorder_num(int[] inorder_num) {
		Inorder_num = inorder_num;
	}

	public int[] getInproduct_num() {
		return Inproduct_num;
	}

	public void setInproduct_num(int[] inproduct_num) {
		Inproduct_num = inproduct_num;
	}

	public String[] getInproduct_name() {
		return Inproduct_name;
	}

	public void setInproduct_name(String[] inproduct_name) {
		Inproduct_name = inproduct_name;
	}

	public int[] getInproduct_count() {
		return Inproduct_count;
	}

	public void setInproduct_count(int[] inproduct_count) {
		Inproduct_count = inproduct_count;
	}

	public int[] getInproduct_price() {
		return Inproduct_price;
	}

	public void setInproduct_price(int[] inproduct_price) {
		Inproduct_price = inproduct_price;
	}

	public char[] getInrefund_yn() {
		return Inrefund_yn;
	}

	public void setInrefund_yn(char[] inrefund_yn) {
		Inrefund_yn = inrefund_yn;
	}

	public int getOrder_detail_num() {
		return order_detail_num;
	}

	public void setOrder_detail_num(int order_detail_num) {
		this.order_detail_num = order_detail_num;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

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

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public char getRefund_yn() {
		return refund_yn;
	}

	public void setRefund_yn(char refund_yn) {
		this.refund_yn = refund_yn;
	}

	public List<ProductImgVO> getImgList() {
		return imgList;
	}

	public void setImgList(List<ProductImgVO> imgList) {
		this.imgList = imgList;
	}
	
	public OrderVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}

	@Override
	public String toString() {
		return "OrderDetailVO [Inorder_detail_num=" + Arrays.toString(Inorder_detail_num) + ", Inorder_num="
				+ Arrays.toString(Inorder_num) + ", Inproduct_num=" + Arrays.toString(Inproduct_num)
				+ ", Inproduct_name=" + Arrays.toString(Inproduct_name) + ", Inproduct_count="
				+ Arrays.toString(Inproduct_count) + ", Inproduct_price=" + Arrays.toString(Inproduct_price)
				+ ", Inrefund_yn=" + Arrays.toString(Inrefund_yn) + ", order_detail_num=" + order_detail_num
				+ ", order_num=" + order_num + ", product_num=" + product_num + ", product_name=" + product_name
				+ ", product_count=" + product_count + ", product_price=" + product_price + ", refund_yn=" + refund_yn
				+ ", imgList=" + imgList + ", orderVO=" + orderVO + "]";
	}
	
	
	
}
