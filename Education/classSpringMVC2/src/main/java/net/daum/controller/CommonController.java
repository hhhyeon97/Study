package net.daum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CommonController {
	
	
	@GetMapping("/accessError") //403 접근금지 에러가 발생했을 때 실행되는 매핑주소 
	public void accessDenied(Model model) {
		/*리턴값이 void형일 때는 매핑주소와 뷰페이지 jsp 파일 이름을 동일하게 한다.*/
		System.out.println("access Denied");
		
		model.addAttribute("msg","Access Denied"); // msg 키이름에 Access Denied 값을 저장 

	}
	
	// 커스텀 로그인 매핑주소
	@GetMapping("/customLogin")
	public void customLogin(String error, String logout, Model model) {
		
		System.out.println("error : " +error);
		System.out.println("logout : "+logout);
		
		if(error != null) {
			model.addAttribute("error","Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout","Logout!!");
		}
	
	}//customLogin()
	
	
	// get방식 로그아웃 처리하는 페이지로 이동
	@GetMapping("/customLogout")
	public void logoutGet() {
		
	}
	
	// post방식 로그아웃 
	@PostMapping("/customLogout")
	public void logoutPost() {
		
	}
	
	
	
}
