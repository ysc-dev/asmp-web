package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ysc.after.school.domain.CommonEnum.ClassType;
import com.ysc.after.school.domain.CommonEnum.GradeType;
import com.ysc.after.school.domain.Domain;

import lombok.Data;

/**
 * 강좌 추가 정보 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_lesson_info")
@Data
public class LessonInfo implements Domain {

	@Id
	@GeneratedValue
	private long id;
	
	/** 반 */
	@Enumerated(EnumType.ORDINAL)
	@Column(nullable = false)
	private ClassType classType;
	
	/** 대상학년 타입 */
	@Enumerated(EnumType.ORDINAL)
	@Column(nullable = false)
	private GradeType gradeType;
	
	/** 대상학년 정보 */
	@Column(nullable = false, length = 20)
	private String grade;
	
	/** 요일 */
	@Column(nullable = false, length = 45)
	private String week;
	
	/** 시간 */
	@Column(nullable = false, length = 20)
	private String startTime;
	
	@Column(nullable = false, length = 20)
	private String endTime;
	
	/** 장소 */
	@Column(nullable = false, length = 20)
	private String location;
	
	/** 수강료 */
	private int tuition;
	
	/** 정원 */
	private int fixedNumber;
	
	/** 교재비 별도 여부 */
	private boolean textbook;
	
	@ManyToOne
	@JoinColumn(name = "lesson_id")
    @JsonIgnore
    private Lesson lesson;
}
