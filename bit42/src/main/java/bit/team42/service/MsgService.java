package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.team42.domain.FileVO;
import bit.team42.domain.MobileCriteria;
import bit.team42.domain.MsgVO;
import bit.team42.persistence.FileDAO;
import bit.team42.persistence.MsgDAO;


@Service
@Transactional
public class MsgService {
	
	@Inject
	private MsgDAO dao;
	
	public List<Integer> markerlist(MsgVO vo) {
		return dao.markerlist(vo);
	}
	public int insertMsg(MsgVO vo){
		return dao.insertfile(vo);
	}
	public List<MsgVO> selectbycno(MsgVO vo, MobileCriteria cri) {
		return dao.selectbycno(vo,cri);
	}
	public List<MsgVO> selectbyuserid(MsgVO vo) throws Exception{
		return dao.selectbyuserid(vo);
	}
	public MsgVO selectbymno(MsgVO vo) throws Exception{
		return dao.selectbymno(vo);
	}
	public MsgVO selectbymarker(MsgVO vo) throws Exception{
		return dao.selectbymarker(vo);
	}
	public int update(MsgVO vo){
		return dao.update(vo);
	}
	public int delete(MsgVO vo){
		return dao.delete(vo);
	}
	public MobileCriteria selectbycnocnt(MsgVO vo, MobileCriteria cri){
		cri.setTotal(dao.selectbycnocnt(vo));
		return cri;
	}
	
}
