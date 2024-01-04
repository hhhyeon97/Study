package net.daum.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor   // 모든 속성들에 대해서 생성자를 만들어 준다. (생성자 오버로딩)
public class MemberVO {  //엔티티빈 클래스

	
	private int mno;
	private String mid;
	private String mpw;
	private String mname;
	private Timestamp regdate;
	
	
	
	
	
	
	
	
}
