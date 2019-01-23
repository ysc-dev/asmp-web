package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.ysc.after.school.domain.CommonEnum.Sex;
import com.ysc.after.school.domain.CommonEnum.StudentInfo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 학생 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_student")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
public class Student extends AbstractDomain {

	@Id
	@GeneratedValue
	private int id;
	
	/** 이름 */
	@Column(nullable = false, length = 20)
	private String name;
	
	/** 소속(학교 명) */
	@Column(nullable = false, length = 20)
	private String affiliation;
	
	/** 학년 */
	private int grade;
	
	/** 학급(반) */
	private int classType;
	
	/** 번호 */
	private int number;
	
	/** 성별 */
	@Enumerated(EnumType.ORDINAL)
	@Column(nullable = false)
	private Sex sex;
	
	/** 연락처 */
	@Column(length = 20)
	private String tel;
	
	/** 학부모 연락처 */
	@Column(nullable = false, length = 20)
	private String parentTel;
	
	/** 자유수강권자 여부 */
	private boolean lesson;

	@Transient
	private StudentInfo studentInfo;
	
	@Transient
	private String isLesson;
	
	public Student(int id) {
		this.id = id;
	}
}
