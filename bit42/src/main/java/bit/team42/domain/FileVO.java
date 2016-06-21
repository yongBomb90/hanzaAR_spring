package bit.team42.domain;

import java.io.File;
import java.util.Date;

public class FileVO {
	
	private int fno;
	private int bno;
	private String filepath;
	private String  filename;
	private String thumpath;
	private Date regdate;
	private Date updatedate;
	
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getThumpath() {
		return thumpath;
	}
	public void setThumpath(String thumpath) {
		this.thumpath = thumpath;
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
		return "FileVO [fno=" + fno + ", bno=" + bno + ", filepath=" + filepath + ", filename=" + filename
				+ ", thumpath=" + thumpath + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}

	
	
	
	
	
}
