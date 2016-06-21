package bit.team42.controller;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.team42.domain.ChildVO;
import bit.team42.domain.Criteria;
import bit.team42.domain.MemberVO;
import bit.team42.domain.QnaVO;
import bit.team42.domain.SearchCriteria;
import bit.team42.dto.LoginDTO;
import bit.team42.persistence.ChildDAO;
import bit.team42.persistence.MemberDAO;
import bit.team42.persistence.QnaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class DAOTest {

	private static final Logger logger = LoggerFactory.getLogger(DAOTest.class);
	
	@Inject
	private MemberDAO dao;
	

	@Inject
	private QnaDAO qdao;

	@Inject 
	private ChildDAO cdao;
	

	
	@Test
	public void cage() throws Exception {
		logger.info(""+cdao.read(452));
		
	}
	
	@Test
	public void asdwqdqwqf() throws Exception {
		List<ChildVO> list = cdao.listAll();
		for (ChildVO vo : list) {
			System.out.println(vo.getCno());
		}
		ChildVO vo = cdao.read(376);
		Date age = new Date(12,10,10);
		vo.setAge(age);
		cdao.update(vo);
		
	}


	@Test
	public void insert() throws Exception {

		
		MemberVO vo = new MemberVO();
		
		
		vo.setUserid("zizi");
		
		vo.setUsername("만성");
		vo.setUserpw("zzz");
		vo.setEmail("naver");
		vo.setPhonenumber("010");
		vo.setGubun("u");
		dao.add(vo);
		
	}

	@Test
	public void delete() throws Exception {

		dao.remove("mskang102");

	}

	@Test
	public void update() throws Exception {

		MemberVO vo = new MemberVO();
		vo.setUserid("gigi");
		vo.setUserpw("121231231231233");
		vo.setEmail("daum");
		vo.setPhonenumber("010");
		vo.setUsername("만성");
		dao.update(vo);

	}

	@Test
	public void select() throws Exception {

		List<MemberVO> list = dao.listAll();
		logger.info("AllList" + list);

	}

	@Test
	public void selectOne() throws Exception {

		System.out.println(dao.read("mskang102"));

	}

	// @Test
	// public void login() throws Exception{
	//
	// LoginDTO dto = new LoginDTO();
	// dto.setUserid("mskang102");
	// dto.setUserpw("mskang");
	// System.out.println(loginDao.login(dto));
	// logger.info("login" + loginDao.login(dto));
	//
	//
	// }

	@Test
	public void listPageTest() throws Exception {

		int page = 2;
		List<MemberVO> list = dao.listPage(page);
		System.out.println("=======================================");
		for (MemberVO vo : list) {
			System.out.println("=======================================");
			logger.info("listpage ::::::::::::" + vo.getUserid() + "regdate:::::" + vo.getRegdate());

		}
	}

	@Test
	public void listCri() throws Exception {

		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPageNum(20);

		List<MemberVO> list = dao.listCriteria(cri);

		for (MemberVO vo : list) {

			logger.info("listCri::::::::::" + vo.getUserid() + vo.getRegdate());
		}

	}

	@Test
	public void countPageTest() throws Exception {

		System.out.println(dao.countPaging());

	}

	@Test
	public void listSaearch() throws Exception {

	SearchCriteria cri = new SearchCriteria();
	cri.setPage(1);
	List<MemberVO> list = dao.listSearch(cri);
	for (MemberVO vo : list) {
		logger.info("for=====================");
		logger.info(vo.getUserid() + ":::::::::::" + vo.getRegdate());
	}

	

	}
	@Test
	public void listSearch() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("m");
		cri.setSearchType("t");
		logger.info("===============");
		List<MemberVO> list = dao.listSearch(cri);

		for (MemberVO vo : list) {
			logger.info("for=====================");
			logger.info(vo.getUserid() + ":::::::::::" + vo.getRegdate());
		}

		logger.info("Count::::" + dao.listSearchCount(cri));

	}

	@Test
	public void listSearch1() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setSearchType("c");
		Date de = Date.valueOf("2016-05-10");

		

		List<MemberVO> list = dao.listSearch(cri);

		for (MemberVO vo : list) {
			logger.info("for=====================");
			logger.info(":::::::::::" + vo.getRegdate() + vo.getUserid());

		}

		logger.info("count:::::::" + dao.listSearchCount(cri));
	}
	
	@Test
	public void DateSearch() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setSearchType("c");
		cri.setKeyword("2016-05-09");
		System.out.println(cri);
		
		

		List<MemberVO> list = dao.listDate(cri);

		for (MemberVO vo : list) {
			logger.info("for=====================");
			logger.info(":::::::::::" + vo.getRegdate() + vo.getUserid());

		}

		logger.info("count:::::::" + dao.listSearchCount(cri));
	}

	@Test
	public void listSea() throws Exception {

		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		
		cri.setKeyword("2016-05-09");
		System.out.println(cri);
		
		

		List<MemberVO> list = dao.listSearch(cri);

		for (MemberVO vo : list) {
			logger.info("for=====================");
			logger.info(":::::::::::" + vo.getRegdate() + vo.getUserid());

		}

		logger.info("count:::::::" + dao.listSearchCount(cri));
	}
	
	
	
	/////로그인
	
	
	@Test
	public void login() throws Exception {

		LoginDTO dto = new LoginDTO();
		dto.setUserid("만성이");
		dto.setUserpw("1");
		dao.login(dto);
		System.out.println(dao.login(dto));

	}
	

	@Test
	public void childcnt() throws Exception {

		System.out.println(cdao.childcnt("wantme"));

	}
	
	

	

	



}
