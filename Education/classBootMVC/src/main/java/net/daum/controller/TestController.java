package net.daum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.TestService;
import net.daum.vo.TestVO;

@Controller
@RequestMapping("/study/*")
public class TestController {

	
	@Autowired
	private TestService testService;
	
	@GetMapping("/test_write")
	public String test_write() {
		return "test_insert"; // 뷰페이지 경로가 /WEB-INF/views/test_insert.jsp
	}
	
	@PostMapping("/test_ok")
	public ModelAndView test_ok(TestVO tv) {
		
		this.testService.insertTest01(tv); //저장 
		
		return null;
	}
}
