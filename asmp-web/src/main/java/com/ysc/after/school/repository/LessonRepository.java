package com.ysc.after.school.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.ysc.after.school.domain.db.Lesson;

public interface LessonRepository extends DefaultRepository<Lesson, Integer> {

	List<Lesson> findByTeacherId(int teacherId);
	
	@Query(value = "DELETE FROM tb_lesson WHERE id = ?1", nativeQuery = true)
	int deleteById(int id);

	List<Lesson> findByUserId(int id);
}
