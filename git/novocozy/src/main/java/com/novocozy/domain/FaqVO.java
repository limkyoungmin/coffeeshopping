package com.novocozy.domain;

import java.util.Date;

public class FaqVO {

	private int faq_num; //게시글 번호
	private String admin_id; //관리자ID - 작성자
	private Date faq_date; //작성날짜	
	private String faq_title;  //게시글 제목
	private String faq_content; //게시글 내용
	
	public int getFaq_num() {
		return faq_num;
	}
	
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	public Date getFaq_date() {
		return faq_date;
	}
	
	public void setFaq_date(Date faq_date) {
		this.faq_date = faq_date;
	}
	
	public String getFaq_title() {
		return faq_title;
	}
	
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	@Override
	public String toString() {
		return "FaqVO [faq_num=" + faq_num + ", admin_id=" + admin_id + ", faq_date=" + faq_date + ", faq_title="
				+ faq_title + ", faq_content=" + faq_content + "]";
	}
	
	
}
