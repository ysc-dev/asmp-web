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
		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/login/success")
	public String loginSuccess(HttpSession session, Authentication authentication) {
		User user = (User) authentication.getPrincipal();
		session.setAttribute("loginUser", user);
		System.err.println("Login Success");
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/login/fail")
	public String loginFail(HttpSession session) {
		System.err.println("Login Fail");
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/logout/success")
	public String logoutSuccess(HttpSession session) {
		System.err.println("Logout Success");
		return "redirect:/notice/list";
	}
}
