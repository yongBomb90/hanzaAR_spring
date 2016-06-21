package bit.team42.persistence;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.MemberVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.dto.LoginDTO;

@Repository
public class MemberDAO {

	@Inject
	private SqlSession session;

	public void add(MemberVO vo) throws Exception {

		session.insert("bit.team42.memberMapper.insert", vo);
	}

	public void remove(String userid) throws Exception {

		session.delete("bit.team42.memberMapper.delete", userid);

	}

	public void update(MemberVO vo) throws Exception {

		session.update("bit.team42.memberMapper.update", vo);
	}

	public void childcntupdate(String userid) throws Exception {
		session.update("bit.team42.memberMapper.childcntupdate", userid);
	}

	
	public List<MemberVO> listAll() throws Exception {

		return session.selectList("bit.team42.memberMapper.readAll");
	}

	public MemberVO read(String userid) throws Exception {
		return session.selectOne("bit.team42.memberMapper.read", userid);
	}

	public List<MemberVO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList("bit.team42.memberMapper.listPage", page);
	}

	public List<MemberVO> listCriteria(Criteria cri) throws Exception {

		return session.selectList("bit.team42.memberMapper.listCriteria", cri);

	}

	public int countPaging() throws Exception {
		return session.selectOne("bit.team42.memberMapper.countPaging");
	}

	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList("bit.team42.memberMapper.listSearch", cri);
	}

	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne("bit.team42.memberMapper.listSearchCount", cri);
	}

	public List<MemberVO> listDate(SearchCriteria cri) throws Exception {

		return session.selectList("bit.team42.memberMapper.date", cri);
	}

	// 濡쒓렇�씤

	public MemberVO login(LoginDTO dto) throws Exception {

		return session.selectOne("bit.team42.memberMapper.login", dto);
	}
	
	public void keepLogin(String userid,String sessionid,java.sql.Date next){
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("sessionid", sessionid);
		paramMap.put("next", next);
		session.update("bit.team42.memberMapper.keepLogin", paramMap);
	}

	public MemberVO checkUser(String value)throws Exception{
		return session.selectOne("bit.team42.memberMapper.checkSession", value);
	}
	
	public int choiceUpdate(ChildVO vo) throws Exception {

		return session.update("bit.team42.memberMapper.choice", vo);
	}

	public void updatetoken(MemberVO vo) throws Exception {
		session.update("bit.team42.memberMapper.updatetoken", vo);
	}
}
