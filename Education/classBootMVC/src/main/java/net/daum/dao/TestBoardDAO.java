package net.daum.dao;

import java.util.List;

import net.daum.vo.TestBoardVO;

public interface TestBoardDAO {

	void insertTest(TestBoardVO tv);

	int getListCount();

	List<TestBoardVO> getTestBoardList();

	void updateHit(int bno);
	
	TestBoardVO getTestBoardCont(int bno);


}
