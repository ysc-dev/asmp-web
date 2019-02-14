package com.ysc.after.school.controller;

import java.util.List;
import java.util.stream.Collectors;

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

import com.ysc.after.school.domain.db.LessonManagement;
import com.ysc.after.school.domain.db.Student;
import com.ysc.after.school.domain.param.LessonManagementParam;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.service.LessonInfoService;
import com.ysc.after.school.service.LessonManagementService;
import com.ysc.after.school.service.LessonService;
import com.ysc.after.school.service.StudentService;

/**
 * 방과 후 수업관리 - 수강인원 관리 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("lesson/management")
public class LessonManagementController {
	
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	private LessonInfoService lessonInfoService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private LessonManagementService lessonManagementService;

	/**
	 * 강좌 상세정보 화면
	 * @param model
	 * @param id
	 */
	@GetMapping(value = "")
	public void management(Model model, int lessonId, long lessonInfoId) {
		model.addAttribute("lesson", lessonService.get(lessonId));
		model.addAttribute("lessonInfo", lessonInfoService.get(lessonInfoId));
	}
	
	/**
	 * 수강중인 인원  조회
	 * @param model
	 */
	@PostMapping(value = "lessoning/search")
	@ResponseBody
	public List<LessonManagement> lessoningSearch(@RequestBody SearchParam param) {
		return lessonManagementService.findByLessonInfoId(param.getLessonInfoId());
	}
	
	/**
	 * 대기중인 인원 조회
	 * @param model
	 */
	@PostMapping(value = "waiting/search")
	@ResponseBody
	public List<Student> waitingSearch(@RequestBody SearchParam param) {
		return studentService.getWaitingList(param);
	}
	
	/**
	 * 수강 등록 기능
	 * @param student
	 */
	@PostMapping(value = "regist")
	@ResponseBody
	public ResponseEntity<?> regist(@RequestBody List<LessonManagementParam> params) {
		System.err.println(params);
		List<LessonManagement> managements = params.stream().map(data -> {
			LessonManagement management = new LessonManagement();
			management.setLesson(lessonService.get(data.getLessonId()));
			management.setStudent(studentService.get(data.getStudentId()));
			management.setLessonInfo(lessonInfoService.get(data.getLessonInfoId()));
			return management;
		}).collect(Collectors.toList());
		
		if (lessonManagementService.regist(managements)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 수강 삭제 기능
	 * @param student
	 */
	@PostMapping(value = "delete")
	@ResponseBody
	public ResponseEntity<?> delete(@RequestBody List<LessonManagement> lessonManagements) {
		System.err.println(lessonManagements);
		if (lessonManagementService.delete(lessonManagements)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
}
