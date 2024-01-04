package net.daum.vo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter // setter()메서드 자동 제공
@Getter // getter()메서드 자동 제공
@ToString // toString)() 메서드 자동 제공 
@Entity //JPA 엔티티빈
@SequenceGenerator( // 시퀀스 생성기
			name="test_seq_gename", // 시퀀스 제너레이터 이름
			sequenceName ="test_seq", // 시퀀스 이름
			initialValue = 1, // 시퀀스 시작값
			allocationSize = 1 // 1씩 증가
			
		)
@Table(name="tbl_test") // tbl_test라는 테이블명 지정
@EqualsAndHashCode(of="test_no") // equals(), hashCode(), canEqual() 메서드 자동 제공
public class TestVO {	// TestVO 엔티티빈 클래스 
	
	@Id // 구분키 즉 식별키인 primary key 지정 
	@GeneratedValue(
			strategy=GenerationType.SEQUENCE, // 사용할 전략을 시퀀스로 선택
			generator="test_seq_gename" // 시퀀스 제너레이터 이름 
			)
	private int test_no; // 시퀀스 번호값이 저장되는 test_no
	
	private String test_title; // 제목 
	
	@Column(length=4000) // 컬럼 크기를 4000바이트로 지정 
	private String test_cont; // 내용 
	
	
	@CreationTimestamp // 하이버 네이트의 기능으로 등록 시점 날짜를 기록 (mybatis에서는 실행 안 함.)
	private Timestamp testRegdate; // mybatis 테스트할 때 오류남 !! ORA-01841 - > sql에서 date로 타입변경하니까 mybatis일 때 해결됨.
	
	
	
}
