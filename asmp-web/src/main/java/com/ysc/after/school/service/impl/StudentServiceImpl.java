package com.ysc.after.school.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ysc.after.school.domain.db.QLessonManagement;
import com.ysc.after.school.domain.db.QStudent;
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
	
	@PersistenceContext
    private EntityManager entityManager;

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
	
	@Override
	public boolean delete(List<Student> students) {
		studentRepository.delete(students);
		return true;
	}

	private boolean isNew(Student domain) {
		return !studentRepository.exists(domain.getId());
	}

	@Override
	public List<Student> getList(SearchParam param) {
		int grade = param.getGrade();
		int classType = param.getClassType();
		String name = param.getName();
		
		if (grade == 0 && classType == 0 && name.isEmpty()) {
			return getList();
		} else {
			// QueryDsl 사용
			JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
			QStudent student = QStudent.student;
			
			return queryFactory.selectFrom(student)
					.where((grade != 0 ? student.grade.eq(grade) : student.grade.ne(grade))
						.and((classType != 0 ? student.classType.eq(classType) : student.classType.ne(classType)))
						.and((name.isEmpty() ? student.name.isNotNull() : student.name.contains(name))))
					.fetch().stream().collect(Collectors.toList());
		}
	}

	@Override
	public List<Student> getFreedomList(SearchParam param) {
		int grade = param.getGrade();
		int classType = param.getClassType();
		String name = param.getName();
		
		if (grade == 0 && classType == 0 && name.isEmpty()) {
			return studentRepository.findByFreedom(true);
		} else {
			// QueryDsl 사용
			JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
			QStudent qStudent = QStudent.student;
			
			return queryFactory.selectFrom(qStudent)
					.where((grade != 0 ? qStudent.grade.eq(grade) : qStudent.grade.ne(grade))
						.and((classType != 0 ? qStudent.classType.eq(classType) : qStudent.classType.ne(classType)))
						.and((name.isEmpty() ? qStudent.name.isNotNull() : qStudent.name.contains(name)))
						.and(qStudent.freedom.eq(true)))
					
					.fetch().stream().collect(Collectors.toList());
		}
	}

	@Override
	public List<Student> getWaitingList(SearchParam param) {
		int grade = param.getGrade();
		int classType = param.getClassType();
		String name = param.getName();
		
		// QueryDsl 사용
		JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
		QStudent student = QStudent.student;
		QLessonManagement management = QLessonManagement.lessonManagement;
		
		if (grade == 0 && classType == 0 && name.isEmpty()) {
			return queryFactory.selectFrom(student).leftJoin(student.lessonManagements, management)
					.where((management.lessonInfo.id.ne(param.getLessonInfoId()).or(management.lessonInfo.id.isNull()))
							.and(grade != 0 ? student.grade.eq(grade) : student.grade.ne(grade))
							.and((classType != 0 ? student.classType.eq(classType) : student.classType.ne(classType)))
							.and((name.isEmpty() ? student.name.isNotNull() : student.name.contains(name))))
					.fetch();
		} else {
			return queryFactory.selectFrom(student)
					.where((grade != 0 ? student.grade.eq(grade) : student.grade.ne(grade))
						.and((classType != 0 ? student.classType.eq(classType) : student.classType.ne(classType)))
						.and((name.isEmpty() ? student.name.isNotNull() : student.name.contains(name))))
					.fetch();
		}
	}

}
