package bit.team42.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.Criteria;
import bit.team42.domain.QReplyVO;

@Repository
public class QReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "bit.team42.qreplyMapper";
	
	public List<QReplyVO> list(Integer qno) throws Exception{
		return session.selectList(namespace+".list", qno);
	}
	
	public void create(QReplyVO vo) throws Exception{
		session.insert(namespace+".create",vo);
	}
	
	public void update(QReplyVO vo) throws Exception{
		session.update(namespace+".update", vo);
	}
	
	public void delete(Integer qrno) throws Exception{
		session.update(namespace+".delete", qrno);
	}
	
	public void deleteAll(Integer qno) throws Exception{
		session.update(namespace+".deleteAll", qno);
	}
	
	public List<QReplyVO> listPage(Integer qno, Criteria cri){
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("qno", qno);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".listPage",paramMap);
	}
	
	public int count(Integer qno) throws Exception{
		return session.selectOne(namespace+".count",qno);
	}
	
	public int getQno(Integer qrno) throws Exception{
		return session.selectOne(namespace+".getQno", qrno);
	}

}
