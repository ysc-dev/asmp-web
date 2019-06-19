package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ysc.after.school.domain.Domain;

import lombok.Data;

@Entity
@Table(name = "tb_subject_group")
@Data
public class SubjectGroup implements Domain {

	@Id
	@GeneratedValue
	private int id;

	/** 이름 */
	@Column(nullable = false, length = 45)
	private String name;
}
