package net.daum.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageVO { //tbl_message 테이블의 컬럼명과 일치하는 변수명을 가진 데이터 저장빈 클래스 

	private int mid; // 시퀀스로부터 번호키를 가져와서 저장할 유일 키 번호값
	private String targetid; //외래키 추가 설정 - > tbl_user테이블의 uid2컬럼 레코드인 회원아이디값만 저장됨
	private String sender; // 메세지를 보낸 사람 
	private String message; // 보낸 메세지 
	private Timestamp senddate; //보낸 날짜 
	
	
	
	
}
