package com.ysc.after.school.service;

import java.util.List;

import com.ysc.after.school.domain.db.Comment;

public interface CommentService extends CRUDService<Comment> {

	List<Comment> getList(int noticeId);
	
	boolean delete(int id);

	Comment get(int id);

}
