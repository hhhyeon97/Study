package com.cos.security01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.security01.config.auth.PrincipalDetails;
import com.cos.security01.model.User;
import com.cos.security01.repository.UserRepository;

@Controller // view를 리턴하겠다 !
public class IndexController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/test/login")
	public @ResponseBody String testLogin(Authentication authentication) { // DI(의존성 주입)
		System.out.println("/test/login =================================");
		PrincipalDetails principalDetails = (PrincipalDetails)authentication.getPrincipal(); // 리턴 타입이 오브젝트 
		System.out.println("authentication : "+principalDetails.getUser());  // 유저 정보 확인 가능
		return "세션 정보 확인하기";
	}
	
	@GetMapping({"","/"})
	public String index() {
		// 머스테치 기본폴더 src/main/resources/
		// 뷰리졸버 설정 : templates (prefix), .mustache (suffix) - > 생략 가능
		return "index"; //src/main/resources/templates/index.mustache
	}
	
	@GetMapping("/user")
	public @ResponseBody String user(){
	return "user";
	}

	@GetMapping("/admin")
	public @ResponseBody String admin(){
	return "admin";
	}
	
	@GetMapping("/manager")
	public @ResponseBody String manager(){
	return "manager";
	}
	
	// 스프링 시큐리티가 해당주소를 낚아 채버림! - > SecurityConfig 파일 생성 후 작동 안 함.
	@GetMapping("/loginForm")
	public String loginForm(){
	return "loginForm";
	}

	@GetMapping("/joinForm")
	public String joinForm(){
	return "joinForm";
	}
	
	@PostMapping("/join")
	public String join(User user){
		System.out.println(user);
		user.setRole("ROLE_USER");
		
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		
		userRepository.save(user); // 회원가입 잘 됨. 비밀번호 :1234 - > 시큐리티로 로그인을 할 수 없음.
									// 이유는 패스워드가 암호화가 안 되었기 때문 !!
		return "redirect:/loginForm";
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/info")
	public @ResponseBody String info() {
		return "개인정보";
	}
	
	@PreAuthorize("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
	@GetMapping("/data")
	public @ResponseBody String data() {
		return "데이터정보";
	}
	
	
}
