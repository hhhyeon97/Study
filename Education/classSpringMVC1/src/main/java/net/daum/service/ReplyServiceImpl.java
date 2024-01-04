package net.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.daum.dao.BoardDAO;
import net.daum.dao.ReplyDAO;
import net.daum.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {	//ReplyService를 구현상속받은 ReplyServiceImpl
	
	@Autowired
	private ReplyDAO replyDao;
	
	
	@Autowired
	private BoardDAO boardDao;	

	
	//스프링의 AOP를 통한 트랜잭션 적용 대상 -> 댓글이 추가되면 댓글 카운터 1 증가
	@Transactional //트랜잭션 적용 - > 데이터의 일관성 유지( 데이터 불일치 현상 제거 )
	@Override
	public void addReply(ReplyVO vo) {
		this.replyDao.addReply(vo);  //댓글 추가 insert
		this.boardDao.updateReplyCnt(vo.getBno(),1); // 새로운 댓글 하나가 추가되면 게시물 번호를 기준으로 댓글 개수 1 증가 - > update
	}
	
	@Override
	public List<ReplyVO> listReply(int bno) {
		return this.replyDao.listReply(bno);
	}
	
	@Override
	public void editReply(ReplyVO vo) {
		this.replyDao.editReply(vo);
	}
	
	//댓글이 삭제되면 댓글 개수 1 감소 -> 스프링의 AOP를 통한 트랜잭션 적용 
	@Transactional
	@Override
	public void deleteReply(int rno) { //댓글이 삭제되기전에 번호값에 해당하는 게시판글의 댓글개수를 먼저 획득해야 삭제된 후의 댓글수를 수정할 수 있음!!!
		int bno = this.replyDao.getBno(rno); // 댓글이 삭제되기 전에 번호를 기준으로 게시판 번호를 구함.
		
		this.replyDao.deleteReply(rno);
		this.boardDao.updateReplyCnt(bno, -1); // 댓글 하나 삭제되면 댓글 개수 1 감소 
	}
	
	
	
}
