package bit.team42.domain;

import java.util.Date;

public class VisitVO {

   private String userid;
   private Date visitcount;

   @Override
   public String toString() {
      return "VisitVO [userid=" + userid + ", visitcount=" + visitcount + "]";
   }

   public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   public Date getVisitcount() {
      return visitcount;
   }

   public void setVisitcount(Date visitcount) {
      this.visitcount = visitcount;
   }
   
   
   
   
}