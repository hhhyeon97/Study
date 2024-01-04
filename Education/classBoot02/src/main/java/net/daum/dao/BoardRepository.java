package net.daum.dao;

import org.springframework.data.repository.CrudRepository;

import net.daum.vo.BoardVO;

public interface BoardRepository extends CrudRepository<BoardVO, Integer> {
	/*
	 * <엔티티빈 클래스명, 빈클래스 유일 식별키인 @Id로 정의된 변수명 자료형 참조타입> 
	 *  BoardVO에서 bno가 @Id로 정의된 변수명인데 bno의 자료형이 int이므로 int의 참조타입인 Integer가 들어가게 되는 것 ! 
	 *  자바는 기본 타입의 값을 갖는 객체를 생성할 수 있다. 이런 객체를 포장(wrapper) 객체, 래퍼 클래스라고 부른다.
	 *  말 그대로 기본 타입 값을 내부에 포장한다. 위 표는 각 기본타입별 포장 객체다.
	 *  기본 타입과 래퍼 클래스의 차이는 기본 타입은 값 자체를 저장하고 래퍼 클래스는 객체를 저장한다는 점
	 *  왜 괄호안에 
	 *  
	 *  
	 *  
	 *   
	 *   JpaRepository 인터페이스의 부모 인터페이스가 PagingAndSortingRepository에서 페이징과
	 *   정렬이라는 기능을 제공한다.
	 *   PagingAndSortingRepository의 부모 인터페이스가 CrudRepository이다.
	 *   CrudRepository 인터페이스의 부모 인터페이스가 Repository이다.
	 *   
	 *   JpaRepository(자손이 기능이 더 많음) 를 구현상속 받으면 JPA와 관련된 거의 모든 기능을 쓸 수 있으므로 많이 쓰임 !!
	 */
	
	
	
	
}
