package bit.team42.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.team42.domain.ChildCriteria;
import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaTotaVO;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.persistence.ChildDAO;
import bit.team42.persistence.HanzaDAO;
import bit.team42.persistence.MemberDAO;

@Transactional
@Service
public class ChildService {

   @Inject
   private ChildDAO dao;
   
   @Inject
   private MemberDAO mdao;
   
   @Inject
   private HanzaDAO hdao;
   
   public List<ChildVO> listCriteria(Criteria cri)throws Exception{
      return dao.listCriteria(cri);
   }
   
   public int listCount(Criteria cri)throws Exception{
      return dao.listCount(cri);
   }
   
   public void regist(ChildVO vo, String userid)throws Exception{
      
      if(vo.getImgpath() != null){
         System.out.println("�̹����� �ִ� ���");
         dao.fadd(vo);
      }else{
          dao.add(vo);
          System.out.println("�̹����� ������ ���");
      }
      
      mdao.childcntupdate(userid);
      
      System.out.println("���� : "+vo.toString());
      
   }
   
   
   
   public ChildVO read(Integer cno)throws Exception{
      return dao.read(cno);
   }
   
   public void modify(ChildVO vo)throws Exception{
      if(vo.getImgpath() != null){
            
            dao.fupdate(vo);
            
         }else{
            dao.update(vo);         
            
         }
   }
   public int getmax() throws Exception{
      return dao.maxcno();
   }
   
   public void remove(Integer cno, String userid)throws Exception{
   System.out.println("����");
      dao.remove(cno);
      mdao.childcntupdate(userid);
   }
   

   
   public List<ChildVO>listAll()throws Exception{
      return dao.listAll();
   }
   
   public List<ChildVO>useridlist(String userid)throws Exception{
      return dao.useridlist(userid);
   }
   
   public int listSearchCount(SearchCriteria cri)throws Exception{
      return dao.listSearchCount(cri);
   }
   
   public List<ChildVO> listSearchCri(SearchCriteria cri)throws Exception{
      return dao.listSearch(cri);
   }

   public ChildVO stateup(HttpSession session) {
      ChildVO vo = (ChildVO) session.getAttribute("clogin");   //아이의 정보를 clogin을 통해 얻을 수 있게함
      HanzaVO hvo = new HanzaVO();;            
      hvo.setGrade(vo.getClevel());         //한자 급수에 아이 급수를 넣어줌
      int total = hdao.gradecnt(hvo);         //해당 급수에 대한 단계를 gradecnt로 구함
   
      if(total <= vo.getDeep()){            //급수에 대한 총 단계가 아이의 단계보다 작거나 같으면
         if(vo.getClevel() != 3){         //급수가 3급 이하면
            vo.setClevel(vo.getClevel()-1); //급수를 하나씩 낮춰준다. 한자급수가 8 7 6 5 4 3순이기에
            vo.setDeep(1);               //급수를 낮췄으니 단계를 1로 세팅.
         }
      }else{
         vo.setDeep(vo.getDeep()+1);
      }
      try {
         dao.update(vo);
         return vo;
      } catch (Exception e) {
         e.printStackTrace();
         return null;
      }
      
   }

   public ChildCriteria userchildlistcnt(String userid, ChildCriteria cri) {
      try {
         return    dao.userchildlistcnt(userid, cri);
      } catch (Exception e) {
         return null;
      }
   }

   public List<ChildVO> userchildlist(String userid, ChildCriteria cri) {
      // TODO Auto-generated method stub
      try {
         return dao.userchildlist(userid, cri);
      } catch (Exception e) {
         return null;
      }
            
   }

   
   public int childcnt(String userid)throws Exception{
      return dao.childcnt(userid);
   }

   public List<HanzaTotaVO> childtotacnt() {
      
      List<HanzaTotaVO> list = dao.childtotalcnt();

      return list;
   }
   

}