package com.novocozy.domain;

import java.util.Date;

public class NoticeVO {
	
	private int notice_num;
	private AdminVO adminVo;
	private Date notice_date;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private String notice_img;
	
	
	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public AdminVO getAdmin() {
		return adminVo;
	}

	public void setAdmin(AdminVO adminVo) {
		this.adminVo = adminVo;
	}

	public int getNotice_num() {
		return notice_num;
	}
	
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	
	public Date getNotice_date() {
		return notice_date;
	}
	
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	public String getNotice_title() {
		return notice_title;
	}
	
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	
	public String getNotice_content() {
		return notice_content;
	}
	
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	public String getNotice_img() {
		return notice_img;
	}
	
	public void setNotice_img(String notice_img) {
		this.notice_img = notice_img;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_title="+ notice_title + ", notice_date" + notice_date
				+ ", notice_content=" + notice_content + ", notice_img=" + notice_img + ", adminVo=" + adminVo 
				+ ", notice_writer=" + notice_writer + "]";
	}
}
