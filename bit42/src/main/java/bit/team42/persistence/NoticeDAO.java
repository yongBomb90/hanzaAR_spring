package bit.team42.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.Criteria;
import bit.team42.domain.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Inject
	private SqlSession session;

	private static final String namespace = "bit.team42.noticeMapper";
	
	public String getTime() {
		return session.selectOne(namespace + ".testTime");
	}
	
	public void insertNotice(NoticeVO vo) {
		session.insert(namespace + ".insertNotice", vo);
	}
	
	public NoticeVO selectOne(Integer nno) {
		return session.selectOne(namespace+".selectOne", nno);
	}
	
	public List<NoticeVO> listAll(){
		return session.selectList(namespace+".listAll");
	}
	
	public void deleteNotice(Integer nno) {
		session.delete(namespace + ".deleteNotice", nno);
	}

	public void updateNotice(NoticeVO vo) {
		session.update(namespace + ".updateNotice", vo);
	}
	
	public List<NoticeVO> listPage(int page) throws Exception{
		if(page <= 0){
			page = 1;
		}
		page = (page-1)*10;
		
		return session.selectList(namespace+".listPage", page);
	}
	
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception{
		return session.selectList(namespace+".listCriteria", cri);
	}

	public int countPaging(Criteria cri) throws Exception{
		return session.selectOne(namespace+".countPaging", cri);
	}
	

}
