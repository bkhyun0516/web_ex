package com.bmj.phonebook.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

public class Phone {
	int no;
	String name;
	String phone;
	char gender;
	Date birthDate;
	Timestamp regdate;
	Calendar cal;
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
		if(birthDate!=null) {
			cal.setTime(birthDate);
		}
		this.birthDate = birthDate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public int getBirthYear() {
		return cal.get(Calendar.YEAR);
	}
	
	public int getBirthMonth() {
		return cal.get(Calendar.MONTH)+1;
	}
	
	public int getBirthDay() {
		return cal.get(Calendar.DATE);
	}

	public Phone() {
		cal=Calendar.getInstance();
	}
	
	public Phone(String name, String phone, char gender, Date birthDate) {
		cal=Calendar.getInstance();
		cal.setTime(birthDate);
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.birthDate = birthDate;
	}
	
	
	
	
}
