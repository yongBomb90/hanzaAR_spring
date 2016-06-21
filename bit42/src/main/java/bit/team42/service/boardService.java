package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.team42.domain.BoardVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.ReplyVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.persistence.BoardDAO;
import bit.team42.persistence.GoodCountDAO;
import bit.team42.persistence.ReplyDAO;


@Service
@Transactional
public class boardService {
   
   @Inject
   private BoardDAO dao;
   
   @Inject
   private fileService service;
   
   @Inject
   private GoodCountDAO gdao;
   
   public BoardVO selectOne(Integer bno) throws Exception{
      dao.updateCount(bno);
      return dao.selectOne(bno);
   }
   
   public List<BoardVO> listAll() throws Exception{
      return dao.ListAll();
   }
   

   public void insertBoard(BoardVO vo) throws Exception{
      dao.insertBoard(vo);
      gdao.insertCount(vo);

   }
   
   public void updateBoard(BoardVO vo)throws Exception{
      dao.updateBoard(vo);
   }

   public void deleteBoard(Integer bno) throws Exception{
      dao.deleteBoard(bno);
   }
   
   public void replyDeleteBoard(Integer bno) throws Exception{
      service.deleteFile(bno);
      dao.replyDeleteBoard(bno);
   }
   
   public int getmax() throws Exception{
      return dao.maxbno();
   }
   
   public int listCount() throws Exception{
      return dao.listCount();
   }
   
   public List<BoardVO> listCri(Criteria cri) throws Exception{
      return dao.listCri(cri);
   }
   
   public void reinsert(BoardVO vo) throws Exception {

      BoardVO rvo = dao.selectOneTest(vo.getPno());
      System.out.println("rvo : " +rvo);
      vo.setDepth(rvo.getDepth() + 1);
      vo.setGno(rvo.getGno());
      vo.setOrd(rvo.getOrd());

      System.out.println("vo : " + vo);
      
      dao.testUpdate(vo);
      dao.testInsertReply(vo);
      gdao.insertCount(vo);
      
   }
   
   public List<BoardVO> listSearchCriteria(SearchCriteria cri){
      return dao.listSearch(cri);
   }
   
   public int listSearchCount(SearchCriteria cri){
      return dao.listSerachCount(cri);
   }
   

}