package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.Comment;
import com.ysc.after.school.repository.CommentRepository;
import com.ysc.after.school.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	@Override
	public List<Comment> getList() {
		return commentRepository.findAll();
	}

	@Override
	public boolean regist(Comment comment) {
		if (isNew(comment)) {
			return commentRepository.save(comment) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(Comment comment) {
		if (!isNew(comment)) {
			return commentRepository.save(comment) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(Comment comment) {
		commentRepository.delete(comment);
		return true;
	}
	
	@Override
	public boolean delete(int id) {
		commentRepository.delete(id);
		return true;
	}

	private boolean isNew(Comment comment) {
		return !commentRepository.exists(comment.getId());
	}

	@Override
	public List<Comment> getList(int noticeId) {
		return commentRepository.findByNoticeId(noticeId);
	}

	@Override
	public Comment get(int id) {
		return commentRepository.findOne(id);
	}
	
}
