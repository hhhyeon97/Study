package com.cos.security01.config.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.cos.security01.config.auth.PrincipalDetails;
import com.cos.security01.model.User;
import com.cos.security01.repository.UserRepository;


@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
	
	
	@Autowired 
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserRepository userRepository;
	
	
	// 구글로부터 받은 userRequest 데이터에 대한 후처리를 하는 함수
	// 함수 종료시 @AuthenticationPrincipal 어노테이션이 만들어진다.
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		//System.out.println("userRequest : "+userRequest);
		//System.out.println("getAdditionalParameters : "+userRequest.getAdditionalParameters());
		System.out.println("getClientRegistration : "+userRequest.getClientRegistration());	
																//registrationId로 어떤 Oauth로 로그인했는지 확인 가능	
		System.out.println("getAccessToken : "+userRequest.getAccessToken().getTokenValue());
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		// 구글 로그인 버튼 클릭 - > 구글 로그인창 - > 로그인 완료 - > code를 리턴(OAuth-Client라이브러리)->AccessToken요청
		// userRequest 정보 - > loadUser함수 호출 - >구글로부터 회원프로필을 받아준다. 
		System.out.println("getAttributes : "+super.loadUser(userRequest).getAttributes());
		System.out.println("getAttributes : "+oauth2User.getAttributes());
		
		
		// getAttributes 정보를 토대로 회원가입을 강제로 진행해볼 예정
		
		String provider = userRequest.getClientRegistration().getClientId(); //google
		String providerId = oauth2User.getAttribute("sub");
		String username = provider+"_"+providerId; // google_107006461134109457045
		String password = bCryptPasswordEncoder.encode("겟인데어");
		String email = oauth2User.getAttribute("email");
		String role = "ROLE_USER";
		
		User userEntity = userRepository.findByUsername(username);
		
		if(userEntity == null) {
			System.out.println("구글 로그인이 최초입니다.");
			userEntity = User.builder()
					.username(username)
					.password(password)
					.email(email)
					.role(role)
					.provider(provider)
					.providerId(providerId)
					.build();
			userRepository.save(userEntity);
		}else {
			System.out.println("구글 로그인을 이미 한 적이 있습니다.\n자동회원가입이 된 유저입니다.");
		}
		
		return new PrincipalDetails(userEntity,oauth2User.getAttributes()); 
		// 리턴될 때 Authentication객체에 리턴타입인 PrincipalDetails가 저장된다.
	}
	
	
}
