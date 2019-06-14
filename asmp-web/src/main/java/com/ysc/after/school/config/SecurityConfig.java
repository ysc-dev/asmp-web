package com.ysc.after.school.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.ysc.after.school.provider.CustomAuthenticationProvider;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.csrf().disable();
		http.headers().frameOptions().disable();
		
		// 사용자 정의 accessDecisionManager 접근 제어 장치 및 오픈 식 언어
		http.authorizeRequests() // 요청을 어떻게 보안을 할 것인지 설정
			.antMatchers("/notice/regist").access("hasRole('ROLE_USER')")
			.antMatchers("/student/**").access("hasRole('ROLE_USER')")
			.antMatchers("/teacher/**").access("hasRole('ROLE_USER')")
			.antMatchers("/lesson/**").access("hasRole('ROLE_USER')");
		
		// 사용자 로그인 페이지
		http.formLogin()
			.loginPage("/")
			.loginProcessingUrl("/loginProcess.do")
			.usernameParameter("userId")
			.passwordParameter("password")
			.failureUrl("/login/fail.do")
			.defaultSuccessUrl("/login/success.do", true);
		
		// 사용자 정의 로그아웃
		http.logout()
			.logoutUrl("/logout.do")
			.logoutSuccessUrl("/logout/success.do")
			.invalidateHttpSession(true);
		
		http.httpBasic();
		
		// session 관리
//		http.sessionManagement().sessionFixation().changeSessionId()
//			.maximumSessions(5).expiredUrl("/notice/list");
		
		http.authenticationProvider(customAuthenticationProvider());
	}
	
	@Bean
	public CustomAuthenticationProvider customAuthenticationProvider() {
		return new CustomAuthenticationProvider();
	}
}
