package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.ysc.after.school.domain.Domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 도메인 공통 모음
 * 
 * @author hgko
 *
 */
@Getter
@Setter
@ToString
@MappedSuperclass
public class AbstractDomain implements Domain {

	/** 우편번호 */
	private int postcode;
	
	/** 주소 */
	@Column(nullable = false, length = 100)
	private String address;

	/** 상세 주소 */
	@Column(length = 100)
	private String detailAddress;
	
	private int year;
	
	private int month;
	
	private int day;
}
