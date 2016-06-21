package bit.team42.domain;

public class GoodCountVO {
   
   private int gcno;
   private int bno;
   private int count;
   
   public int getGcno() {
      return gcno;
   }
   public void setGcno(int gcno) {
      this.gcno = gcno;
   }
   public int getBno() {
      return bno;
   }
   public void setBno(int bno) {
      this.bno = bno;
   }
   public int getCount() {
      return count;
   }
   public void setCount(int count) {
      this.count = count;
   }
   @Override
   public String toString() {
      return "GoodCountVO [gcno=" + gcno + ", bno=" + bno + ", count=" + count + "]";
   }
   

}