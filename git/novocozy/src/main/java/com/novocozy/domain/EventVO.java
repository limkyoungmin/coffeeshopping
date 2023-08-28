package com.novocozy.domain;

import java.util.Date;

public class EventVO {
	
	private int event_num;
	private AdminVO adminVo;
	private Date event_date;
	private String event_title;
	private String event_content;
	private String event_img;
	private String event_startdate;
	private String event_enddate;
	private String event_writer;
	
	public String getEvent_writer() {
		return event_writer;
	}

	public void setEvent_writer(String event_writer) {
		this.event_writer = event_writer;
	}

	public AdminVO getAdmin() {
		return adminVo;
	}

	public void setAdmin(AdminVO adminVo) {
		this.adminVo = adminVo;
	}

	public int getEvent_num() {
		return event_num;
	}
	
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	
	public Date getEvent_date() {
		return event_date;
	}
	
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
	
	public String getEvent_title() {
		return event_title;
	}
	
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	
	public String getEvent_content() {
		return event_content;
	}
	
	public void setEvent_content(String event_count) {
		this.event_content = event_count;
	}
	
	public String getEvent_img() {
		return event_img;
	}
	
	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}
	
	public String getEvent_startdate() {
		return event_startdate;
	}
	
	public void setEvent_startdate(String event_startdate) {
		this.event_startdate = event_startdate;
	}
	
	public String getEvent_enddate() {
		return event_enddate;
	}
	
	public void setEvent_enddate(String event_enddate) {
		this.event_enddate = event_enddate;
	}
	
	@Override
	public String toString() {
		return "EventVO [event_num=" + event_num + ", event_title=" + event_title + "event_date=" + event_date + ", event_content=" + event_content
				+ ", event_img=" + event_img + ", event_startdate=" + event_startdate + ", event_enddate=" + event_enddate + ", adminVo=" + adminVo
				+ ", event_writer=" + event_writer + "]";
	}
	
}
