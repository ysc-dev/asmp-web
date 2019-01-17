package com.ysc.after.school.service;

import java.util.List;

import com.ysc.after.school.domain.db.Student;
import com.ysc.after.school.domain.param.SearchParam;

public interface StudentService extends CRUDService<Student> {

	List<Student> getList(SearchParam param);

	Student get(int id);

}
