package com.project.review;

import java.sql.Timestamp;

public class Review {
	private String re_num;
	private String re_title;
	private String re_content;
	private String re_image;
	private String re_blog_url;
	private String m_id;
	private Timestamp re_date;
	private String re_password;
	
	public String getRe_num() {
		return re_num;
	}
	public void setRe_num(String re_num) {
		this.re_num = re_num;
	}
	public String getRe_title() {
		return re_title;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_image() {
		return re_image;
	}
	public void setRe_image(String re_image) {
		this.re_image = re_image;
	}
	public String getRe_blog_url() {
		return re_blog_url;
	}
	public void setRe_blog_url(String re_blog_url) {
		this.re_blog_url = re_blog_url;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public String getRe_password() {
		return re_password;
	}
	public void setRe_password(String re_password) {
		this.re_password = re_password;
	}
	
	
	
}
