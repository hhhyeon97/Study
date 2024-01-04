package net.daum.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.daum.vo.SampleVO;

@RestController // jsp와 같은 뷰페이지를 만들지 않고도 문자열, json, xml 데이터 등을 웹브라우저에 만들 수 있다. 
public class SampleController {

	@GetMapping("/boot_start") // get으로 접근하는 매핑주소를 처리, boot_start 매핑주소등록
	public String boot_start() {
		return "스프링 부트 프로젝트 시작";
	}
	
	@RequestMapping(value="/rest_write",produces="application/json")
	public SampleVO rest_write() {
		// 리턴 타입이 SampleVO이면 해당 클래스 변수명이 json데이터의 키이름이 된다.
		
		SampleVO vo = new SampleVO();
		vo.setVal01("val01입니다.");
		vo.setVal02("val02입니다.");
		vo.setVal03("val03입니다.");
		
		System.out.println(vo.toString());  // .toString()메서드 생략 가능 
		
		return vo;
	} // rest_write()
	
}
