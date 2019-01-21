package com.ysc.after.school.provider;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * 로그인 세션 관리
 * 
 * @author hgko
 *
 */
public class CustomHttpSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		se.getSession().setMaxInactiveInterval(60 * 60 * 2); // 초 단위: 현재 설정은 2시간
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
