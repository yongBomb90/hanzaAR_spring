package bit.team42.domain;

public class HanzaVO {
	
	String hanza,mean;
	int markerid,grade,writecount;
	public String getHanza() {
		return hanza;
	}
	public void setHanza(String hanza) {
		this.hanza = hanza;
	}
	public String getMean() {
		return mean;
	}
	public void setMean(String mean) {
		this.mean = mean;
	}
	public int getMarkerid() {
		return markerid;
	}
	public void setMarkerid(int markerid) {
		this.markerid = markerid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getWritecount() {
		return writecount;
	}
	public void setWritecount(int writecount) {
		this.writecount = writecount;
	}
	@Override
	public String toString() {
		return "HanzaVO [hanza=" + hanza + ", mean=" + mean + ", markerid=" + markerid + ", grade=" + grade
				+ ", writecount=" + writecount + "]";
	}
	
	
	

}
