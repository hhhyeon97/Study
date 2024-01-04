package net.daum.vo;

import lombok.Data;

@Data
public class AddrVO {

	
	private int mno;//변수명이 JSON의 키이름이 된다.
	private String name;//이름
	private String addr;//주소

}
