package com.ysc.after.school.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysc.after.school.domain.db.Notice;
import com.ysc.after.school.domain.param.SearchParam;

/**
 * 관리자 공지사항 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("notice")
public class NoticeController {

	/**
	 * 공지사항 리스트
	 * @param model
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model) {
	}
	
	/**
	 * 공지사항 검색
	 * @param model
	 */
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<Notice>> search(@RequestBody SearchParam param) {
		List<Notice> notices = Arrays.asList(
				new Notice(0, "테스트1", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트2", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트3", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트4", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트5", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트6", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트7", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트8", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트9", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트10", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트11", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트12", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트13", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트14", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트15", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트16", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트17", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트18", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트19", "", new Date(), 0, "admin", "관리자"),
				new Notice(0, "테스트20", "", new Date(), 0, "admin", "관리자")
				);
		
		return new ResponseEntity<>(notices, HttpStatus.OK);
	}
	
	/**
	 * 공지사항 등록
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void regist(Model model) {
	}
	
	/**
	 * 공지사항 상세정보
	 * @param model
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detail(Model model, int id) {
	}
}
