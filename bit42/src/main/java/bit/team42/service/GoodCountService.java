package bit.team42.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.team42.domain.GoodCountVO;
import bit.team42.persistence.GoodCountDAO;

@Service
@Transactional
public class GoodCountService {

   
   @Inject
   private GoodCountDAO dao;
   
   public GoodCountVO selectCount(Integer bno) throws Exception{
      return dao.selectCount(bno);
   }
   
   public void updateCount(GoodCountVO vo) throws Exception{
      dao.updateCount(vo);
   }
   
   public void deleteCount(Integer bno) throws Exception{
      dao.deleteCount(bno);
   }
   
}