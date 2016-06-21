package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import bit.team42.domain.Criteria;
import bit.team42.domain.NoticeVO;
import bit.team42.persistence.NoticeDAO;

@Service
public class NoticeService {
	
	@Inject
	private NoticeDAO dao;
	
	public void insertNotice(NoticeVO vo) throws Exception{
		dao.insertNotice(vo);	
	}
	
	public NoticeVO readNotice(Integer nno) throws Exception{
		return dao.selectOne(nno);
	}
	
	public void modifyNotice(NoticeVO vo) throws Exception{
		dao.updateNotice(vo);
	}
	
	public void removeNotice(Integer nno) throws Exception{
		dao.deleteNotice(nno);
	}
	
	public List<NoticeVO> listAll() throws Exception{
		return dao.listAll();
	}
	
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	
	public int listCountCriteria(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}

}
