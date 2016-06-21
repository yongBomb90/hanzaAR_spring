package bit.team42.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.Criteria;
import bit.team42.domain.MarkerVO;


@Repository
public class MarkerDAO {
	
	@Inject
	private SqlSession session;

	private static final String namespace = "bit.team42.markerMapper";
	
	public void insertMarker(MarkerVO vo) throws Exception{
		session.insert(namespace+".insertMarker", vo);
	}
	
	public MarkerVO readMarker(Integer markerid)throws Exception{
		return session.selectOne(namespace+".readOneMarker", markerid);
	}
	
	public void updateMarker(MarkerVO vo)throws Exception{
		session.update(namespace+".updateMarker", vo);	
	}
	
	public void deleteMarker(Integer markerid)throws Exception{
		session.delete(namespace+".deleteMarker", markerid);
	}
	
	public List<MarkerVO> readAllMarker()throws Exception{
		return session.selectList(namespace+".readAllMarker");
	}
	
	public List<MarkerVO> listPage(int page) throws Exception{
		if(page <= 0){
			page = 1;
		}
		page = (page-1)*10;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	public List<MarkerVO> listCriteria(Criteria cri) throws Exception{
		return session.selectList(namespace+".listCriteria", cri);
	}

	public int countPaging(Criteria cri) throws Exception{
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	
	
}
