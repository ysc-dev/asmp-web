package com.ysc.after.school.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.LessonInfo;
import com.ysc.after.school.repository.LessonInfoRepository;
import com.ysc.after.school.service.LessonInfoService;

/**
 * 학생 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
public class LessonInfoServiceImpl implements LessonInfoService {
	
	@Autowired
	private LessonInfoRepository lessonInfoRepository;
	
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<LessonInfo> getList() {
		return lessonInfoRepository.findAll();
	}

	@Override
	public boolean regist(LessonInfo domain) {
		if (isNew(domain)) {
			return lessonInfoRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(LessonInfo domain) {
		if (!isNew(domain)) {
			return lessonInfoRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(LessonInfo domain) {
		lessonInfoRepository.delete(domain);
		return true;
	}

	private boolean isNew(LessonInfo domain) {
		return !lessonInfoRepository.exists(domain.getId());
	}

	@Override
	public LessonInfo get(long id) {
		return lessonInfoRepository.findOne(id);
	}

}
