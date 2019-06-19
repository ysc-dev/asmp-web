package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.SubjectGroup;
import com.ysc.after.school.repository.SubjectGroupRepository;
import com.ysc.after.school.service.SubjectGroupService;

/**
 * 과목 그룹 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
public class SubjectGroupServiceImpl implements SubjectGroupService {
	
	@Autowired
	private SubjectGroupRepository subjectGroupRepository;

	@Override
	public List<SubjectGroup> getList() {
		return subjectGroupRepository.findAll();
	}

	@Override
	public boolean regist(SubjectGroup domain) {
		if (isNew(domain)) {
			return subjectGroupRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(SubjectGroup domain) {
		if (!isNew(domain)) {
			return subjectGroupRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(SubjectGroup domain) {
		subjectGroupRepository.delete(domain);
		return true;
	}

	private boolean isNew(SubjectGroup domain) {
		return !subjectGroupRepository.exists(domain.getId());
	}

	@Override
	public SubjectGroup get(int id) {
		return subjectGroupRepository.findOne(id);
	}
}
