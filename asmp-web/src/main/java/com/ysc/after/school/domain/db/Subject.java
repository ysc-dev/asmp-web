package com.ysc.after.school.domain.db;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ysc.after.school.domain.Domain;

import lombok.Data;
import lombok.ToString;

/**
 * 방과 후 수업 과목 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_subject")
@Data
@ToString(exclude = "lessons")
public class Subject implements Domain {

	@Id
	@GeneratedValue
	private int id;

	/** 이름 */
	@Column(nullable = false, length = 45)
	private String name;

	@OneToMany(mappedBy = "subject", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonIgnore
	private List<Lesson> lessons;
	
	private int groupId;
	
	@Transient
	private int number;
	
	@Transient
	private String groupName;

}
