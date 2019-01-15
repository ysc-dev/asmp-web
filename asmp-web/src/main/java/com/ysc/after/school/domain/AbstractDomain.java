package com.ysc.after.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;

/**
 * 도메인 공통 모음
 * 
 * @author hgkㅐ
 *
 */
@Getter
@Setter
@MappedSuperclass
public class AbstractDomain implements Domain {
	
	/** 우편번호 */
	private int zipcode;
	
	/** 주소 */
	@Column(nullable = false, length = 100)
	private String address;

	/** 상세 주소 */
	@Column(length = 100)
	private String detailAddress;
	
	private int year;
	
	private int month;
	
	private int day;
	
	/** 등록일시 */
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;
	
	/** 수정일시 */
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;
	
	@PrePersist
	public void prePersist() {
		this.createDate = new Date();
		this.updateDate = new Date();
	}
	
	@PreUpdate
    public void onPreUpdate() {
		this.updateDate = new Date();
	}
}
