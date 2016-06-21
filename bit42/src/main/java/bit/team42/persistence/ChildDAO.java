package bit.team42.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.ChildCriteria;
import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaTotaVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.dto.LoginDTO;

@Repository
public class ChildDAO {

   private String namespace ="bit.team42.childmapper";
   
   @Inject
   private SqlSession session;
   
   public List<ChildVO> listSearch(SearchCriteria cri)throws Exception{
      return session.selectList(namespace+".listSearch",cri);
   }
   
   
   public int listSearchCount(SearchCriteria cri)throws Exception{
      return session.selectOne(namespace+".listSearchCount",cri);
      
   }
   
   public int listCount(Criteria cri)throws Exception{
      return session.selectOne(namespace+".listCount",cri);
   }
   
   public List<ChildVO> listCriteria(Criteria cri)throws Exception{
      return session.selectList(namespace+".listCri",cri);
   }
   
   public int maxcno(){
      return session.selectOne(namespace+".maxcno");
   }
   
   public void fadd(ChildVO vo)throws Exception{
      session.insert(namespace+".finsert",vo);
      System.out.println("í�ϵ�ٿ� :"+vo.toString());
   }
   
   
   public void add(ChildVO vo)throws Exception{
      session.insert(namespace+".insert",vo);
      System.out.println("í�ϵ�ٿ� :"+vo.toString());
   }
   
   
   
   
   
   public void remove(int cno)throws Exception{
      System.out.println("�ٿ�");
      session.delete(namespace+".delete",cno);
   }
   public void userRemove(String userid)throws Exception{
	      System.out.println("�ٿ�");
	      session.delete(namespace+".delUserid",userid);
	   }
	   
   
   public int update(ChildVO vo)throws Exception{
      return session.update(namespace+".update",vo);
   }
   
   public void fupdate(ChildVO vo)throws Exception{
         System.out.println("�̹����ִ� ����");
         session.update(namespace+".fupdate",vo);
   }
   
   public List<ChildVO> listAll()throws Exception{
      return session.selectList(namespace+".readAll");
   }
   
   public ChildVO read(Integer cno)throws Exception{
      return session.selectOne(namespace+".read", cno);
   }
   
   public List<ChildVO> useridlist(String userid)throws Exception{
      return session.selectList(namespace+".useridlist", userid);
   }
   
   public List<ChildVO> listpage(int page)throws Exception{
      if(page <=0){
         page =1;
      }
      page = (page -1) *10;
      return session.selectList(namespace+".listPage",page);
   }
   
   public ChildVO login(LoginDTO dto) throws Exception {

      return session.selectOne(namespace+".login", dto);
   }

   
   public List<ChildVO> userchildlist(String userid, ChildCriteria cri) throws Exception {
      Map<String, Object> map = new HashMap<>();
      map.put("userid", userid);
      map.put("page", cri.getPage());
      return session.selectList(namespace+".userchildlist",map);
   }
   
   public ChildCriteria userchildlistcnt(String userid, ChildCriteria cri)throws Exception{
      cri.setTotal(session.selectOne(namespace+".userchildlistcnt", userid));
      return cri;
   }
      public int childcnt(String userid)throws Exception{
      return session.selectOne(namespace+".childcnt",userid);
   }
      
      public List<HanzaTotaVO> childtotalcnt () {
         return session.selectList(namespace + ".childtotalcnt");
      }
      public int totalcnt () {
         return session.selectOne(namespace + ".allcnt");
      }
}