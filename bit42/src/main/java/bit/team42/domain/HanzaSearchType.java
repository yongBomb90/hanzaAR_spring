package bit.team42.domain;

public class HanzaSearchType {
String type;
String keyword;
int grade,writecount,markerid,page;

public int getPage() {
	return page;
}
public void setPage(int page) {
	this.page = page;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getKeyword() {
	return keyword;
}
public void setKeyword(String keyword) {
	this.keyword = keyword;
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
public int getMarkerid() {
	return markerid;
}
public void setMarkerid(int markerid) {
	this.markerid = markerid;
}
@Override
public String toString() {
	return "HanzaSearchType [type=" + type + ", keyword=" + keyword + ", grade=" + grade + ", writecount=" + writecount
			+ ", markerid=" + markerid + "]";
}


}
