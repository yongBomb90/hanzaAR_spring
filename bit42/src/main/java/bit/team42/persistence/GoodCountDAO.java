package bit.team42.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.BoardVO;
import bit.team42.domain.GoodCountVO;

@Repository
public class GoodCountDAO {
   
   @Inject
   private SqlSession session;

   private static final String namespace = "bit.team42.goodcountmapper";
   
   public void insertCount(BoardVO vo) throws Exception{
      session.insert(namespace+".insertCount", vo);
   }
   
   public GoodCountVO selectCount(Integer bno) throws Exception{
      return session.selectOne(namespace+".selectCount", bno);
   }
   
   public void updateCount(GoodCountVO vo) throws Exception{
      session.update(namespace+".updateCount", vo);
   }
   
   public void deleteCount(Integer bno) throws Exception{
      session.delete(namespace+".deleteCount", bno);
   }

}