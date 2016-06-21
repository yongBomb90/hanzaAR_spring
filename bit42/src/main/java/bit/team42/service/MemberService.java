package bit.team42.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.MemberVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.dto.LoginDTO;
import bit.team42.persistence.ChildDAO;
import bit.team42.persistence.MemberDAO;


@Service
public class MemberService {

	@Inject
	private MemberDAO dao;
	@Inject
	private ChildDAO cdao;
	
	public void register(MemberVO vo)throws Exception{
		
		dao.add(vo);
	}
	
	public void update(MemberVO vo)throws Exception{
		
		dao.update(vo);
		
	}
	
	public void delete(String userid)throws Exception{
		cdao.userRemove(userid);
		dao.remove(userid);
	}
	
	public List<MemberVO> listAll() throws Exception{
		return dao.listAll();
	}
	
	public MemberVO readOne(String userid)throws Exception{
		return dao.read(userid);
	
	}
	
	public List<MemberVO> listCriteria(Criteria cri)throws Exception{
		return dao.listCriteria(cri);
	}
	
	public int listCountCriteria()throws Exception{
		return dao.countPaging();
	}

	public List<MemberVO> listSearchCri(SearchCriteria cri)throws Exception{
		return dao.listSearch(cri);
	}
	public int listSearchCount(SearchCriteria cri)throws Exception{
		return dao.listSearchCount(cri);
	}
	public List<MemberVO> listDate(SearchCriteria cri)throws Exception{
		return dao.listDate(cri);
	}
	////濡쒓렇�씤
	
	public MemberVO login(LoginDTO dto)throws Exception{
		
		return dao.login(dto);
	}
	
	public ChildVO clogin(LoginDTO dto)throws Exception{
		
		return cdao.login(dto);
	}
	
	
	public void keepLogin(String userid,String sessionid,Date next)throws Exception{
		dao.keepLogin(userid, sessionid, next);
	}
	
	public MemberVO checkLogin(String value)throws Exception{
		
		return dao.checkUser(value);
	}
	
public void choiceUpdate(ChildVO vo)throws Exception{
		
		dao.choiceUpdate(vo);
		
	}

public void updatetoken(MemberVO vo)throws Exception{
	
	dao.updatetoken(vo);
	
}

}
