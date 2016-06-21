package bit.team42.domain;

/**
 * @author yongbum
 *
 */
public class ChildCriteria {
   int page,startpage,endpage,pagesize,total;
   boolean prev,next;
   
   public ChildCriteria(){
      this.page = 1;
      this.pagesize = 5;
      this.next = true;
      this.prev = true;
   }
   
   public int getPage() {
      return page;
   }
   public void setPage(int page) {
      if(page<1){
         page=1;
      }
      this.page = page;
   }
   public int getStartpage() {
      return startpage;
   }
   public void setStartpage(int startpage) {
      this.startpage = startpage;
   }
   public int getEndpage() {
      return endpage;
   }
   public void setEndpage(int endpage) {
      this.endpage = endpage;
   }
   public int getPagesize() {
      return pagesize;
   }
   public void setPagesize(int pagesize) {
      this.pagesize = pagesize;
   }
   public int getTotal() {
      return total;
   }
   public void setTotal(int total) {
      
      this.startpage = ((page/pagesize)*pagesize)+1;
      if((this.page%pagesize)==0 && (this.startpage > 0)){
         this.startpage = this.page/pagesize;
      }
      this.endpage = startpage+4;
      int lastpage = (int) Math.ceil(total/(double)pagesize);
      int lastfirstpage = ((lastpage/pagesize)*5)+1;
      if(lastpage<this.endpage){
         this.endpage = lastpage;
         this.next = false;
      }
      if(lastfirstpage<this.startpage){
         this.startpage = lastfirstpage;
         this.page = lastfirstpage;
      }
      if(startpage <= 1 ){
         this.prev = false;
      }
      this.total = total;
   }
   public boolean isPrev() {
      return prev;
   }
   public void setPrev(boolean prev) {
      this.prev = prev;
   }
   public boolean isNext() {
      return next;
   }
   public void setNext(boolean next) {
      this.next = next;
   }

   @Override
   public String toString() {
      return "ChildCriteria [page=" + page + ", startpage=" + startpage + ", endpage=" + endpage + ", pagesize="
            + pagesize + ", total=" + total + ", prev=" + prev + ", next=" + next + "]";
   }
   

   
}