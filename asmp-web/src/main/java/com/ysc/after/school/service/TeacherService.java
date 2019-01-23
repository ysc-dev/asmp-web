package com.ysc.after.school.service;

import java.util.List;

import com.ysc.after.school.domain.db.Teacher;
import com.ysc.after.school.domain.param.SearchParam;

public interface TeacherService extends CRUDService<Teacher> {

	List<Teacher> getList(SearchParam param);

	Teacher get(int id);

	boolean delete(List<Teacher> teachers);

}
