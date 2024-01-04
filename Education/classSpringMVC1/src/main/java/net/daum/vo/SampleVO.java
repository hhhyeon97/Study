package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

@Setter //setter() 메서드 자동제공하는 람복 라이브러리 추가
@Getter //getter() 메서드 자동제공
public class SampleVO {
	
	private int mno;
	private String firstName; //성
	private String lastName; //이름
}
