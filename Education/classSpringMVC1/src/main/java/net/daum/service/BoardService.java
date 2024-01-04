package net.daum.service;

import java.util.List;

import net.daum.vo.BoardVO;

public interface BoardService {
	
	void insertBoard(BoardVO b); //public abstract이 생략된 추상메서드 - > {}가 없고 실행문장이 없다.
	int getTotalCount();
	List<BoardVO> getBoardLsit(BoardVO b);
	BoardVO getBoardCont(int bno);
	BoardVO getBoardCont2(int bno);
	void editBoard(BoardVO eb);
	void delBoard(int bno);

}
