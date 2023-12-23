package com.cos.security01.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration	// IoC 빈(bean)을 등록
@EnableWebSecurity //스프링 시큐리티 필터가 스프링 필터체인에 등록	// 필터 체인 관리 시작 어노테이션
public class SecurityConfig{	// 스프링 시큐리티 필터 설정 
	
	// 해당 메서드의 리턴되는 오브젝트를 IOC로 등록해준다.
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeHttpRequests()
                .requestMatchers("/user/**").authenticated()
                .requestMatchers("/manager/**"). hasAnyRole("hasAnyRole('ROLE_MANAGER','ROLE_ADMIN')")
                .requestMatchers("/admin/**").hasAnyRole("hasRole('ROLE_ADMIN')")
                .anyRequest().permitAll()
        		.and()
        		.formLogin()
        		.loginPage("/loginForm");
        return http.build();
    }

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
	
