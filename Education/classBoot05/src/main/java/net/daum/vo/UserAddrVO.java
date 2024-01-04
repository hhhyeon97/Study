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

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity // JPA를 다루는 엔티티빈 클래스
@SequenceGenerator( // 시퀀스생성기
		name="bno_seq2_gename", // 시퀀스 제너레이터 이름
		sequenceName="bno_seq2", // 시퀀스 이름
		initialValue=1, //시작값
		allocationSize=1//증가값 1, 기본값은 50
		)
@Table(name="tbl_useraddr2") //tbl_useraddr2 테이블명 지정
public class UserAddrVO { //데이터 저장빈 클래스
	
	@Id //기본키 즉 구분키 지정
	@GeneratedValue(
				strategy = GenerationType.SEQUENCE,
				generator = "bno_seq2_gename" // 시퀀스 제너레이터 이름
			)
	private int userno; // 번호
	private String username; // 이름
	
	// 이 기능은 처음 테이블 생성할 때 설정하면 먹히고 생성된 뒤에 바꾸려고 할 땐 적용 안 됨!
	// 수정하는거랑 nocache 0으로 설정하는 거 찾아보기 !!! 
	@Column(length=4000)
	private String useraddr; // 주소
	
	@CreationTimestamp // 하이버 네이트에서 제공하는 기능으로 등록날짜 설정 
	private Timestamp regdate;
	
}
