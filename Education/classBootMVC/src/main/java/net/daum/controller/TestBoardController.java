package net.daum.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.daum.service.TestBoardService;
import net.daum.vo.TestBoardVO;

@Controller
public class TestBoardController {

	
	@Autowired
	private TestBoardService testboardService;
	
	
	@GetMapping("/testboard_write")
	public String test_write() {
		return "testboard_write"; 
	}	
	
	
	@PostMapping("/testboard_ok")
	public String test_ok(TestBoardVO tv) {
		this.testboardService.insertTest(tv); //저장 
		return "redirect:testboard_list";
	}
	
	@RequestMapping("/testboard_list")
	public ModelAndView testboard_list(HttpServletRequest request) {
		
		
		int listcount =this.testboardService.getListCount();
		List<TestBoardVO> blist=this.testboardService.getTestBoardList();
		
		ModelAndView listM=new ModelAndView();
		listM.addObject("blist",blist);//blist 키이름에 값
		listM.addObject("listcount",listcount);
		listM.setViewName("/testboard_list");//뷰페이지 폴더
		//경로와 파일명 지정
		return listM;
	
	}
	
	
	
	@RequestMapping("/aop_cont")
	public String aop_cont(@RequestParam("no") int bno,
			@RequestParam("state") String state,
			HttpServletRequest request,
			Model m, @ModelAttribute TestBoardVO tb) throws Exception {
		
		
		if(state.equals("cont")) {//내용보기일때만 조회수 증가
			tb=this.testboardService.getTestBoardCont(bno);
			//this.testboardService.updateHit(bno);
		}
		
		String bcont=tb.getBcont().replace("\n","<br/>");

		m.addAttribute("tb",tb);
		m.addAttribute("bcont",bcont);

		if(state.equals("cont")) {//내용보기
			return "/testboard_cont";
		}
		return null;
	}
	
	
	
	
}
