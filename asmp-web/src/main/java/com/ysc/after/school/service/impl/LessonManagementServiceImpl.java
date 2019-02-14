package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.LessonManagement;
import com.ysc.after.school.repository.LessonManagementRepository;
import com.ysc.after.school.service.LessonManagementService;

/**
 * 학생 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
public class LessonManagementServiceImpl implements LessonManagementService {
	
	@Autowired
	private LessonManagementRepository lessonManagementRepository;
	
	@Override
	public List<LessonManagement> getList() {
		return lessonManagementRepository.findAll();
	}

	@Override
	public boolean regist(LessonManagement domain) {
		if (isNew(domain)) {
			return lessonManagementRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(LessonManagement domain) {
		if (!isNew(domain)) {
			return lessonManagementRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(LessonManagement domain) {
		lessonManagementRepository.delete(domain);
		return true;
	}

	private boolean isNew(LessonManagement domain) {
		return !lessonManagementRepository.exists(domain.getId());
	}

	@Override
	public LessonManagement get(long id) {
		return lessonManagementRepository.findOne(id);
	}

	@Override
	public List<LessonManagement> getList(long lessonInfoId) {
		return lessonManagementRepository.findByLessonInfoId(lessonInfoId);
	}

	@Override
	public boolean delete(List<LessonManagement> lessonManagements) {
		lessonManagementRepository.delete(lessonManagements);
		return true;
	}

	@Override
	public boolean regist(List<LessonManagement> lessonManagements) {
		return lessonManagementRepository.save(lessonManagements).size() > 0;
	}

	@Override
	public List<LessonManagement> findByStudentId(int id) {
		return lessonManagementRepository.findByStudentId(id);
	}

}
