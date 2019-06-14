package com.ysc.after.school.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ysc.after.school.domain.db.User;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "redirect:/notice/list.do";
	}

	/**
	 * 로그인 성공 시
	 * @param session
	 * @param authentication
	 * @return
	 */
	@RequestMapping(value = "/login/success.do")
	public String loginSuccess(HttpSession session, Authentication authentication) {
		System.err.println(authentication);
		User user = (User) authentication.getPrincipal();
		session.setAttribute("loginUser", user);
		return "redirect:/notice/list.do";
	}
	
	/**
	 * 로그인 실패 시
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login/fail.do")
	public String loginFail(HttpSession session) {
		return "redirect:/notice/list.do";
	}
	
	/**
	 * 로그아웃 성공 시
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout/success.do")
	public String logoutSuccess(HttpSession session) {
		return "redirect:/notice/list.do";
	}
}
