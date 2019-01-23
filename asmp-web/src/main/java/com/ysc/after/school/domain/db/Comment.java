package com.ysc.after.school.domain.db;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.ysc.after.school.domain.Domain;

import lombok.Data;

/**
 * 공지사항에 대한 댓글 관련 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_comment")
@Data
public class Comment implements Domain {

	@Id
	@GeneratedValue
	private int id;
	
	/** 공지사항 ID */
	private int noticeId;
	
	/** 작성자 ID */
	@Column(nullable = false, length = 20)
	private String userId;
	
	/** 작성자 이름 */
	@Column(nullable = false, length = 100)
	private String userName;
	
	/** 내용 */
	@Lob
	@Column(nullable = false)
	private String content;
	
	/** 등록시간 */
	@Column(nullable = false, length = 45)
	private String createDate;
	
	@Transient
	private String date;
	
	@PrePersist
	public void prePersist() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		createDate = dateFormat.format(new Date());
	}
}
