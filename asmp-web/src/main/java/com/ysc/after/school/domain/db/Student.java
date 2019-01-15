package com.ysc.after.school.domain.db;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * 학생 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_student")
@Data
public class Student {

	@Id
	@GeneratedValue
	private int id;
}
