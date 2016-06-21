package bit.team42.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "bit.team42.replyMapper";
	
	public void replyInsert(ReplyVO vo){
		session.insert(namespace+".replyInsert", vo);
	}
	
	public List<ReplyVO> replySelectOne(Integer bno){
		return session.selectList(namespace+".replySelectOne", bno);
	}
	
	public void replyDelete(Integer rno){
		session.delete(namespace+".replyDelete", rno);
	}
	
	public void replyUpdate(ReplyVO vo){
		session.update(namespace+".replyupdate", vo);
	}
	
	public int replyCount(Integer bno){
		return session.selectOne(namespace+".replyCount", bno);
	}
	
	public void deleteBaord(Integer bno){
		session.delete(namespace+".deleteBaord", bno);
	}

}
