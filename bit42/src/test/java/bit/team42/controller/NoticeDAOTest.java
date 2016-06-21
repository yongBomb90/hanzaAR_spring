package bit.team42.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.team42.domain.Criteria;
import bit.team42.domain.NoticeVO;
import bit.team42.domain.QnaVO;
import bit.team42.persistence.NoticeDAO;
import bit.team42.persistence.QnaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeDAOTest {

private static final Logger logger = LoggerFactory.getLogger(NoticeDAOTest.class);
	
	@Inject
	private NoticeDAO dao;
	
	@Inject
	private QnaDAO qdao;
	
	@Test
	public void getTime(){
		dao.getTime();
	}
	
	@Test
	public void insertNotice(){
		
		NoticeVO vo = new NoticeVO();
		
		for(int i=2;i<100;i++){
		vo.setTitle("공지입니다"+i);
		vo.setContent("내용입니다"+i);
		vo.setUserid("adminsun");
		
		dao.insertNotice(vo);
		}
		}
	


	@Test
	public void testUpdate() throws Exception{
		
		QnaVO vo = new QnaVO();
		
		vo.setQno(239);
		vo.setContent("수정 내용");
		vo.setTitle("수정 제목");
		
		qdao.updateQnA(vo);
		
	}
	
	@Test
	public void testRead() throws Exception{
		
		logger.info(dao.selectOne(22).toString());
		
	}
	
	@Test
	public void testReadAll() throws Exception{
		
		logger.info(dao.listAll().toString());
		
	}
	
	@Test
	public void testdelete() throws Exception{
		
		dao.deleteNotice(99);
		
	}
	
	@Test
	public void testListPage() throws Exception{
		
		int page=3;
		
		List<NoticeVO> list = dao.listPage(page);
		
		for (NoticeVO noticeVO : list) {
			logger.info(noticeVO.getTitle()+":"+noticeVO.getNno());
		}
	}
	
	@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPageNum(20);
		
		List<NoticeVO> list = dao.listCriteria(cri);
		
		for (NoticeVO noticeVO : list) {
			logger.info(noticeVO.getTitle()+":"+noticeVO.getNno());
		}
	}

	

}
