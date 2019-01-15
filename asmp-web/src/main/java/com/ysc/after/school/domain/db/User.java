package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ysc.after.school.domain.Domain;

import lombok.Data;

@Entity
@Table(name = "TB_USER")
@Data
public class User implements Domain {

	/** 사용자ID */
	@Id
	@Column(nullable = false, length = 20)
	private String userId;
	
	/** 사용자명 */
	@Column(nullable = false, length = 100)
	private String name;
	
	/** 사용자비밀번호암호화 */
	@Column(nullable = false, length = 100)
	private String password;
}
