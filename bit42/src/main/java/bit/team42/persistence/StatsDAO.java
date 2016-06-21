package bit.team42.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.Criteria;
import bit.team42.domain.VisitVO;


@Repository
public class StatsDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "bit.team42.visitMapper";

	public void visitInsert(VisitVO vo){
		session.insert(namespace+".setVisitTotalCount",vo);
	}
	
	public int visitTotalCount(){
		return session.selectOne(namespace+".getVisitTotalCount");
	}
	
	public int visitTodayCount(){
		return session.selectOne(namespace+".getVisitTodayCount");
	}
	
	public int memberTotalCount(){
		return session.selectOne(namespace+".memberTotalCount");
	}
	
	public int childTotalCount(){
		return session.selectOne(namespace+".childTotalCount");
	}
	
	public int markerTotalCount(){
		return session.selectOne(namespace+".markerTotalCount");
	}
	
	public int hanzaTotalCount(){
		return session.selectOne(namespace+".hanzaTotalCount");
	}
	
	public List<VisitVO> visitToday(){
		return session.selectList(namespace+".getVisitToday");
	}
	
	public List<VisitVO> listCriteria(Criteria cri) throws Exception {

		return session.selectList(namespace+".memberPage", cri);

	}

}
