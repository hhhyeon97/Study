package net.daum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.daum.service.ReplyService;
import net.daum.vo.ReplyVO;

@RestController		//@RestController 애노테이션을 추가함으로써 해당 컨트롤러는 REST Api 서비스 프로그램을 개발 가능하게 된다. 
@RequestMapping("/replies") //컨트롤러 자체 매핑주소 등록
public class ReplyController {
	
	@Autowired	//자동 의존성 주입 (DI)
	private ReplyService replyService;
	
	//1.댓글 등록
	@RequestMapping(value="/reply_add",method=RequestMethod.POST) //post로 접근하는 매핑주소 처리 => reply_add 매핑주소 등록 
	public ResponseEntity<String> reply_add(@RequestBody ReplyVO vo){
		/*	@RequestBody 애노테이션은 키, 값 쌍의 JSON 형태의 전송된 데이터를 ReplyVO 객체 타입으로 변경해준다.
		 */
		ResponseEntity<String> entity=null;
		
		try {
			this.replyService.addReply(vo); //댓글 저장
			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
			//댓글 저장 성공시 'SUCCESS'문자와 200 정상 상태 코드가 반환됨.
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			// 댓글 저장 실패시 예외 에러 메세지와 나쁜 상태 코드 반환 
		}
		return entity;
	}//reply_add()
	
	//2.게시판 번호에 해당하는 댓글 목록
	@RequestMapping(value="/all/{bno}",produces="application/json") //주소창에 직접 입력해서 실행하는 방식이 GET 방식 
													//(그러므로 이 메서드는 get방식임 왜냐면 bno(게시판번호)값을 직접 입력하기 때문)
	public ResponseEntity<List<ReplyVO>> getReplyList(@PathVariable("bno")int bno){
		/*
		 * @PathVariable("bno")는 매핑주소로부터 번호값을 추출하는 용도로 활용된다.
		 */
		ResponseEntity<List<ReplyVO>> entity=null;
		
		try {
			entity = new ResponseEntity<>(this.replyService.listReply(bno),
					HttpStatus.OK);
			//게시판 번호에 해당하는 댓글 목록을 반환 
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}//getReplyList()
	
	
	//3.댓글 수정 							// 방식 2가지 
	@RequestMapping(value="/{rno}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	//PUT은 전체 자료 수정, PATCH는 일부 자료 수정 
	public ResponseEntity<String> updateReply(@PathVariable("rno")int rno,
			@RequestBody ReplyVO vo){
		
		ResponseEntity<String> entity=null;
		
		try {
			vo.setRno(rno); //댓글 번호 저장    !!댓글 등록부분과 달리 수정파트에서는 json타입이 아니라서 
			//@RequestBody 애노테이션이 ReplyVO 객체 타입으로 변경해주지 못함 !!
			//그러므로 여기선 따로 댓글번호 저장해주어야 함 ! 
			this.replyService.editReply(vo); //댓글수정
			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}//updateReply()
	
	
	//댓글삭제
	@RequestMapping(value="{rno}",method=RequestMethod.DELETE)
	public ResponseEntity<String> delReply(@PathVariable("rno")int rno){
		ResponseEntity<String> entity=null;
		
		try {
			this.replyService.deleteReply(rno);
			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}//delReply()
	
}
