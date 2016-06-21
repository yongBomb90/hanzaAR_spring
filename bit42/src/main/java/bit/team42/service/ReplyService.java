package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.team42.domain.ReplyVO;
import bit.team42.persistence.BoardDAO;
import bit.team42.persistence.ReplyDAO;

@Service	
@Transactional
public class ReplyService {
	
	@Inject
	ReplyDAO dao;
	
	@Inject
	BoardDAO bdao;
	
	public void replyInsert(ReplyVO vo)throws Exception{
		dao.replyInsert(vo);
		bdao.updateReplycnt(vo.getBno());

	}
	
	public List<ReplyVO> replySelectOne(Integer bno)throws Exception{
		bdao.updateReplycnt(bno);
		return dao.replySelectOne(bno);
	}

	public void replyDelete(Integer rno) throws Exception{
		dao.replyDelete(rno);
	}
	
	public void replyUpdate(ReplyVO vo)throws Exception{
		dao.replyUpdate(vo);
	}

	public void replyDeleteBoard(Integer bno) throws Exception{
		dao.deleteBaord(bno);
	}


}
