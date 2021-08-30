package com.kh.faq.model.vo;

import java.util.Date;

public class Faq {

	private String fNo;
	private String writer;
	private String targetUser;
	private String question;
	private String answer;
	private Date createDate;
	private Date updateDate;
	private char showYn;
	
	public Faq() {
		
	}

	public Faq(String fNo, String writer, String targetUser, String question, String answer, Date createDate,
			Date updateDate, char showYn) {
		super();
		this.fNo = fNo;
		this.writer = writer;
		this.targetUser = targetUser;
		this.question = question;
		this.answer = answer;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.showYn = showYn;
	}

	public Faq(String fNo, String targetUser, String question) {
		super();
		this.fNo = fNo;
		this.targetUser = targetUser;
		this.question = question;
	}

	public Faq(String fNo, String targetUser, String question, String answer) {
		super();
		this.fNo = fNo;
		this.targetUser = targetUser;
		this.question = question;
		this.answer = answer;
	}


	public String getfNo() {
		return fNo;
	}



	public void setfNo(String fNo) {
		this.fNo = fNo;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getTargetUser() {
		return targetUser;
	}



	public void setTargetUser(String targetUser) {
		this.targetUser = targetUser;
	}



	public String getQuestion() {
		return question;
	}



	public void setQuestion(String question) {
		this.question = question;
	}



	public String getAnswer() {
		return answer;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}



	public char getShowYn() {
		return showYn;
	}



	public void setShowYn(char showYn) {
		this.showYn = showYn;
	}



	@Override
	public String toString() {

		return fNo + " / " + writer + " / " + targetUser + " / " + question 
				+ " / " + answer + " / " + createDate + " / " + updateDate + " / " + showYn;
	}
	
	
}
