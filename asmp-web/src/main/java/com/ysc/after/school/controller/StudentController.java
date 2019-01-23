package com.ysc.after.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysc.after.school.domain.CommonEnum.StudentInfo;
import com.ysc.after.school.domain.db.Student;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.service.StudentService;

/**
 * 학생 관리 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;

	/**
	 * 학생 조회 화면
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
		return new ResponseEntity<>(studentService.getList(param), HttpStatus.OK);
	}
	
	/**
	 * 학생 등록 화면
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void regist(Model model) {
	}
	
	/**
	 * 학생 등록 기능
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> regist(Student student) {
		if (studentService.regist(student)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 학생 정보 수정 화면
	 * @param model
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public void update(Model model, int id) {
		model.addAttribute("student", studentService.get(id));
	}
	
	/**
	 * 학생 정보 수정 기능
	 * @param model
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> update(Student student) {
		if (studentService.update(student)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 학생 상세정보
	 * @param model
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detail(Model model, int id) {
		Student student = studentService.get(id);
		student.setStudentInfo(StudentInfo.INFO_1);
		student.setIsLesson(student.isLesson() ? "O" : "X");
		model.addAttribute("student", student);
	}
	
	/**
	 * 선택된 학생 정보 삭제
	 * @param selectArray
	 * @return
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> delete(@RequestBody List<Student> students) {
		if (studentService.delete(students)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
}
