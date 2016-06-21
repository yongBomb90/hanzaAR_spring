package bit.team42.domain;

import java.sql.Date;

public class MemberVO {

	private String userid;
	private String userpw;
	private String username;
	private String phonenumber;
	private String gubun;
	private String token;
	private Date regdate;
	private String sessionkey;
	private String email;
	private Date sessionlimit;
	private int choice;
	private int childcount;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(Date sessionlimit) {
		this.sessionlimit = sessionlimit;
	}
	public int getChoice() {
		return choice;
	}
	public void setChoice(int choice) {
		this.choice = choice;
	}
	public int getChildcount() {
		return childcount;
	}
	public void setChildcount(int childcount) {
		this.childcount = childcount;
	}

	
	
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", phonenumber="
				+ phonenumber + ", gubun=" + gubun + ", token=" + token + ", regdate=" + regdate + ", sessionkey="
				+ sessionkey + ", email=" + email + ", sessionlimit=" + sessionlimit + ", choice=" + choice
				+ ", childcount=" + childcount + "]";
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}

	
	
	
	
	
	
}
