package net.daum.security;

import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomNoOpPasswordEncoder implements PasswordEncoder { //비번 암호화 클래스 
	
	@Override
	public String encode(CharSequence rawPassword) {
		return rawPassword.toString();
	} //암호화 되기전 비번을 문자열로 반환
	
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return rawPassword.toString().equals(encodedPassword);
	}// 암호화 되기 전 비번과 암호화 된 비번 내용물만 같은지 비교 (개념상 이렇다는 말이고 실제로는 암호화된 비번끼리 비교하는 것 !)

}
