package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.team42.domain.Criteria;
import bit.team42.domain.QReplyVO;
import bit.team42.persistence.QReplyDAO;
import bit.team42.persistence.QnaDAO;

@Transactional
@Service
public class QReplyService {
	
	@Inject
	private QReplyDAO qreplyDAO;
	
	@Inject
	private QnaDAO qnaDAO;
	
	public void addReply(QReplyVO vo)throws Exception{
		qreplyDAO.create(vo);
		qnaDAO.updateReplyCnt(vo.getQno(), 1);
	}
	
	public List<QReplyVO> listReply(Integer qno) throws Exception{
		return qreplyDAO.list(qno);
	}
	
	public void modifyReply(QReplyVO vo) throws Exception{
		qreplyDAO.update(vo);
	}
	
	public void removeReply(Integer qrno) throws Exception{
		int qno = qreplyDAO.getQno(qrno);
		qreplyDAO.delete(qrno);
		qnaDAO.updateReplyCnt(qno, -1);
	}
	
	public void removeAllReply(Integer qno) throws Exception{
		qreplyDAO.deleteAll(qno);
	}
	
	public List<QReplyVO> listReplyPage(Integer qno, Criteria cri) throws Exception{
		return qreplyDAO.listPage(qno, cri);
	}
	
	public int count(Integer qno) throws Exception{
		return qreplyDAO.count(qno);
	}
	
	

}
