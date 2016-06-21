package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import bit.team42.domain.Criteria;
import bit.team42.domain.QnaVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.persistence.QnaDAO;


@Service
public class QnaService {
	
	@Inject
	private QnaDAO dao;
	
	public void insertQnA(QnaVO vo) throws Exception{
		dao.insertQnA(vo);	
	}
	
	public QnaVO readQnA(Integer qno) throws Exception{
		return dao.selectOne(qno);
	}
	
	public void modifyQnA(QnaVO vo) throws Exception{
		dao.updateQnA(vo);
	}
	
	public void removeQnA(Integer qno) throws Exception{
		dao.deleteQnA(qno);
	}
	
	public List<QnaVO> listAll() throws Exception{
		return dao.listAll();
	}
	
	public List<QnaVO> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	
	public int listCountCriteria(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}
	
	public List<QnaVO> listSearchCriteria(SearchCriteria cri) throws Exception{
		return dao.listSearch(cri);
	}
	
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return dao.listSearchCount(cri);
	}

}
