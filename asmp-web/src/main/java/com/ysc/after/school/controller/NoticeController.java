package com.ysc.after.school.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ysc.after.school.domain.CommonEnum.NoticeSearchType;
import com.ysc.after.school.domain.db.Notice;
import com.ysc.after.school.domain.db.UploadedFile;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.service.NoticeService;
import com.ysc.after.school.service.UploadedFileService;
import com.ysc.after.school.service.util.FileInfoService;

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
	private FileInfoService fileInfoService;
	
	@Autowired
	private UploadedFileService uploadedFileService;

	/**
	 * 공지사항 리스트
	 * @param model
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Model model) {
		model.addAttribute("searchTypes", NoticeSearchType.values());
	}
	
	/**
	 * 공지사항 검색
	 * @param model
	 */
	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<Notice>> search(@RequestBody SearchParam param) {
		System.out.println("공지사항 검색 조건 => " + param);
		return new ResponseEntity<>(noticeService.getList(param), HttpStatus.OK);
	}
	
	/**
	 * 공지사항 등록
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void regist(Model model) {
	}
	
	/**
	 * 공지사항 등록
	 * @param model
	 */
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public ResponseEntity<?> regist(Notice notice, MultipartHttpServletRequest request) {
		
		notice.setUserId("admin");
		notice.setUserName("관리자");
		
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
//		System.err.println("공지사항 => " + notice);
		
		if (noticeService.regist(notice)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 공지사항 상세정보
	 * @param model
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detail(Model model, int id) {
		Notice notice = noticeService.get(id);
		notice.setDate(fileInfoService.getNoticeDate(notice.getCreateDate()));
		model.addAttribute("notice", notice);
		
		notice.setHit(notice.getHit() + 1);
		noticeService.update(notice);
	}
	
	@RequestMapping(value = "getFile", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<UploadedFile> getUploadedFile(int id) {
		UploadedFile uploadedFile = uploadedFileService.get(id);
		return new ResponseEntity<UploadedFile>(uploadedFile, HttpStatus.OK);
	}
}
