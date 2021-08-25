package com.kh.recruit.model.vo;

public class RecruitMember {
	private int id; // 지원자번호
	private String name; // 성명
	private String phone; // 연락처
	private String education; // 학력사항
	private String career; // 경력사항
	private String email; // 이메일
	private String password; // 비밀번호

	public RecruitMember() {
	}

	public RecruitMember(int id, String name, String phone, String education, String career, String email,
			String password) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.education = education;
		this.career = career;
		this.email = email;
		this.password = password;
	}

	int getId() {
		return id;
	}

	void setId(int id) {
		this.id = id;
	}

	String getName() {
		return name;
	}

	void setName(String name) {
		this.name = name;
	}

	String getPhone() {
		return phone;
	}

	void setPhone(String phone) {
		this.phone = phone;
	}

	String getEducation() {
		return education;
	}

	void setEducation(String education) {
		this.education = education;
	}

	String getCareer() {
		return career;
	}

	void setCareer(String career) {
		this.career = career;
	}

	String getEmail() {
		return email;
	}

	void setEmail(String email) {
		this.email = email;
	}

	String getPassword() {
		return password;
	}

	void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "RecruitMember [id=" + id + ", name=" + name + ", phone=" + phone + ", education=" + education
				+ ", career=" + career + ", email=" + email + ", password=" + password + "]";
	}

}
