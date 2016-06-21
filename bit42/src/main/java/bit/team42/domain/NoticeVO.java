package bit.team42.domain;

import java.util.Date;

public class NoticeVO {
	
	int nno;
	String title;
	String content;
	String userid;
	private Date regdate;
	
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "NoticeVO [nno=" + nno + ", title=" + title + ", content=" + content + ", userid=" + userid
				+ ", regdate=" + regdate + "]";
	}
	
	

	
	
	

}
