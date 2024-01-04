package net.daum.dao;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import net.daum.vo.BoardVO;

public interface BoardRepository extends JpaRepository<BoardVO, Integer> {

	/*	쿼리 메서드란? 검색쿼리문에서 메서드 이름만으로 원하는 검색 쿼리문을 만들어 내는 메서드를 말한다. 
	 * 
	 */
	public List<BoardVO> findBoardVOByTitle(String title); //쿼리메서드에서 find+
	//엔티티빈클래스명+By+테이블 컬럼명()을 통해 제목을 기준으로 검색
	
	public Collection<BoardVO> findByWriter(String writer); //쿼리메서드에서 
	//findBy+엔티티빈클래스속성명() - > 글쓴이를 기준으로 검색 
	
	/* 글쓴이에 대한 like %검색어% = > '%'+ 검색어 + '%' ( Containing 형태가 가장 많이 쓰임 ) 
	 * like 검색 쿼리 메서드 형태  ) 
	 * 형태 			쿼리 메서드 
	 * 검색어 +'%'     StartingWith
	 * '%'+검색어            EndingWith 
	 * '%'+검색어+'%'  Containing
	 */
	// like검색 쿼리 메서드 (우편주소 등등에 활용할 수 있음)  // 사용 빈도 높음 !! 
	public Collection<BoardVO> findByWriterContaining(String name);
	
	// or 조건 처리 = >  '%'+제목+'%' + or + '%'+내용+'%'
	public Collection<BoardVO> findByTitleContainingOrContentContaining(String title,
			String cont);
	
	// title like %?% And Bno > ?
	public Collection<BoardVO> findByTitleContainingAndBnoGreaterThan(String title,
			int bno);
	
	
	// bno > ? order by bno desc
	public Collection<BoardVO> findByBnoGreaterThanOrderByBnoDesc(int bno);
	
	
	// =================JPQL문========================================
														// %?1% = > 첫번째로 전달되어지는 인자값 ( 이 방식 자주 활용하기 !)
	@Query("select b from BoardVO b where b.title like %?1% and b.bno >0 order by"        
			+" b.bno desc") // JPQL(JPA에서 사용하는 쿼리 언어) (Java Persistence Query Language의 약어)
	
		// < -- ※ 에러 원인 : by랑 b.bno 사이에 띄어쓰기 해주어야 함 ! 플러스 안 쓰고 한 줄에 써도 됨 !! 
	
	// JPQL에서는 실제 테이블 명 대신 엔티티빈 클래스명을 사용하고, 실제 테이블의 컬럼명 대신 엔티티빈의 속성 즉 변수명을 이용한다.
	// ?1의 뜻은 첫번쨰로 전달되어지는 인자값을 의미한다. 
	public List<BoardVO> findByTitle(String title);
	
	// jpql문이 가독성이 좀 더 낫다요 .. jpql문을 사용할 때 쿼리문에서 완전히 독립적일 순 없는 ?!
	// jpql문 쓰면 메서드 이름 구속받지 않고 마음대로 지을 수 있게 됨 ! 
	
	
						// findbyContent에서 일부로 b를 소문자로 해서 오류가 안 나는지 테스트 ! 
	@Query("select b from BoardVO b where b.content like %:content% and b.bno>0 order by b.bno desc")
	public List<BoardVO> findbyContent(@Param("content") String content);
	// :content는 @Param("content")와 연결된다. 
	
	
	// 원하는 컬럼만 검색할 때는 반환타입이 컬렉션 제네릭 타입인 엔티티빈(BoardVO) 타입이 아니라 Object[] 배열이다.
	@Query("select b.bno, b.title, b.writer, b.regdate from BoardVO b where b.title like %?1% and b.bno > 0 order by b.bno desc")
	public List<Object[]> findByTitle2(String title);
	
	
	
	
	
	
	
	
	
	
}
