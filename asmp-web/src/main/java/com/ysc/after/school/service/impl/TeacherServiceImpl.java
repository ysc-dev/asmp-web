package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.Teacher;
import com.ysc.after.school.domain.db.User;
import com.ysc.after.school.domain.db.User.UserRole;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.repository.TeacherRepository;
import com.ysc.after.school.service.TeacherService;

/**
 * 강사 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherRepository teacherRepository;

	@Override
	public Teacher get(int id) {
		return teacherRepository.findOne(id);
	}
	
	@Override
	public List<Teacher> getList() {
		return teacherRepository.findAll();
	}

	@Override
	public boolean regist(Teacher domain) {
		if (isNew(domain)) {
			return teacherRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(Teacher domain) {
		if (!isNew(domain)) {
			return teacherRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(Teacher domain) {
		teacherRepository.delete(domain);
		return true;
	}
	
	@Override
	public boolean delete(List<Teacher> teachers) {
		teacherRepository.delete(teachers);
		return true;
	}

	private boolean isNew(Teacher domain) {
		return !teacherRepository.exists(domain.getId());
	}

	@Override
	public List<Teacher> getList(SearchParam param) {
		String searchType = param.getSearchType();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal();
		
		if (user.getRole() == UserRole.ADMIN) {
			if (searchType.equals("NAME")) {
				return teacherRepository.findByNameContaining(param.getContent());
			} else if (searchType.equals("SUBJECT")) {
				return teacherRepository.findBySubjectContaining(param.getContent());
			} else {
				return getList();
			}
		} else {
			if (searchType.equals("NAME")) {
				return teacherRepository.findByUserIdAndNameContaining(user.getUserId(), param.getContent());
			} else if (searchType.equals("SUBJECT")) {
				return teacherRepository.findByUserIdAndSubjectContaining(user.getUserId(), param.getContent());
			} else {
				return teacherRepository.findByUserId(user.getId());
			}
		}
	}

	@Override
	public List<Teacher> findByLesson() {
		return teacherRepository.findByLessonId();
	}
}
