package bit.team42.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.Criteria;
import bit.team42.domain.QnaVO;
import bit.team42.domain.SearchCriteria;

@Repository
public class QnaDAO {
	
	@Inject
	private SqlSession session;

	private static final String namespace = "bit.team42.qnaMapper";
	
	public String getTime() {
		return session.selectOne(namespace + ".testTime");
	}
	
	public void insertQnA(QnaVO vo) {
		System.out.println("인설트  "+vo);
		session.insert(namespace + ".insertQnA", vo);
	}
	
	public QnaVO selectOne(Integer qno) {
		return session.selectOne(namespace+".selectOne", qno);
	}
	
	public List<QnaVO> listAll(){
		return session.selectList(namespace+".listAll");
	}
	
	public void deleteQnA(Integer qno) {
		session.delete(namespace + ".deleteQnA", qno);
	}

	public void updateQnA(QnaVO vo) {
		session.update(namespace + ".updateQnA", vo);
	}
	
	public List<QnaVO> listPage(int page) throws Exception{
		if(page <= 0){
			page = 1;
		}
		page = (page-1)*10;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	public List<QnaVO> listCriteria(Criteria cri) throws Exception{
		return session.selectList(namespace+".listCriteria", cri);
	}

	public int countPaging(Criteria cri) throws Exception{
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	public List<QnaVO> listSearch(SearchCriteria cri) throws Exception{
		return session.selectList(namespace+".listSearch",cri);
	}
	
	public int listSearchCount(SearchCriteria cri) throws Exception{
		return session.selectOne(namespace+".listSearchCount",cri);
	}
	
	//댓글 count
	public void updateReplyCnt(Integer qno, int amount) throws Exception{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("qno", qno);
		paramMap.put("amount", amount);
		
		session.update(namespace+".updateReplyCnt",paramMap);
	}
	

}
