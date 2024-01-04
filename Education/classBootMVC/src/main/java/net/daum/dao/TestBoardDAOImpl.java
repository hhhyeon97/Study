package net.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.daum.vo.TestBoardVO;

@Repository
public class TestBoardDAOImpl implements TestBoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertTest(TestBoardVO tv) {
		sqlSession.insert("testboard_in",tv);
	}

	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("testboard_count");
	}

	@Override
	public List<TestBoardVO> getTestBoardList() {
		return sqlSession.selectList("testboard_list");
	}
	
	
	@Override
	public void updateHit(int bno) {
		this.sqlSession.update("testboard_hit",bno);
	}

	@Override
	public TestBoardVO getTestBoardCont(int bno) {
		return this.sqlSession.selectOne("testboard_cont",bno);
	}

	
	
	
}
