package com.ysc.after.school.repository;

import java.util.List;

import com.ysc.after.school.domain.db.LessonManagement;

public interface LessonManagementRepository extends DefaultRepository<LessonManagement, Long> {

	List<LessonManagement> findByLessonInfoId(long lessonInfoId);
	
	List<LessonManagement> findByStudentId(int studentId);
}
