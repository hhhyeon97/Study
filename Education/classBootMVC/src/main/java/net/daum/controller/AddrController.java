package net.daum.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.daum.vo.AddrVO;

@RestController
@RequestMapping("/test")
public class AddrController {

	
	/*
	 *net.daum.controller 패키지에  AddrController.java 스프링컨트롤러 클래스를 
	 *@RestController 애노테이션을 사용해서 기술작성 합니다. 
	 *웹브라우저 출력창에 [{"mno":1,"name":"홍길동","addr":"서울시"},
	 *{"mno":2,"name":"홍길동","addr":"서울시"}] 컬렉션 List<AddrVO> 타입의 
	 *json 데이터가 출력되게 합니다. 매핑주소는 addrList입니다.
	 */
	
	
	
	 @GetMapping(produces = "application/json")
	    public List<AddrVO> addrList() {
	        AddrVO addr1 = new AddrVO();
	        AddrVO addr2 = new AddrVO();
	        
	        addr1.setMno(1);
	        addr1.setName("홍길동");
	        addr1.setAddr("서울시");

	        addr2.setMno(2);
	        addr2.setName("홍길동");
	        addr2.setAddr("서울시");

	        return new ArrayList<>(List.of(addr1, addr2));
	    }
	
	
}
