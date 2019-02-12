package com.ysc.after.school.service;

import java.util.List;

import com.ysc.after.school.domain.db.Lesson;
import com.ysc.after.school.domain.param.SearchParam;

public interface LessonService extends CRUDService<Lesson> {

	List<Lesson> getList(SearchParam param);

	Lesson get(int id);

}
