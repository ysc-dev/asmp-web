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
import com.ysc.after.school.domain.CommonEnum.Subject;
import com.ysc.after.school.domain.db.Teacher;
import com.ysc.after.school.domain.param.SearchParam;

/**
 * 강사 관리 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("teacher")
public class TeacherController {

	/**
	 * 강사 리스트
	 * @param model
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model) {
		
	}
	
	/**
	 * 강사 검색
	 * @param model
	 */
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<Teacher>> search(@RequestBody SearchParam param) {
		System.out.println("강사 검색 조건 => " + param);
		
		List<Teacher> teachers = Arrays.asList(
				new Teacher(0, "박", Sex.MALE, "010-5292-8842", "xx학교", Subject.영어, "", "", "", ""),
				new Teacher(0, "고", Sex.FEMALE, "010-5292-8843", "xx학교", Subject.영어, "", "", "", "")
				);
		
		return new ResponseEntity<>(teachers, HttpStatus.OK);
	}
	
	/**
	 * 강사 등록
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void regist(Model model) {
	}
	
	/**
	 * 강사 수정
	 * @param model
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void update(Model model, int id) {
	}
	
	/**
	 * 강사 상세정보
	 * @param model
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detail(Model model, int id) {
	}
}
