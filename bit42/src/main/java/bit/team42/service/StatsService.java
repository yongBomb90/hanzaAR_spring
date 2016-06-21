package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import bit.team42.domain.Criteria;
import bit.team42.domain.VisitVO;
import bit.team42.persistence.StatsDAO;

@Service
public class StatsService {
	
	@Inject
	private StatsDAO dao;
	
	public void visitInsert(VisitVO vo) throws Exception{
		dao.visitInsert(vo);
	}
	
	public int visitTotalCount() throws Exception{
		return dao.visitTotalCount();
	}
	
	public int visitTodayCount() throws Exception{
		return dao.visitTodayCount();
	}
	
	public int memberTotalCount() throws Exception{
		return dao.memberTotalCount();
	}
	
	public int childTotalCount() throws Exception{
		return dao.childTotalCount();
	}
	
	public int markerTotalCount() throws Exception{
		return dao.markerTotalCount();
	}
	
	public int hanzaTotalCount() throws Exception{
		return dao.hanzaTotalCount();
	}
	
	public List<VisitVO> VisitList(VisitVO vo)throws Exception{
		return dao.visitToday();
	}


	public List<VisitVO> listCriteria(Criteria cri)throws Exception{
		return dao.listCriteria(cri);
	}
}
