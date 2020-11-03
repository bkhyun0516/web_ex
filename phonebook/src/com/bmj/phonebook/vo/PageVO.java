package com.bmj.phonebook.vo;

public class PageVO {
	private int start, end, memberNo;
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getStart() {
		return start;
	}
	
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public PageVO(int pageNo,int numPage, int memberNo) {
		this.end=pageNo*numPage;
		this.start=end+1-numPage;
		this.memberNo = memberNo;
	}
}
