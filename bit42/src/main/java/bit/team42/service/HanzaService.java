package bit.team42.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaSearchType;
import bit.team42.domain.HanzaTotaVO;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MobileCriteria;
import bit.team42.domain.PageMaker;
import bit.team42.persistence.HanzaDAO;
@Service
public class HanzaService {

   @Inject
   HanzaDAO dao;
   
   public HanzaVO selbyhanza(String hanza) {
      return dao.selbyhanza(hanza);
   }

   public List<HanzaVO> selbygrade(HanzaVO hanza, Criteria cri) {
      return dao.selbygrade(hanza,cri);
   }
   public List<HanzaVO> selbywritecount(HanzaVO hanza, Criteria cri) {
      return dao.selbywritecount(hanza,cri);
   }
   public List<HanzaVO> selbyrandom() {
      List<HanzaVO> list = new ArrayList<HanzaVO>();
      for(int z = 0; z<10; z++){
         int markerid = (int) ((Math.random()*1000)+1);
         list.add(dao.selrandom(markerid).get(0));   
      }
      return list;
      
   }
   public PageMaker gradetotal(HanzaVO hanza,Criteria cri) {
      PageMaker pagemaker = new PageMaker();
      pagemaker.setCri(cri);
      pagemaker.setTotalCount(dao.gradetotal(hanza));
      return pagemaker;
      
   }
   
   public PageMaker writecounttotal(HanzaVO hanza,Criteria cri) {
      PageMaker pagemaker = new PageMaker();
      pagemaker.setCri(cri);
      pagemaker.setTotalCount(dao.writecounttotal(hanza));
      return pagemaker;
      
   }
   public HanzaVO selbymarker(HanzaVO hanza) {
      return dao.selbymarker(hanza);
   }

   
   
   public int insert(HanzaVO hanza) {
      return dao.insert(hanza);
   }
   public int delete(String hanza) {
      return dao.delete(hanza);
   }
   public int update(HanzaVO hanza) {
      System.out.println("������Ʈ post "+hanza);
      return dao.update(hanza);
   }
   
   
   public int gradecnt(HanzaVO hanza) {
      double totalcnt = dao.gradecnt(hanza);
      double temp = totalcnt/10;
      int last = (int) Math.ceil((temp));
      return last;
   }
   
   public PageMaker searchcnt(HanzaSearchType type,Criteria cri) {
      PageMaker pagemaker = new PageMaker();
      pagemaker.setCri(cri);
      pagemaker.setTotalCount(dao.searchlistcnt(type));
      return pagemaker;
   }
   
   public List<HanzaVO> searchlist(HanzaSearchType type) {
      return dao.searchlist(type);
   }
   
   
   public List<HanzaTotaVO> hanzatotacnt() {
      List<HanzaTotaVO> list = dao.HanzaTotalcnt();

       return list;

   }

public List<HanzaVO> mobileHanzalist(MobileCriteria cri, HanzaVO vo) {
	  double totalcnt = dao.gradecnt(vo);
	  cri.setTotal((int)totalcnt);
	  System.out.println("서비스쪽 cri"+cri);
	  return dao.mobileHanzalist(cri,vo);
}

public MobileCriteria searchmobilecnt(MobileCriteria cri, HanzaSearchType searchtype) {
	cri.setTotal(dao.searchlistcnt(searchtype));
	return cri;
}

public List<HanzaVO> mobilesearchlist(MobileCriteria cri, HanzaSearchType searchtype) {
	 searchtype.setPage(cri.getPage());
	 return dao.searchlist(searchtype);
}


   
}