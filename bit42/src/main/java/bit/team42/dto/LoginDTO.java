package bit.team42.dto;

public class LoginDTO {

	private String userid;
	private String userpw;
	private boolean userCookie;
	private int cno;
	private int choice;
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
	public boolean isUserCookie() {
		return userCookie;
	}
	public void setUserCookie(boolean userCookie) {
		this.userCookie = userCookie;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getChoice() {
		return choice;
	}
	public void setChoice(int choice) {
		this.choice = choice;
	}
	@Override
	public String toString() {
		return "LoginDTO [userid=" + userid + ", userpw=" + userpw + ", userCookie=" + userCookie + ", cno=" + cno
				+ ", choice=" + choice + "]";
	}
	
	
	
	
	
	
	
	
}
