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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ysc.after.school.domain.CommonEnum.ClassType;
import com.ysc.after.school.domain.LessonForm;
import com.ysc.after.school.domain.db.Lesson;
import com.ysc.after.school.domain.db.Lesson.LessonStatus;
import com.ysc.after.school.domain.db.LessonInfo;
import com.ysc.after.school.domain.db.LessonManagement;
import com.ysc.after.school.domain.db.Subject;
import com.ysc.after.school.domain.db.Teacher;
import com.ysc.after.school.domain.param.LessonSearchParam;
import com.ysc.after.school.domain.param.LessonSearchParam.LessonDetailSearch;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.domain.param.SearchParam.LessonSearchType;
import com.ysc.after.school.service.LessonManagementService;
import com.ysc.after.school.service.LessonService;
import com.ysc.after.school.service.SubjectService;
import com.ysc.after.school.service.TeacherService;

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
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	private LessonManagementService lessonManagementService;
	
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
		return subjectService.getList().stream().map(data -> {
					data.setNumber(data.getLessons().size());
					return data;
				}).collect(Collectors.toList());
	}
	
	/**
	 * 방과 후 과목 추가
	 * @param subject
	 */
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
		model.addAttribute("searchTypes", LessonSearchType.values());
	}
	
	/**
	 * 강좌 조회 화면
	 * @param model
	 */
	@PostMapping(value = "search")
	@ResponseBody
	public List<Lesson> search(@RequestBody SearchParam param) {
		System.out.println("강좌 검색 조건 => " + param);
		return lessonService.getList(param);
	}
	
	/**
	 * 강좌 생성 화면
	 * @param model
	 */
	@GetMapping(value = "regist")
	public void regist(Model model) {
		model.addAttribute("classTypes", ClassType.values());
		model.addAttribute("teachers", teacherService.findByLesson());
		model.addAttribute("subjects", subjectService.getList());
	}
	
	/**
	 * 강좌 생성 기능
	 * @param lesson
	 */
	@PostMapping(value = "regist")
	@ResponseBody
	public ResponseEntity<?> regist(@RequestBody LessonForm lessonForm) {
		Lesson lesson = new Lesson(lessonForm);
		lesson.setTeacher(lessonForm.getTeacher() == 0 ? null : teacherService.get(lessonForm.getTeacher()));
		lesson.setSubject(subjectService.get(lessonForm.getSubject()));
		
		List<LessonInfo> lessonInfos = lessonForm.getLessonInfos().stream().map(info -> {
			info.setLesson(lesson);
			return info;
		}).collect(Collectors.toList());
		lesson.setLessonInfos(lessonInfos);
		lesson.setStatus(lessonInfos.size() == 0 ? LessonStatus.신설예정.getName() : LessonStatus.모집중.getName());
		
		if (lessonService.regist(lesson)) {
			Teacher teacher = lesson.getTeacher();
			if (teacher != null) {
				teacher.setLessonId(lesson.getId());
				if (teacherService.update(teacher)) {
					return new ResponseEntity<>(HttpStatus.OK);
				}
			}
			
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 강좌 정보 수정 화면
	 * @param model
	 * @param id
	 */
	@GetMapping(value = "update")
	public void update(Model model, int id) {
		Lesson lesson = lessonService.get(id);
		model.addAttribute("lesson", lesson);
		model.addAttribute("classTypes", ClassType.values());
		model.addAttribute("teachers", teacherService.getList());
		model.addAttribute("subjects", subjectService.getList());
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			String jsonList = mapper.writeValueAsString(lesson.getLessonInfos());
			model.addAttribute("lessonInfos", jsonList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 강좌 생성 기능
	 * @param lesson
	 */
	@PostMapping(value = "update")
	@ResponseBody
	public ResponseEntity<?> update(@RequestBody LessonForm lessonForm) {
		Lesson lesson = lessonService.get(lessonForm.getId());
		lesson.setName(lessonForm.getName());
		lesson.setIntroduction(lessonForm.getIntroduction());
		lesson.setSubject(subjectService.get(lessonForm.getSubject()));
		
		if (lessonForm.getTeacher() == 0) {
			lesson.setTeacher(null);
		} else {
			Teacher preTeacher = lesson.getTeacher();
			Teacher newTeacher = teacherService.get(lessonForm.getTeacher());
			if (preTeacher != null) {
				if (preTeacher.getId() != newTeacher.getId()) {
					preTeacher.setLessonId(0);
					teacherService.update(preTeacher);
				}
			}
				
			lesson.setTeacher(newTeacher);
			newTeacher.setLessonId(lesson.getId());
			teacherService.update(newTeacher);
			
		}
		
		List<LessonInfo> lessonInfos = lessonForm.getLessonInfos().stream().map(info -> {
			info.setLesson(lesson);
			return info;
		}).collect(Collectors.toList());
		lesson.setLessonInfos(lessonInfos);
		
		lesson.setStatus(lessonInfos.size() == 0 ? LessonStatus.신설예정.getName() : lesson.getStatus());
		
		if (lessonService.update(lesson)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 강좌 상세정보 화면
	 * @param model
	 * @param id
	 */
	@GetMapping(value = "detail")
	public void detail(Model model, int id) {
		model.addAttribute("lesson", lessonService.get(id));
		model.addAttribute("searchTypes", LessonDetailSearch.values());
	}
	
	/**
	 * 강좌 상세정보 화면
	 * @param model
	 * @param id
	 */
	@PostMapping(value = "detail/search")
	@ResponseBody
	public List<LessonManagement> detailSearch(@RequestBody LessonSearchParam param) {
		return lessonManagementService.getList(param);
	}
	
	/**
	 * 선택된 학생 정보 삭제
	 * @param students
	 * @return
	 */
	@PostMapping(value = "delete")
	@ResponseBody
	public ResponseEntity<?> delete(@RequestBody List<Lesson> lessons) {
		System.err.println(lessons);
		if (lessonService.delete(lessons)) {
			System.err.println(111);
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		System.err.println(222);
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
}
