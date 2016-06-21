package bit.team42.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import bit.team42.domain.FileVO;

@Repository
public class FileDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "org.team.fileMapper";
	
	public void insertFile(FileVO vo){
		session.insert(namespace+".insertFile", vo);
	}
	
	public List<FileVO> selectOne(Integer bno) throws Exception{
		return session.selectList(namespace+".selectOne", bno);
	}
	
	public void updateFile(FileVO vo){
		session.update(namespace+".updateFile", vo);
	}
	
	public int deleteFile(Integer bno){
		return session.delete(namespace+".deleteFile", bno);
	}

}
