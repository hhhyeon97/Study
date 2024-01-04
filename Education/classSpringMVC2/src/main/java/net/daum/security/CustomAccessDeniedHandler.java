package net.daum.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// 403 접근 금지 에러가 발생했을 때 다양한 처리를 하려면 AccessDeniedHandler 인터페이스를 구현 상속 받아서 처리한다. 
		
		System.out.println("Access Denied Handler");
		System.out.println("Redirect .....");
		
		response.sendRedirect("/accessError"); // accessError 매핑 주소로 이동 
		
		
	}

}
