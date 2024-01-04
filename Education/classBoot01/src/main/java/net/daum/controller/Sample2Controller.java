package net.daum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Sample2Controller {

	@RequestMapping("/view_test") // view_test 매핑 주소 등록
	public ModelAndView view_test() {
		ModelAndView wm = new ModelAndView("test_view"); // 생성자 인자값으로
														// 뷰페이지 경로 설정
		// /WEB-INF/views/test_view.jsp
		wm.addObject("name","홍추추"); //문자열 name키이름에 홍추추 저장. 뷰페이지에서 
									// name 키이름을 ${name} EL로 참조해서 이름을 가져온다.
		return wm;
	}
}
