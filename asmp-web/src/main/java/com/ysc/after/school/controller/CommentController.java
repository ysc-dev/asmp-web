package com.ysc.after.school.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysc.after.school.domain.db.Comment;
import com.ysc.after.school.domain.db.User;
import com.ysc.after.school.service.CommentService;

/**
 * 댓글 관리 컨트롤러 클래스
 * 
 * @author hgko
 *
 */
@Controller
@RequestMapping("comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	/**
	 * 한개의 댓글 정보 불러오기
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "get", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Comment> get(int id) {
		return new ResponseEntity<>(commentService.get(id), HttpStatus.OK);
	}
	
	/**
	 * 댓글 등록
	 * @param comment
	 * @param authentication
	 * @return
	 */
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> regist(Comment comment, Authentication authentication) {
		
		User user = (User) authentication.getPrincipal();
		comment.setUserId(user.getUserId());
		comment.setUserName(user.getName());
		
		if (commentService.regist(comment)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
	
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 댓글 수정
	 * @param id
	 * @param content
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> update(int id, String content) {
		
		Comment comment = commentService.get(id);
		comment.setContent(content);
		
		if (commentService.update(comment)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
	
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/**
	 * 댓글 삭제
	 * @param selectArray
	 * @return
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> delete(Comment id) {
		if (commentService.delete(id)) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
}
