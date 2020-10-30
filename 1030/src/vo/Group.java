package vo;

import java.sql.Date;
import java.util.Calendar;

public class Group {
	private int groupId;
	private String name;
	private Date debutDate;
	
	private Calendar cal;
	
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
	public Date getDebutDate() {
		return debutDate;
	}
	public void setDebutDate(Date debutDate) {
		this.debutDate = debutDate;
		cal = Calendar.getInstance();
		cal.setTime(this.debutDate);
	}
	
	public int getDebutYear() {
		return cal.get(Calendar.YEAR);

	}
	public int getDebutMonth() {
		return cal.get(Calendar.MONTH)+1;
		
	}
	public int getDebutDay() {	
		return cal.get(Calendar.DATE);
	}
	public Group() {
		// TODO Auto-generated constructor stub
	}
	public Group(int groupId, String name, Date debutDate) {
		super();
		this.groupId = groupId;
		this.name = name;
		this.debutDate = debutDate;
	}
	
	
}
