package com.novocozy.domain;

import java.util.Date;

public class QnaVO {

	
	private int qna_num; //게시글 번호nn
	private String users_id; //유저ID - 작성자nn
	private Date qna_date; //작성날짜nn
	private String qna_type;//문의유형nn
	private String qna_title;  //게시글 제목nn
	private String qna_content; //게시글 내용nn
	private String qna_adcontent;//관리자글 내용
	private String qna_img;//게시물 이미지
	private String qna_passwd;//게시물 비밀번호	
	private String qna_yn;//게시물답변여부
	private int qna_readcount;//게시물 조회수
	private int qna_ref;//게시물ref(답변글)
	private int qna_step;//step(답변글)
	private int qna_level;//level(답변글)
	
	public int getQna_num() {

		return qna_num;
	}
	
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;

	}
	public String getUsers_id() {

		return users_id;
	}
	public void setUsers_id(String users_id) {
		this.users_id = users_id;

	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_title() {

		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;

	}
	public String getQna_content() {

		return qna_content;
	}
	
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;

	}
	
	public String getQna_adcontent() {
		return qna_adcontent;
	}
	
	public void setQna_adcontent(String qna_adcontent){
		this.qna_adcontent=qna_adcontent;
	}	
	
	public String getQna_img() {
		return qna_img;
	}
	public void setQna_img(String qna_img) {
		this.qna_img = qna_img;
	}
	public String getQna_passwd() {
		return qna_passwd;
	}
	public void setQna_passwd(String qna_passwd) {
		this.qna_passwd = qna_passwd;
	}
	public String getQna_yn() {
		return qna_yn;
	}
	public void setQna_yn(String qna_yn) {
		this.qna_yn = qna_yn;
	}
	public int getQna_readcount() {
		return qna_readcount;
	}
	public void setQna_readcount(int qna_readcount) {
		this.qna_readcount = qna_readcount;
	}
	public int getQna_ref() {
		return qna_ref;
	}
	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}
	public int getQna_step() {
		return qna_step;
	}
	public void setQna_step(int qna_step) {
		this.qna_step = qna_step;
	}
	public int getQna_level() {
		return qna_level;
	}
	public void setQna_level(int qna_level) {
		this.qna_level = qna_level;
	}
	
	@Override
	public String toString() {
	
		return "QnaVO[qna_num="+qna_num+",users_id="+users_id+",qna_date="+qna_date+",qna_type="+qna_type
				+",qna_title="+qna_title+",qna_content="+qna_content+",qna_adcontent"+qna_adcontent+",qna_img="+qna_img+",qna_passwd="+qna_passwd
				+",qna_yn="+qna_yn+",qna_readcount="+qna_readcount+",qna_ref="+qna_ref+",qna_step="+qna_step
				+",qna_level="+qna_level+"]";
	}
	
	
	
	
}
