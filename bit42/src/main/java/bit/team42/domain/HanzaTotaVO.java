package bit.team42.domain;

public class HanzaTotaVO {
	int grade,total;

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	public void setClevel(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "HanzaTotaVO [grade=" + grade + ", total=" + total + "]";
	}
	
}
