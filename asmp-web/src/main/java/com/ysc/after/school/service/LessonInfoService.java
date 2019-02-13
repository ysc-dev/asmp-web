package com.ysc.after.school.service;

import com.ysc.after.school.domain.db.LessonInfo;

public interface LessonInfoService extends CRUDService<LessonInfo> {

	LessonInfo get(long id);

}
