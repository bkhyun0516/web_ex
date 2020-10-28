package org.bmj.guestbook.vo;

import java.sql.Timestamp;//밀리 세컨드 까지 측정(Date는 초까지)

public class Guest {
	
	private int no;
	private char emotion;
	private String writer, contents, ip;
	private Timestamp regdate;
	public Guest() {
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public char getEmotion() {
		return emotion;
	}
	public void setEmotion(char emotion) {
		this.emotion = emotion;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public Guest(char emotion, String writer, String contents, String ip) {
		super();
		this.emotion = emotion;
		this.writer = writer;
		this.contents = contents;
		this.ip = ip;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
