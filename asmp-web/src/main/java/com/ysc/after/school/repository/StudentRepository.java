package com.ysc.after.school.repository;

import java.util.List;

import com.ysc.after.school.domain.db.Student;

public interface StudentRepository extends DefaultRepository<Student, Integer> {

	List<Student> findByLesson(boolean lesson);

}
