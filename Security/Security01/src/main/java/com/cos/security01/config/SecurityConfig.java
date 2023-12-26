package com.cos.security01.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.cos.security01.config.oauth.PrincipalOauth2UserService;

@Configuration	// IoC 빈(bean)을 등록
@EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터체인에 등록	// 필터 체인 관리 시작 어노테이션
@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true) // secured 어노테이션 활성화, preAuthorize,postAuthorize 어노테이션 활성화
public class SecurityConfig{	// 스프링 시큐리티 필터 설정 
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	// 해당 메서드의 리턴되는 오브젝트를 IOC로 등록해준다.
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeHttpRequests()
                .requestMatchers("/user/**").authenticated()  // 인증만 되면 들어갈 수 있는 주소 ! 
                .requestMatchers("/manager/**").hasAnyRole("ADMIN", "MANAGER")
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().permitAll()
        		.and()
        		.formLogin()
        		.loginPage("/loginForm")
        		//.usernameParameter("username2")   // name 변수명 바꿀 때 사용하는 기능
                .loginProcessingUrl("/login") // login 주소가 호출이 되면 시큐리티가 낚아 채서 대신 로그인 진행
                .defaultSuccessUrl("/")		// default로 로그인 성공시엔 / 로 가지만 만약 /user 로 가려다 막혀서 로그인으로 돌아갔을 때 로그인 성공시 요청했던 /user로 가짐 !!! 
        		.and()
        		.oauth2Login()
        		.loginPage("/loginForm")		
                .userInfoEndpoint()
        		.userService(principalOauth2UserService);	// 구글 로그인이 완료된 후의 후처리가 필요함. Tip : 코드 X (엑세스토큰+사용자프로필정보 O)
        		return http.build();
    }

	/*
	 * private void loginProcessingUrl(String string) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 */

    /*
    기존: WebSecurityConfigurerAdapter를 상속하고 configure매소드를 오버라이딩하여 설정하는 방법
    => 현재: SecurityFilterChain을 리턴하는 메소드를 빈에 등록하는 방식(컴포넌트 방식으로 컨테이너가 관리)
    //https://spring.io/blog/2022/02/21/spring-security-without-the-websecurityconfigureradapter
    @Override
    protected void configure(HttpSecurity http) throws  Exception{
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/user/**").authenticated()
                .antMatchers("/manager/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MANAGER')")
                .antMatchers("/admin").access("\"hasRole('ROLE_ADMIN')")
                .anyRequest().permitAll();
    }

     */
}
	
