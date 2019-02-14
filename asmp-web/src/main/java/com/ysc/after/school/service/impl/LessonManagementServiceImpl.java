package com.ysc.after.school.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.CommonEnum.ClassType;
import com.ysc.after.school.domain.db.LessonManagement;
import com.ysc.after.school.domain.param.LessonSearchParam;
import com.ysc.after.school.domain.param.LessonSearchParam.LessonDetailSearch;
import com.ysc.after.school.repository.LessonManagementRepository;
import com.ysc.after.school.service.LessonManagementService;

/**
 * 수강인원 관리 서비스
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
	public List<LessonManagement> findByLessonInfoId(long lessonInfoId) {
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

	@Override
	public List<LessonManagement> getList(LessonSearchParam param) {
		System.err.println(param);
		List<LessonManagement> managements = lessonManagementRepository.findByLessonId(param.getLessonId());
		if (param.getSearchType() == LessonDetailSearch.반) {
			if (!param.getClassType().equals("ALL")) {
				return managements.stream().filter(data -> data.getLessonInfo().getClassType() == ClassType.valueOf(param.getClassType()))
					.collect(Collectors.toList());
			}
		} else if (param.getSearchType() == LessonDetailSearch.학년) {
			if (param.getGrade() != 0) {
				return managements.stream().filter(data -> data.getStudent().getGrade() == param.getGrade())
					.collect(Collectors.toList());
			}
		} else if (param.getSearchType() == LessonDetailSearch.자유수강권여부) {
			if (!param.getFreedom().equals("ALL")) {
				return managements.stream().filter(data -> data.getStudent().isFreedom() == Boolean.valueOf(param.getFreedom()))
						.collect(Collectors.toList());
			}
		}
		
		return managements;
	}

}
