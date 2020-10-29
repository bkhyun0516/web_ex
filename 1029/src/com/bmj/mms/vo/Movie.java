package com.bmj.mms.vo;

import java.sql.Date;
import java.util.Calendar;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class Movie {
	private int no, audienceNum, genre;
	private String name, director, genreName, posterImage;
	private Date releaseDate, endDate;
	private Calendar releaseCalendar, endCalendar;
	
	public String getPosterImage() {
		return posterImage;
	}
	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}
	public Movie() {
		// TODO Auto-generated constructor stub
		releaseCalendar=Calendar.getInstance();
		endCalendar=Calendar.getInstance();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAudienceNum() {
		return audienceNum;
	}
	public void setAudienceNum(int audienceNum) {
		this.audienceNum = audienceNum;
	}
	public int getGenre() {
		return genre;
	}
	public void setGenre(int genre) {
		this.genre = genre;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		if(releaseDate!=null) {
			releaseCalendar.setTime(releaseDate);
		}
		this.releaseDate = releaseDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		if(endDate!=null) {
			endCalendar.setTime(endDate);
		}
		this.endDate = endDate;
	}
	public int getReleaseYear() {
		return releaseCalendar.get(Calendar.YEAR);
	}
	public int getEndYear() {
		return endCalendar.get(Calendar.YEAR);
	}
	@JsonIgnore //json으로 안넘긴다는 표시!
	public int getReleaseMonth() {
		return releaseCalendar.get(Calendar.MONTH)+1;
	}
	@JsonIgnore //json으로 안넘긴다는 표시!
	public int getEndMonth() {
		return endCalendar.get(Calendar.MONTH)+1;
	}
	@JsonIgnore //json으로 안넘긴다는 표시!
	public int getReleaseDay() {
		return releaseCalendar.get(Calendar.DATE);
	}
	public int getEndDay() {
		return endCalendar.get(Calendar.DATE);
	}
	
	
	public Movie(int audienceNum, int genre, String name, String director, Date releaseDate) {
		releaseCalendar=Calendar.getInstance();
		endCalendar=Calendar.getInstance();
		this.audienceNum = audienceNum;
		this.genre = genre;
		this.name = name;
		this.director = director;
		this.releaseDate = releaseDate;
	}
	
}
