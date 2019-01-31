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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.ysc.after.school.domain.CommonEnum.Sex;
import com.ysc.after.school.domain.CommonEnum.TeacherStatus;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 강사 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_teacher")
@Data
@EqualsAndHashCode(callSuper = false)
public class Teacher extends AbstractDomain {

	@Id
	@GeneratedValue
	private int id;
	
	/** 이름 */
	@Column(nullable = false, length = 20)
	private String name;
	
	/** 성별 */
	@Enumerated(EnumType.ORDINAL)
	@Column(nullable = false)
	private Sex sex;
	
	/** 연락처 */
	@Column(nullable = false, length = 20)
	private String tel;
	
	/** 소속(학교 명) */
	@Column(nullable = false, length = 20)
	private String affiliation;
	
	/** 담당과목 */
	@Column(nullable = false, length = 20)
	private String subject;
	
	/** 계약일자 */
	@Column(nullable = false, length = 20)
	private String contractDate;
	
	/** 강사상태 */
	@Enumerated(EnumType.ORDINAL)
	@Column(nullable = false)
	private TeacherStatus status;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;
	
	@OneToMany(mappedBy = "teacher", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<Lesson> lessons;
	
	@Transient
	private String contractYear;
	
	@Transient
	private String contractMonth;
	
	@Transient
	private String contractDay;
	
	@PrePersist
	public void prePersist() {
		createDate = new Date();
	}
}
