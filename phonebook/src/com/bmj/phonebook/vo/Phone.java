package com.bmj.phonebook.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

public class Phone {
	private int no;
	private String name, phone;
	private char gender;
	private Date birthDate;
	private Timestamp regdate;
	private Calendar calendar;
	
	public Phone() {
		//마이베티스가 생성할때는 무조건 기본생성자로 생성함
		// 꼭 기본생성자 만들어야 함
		//인스턴스화
		calendar= Calendar.getInstance(); //기본생성자에 꼭 넣어줘야한다. 안넣으면 널포인터 익셉션 뜬다.
	}
	
	public Phone(String name, String phone, char gender, Date birthDate) {
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
	}
	
	public Phone(int no, String phone, char gender, Date birthDate) {
		super();
		this.no = no;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		calendar.setTime(birthDate);
		this.birthDate = birthDate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public String getPhone1() {
		return phone.substring(0,3);
	}
	public String getPhone2() {
		return phone.substring(3,phone.length()-4);
	}
	public String getPhone3() {
		return phone.substring(phone.length()-4,phone.length());
	}
	public int getYear() {
		return calendar.get(Calendar.YEAR);
	}
	public int getMonth() {
		return calendar.get(Calendar.MONTH)+1;
	}
	public int getDate() {
		return calendar.get(Calendar.DATE);
	}
	public int getAge() {
		return 0;
	}
}
