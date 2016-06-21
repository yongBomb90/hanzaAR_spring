package bit.team42.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.FileVO;
import bit.team42.domain.MobileCriteria;
import bit.team42.domain.MsgVO;

@Repository
public class MsgDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "bit.team42.msgmapper";
	
	
	public int insertfile(MsgVO vo){
		return session.insert(namespace+".insertfile", vo);
	}
	public List<MsgVO> selectbycno(MsgVO vo, MobileCriteria cri) {
		 Map<String,Integer> map = new HashMap<String,Integer>();
	      map.put("page", cri.getPage());
	      map.put("cno",vo.getCno());
		return session.selectList(namespace+".selectbycno", map);
	}
	public List<MsgVO> selectbyuserid(MsgVO vo) {
		return session.selectList(namespace+".selectbyuserid", vo);
	}
	public List<Integer> markerlist(MsgVO vo) {
		return session.selectList(namespace+".markerlist", vo);
	}
	
	public MsgVO selectbymno(MsgVO vo) {
		return session.selectOne(namespace+".selectbymno", vo);
	}
	public MsgVO selectbymarker(MsgVO vo) {
		return session.selectOne(namespace+".selectbymarker", vo);
	}
	public int selectbycnocnt(MsgVO vo) {
		return session.selectOne(namespace+".selectbycnocnt", vo);
	}
	public int update(MsgVO vo){
		return session.update(namespace+".update", vo);
	}
	public int delete(MsgVO vo){
		return session.delete(namespace+".delete", vo);
	}

}
