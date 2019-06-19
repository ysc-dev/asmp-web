package com.ysc.after.school.service;

import com.ysc.after.school.domain.db.SubjectGroup;

public interface SubjectGroupService extends CRUDService<SubjectGroup> {

	SubjectGroup get(int id);
}
