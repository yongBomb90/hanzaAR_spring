package bit.team42.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaSearchType;
import bit.team42.domain.HanzaTotaVO;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MobileCriteria;



public class HanzaDAO {
   @Inject
   private SqlSession session;

   private static final String namespace = "bit.team42.hanzaMapper";

   public String getTime() {
      return session.selectOne(namespace + ".testTime");
   }
   
   public HanzaVO selbyhanza(String hanza) {
      return session.selectOne(namespace + ".SelByHanza",hanza);
   }

   public List<HanzaVO> selbygrade(HanzaVO hanza, Criteria cri) {
      Map<String,Integer> map = new HashMap<String,Integer>();
      map.put("page", cri.getPage());
      map.put("grade",hanza.getGrade());
      return session.selectList(namespace + ".SelByGrade",map);
   }
   
   public List<HanzaVO> selbywritecount(HanzaVO hanza, Criteria cri) {
      Map<String,Integer> map = new HashMap<String,Integer>();
      map.put("page", cri.getPage());
      map.put("writecount",hanza.getWritecount());
      return session.selectList(namespace + ".SelByWritecount",map);
   }
   
   
   public HanzaVO selbymarker(HanzaVO hanza) {
      return session.selectOne(namespace + ".SelByMarker",hanza);
   }

   
   public List<HanzaVO>selbywritecount(HanzaVO hanza) {
      return session.selectList(namespace + ".SelByWritecount",hanza);
   }
   
   public int insert(HanzaVO hanza) {
      return session.insert(namespace + ".insert",hanza);
   }
   public int delete(String hanza) {
      return session.delete(namespace + ".delete",hanza);
   }
   public int update(HanzaVO hanza) {
      System.out.println("update dao "+hanza);
      return session.update(namespace + ".update",hanza);
   }
   public int gradetotal(HanzaVO hanza) {
      return session.selectOne(namespace + ".Gradetotal",hanza);
   }
   
   public int writecounttotal(HanzaVO hanza) {
      return session.selectOne(namespace + ".Writecounttotal",hanza);
   }
   
   public int gradecnt(HanzaVO hanza) {
      return session.selectOne(namespace + ".Gradecnt",hanza);
   }
   
   public List<HanzaVO>searchlist(HanzaSearchType type) {
      return session.selectList(namespace + ".searchlist",type);
   }
   public List<HanzaVO>selrandom(int markerid) {
      return session.selectList(namespace + ".randomsel",markerid);
   }

   public int searchlistcnt (HanzaSearchType type) {
      return session.selectOne(namespace + ".searchlistcnt",type);
   }
   
   public List<HanzaTotaVO> HanzaTotalcnt () {
      return session.selectList(namespace + ".hanzatotalcnt");
   }
   public int totalcnt (){
      return session.selectOne(namespace + ".totalcnt");
   }

   public List<HanzaVO> mobileHanzalist(MobileCriteria cri, HanzaVO vo) {
	 Map<String,Integer> map = new HashMap<String,Integer>();
     map.put("page", cri.getPage());
     map.put("grade",vo.getGrade());
     map.put("pagesize",10);
     System.out.println("다오쪽 list"+session.selectList(namespace + ".mobilehanza",map));
     return session.selectList(namespace + ".mobilehanza",map);
   }
   
}