package com.cos.security01.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cos.security01.model.User;
import com.cos.security01.repository.UserRepository;

// 시큐리티 설정에서 loginProcessiongUrl("/login");
// /login 요청이 오면 자동으로 UserDetailsService 타입으로 IOC되어 있는 
// loadByUsername 함수가 실행됨.

@Service
public class PrincipalDetailsService implements UserDetailsService{

	@Autowired
	private UserRepository userRepository;
	
	// 시큐리티 session(내부 Authentication(내부 UserDetails))
	// 함수 종료시 @AuthenticationPrincipal 어노테이션이 만들어진다.
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("username : "+username);
		User userEntity = userRepository.findByUsername(username);
		if(userEntity != null) {
			return new PrincipalDetails(userEntity); 
			// 리턴될 때 Authentication객체에 리턴타입인 PrincipalDetails가 저장된다.
		}
		return null;
	}

	
}
