package com.novocozy.domain;

import java.util.List;

public class OrderVO {

	private int order_num; //주문번호
	private String users_id; //주문자 아이디
	private String order_date; //주문 날짜
	private String order_name; //받는이 이름
	private String order_zonecode; // 받는이 우편번호
	private String order_address; //받는이 주소
	private String order_addressdetail; //받는이 상세주소
	private String order_phone; //받는분 전화번호
	private String order_deliverymsg;//배송메세지
	private String order_buyer_name;//주문자 이름
	private String order_buyer_phone;//주문자 핸드폰번호
	private String order_buyer_email;//주문자 이메일
	private String order_request; // 배송현황
	private String order_courier; // 택배사
	private String order_trackingnum; // 송장번호
	
	private OrderDetailVO orderDetailVO;
	private List<ProductImgVO> imgList;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getUsers_id() {
		return users_id;
	}
	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_zonecode() {
		return order_zonecode;
	}
	public void setOrder_zonecode(String order_zonecode) {
		this.order_zonecode = order_zonecode;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_addressdetail() {
		return order_addressdetail;
	}
	public void setOrder_addressdetail(String order_addressdetail) {
		this.order_addressdetail = order_addressdetail;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_deliverymsg() {
		return order_deliverymsg;
	}
	public void setOrder_deliverymsg(String order_deliverymsg) {
		this.order_deliverymsg = order_deliverymsg;
	}
	public String getOrder_buyer_name() {
		return order_buyer_name;
	}
	public void setOrder_buyer_name(String order_buyer_name) {
		this.order_buyer_name = order_buyer_name;
	}
	public String getOrder_buyer_phone() {
		return order_buyer_phone;
	}
	public void setOrder_buyer_phone(String order_buyer_phone) {
		this.order_buyer_phone = order_buyer_phone;
	}
	public String getOrder_buyer_email() {
		return order_buyer_email;
	}
	public void setOrder_buyer_email(String order_buyer_email) {
		this.order_buyer_email = order_buyer_email;
	}

	public List<ProductImgVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ProductImgVO> imgList) {
		this.imgList = imgList;
	}
	public OrderDetailVO getOrderDetailVO() {
		return orderDetailVO;
	}
	public void setOrderDetailVO(OrderDetailVO orderDetailVO) {
		this.orderDetailVO = orderDetailVO;
	}
	public String getOrder_request() {
		return order_request;
	}
	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}
	public String getOrder_courier() {
		return order_courier;
	}
	public void setOrder_courier(String order_courier) {
		this.order_courier = order_courier;
	}
	public String getOrder_trackingnum() {
		return order_trackingnum;
	}
	public void setOrder_trackingnum(String order_trackingnum) {
		this.order_trackingnum = order_trackingnum;
	}
	@Override
	public String toString() {
		return "OrderVO [order_num=" + order_num + ", users_id=" + users_id + ", order_date=" + order_date
				+ ", order_name=" + order_name + ", order_zonecode=" + order_zonecode + ", order_address="
				+ order_address + ", order_addressdetail=" + order_addressdetail + ", order_phone=" + order_phone
				+ ", order_deliverymsg=" + order_deliverymsg + ", order_buyer_name=" + order_buyer_name
				+ ", order_buyer_phone=" + order_buyer_phone + ", order_buyer_email=" + order_buyer_email
				+ ", imgList=" + imgList + ", orderDetailVO=" + orderDetailVO + ", order_request=" + order_request + "]";
	}
	
	
}
