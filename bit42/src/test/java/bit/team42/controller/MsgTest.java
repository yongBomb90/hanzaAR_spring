package bit.team42.controller;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import bit.team42.domain.HanzaVO;
import bit.team42.domain.MsgVO;
import bit.team42.service.HanzaService;
import bit.team42.service.MsgService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MsgTest {
	@Inject
	private MsgService service;
	MsgVO vo ;
	@Before
	public void before(){
		vo = new MsgVO();
		vo.setUserid("adminbum");
		vo.setCno(454);
		vo.setMarkerid(10);
		vo.setContent("이야호");
	}
	@Test
	public void insert() throws Exception {
		for (int i = 1; i < 553; i++) {
			vo.setContent("이야호 "+i);
			vo.setCno(449);
			vo.setMarkerid(i);
			service.insertMsg(vo);
		}
	}
	@Test
	public void insertfile() throws Exception {
		vo.setFiletype(".mp3");
		service.insertMsg(vo);
	}
	
	@Test
	public void selectbyuserid() throws Exception {
		System.out.println(service.selectbyuserid(vo));
	}
	@Test
	public void selectbymno() throws Exception {
		vo.setMno(1);
		System.out.println(service.selectbymno(vo));
	}
	@Test
	public void update() throws Exception {
		vo.setMno(1);
		vo.setContent("13");
		System.out.println(service.update(vo));
	}
	@Test
	public void delete() throws Exception {
		vo.setMno(1);
		System.out.println(service.delete(vo));
	}
	@Test
	public void selectbymarker() throws Exception {
		vo.setCno(452);
		vo.setMarkerid(17);
		System.out.println(service.selectbymarker(vo));
	}
}
