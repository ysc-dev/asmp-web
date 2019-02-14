package com.ysc.after.school.domain.db;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ysc.after.school.domain.CommonEnum.Reason;
import com.ysc.after.school.domain.CommonEnum.Sex;
import com.ysc.after.school.service.util.DateUtil;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

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
@ToString(exclude = "lessonManagements")
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
	private boolean freedom;

	@Enumerated(EnumType.ORDINAL)
	private Reason reason;
	
	@Column(nullable = false, length = 20)
	private String createDate;
	
	@Transient
	private String isFreedom;
	
	@OneToMany(mappedBy = "student", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	@JsonIgnore
	private List<LessonManagement> lessonManagements;
	
	@PrePersist
	public void prePersist() {
		createDate = DateUtil.convertDate(new Date());
	}
}
