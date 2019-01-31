package com.ysc.after.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysc.after.school.domain.CommonEnum.Subject;
import com.ysc.after.school.domain.CommonEnum.TeacherStatus;
import com.ysc.after.school.domain.db.Teacher;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.service.TeacherService;

/**
 * 강사 관리 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("teacher")
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;

	/**
	 * 강사 리스트
	 * @param model
	 */
	@GetMapping(value = "list")
	public void list(Model model) {
		
	}
	
	/**
	 * 강사 검색
	 * @param model
	 */
	@PostMapping(value = "search")
	@ResponseBody
	public List<Teacher> search(@RequestBody SearchParam param) {
		System.out.println("강사 검색 조건 => " + param);
		return teacherService.getList(param);
	}
	
	/**
	 * 강사 등록 화면
	 * @param model
	 */
	@GetMapping(value = "regist")
	public void regist(Model model) {
		model.addAttribute("subjects", Subject.values());
		model.addAttribute("teacherStatus", TeacherStatus.values());
	}
	
	/**
	 * 강사 등록
	 * @param model
	 */
	@PostMapping(value = "regist")
	@ResponseBody
	public ResponseEntity<?> regist(Teacher teacher) {
		teacher.setContractDate(teacher.getContractYear() + "-" + teacher.getContractMonth() + "-" + teacher.getDay());
		teacher.setStatus(TeacherStatus.재직);
		if (teacherService.regist(teacher)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 강사 수정 화면
	 * @param model
	 */
	@GetMapping(value = "update")
	public void update(Model model, int id) {
		Teacher teacher = teacherService.get(id);
		setContractDate(teacher);
		model.addAttribute("teacher", teacher);
		model.addAttribute("subjects", Subject.values());
		model.addAttribute("teacherStatus", TeacherStatus.values());
	}

	/**
	 * 강사 수정
	 * @param model
	 */
	@PostMapping(value = "update")
	public ResponseEntity<?> update(Teacher teacher) {
		System.err.println(teacher);
		teacher.setContractDate(teacher.getContractYear() + "-" + teacher.getContractMonth() + "-" + teacher.getDay());
		if (teacherService.update(teacher)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 강사 상세정보
	 * @param model
	 */
	@GetMapping(value = "detail")
	public void detail(Model model, int id) {
		Teacher teacher = teacherService.get(id);
		setContractDate(teacher);
		model.addAttribute("teacher", teacher);
	}
	
	/**
	 * 선택된 강사 정보 삭제
	 * @param selectArray
	 * @return
	 */
	@PostMapping(value = "delete")
	@ResponseBody
	public ResponseEntity<?> delete(@RequestBody List<Teacher> teachers) {
		if (teacherService.delete(teachers)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 계약일자 분할
	 * @param teacher
	 */
	private void setContractDate(Teacher teacher) {
		String[] contractDate = teacher.getContractDate().split("-");
		teacher.setContractYear(contractDate[0]);
		teacher.setContractMonth(contractDate[1]);
		teacher.setContractDay(contractDate[2]);
	}
}
