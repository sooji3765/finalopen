package com.project.alarm;

import java.sql.Timestamp;

public class Alarm {
	
	private String al_num;
	private String al_title;
	private String al_content;
	private Timestamp al_time;
	private String al_check;
	private String al_content_url;
	
	public String getAl_num() {
		return al_num;
	}
	public void setAl_num(String al_num) {
		this.al_num = al_num;
	}
	public String getAl_title() {
		return al_title;
	}
	public void setAl_title(String al_title) {
		this.al_title = al_title;
	}
	public String getAl_content() {
		return al_content;
	}
	public void setAl_content(String al_content) {
		this.al_content = al_content;
	}
	public Timestamp getAl_time() {
		return al_time;
	}
	public void setAl_time(Timestamp al_time) {
		this.al_time = al_time;
	}
	public String getAl_check() {
		return al_check;
	}
	public void setAl_check(String al_check) {
		this.al_check = al_check;
	}
	public String getAl_content_url() {
		return al_content_url;
	}
	public void setAl_content_url(String al_content_url) {
		this.al_content_url = al_content_url;
	}
		

}
