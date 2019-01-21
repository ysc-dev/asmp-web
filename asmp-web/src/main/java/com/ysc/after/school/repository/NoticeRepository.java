package com.ysc.after.school.repository;

import java.util.List;

import com.ysc.after.school.domain.db.Notice;

public interface NoticeRepository extends DefaultRepository<Notice, Integer> {

	List<Notice> findBySubjectContaining(String content);

	List<Notice> findByUserNameContaining(String content);

	List<Notice> findByContentContaining(String content);

}
