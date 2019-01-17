package com.ysc.after.school.repository;

import java.util.List;

import com.ysc.after.school.domain.db.Teacher;

public interface TeacherRepository extends DefaultRepository<Teacher, Integer> {

	List<Teacher> findByNameContaining(String name);

	List<Teacher> findBySubjectContaining(String content);

}
