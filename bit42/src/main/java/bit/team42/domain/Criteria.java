package bit.team42.domain;

public class Criteria {
	
	private int page;
	private int pageNum;
	
	public Criteria(){
		this.page = 1;
		this.pageNum = 10;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageNum=" + pageNum + "]";
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		if(page <= 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}

	public int getPageNum() {
		return this.pageNum;
	}

	public void setPageNum(int pageNum) {
		
		if(pageNum <= 0 || pageNum > 100){
			this.pageNum = 10;
			return ;
		}
		this.pageNum = pageNum;
	}
	
	public int getPageStart() {
		return (this.page-1)*pageNum;
	}
	

}
