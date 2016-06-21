package bit.team42.domain;

import java.sql.Date;

public class MsgVO {
int mno,cno,markerid;
String content,userid,filetype,cname,filename,savename;

private Date regdate;

public MsgVO() {
	super();
	this.filetype = "msg";
	this.filename = "msg";
	this.savename = "msg";
}

public String getFilename() {
	return filename;
}

public void setFilename(String filename) {
	this.filename = filename;
}

public String getSavename() {
	return savename;
}

public void setSavename(String savename) {
	this.savename = savename;
}

public int getMno() {
	return mno;
}

public void setMno(int mno) {
	this.mno = mno;
}

public int getCno() {
	return cno;
}

public void setCno(int cno) {
	this.cno = cno;
}

public int getMarkerid() {
	return markerid;
}

public void setMarkerid(int markerid) {
	this.markerid = markerid;
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

public String getFiletype() {
	return filetype;
}

public void setFiletype(String filetype) {
	this.filetype = filetype;
}

public Date getRegdate() {
	return regdate;
}

public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
public String getCname() {
	return cname;
}

public void setCname(String cname) {
	this.cname = cname;
}

@Override
public String toString() {
	return "MsgVO [mno=" + mno + ", cno=" + cno + ", markerid=" + markerid + ", content=" + content + ", userid="
			+ userid + ", filetype=" + filetype + ", cname=" + cname + ", filename=" + filename + ", savename="
			+ savename + ", regdate=" + regdate + "]";
}


	
	
}
