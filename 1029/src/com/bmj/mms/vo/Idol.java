package com.bmj.mms.vo;

import java.sql.Date;
import java.util.Calendar;

public class Idol {
	private int idolId,groupId;
	private String name,profileImage;
	private double height, weight;
	private Date birthDate;
	private char gender;
	private Calendar cal;
	
	
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public Idol() {
		// TODO Auto-generated constructor stub
	}
	public int getIdolId() {
		return idolId;
	}
	public void setIdolId(int idolId) {
		this.idolId = idolId;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
		cal = Calendar.getInstance();
		cal.setTime(birthDate);
	}
	public String getGenderIcon() {
		String icon = "<i class='fas fa-";
		if(gender=='F') {icon+="fe";} //if end
		icon+="male'></i>";
		return icon;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
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
}
