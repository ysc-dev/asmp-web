package com.ysc.after.school.domain.db;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import com.ysc.after.school.domain.Domain;
import com.ysc.after.school.service.util.DateUtil;

import lombok.Data;

/**
 * 수강인원 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_lesson_management")
@Data
public class LessonManagement implements Domain {

	@Id
	@GeneratedValue
	private long id;
	
	private int lessonId;

	/** 수강인원 학생 */
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	
	/** 강좌-반 */
	@ManyToOne
	@JoinColumn(name = "lesson_info_id")
	private LessonInfo lessonInfo;
	
	/** 등록일 */
	@Column(nullable = false, length = 20)
	private String createDate;
	
	@PrePersist
	public void prePersist() {
		createDate = DateUtil.convertDate(new Date());
	}
}
