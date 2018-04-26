package com.project.user;

import java.sql.Timestamp;

public class User {
	
	private String m_id;
	private String m_nickname;
	private String m_logintype;
	private String m_profile;
	private Timestamp m_regdate;
	private String m_ref;
	private String m_passwd;
	
	
	public User() {}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_logintype() {
		return m_logintype;
	}
	public void setM_logintype(String m_logintype) {
		this.m_logintype = m_logintype;
	}
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public Timestamp getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Timestamp m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getM_ref() {
		return m_ref;
	}

	public void setM_ref(String m_ref) {
		this.m_ref = m_ref;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}


	
}
