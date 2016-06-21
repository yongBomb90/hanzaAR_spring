package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import bit.team42.domain.Criteria;
import bit.team42.domain.MarkerVO;
import bit.team42.persistence.MarkerDAO;




@Service
public class MarkerService {
	
	@Inject
	private MarkerDAO dao;
	
	public void insertFile(MarkerVO vo) throws Exception{
		dao.insertMarker(vo);	
	}
	
	public MarkerVO readFile(Integer markerid) throws Exception{
		return dao.readMarker(markerid);
	}
	
	public void modifyFile(MarkerVO vo) throws Exception{
		dao.updateMarker(vo);
	}
	
	public void removeFile(Integer markerid) throws Exception{
		dao.deleteMarker(markerid);
	}
	
	public List<MarkerVO> listAll() throws Exception{
		return dao.readAllMarker();
	}
	
	public List<MarkerVO> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	
	public int listCountCriteria(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}

}
