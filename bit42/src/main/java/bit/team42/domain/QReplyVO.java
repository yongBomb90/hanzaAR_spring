package bit.team42.domain;

import java.util.Date;

public class QReplyVO {
	
	private Integer qrno;
	private Integer qno;
	private String replytext;
	private String replyer;
	private Date regdate;
	private Date updatedate;
	public Integer getQrno() {
		return qrno;
	}
	public void setQrno(Integer qrno) {
		this.qrno = qrno;
	}
	public Integer getQno() {
		return qno;
	}
	public void setQno(Integer qno) {
		this.qno = qno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "QReplyVO [qrno=" + qrno + ", qno=" + qno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	


}
