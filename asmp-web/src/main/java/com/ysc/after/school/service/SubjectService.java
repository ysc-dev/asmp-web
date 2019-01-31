package com.ysc.after.school.service;

import com.ysc.after.school.domain.db.Subject;

public interface SubjectService extends CRUDService<Subject> {

	Subject get(int id);

}
