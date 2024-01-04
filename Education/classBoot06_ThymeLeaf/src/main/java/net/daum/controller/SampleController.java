package net.daum.controller;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.daum.vo.MemberVO;

@Controller
public class SampleController {

	@GetMapping("/start_thymeLeaf")
	public ModelAndView start_thymeLeaf() {
		
		ModelAndView tm = new ModelAndView();
		tm.addObject("greeting","안녕하세요. 타임리프"); // greeting 키이름에 문자 저장
		tm.setViewName("./thymeLeaf/start_thymeLeaf"); // 뷰리졸브 경로는 /src/main/resources/
		// templates/thymeLeaf/start_thymeLeaf.html
		
		// /src/main/resources/static 경로에는 html, javascript, css 이미지 등 사이트 개발에 필요한
		// 리소스 자원이 들어간다. sts상에서 .html, .css 등을 만들면 자동으로 src/main/webapp 경로로 들어감
		return tm;
	} // start_thymeLeaf()
	
	
	// 복수개 값을 타임리프로 가져오기 
	@RequestMapping("/listTest")
	public void listTest(Model model) { // 리턴 타입이 없는 void형이면 매핑주소가 뷰페이지 파일명이 된다. 
		
		List<String> list=new ArrayList<>();
		
		for(int i=1; i<=5; i++) {
			list.add("Data : "+i); // 컬렉션에 추가 
			
		}
		
		
		model.addAttribute("cont_title","타임리프로 복수개 값 가져오기");
		model.addAttribute("list",list); //각각의 키이름에 값 저장  // 게시판 목록 가져올 때 활용
		
	} //listTest
	
	
	// 객체 값을 가져오는 연습
	@GetMapping("/sample2")
	public void sample2(Model m) {
		
		MemberVO vo = new MemberVO(123,"u00","p00","홍추추",new Timestamp(
				System.currentTimeMillis()));
		
		m.addAttribute("vo",vo);
		
	}// sample2()
	
	
	//
	@GetMapping("/sample3")
	public void sample3(Model m) {
		List<MemberVO> list=new ArrayList<>();
		
		for(int i=1;i<=5;i++) {
			list.add(new MemberVO(123+1,"u0"+i,"p0"+i,"홍추추"+i,
					new Timestamp(System.currentTimeMillis())));
		} // for
		
		m.addAttribute("list",list);
	}// sample3()
	
	
	@GetMapping("/sample4")
	public void sample4(Model m) {
		List<MemberVO> list = new ArrayList<>();
		
		for(int i=0;i<10;i++) {
			list.add(new MemberVO(i+1,"u000"+i%3, "p0000"+i%3, "홍추추"+(i+1),
					new Timestamp(System.currentTimeMillis())));
		} // for
		
		m.addAttribute("list",list);
	} //sample4()
	
	
	@GetMapping("/sample5")
	public void sample5(Model m) {
		
		String result="SUCCESS";
		m.addAttribute("result",result);
		
	} //sample5()
	
	@GetMapping("/sample6")
	public void sample6(Model m) {
		
		List<MemberVO> list= new ArrayList<>();
		
		for(int i=0; i<10; i++) {
			list.add(new MemberVO(i,"u0"+i,"p0"+i,"홍길동"+i,
					new Timestamp(System.currentTimeMillis())));
		} //for
		
		m.addAttribute("list",list);
		String result="success!";
		m.addAttribute("result",result);
	} //sample6()
	
	
	@GetMapping("/sample7")
	public void sample7(Model m) {
		
		m.addAttribute("now",new Date());
		m.addAttribute("price",123456789);
		m.addAttribute("title","This is a just sample.");
		
		m.addAttribute("options",Arrays.asList("AAAA","BBBB","CCCC","DDDD"));
		//Arrays.asList()는 배열을 컬렉션 List로 변환
	}// sample7()
	
	
	
	
	
}
