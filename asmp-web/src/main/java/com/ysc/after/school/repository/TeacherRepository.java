package com.ysc.after.school.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.ysc.after.school.domain.db.Teacher;

public interface TeacherRepository extends DefaultRepository<Teacher, Integer> {

	List<Teacher> findByNameContaining(String name);

	List<Teacher> findBySubjectContaining(String content);
	
	@Query(value = "SELECT * FROM tb_teacher WHERE lesson_id = 0", nativeQuery = true)
	List<Teacher> findByLessonId();

}
