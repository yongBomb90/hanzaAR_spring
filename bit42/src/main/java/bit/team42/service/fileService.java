package bit.team42.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bit.team42.domain.FileVO;
import bit.team42.persistence.FileDAO;


@Service
@Transactional
public class fileService {
	
	@Inject
	private FileDAO dao;
	
	public void insertFile(FileVO vo) throws Exception{
		dao.insertFile(vo);
	}
	
	public List<FileVO> selectOne(Integer bno) throws Exception{
		return dao.selectOne(bno);
	}
	
	public void updateFile(FileVO vo) throws Exception{
		dao.updateFile(vo);
	}
	
	public int deleteFile(Integer bno) throws Exception{
		return dao.deleteFile(bno);
	}
	
	

}
