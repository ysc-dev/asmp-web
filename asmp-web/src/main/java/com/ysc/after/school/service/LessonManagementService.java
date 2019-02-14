package com.ysc.after.school.service;

import java.util.List;

import com.ysc.after.school.domain.db.LessonManagement;
import com.ysc.after.school.domain.param.LessonSearchParam;

public interface LessonManagementService extends CRUDService<LessonManagement> {

	LessonManagement get(long id);

	boolean regist(List<LessonManagement> lessonManagements);

	boolean delete(List<LessonManagement> lessonManagements);
	
	List<LessonManagement> findByLessonInfoId(long lessonInfoId);

	List<LessonManagement> findByStudentId(int id);

	List<LessonManagement> getList(LessonSearchParam param);
}
