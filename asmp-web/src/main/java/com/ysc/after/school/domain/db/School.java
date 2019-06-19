package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ysc.after.school.domain.Domain;

import lombok.Data;

/**
 * 학교 관련 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_school")
@Data
public class School implements Domain {

	@Id
	@GeneratedValue
	private int id;
	
	/** 이름 */
	@Column(nullable = false, length = 20)
	private String name;
}
