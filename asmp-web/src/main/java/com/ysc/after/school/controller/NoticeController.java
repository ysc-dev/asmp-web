package com.ysc.after.school.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ysc.after.school.domain.CommonEnum.NoticeSearchType;
import com.ysc.after.school.domain.db.Notice;
import com.ysc.after.school.domain.db.UploadedFile;
import com.ysc.after.school.domain.db.User;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.service.CommentService;
import com.ysc.after.school.service.NoticeService;
import com.ysc.after.school.service.UploadedFileService;
import com.ysc.after.school.service.util.DateUtil;

/**
 * 관리자 공지사항 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private UploadedFileService uploadedFileService;
	
	@Autowired
	private CommentService commentService;

	/**
	 * 공지사항 조회 화면
	 * @param model
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model) {
		model.addAttribute("searchTypes", NoticeSearchType.values());
	}
	
	/**
	 * 공지사항 검색 기능
	 * @param model
	 */
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<Notice>> search(@RequestBody SearchParam param) {
		System.out.println("공지사항 검색 조건 => " + param);
		return new ResponseEntity<>(noticeService.getList(param), HttpStatus.OK);
	}
	
	/**
	 * 공지사항 등록 화면
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void regist(Model model) {
	}
	
	/**
	 * 공지사항 등록 기능
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ResponseEntity<?> regist(Notice notice, MultipartHttpServletRequest request, Authentication authentication) {
		
		User user = (User) authentication.getPrincipal();
		notice.setUserId(user.getUserId());
		notice.setUserName(user.getName());
		
		List<UploadedFile> uploadedFiles = new ArrayList<>();
		
		Iterator<String> files = request.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile multipartFile = request.getFile(uploadFile);
			String fileName = multipartFile.getOriginalFilename();
			if (!fileName.isEmpty()) {
				try {
					UploadedFile uploadedFile = new UploadedFile();
					uploadedFile.setFileName(fileName);
					uploadedFile.setContent(multipartFile.getBytes());
					uploadedFile.setContentType(multipartFile.getContentType());
					uploadedFile.setNotice(notice);
					
					uploadedFiles.add(uploadedFile);
				} catch (IOException e) {
					e.printStackTrace();
					return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}
			}
		}
		
		notice.setUploadedFiles(uploadedFiles);
		
		if (noticeService.regist(notice)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 공지사항 상세정보 화면
	 * @param model
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detail(Model model, int id) {
		Notice notice = noticeService.get(id);
		notice.setDate(DateUtil.convertNoticeDate(notice.getCreateDate()));
		model.addAttribute("notice", notice);
		model.addAttribute("comments", commentService.getList(notice.getId()));
		
		notice.setHit(notice.getHit() + 1);
		noticeService.update(notice);
	}
	
	/**
	 * 공지사항 정보 불러오기
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "get", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Notice> get(int id) {
		Notice notice = noticeService.get(id);
		notice.setDate(DateUtil.convertNoticeDate(notice.getCreateDate()));
		return new ResponseEntity<>(notice, HttpStatus.OK);
	}
	
	/**
	 * 첨부파일 정보 불러오기
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "getFile", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<UploadedFile> getUploadedFile(int id) {
		UploadedFile uploadedFile = uploadedFileService.get(id);
		return new ResponseEntity<>(uploadedFile, HttpStatus.OK);
	}
	
	/**
	 * 이전글 이동
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "back", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Integer> backMove(int id) {
		Integer backId = noticeService.backId(id);
		return new ResponseEntity<>(backId == null ? 0 : backId, HttpStatus.OK);
	}
	
	/**
	 * 다음글 이동
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "next", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Integer> nextMove(int id) {
		Integer nextId = noticeService.nextId(id);
		return new ResponseEntity<>(nextId == null ? 0 : nextId, HttpStatus.OK);
	}
}
