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

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.ysc.after.school.domain.Domain;

import lombok.Data;

/**
 * 방과 후 수업 과목 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_subject")
@Data
public class Subject implements Domain {

	@Id
	@GeneratedValue
	private int id;

	/** 이름 */
	@Column(nullable = false, length = 20)
	private String name;

	/** 진행중인 강좌 수 */
	private int number;

	@OneToMany(mappedBy = "subject", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<Lesson> lessons;

}
