package bit.team42.domain;

import java.sql.Date;


public class ChildVO {

	private Integer cno;
	private String userid;
	private Integer clevel;
	private Date age;
	private int cage;
	private Integer deep;
	private String cname;
	private String imgpath;
	private String s_imgpath;
	private String school;
	private Date regdate;
	private Date updatedate;
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Integer getClevel() {
		return clevel;
	}
	public void setClevel(Integer clevel) {
		this.clevel = clevel;
	}
	public Date getAge() {
		return age;
	}
	public void setAge(Date age) {
		this.age = age;
	}
	public int getCage() {
		return cage;
	}
	public void setCage(int cage) {
		this.cage = cage;
	}
	public Integer getDeep() {
		return deep;
	}
	public void setDeep(Integer deep) {
		this.deep = deep;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getS_imgpath() {
		return s_imgpath;
	}
	public void setS_imgpath(String s_imgpath) {
		this.s_imgpath = s_imgpath;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
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
		return "ChildVO [cno=" + cno + ", userid=" + userid + ", clevel=" + clevel + ", age=" + age + ", cage=" + cage
				+ ", deep=" + deep + ", cname=" + cname + ", imgpath=" + imgpath + ", s_imgpath=" + s_imgpath
				+ ", school=" + school + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}

	
}
