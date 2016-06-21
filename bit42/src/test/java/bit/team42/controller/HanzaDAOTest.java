package bit.team42.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.team42.domain.ChildCriteria;
import bit.team42.domain.Criteria;
import bit.team42.domain.HanzaVO;
import bit.team42.domain.MemberVO;
import bit.team42.domain.PageMaker;
import bit.team42.persistence.ChildDAO;
import bit.team42.persistence.HanzaDAO;
import bit.team42.persistence.MemberDAO;
import bit.team42.service.HanzaService;
import bit.team42.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class HanzaDAOTest {

	@Inject
	private HanzaDAO dao;
	
	@Inject
	private HanzaService service;
	
	@Inject
	private MemberService mservice;
	
	@Inject
	private MemberDAO mdao;
	
	
	@Inject
	private ChildDAO cdao;
	
	
	@Test
	public void delete() throws Exception {
		HanzaVO vo  = new HanzaVO();
		vo.setGrade(8);
		double totalcnt = dao.gradecnt(vo);
		System.out.println(totalcnt);
		double temp = totalcnt/10;
		System.out.println(temp);
		int last = (int) Math.ceil((temp));
		System.out.println(last);
		
		
		
	}
	@Test
	public void sda() throws Exception {
		HanzaVO vo  = new HanzaVO();
		vo.setGrade(8);
		System.out.println(service.gradecnt(vo));
	}
	

	
	@Test
	public void sda1() throws Exception {
		HanzaVO vo  = new HanzaVO();
		Criteria cri = new Criteria();
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(dao.gradetotal(vo));
		vo.setGrade(8);
		
		System.out.println(pagemaker);
	}

	@Test
	public void ssda() throws Exception {
	ChildCriteria cri = new ChildCriteria();
	cri.setPage(6);
	cri.setTotal(3);
	System.out.println(cri.getStartpage());
	System.out.println(cri.getEndpage());
	System.out.println(cri);

	}
	
	
	@Test
	public void childdaolist() throws Exception {
	ChildCriteria cri = new ChildCriteria();
	cri.setPage(6);
	cri.setTotal(3);
	System.out.println(cri.getStartpage());
	System.out.println(cri.getEndpage());
	System.out.println(cri);
	cri = cdao.userchildlistcnt("mskang102", cri);
	System.out.println(cri);
	System.out.println(cdao.userchildlist("mskang102", cri));
	
	}
	@Test
	public void mservice() throws Exception {
		
		System.out.println(mdao.read("mongjun"));
		
	}

}
