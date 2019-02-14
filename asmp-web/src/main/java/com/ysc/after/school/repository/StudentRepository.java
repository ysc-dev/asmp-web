package com.ysc.after.school.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.ysc.after.school.domain.db.Student;

public interface StudentRepository extends DefaultRepository<Student, Integer> {

	List<Student> findByFreedom(boolean freedom);

	@Query(value = "SELECT * FROM tb_student s LEFT JOIN tb_lesson_management m ON (s.id = m.student_id) " +
					"WHERE m.lesson_info_id <> ?1 or m.student_id is NULL;", nativeQuery = true)
	List<Student> findByWaitingList(long lessonInfoId);
}
