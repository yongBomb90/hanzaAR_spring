package bit.team42.domain;

import java.util.Date;

public class QnaVO {
	
	private int qno;
	private String title;
	private String content;
	private String userid;
	private Date regdate;
	private String secret;
	private int replycnt;

	public QnaVO() {
		this.secret = "n";
		// TODO Auto-generated constructor stub
	}

	public int getQno() {
		return qno;
	}
	
	public void setQno(int qno) {
		this.qno = qno;
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
	public String getSecret() {
		return secret;
	}
	
	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qno=" + qno + ", title=" + title + ", content=" + content + ", userid=" + userid + ", regdate="
				+ regdate + ", secret=" + secret + ", replycnt=" + replycnt + "]";
	}
	
	

	

}
