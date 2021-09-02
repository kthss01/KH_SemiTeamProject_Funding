package com.kh.event.model.vo;

import java.sql.Date;

public class Event {

	private int eNo;
	private String eName;
	private String eContent;
	private Date regDate;
	private Date startDate;
	private Date endDate;	
	private String status;
	
	public Event() {
		// TODO Auto-generated constructor stub
	}
	

	public Event(int eNo, String eName, String eContent, Date regDate, Date startDate, Date endDate, String status) {
		super();
		this.eNo = eNo;
		this.eName = eName;
		this.eContent = eContent;
		this.regDate = regDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}


	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Event [eNo=" + eNo + ", eName=" + eName + ", eContent=" + eContent + ", regDate=" + regDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + "]";
	}

}
