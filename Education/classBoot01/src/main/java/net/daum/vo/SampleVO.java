package net.daum.vo;

import lombok.Data;
import lombok.ToString;

//@Setter
//@Getter
@Data
@ToString(exclude= {"val03"})  //exclude를 사용해서 toString()메서드를 호출했을 때 val03 변수 제외
public class SampleVO { // 데이터 저장빈 클래스 
	
	private String val01;
	private String val02;
	private String val03;
	
	
	

}
