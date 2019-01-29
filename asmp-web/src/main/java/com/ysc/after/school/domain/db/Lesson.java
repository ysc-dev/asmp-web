package com.ysc.after.school.domain.db;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ysc.after.school.domain.Domain;

import lombok.Data;

/**
 * 강과 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_lesson")
@Data
public class Lesson implements Domain {

	@Id
	@GeneratedValue
	private int id;
}
