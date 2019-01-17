package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.Student;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.repository.StudentRepository;
import com.ysc.after.school.service.StudentService;

/**
 * 학생 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentRepository studentRepository;

	@Override
	public Student get(int id) {
		return studentRepository.findOne(id);
	}
	
	@Override
	public List<Student> getList() {
		return studentRepository.findAll();
	}

	@Override
	public boolean regist(Student domain) {
		if (isNew(domain)) {
			return studentRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(Student domain) {
		if (!isNew(domain)) {
			return studentRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(Student domain) {
		studentRepository.delete(domain);
		return true;
	}

	private boolean isNew(Student domain) {
		return !studentRepository.exists(domain.getId());
	}

	@Override
	public List<Student> getList(SearchParam param) {
		System.err.println(param);
		return getList();
	}
	
}
