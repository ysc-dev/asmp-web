package com.ysc.after.school.domain.db;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.ysc.after.school.domain.Domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 공지사항 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_notice")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice implements Domain {

	@Id
	@GeneratedValue
	private int id;
	
	@Column(nullable = false, length = 100)
	private String subject;
	
	@Column(nullable = false, length = 200)
	private String content;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;
	
	private int hit;
	
	@Column(nullable = false, length = 20)
	private String userId;
	
	@Column(nullable = false, length = 100)
	private String userName;
	
	@PrePersist
	public void prePersist() {
		createDate = new Date();
	}
}
