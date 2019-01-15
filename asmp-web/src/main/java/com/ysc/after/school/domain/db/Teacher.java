package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.ysc.after.school.domain.AbstractDomain;
import com.ysc.after.school.domain.CommonEnum.Sex;
import com.ysc.after.school.domain.CommonEnum.Subject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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
@NoArgsConstructor
@AllArgsConstructor
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
	@Column(nullable = false, length = 12)
	private String tel;
	
	/** 소속(학교 명) */
	@Column(nullable = false, length = 20)
	private String affiliation;
	
	/** 담당과목 */
	@Enumerated(EnumType.ORDINAL)
	@Column(nullable = false)
	private Subject subject;
	
	/** 계약일자 */
	@Column(nullable = false, length = 20)
	private String contractDate;
	
	@Transient
	private String contractYear;
	
	@Transient
	private String contractMonth;
	
	@Transient
	private String contractDay;
}
