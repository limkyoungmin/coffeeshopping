package com.novocozy.domain;

import java.sql.Date;

public class LoginVO {

	private String users_id; //유저 아이디
	private String users_passwd; //유저 비밀번호
	private String users_name; //유저 이름
	private Date users_date; //유저 가입날짜
	private String users_birthday; //유저 생일
	private String users_email; //유저 이메일
	private char users_email_yn; //유저 이메일 인증 여부
	private String users_email_code; // 유저 이메일 인증코드
	private String users_phone; //유저 핸드폰번호
	private char users_yn; //유저 탈퇴 여부
	private String users_zonecode;//유저 우편번호
	private String users_address;//유저 주소
	private String users_addressdetail;//유저 상세주소
	
	public String getUsers_id() {
		return users_id;
	}
	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}
	public String getUsers_passwd() {
		return users_passwd;
	}
	public void setUsers_passwd(String users_passwd) {
		this.users_passwd = users_passwd;
	}
	public String getUsers_name() {
		return users_name;
	}
	public void setUsers_name(String users_name) {
		this.users_name = users_name;
	}
	public Date getUsers_date() {
		return users_date;
	}
	public void setUsers_date(Date users_date) {
		this.users_date = users_date;
	}
	public String getUsers_birthday() {
		return users_birthday;
	}
	public void setUsers_birthday(String users_birthday) {
		this.users_birthday = users_birthday;
	}
	public String getUsers_email() {
		return users_email;
	}
	public void setUsers_email(String users_email) {
		this.users_email = users_email;
	}
	public char getUsers_email_yn() {
		return users_email_yn;
	}
	public void setUsers_email_yn(char users_email_yn) {
		this.users_email_yn = users_email_yn;
	}
	public String getUsers_email_code() {
		return users_email_code;
	}
	public void setUsers_email_code(String users_email_code) {
		this.users_email_code = users_email_code;
	}
	public String getUsers_phone() {
		return users_phone;
	}
	public void setUsers_phone(String users_phone) {
		this.users_phone = users_phone;
	}
	public char getUsers_yn() {
		return users_yn;
	}
	public void setUsers_yn(char users_yn) {
		this.users_yn = users_yn;
	}
	public String getUsers_zonecode() {
		return users_zonecode;
	}
	public void setUsers_zonecode(String users_zonecode) {
		this.users_zonecode = users_zonecode;
	}
	public String getUsers_address() {
		return users_address;
	}
	public void setUsers_address(String users_address) {
		this.users_address = users_address;
	}
	public String getUsers_addressdetail() {
		return users_addressdetail;
	}
	public void setUsers_addressdetail(String users_addressdetail) {
		this.users_addressdetail = users_addressdetail;
	}
}
