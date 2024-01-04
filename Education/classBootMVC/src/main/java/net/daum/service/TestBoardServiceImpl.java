package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.TestBoardDAO;
import net.daum.vo.TestBoardVO;

@Service
public class TestBoardServiceImpl implements TestBoardService {

	
	@Autowired
	private TestBoardDAO testboardDao;

	@Override
	public void insertTest(TestBoardVO tv) {
		testboardDao.insertTest(tv);
	}

	@Override
	public int getListCount() {
		return this.testboardDao.getListCount();
	}

	@Override
	public List<TestBoardVO> getTestBoardList() {
		return this.testboardDao.getTestBoardList();
	}

	/*
	 * @Override public void updateHit(int bno) {
	 * 
	 * }
	 */
	
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public TestBoardVO getTestBoardCont(int bno) {
		this.testboardDao.updateHit(bno);
		return testboardDao.getTestBoardCont(bno);
	}

	
	
	
	
}
