package com.ysc.after.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysc.after.school.domain.db.Subject;
import com.ysc.after.school.service.SubjectService;

/**
 * 방과 후 수업관리 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("lesson")
public class LessonController {
	
	@Autowired
	private SubjectService subjectService;

	/**
	 * 방과 후 과목 관리 조회 화면
	 * @param model
	 */
	@GetMapping(value = "subject")
	public void subject(Model model) {
		
	}
	
	/**
	 * 방과 후 과목 관리 조회
	 * @param model
	 */
	@PostMapping(value = "subject/search")
	@ResponseBody
	public List<Subject> subjectSearch() {
		return subjectService.getList();
	}
	
	@PostMapping(value = "subject/regist")
	@ResponseBody
	public ResponseEntity<?> subjectRegist(Subject subject) {
		if (subjectService.regist(subject)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 강좌 조회 화면
	 * @param model
	 */
	@GetMapping(value = "list")
	public void list(Model model) {
		
	}
	
	/**
	 * 강좌 생성 화면
	 * @param model
	 */
	@GetMapping(value = "regist")
	public void regist(Model model) {
		
	}
}
