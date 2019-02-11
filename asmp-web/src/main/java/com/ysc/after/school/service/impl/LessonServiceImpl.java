package com.ysc.after.school.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.core.types.Predicate;
import com.querydsl.jpa.impl.JPAQueryFactory;
import com.ysc.after.school.domain.CommonEnum.LessonSearchType;
import com.ysc.after.school.domain.db.Lesson;
import com.ysc.after.school.domain.db.QLesson;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.repository.LessonRepository;
import com.ysc.after.school.service.LessonService;

/**
 * 학생 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
public class LessonServiceImpl implements LessonService {
	
	@Autowired
	private LessonRepository lessonRepository;
	
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Lesson> getList() {
		return lessonRepository.findAll();
	}

	@Override
	public boolean regist(Lesson domain) {
		if (isNew(domain)) {
			return lessonRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(Lesson domain) {
		if (!isNew(domain)) {
			return lessonRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(Lesson domain) {
		lessonRepository.delete(domain);
		return true;
	}

	private boolean isNew(Lesson domain) {
		return !lessonRepository.exists(domain.getId());
	}

	@Override
	public List<Lesson> getList(SearchParam param) {
		LessonSearchType searchType = param.getLessonSearchType();
		String content = param.getContent();
		if (searchType == LessonSearchType.전체) {
			return lessonRepository.findAll();
		} else {
			if (!content.isEmpty()) {
				JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
				QLesson lesson = QLesson.lesson;
				
				Predicate predicate = null;
				
				if (searchType == LessonSearchType.과목) {
					predicate = lesson.subject.name.contains(content);
				} else if (searchType == LessonSearchType.강좌명) {
					predicate = lesson.name.contains(content);
				} else if (searchType == LessonSearchType.강사명) {
					predicate = lesson.teacher.name.contains(content);
				} else if (searchType == LessonSearchType.상태) {
					predicate = lesson.status.contains(content);
				}
				
				return queryFactory.selectFrom(lesson)
						.where(predicate)
						.fetch().stream().collect(Collectors.toList());
			}
			
			return null;
		}
	}

}
