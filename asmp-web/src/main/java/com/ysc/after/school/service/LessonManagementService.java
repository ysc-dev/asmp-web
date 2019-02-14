package com.ysc.after.school.service;

import java.util.List;

import com.ysc.after.school.domain.db.LessonManagement;

public interface LessonManagementService extends CRUDService<LessonManagement> {

	LessonManagement get(long id);

	List<LessonManagement> getList(long lessonInfoId);
	
	boolean regist(List<LessonManagement> lessonManagements);

	boolean delete(List<LessonManagement> lessonManagements);

	List<LessonManagement> findByStudentId(int id);
}
