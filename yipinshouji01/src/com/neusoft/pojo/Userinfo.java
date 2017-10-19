package com.neusoft.pojo;

public class Userinfo {
	private int userid; 
	private String username;
	private String userpwd;
	private String sex;
	private String phone;
	private String address;
	private int baned;
	private String pawquestion;
	private String answer;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getBaned() {
		return baned;
	}
	public void setBaned(int baned) {
		this.baned = baned;
	}
	public String getPawquestion() {
		return pawquestion;
	}
	public void setPawquestion(String pawquestion) {
		this.pawquestion = pawquestion;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Userinfo [userid=" + userid + ", username=" + username + ", userpwd=" + userpwd + ", sex=" + sex
				+ ", phone=" + phone + ", address=" + address + ", baned=" + baned + ", pawquestion=" + pawquestion
				+ ", answer=" + answer + "]";
	}
	
}
