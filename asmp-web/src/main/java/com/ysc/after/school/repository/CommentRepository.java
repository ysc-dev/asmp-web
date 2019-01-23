package com.ysc.after.school.repository;

import java.util.List;

import com.ysc.after.school.domain.db.Comment;

public interface CommentRepository extends DefaultRepository<Comment, Integer> {

	List<Comment> findByNoticeId(int noticeId);

}
