package bit.team42.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.BoardVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.SearchCriteria;


@Repository
public class BoardDAO {

   @Inject
   private SqlSession session;

   private static final String namespace = "bit.team42.boardMapper";

   public String getTime() {
      return session.selectOne(namespace + ".testTime");
   }

   public BoardVO selectOne(Integer bno) {
      return session.selectOne(namespace+".selectOne", bno);
   }
   
   public List<BoardVO> ListAll(){
      return session.selectList(namespace+".listAll");
   }

   public void insertBoard(BoardVO vo) {
      session.insert(namespace + ".insertBoard", vo);
   }

   public void deleteBoard(Integer bno) {
      session.delete(namespace + ".deleteBoard", bno);
   }

   public void updateBoard(BoardVO vo) {
      session.update(namespace + ".updateBoard", vo);
   }
   
   public void updateReplycnt(int vo) {
      session.update(namespace + ".updateReplycnt", vo);
   }
   public void updateCount(int vo) {
      session.update(namespace + ".updateCount", vo);
   }

   public int maxbno(){
      return session.selectOne(namespace+".maxbno");
   }
   
   public int listCount(){
      return session.selectOne(namespace+".listCount");
   }
   
   public List<BoardVO> listPage(int page){
      
      if(page <= 0){
         page = 1;
      }
      page = (page -1)*10;
      
      return session.selectList(namespace+".listPage", page);
   }
   
   public List<BoardVO> listCri(Criteria cri){
      return session.selectList(namespace+".listCri", cri);
   }
   
   public BoardVO selectOneTest(Integer bno){
      return session.selectOne(namespace+".replySelectOne", bno);
   }
   
   public void testUpdate(BoardVO vo){
      session.update(namespace+".replyUpdateBoard", vo);
   }
   
   public void testInsertReply(BoardVO vo){
      session.insert(namespace+".replyInsertBoard", vo);
   }

   public void replyDeleteBoard(Integer bno){
      session.delete(namespace+".replyDeleteBoard", bno);
   }
   
   public List<BoardVO> listSearch(SearchCriteria cri) {
      return session.selectList(namespace+".listSearch", cri);
   }
   
   public int listSerachCount(SearchCriteria cri){
      return session.selectOne(namespace+".listSearchCount", cri);
   }

}