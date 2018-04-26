package com.project.comment;

import java.sql.Timestamp;

public class Comment {
	
	private String cno; // 댓글 SEQ
	private String bno; // 리뷰 번호
	private String content; // 댓글 내용
	private String writer; //작성자
	private String nickname;
	private Timestamp regdate; // 작성 시간
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setReg_date(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

}
