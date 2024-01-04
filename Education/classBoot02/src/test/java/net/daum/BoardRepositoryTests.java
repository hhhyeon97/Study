package net.daum;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import net.daum.dao.BoardRepository;
import net.daum.vo.BoardVO;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BoardRepositoryTests {

	@Autowired // 자동 의존성 주입
	private BoardRepository boardRepo;
	
	@Test
	public void testInsertBoard() {
		BoardVO b = new BoardVO();
		
		b.setWriter("홍추추");
		b.setTitle("게시판 제목입니다.");
		b.setContent("게시판 내용입니다.");
		
		//this.boardRepo.save(b); // 게시판 저장 
	} // tbl_boards2 테이블에 레코드 저장
	
	
	@Test
	public void testBoardRead() {
		//Optional<BoardVO> b= this.boardRepo.findById(1); // 1번 레코드를 검색 
		//System.out.println(b);
	} // 게시판 조회 
	
	
	@Test
	public void testBoardEdit() {
		/*Optional<BoardVO> eb=this.boardRepo.findById(1); // 1번 레코드 검색
		
		eb.ifPresent(ebBoard->{ // 검색된 자료가 있다면 
			ebBoard.setWriter("수정홍추추");
			ebBoard.setTitle("수정 게시판 제목입니다.");
			ebBoard.setContent("수정 게시판 내용입니다.");
			
			System.out.println("\n=========> 게시판 수정");
			this.boardRepo.save(ebBoard); // 1번 레코드를 수정
		});*/
	} //게시판 수정 
	
	
	@Test
	public void testBoardDel() {
		System.out.println(" \n =========> 게시판 삭제");
		this.boardRepo.deleteById(1); // 1번 레코드 삭제 
	} //게시판 삭제 
	
	// mybatis보다 간단한 sql문과 관련된 효율은 JPA가 높다. 지원하지 않는 메서드나 복잡한 sql문은
	// mybatis로 사용하는 비율이 높다.. 적재적소 중요 ! 
	
	
}
