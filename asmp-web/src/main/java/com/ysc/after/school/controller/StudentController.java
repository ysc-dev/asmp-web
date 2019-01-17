package com.ysc.after.school.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysc.after.school.domain.CommonEnum.Sex;
import com.ysc.after.school.domain.db.Student;
import com.ysc.after.school.domain.param.SearchParam;

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
	 * 학생 검색
	 * @param model
	 */
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<Student>> search(@RequestBody SearchParam param) {
		System.out.println("학생 검색 조건 => " + param);
		
		List<Student> students = Arrays.asList(
				new Student(0, "박", "", 3, 1, 1, Sex.MALE, "", "010-5292-8842", true),
				new Student(0, "고", "", 3, 1, 1, Sex.MALE, "", "010-5292-8842", false)
				);
		
		return new ResponseEntity<>(students, HttpStatus.OK);
	}
	
	/**
	 * 학생 등록
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void regist(Model model) {
	}
	
	/**
	 * 학생 수정
	 * @param model
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void update(Model model, int id) {
	}
	
	/**
	 * 학생 상세정보
	 * @param model
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detail(Model model, int id) {
	}
}
