package com.ysc.after.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 학생 관리 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("student")
public class StudentController {

	/**
	 * 학생 리스트
	 * @param model
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model) {
	}
	
	/**
	 * 학생 등록
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void regist(Model model) {
	}
}
