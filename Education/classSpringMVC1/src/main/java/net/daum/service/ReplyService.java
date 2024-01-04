package net.daum.service;

import java.util.List;

import net.daum.vo.ReplyVO;

public interface ReplyService {

	void addReply(ReplyVO vo);

	List<ReplyVO> listReply(int bno); //리턴 타입 알맞게 수정 

	void editReply(ReplyVO vo);

	void deleteReply(int rno);
	
}
