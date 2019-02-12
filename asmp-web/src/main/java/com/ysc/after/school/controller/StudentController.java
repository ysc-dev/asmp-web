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

import com.ysc.after.school.domain.CommonEnum.Reason;
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
	@GetMapping(value = "list")
	public void list(Model model) {
		
	}
	
	/**
	 * 학생 검색
	 * @param param
	 */
	@PostMapping(value = "search")
	@ResponseBody
	public List<Student> search(@RequestBody SearchParam param) {
		System.out.println("학생 검색 조건 => " + param);
		return studentService.getList(param);
	}
	
	/**
	 * 학생 등록 화면
	 * @param model
	 */
	@GetMapping(value = "regist")
	public void regist(Model model) {
		model.addAttribute("reasons", Reason.values());
	}
	
	/**
	 * 학생 등록 기능
	 * @param student
	 */
	@PostMapping(value = "regist")
	@ResponseBody
	public ResponseEntity<?> regist(Student student) {
		student.setReason(student.isFreedom() ? student.getReason() : Reason.INFO_0);
		if (studentService.regist(student)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 학생 정보 수정 화면
	 * @param model
	 * @param id
	 */
	@GetMapping(value = "update")
	public void update(Model model, int id) {
		model.addAttribute("reasons", Reason.values());
		model.addAttribute("student", studentService.get(id));
	}
	
	/**
	 * 학생 정보 수정 기능
	 * @param student
	 */
	@PostMapping(value = "update")
	@ResponseBody
	public ResponseEntity<?> update(Student student) {
		student.setReason(student.isFreedom() ? student.getReason() : Reason.INFO_0);
		if (studentService.update(student)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 학생 상세정보 화면
	 * @param model
	 * @param id
	 */
	@GetMapping(value = "detail")
	public void detail(Model model, int id) {
		Student student = studentService.get(id);
		student.setIsFreedom(student.isFreedom() ? "O" : "");
		model.addAttribute("student", student);
	}
	
	/**
	 * 선택된 학생 정보 삭제
	 * @param students
	 * @return
	 */
	@PostMapping(value = "delete")
	@ResponseBody
	public ResponseEntity<?> delete(@RequestBody List<Student> students) {
		if (studentService.delete(students)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 자유수강권자 조회 화면
	 * @param model
	 */
	@GetMapping(value = "freedom")
	public void autonomy(Model model) {
	}
	
	/**
	 * 자유수강권자 검색
	 * @param param
	 */
	@PostMapping(value = "freedom/search")
	@ResponseBody
	public ResponseEntity<List<Student>> freedomSearch(@RequestBody SearchParam param) {
		System.out.println("자율수강권자 검색 조건 => " + param);
		return new ResponseEntity<>(studentService.getFreedomList(param), HttpStatus.OK);
	}
}
