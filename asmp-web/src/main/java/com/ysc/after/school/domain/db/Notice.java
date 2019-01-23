package com.ysc.after.school.domain.db;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.ysc.after.school.domain.Domain;

import lombok.Data;

/**
 * 공지사항 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_notice")
@Data
public class Notice implements Domain {

	@Id
	@GeneratedValue
	private int id;
	
	@Column(nullable = false, length = 255)
	private String subject;
	
	@Lob
	@Column(nullable = false)
	private String content;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;
	
	private int hit;
	
	@Column(nullable = false, length = 20)
	private String userId;
	
	@Column(nullable = false, length = 100)
	private String userName;

	@OneToMany(mappedBy = "notice", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<UploadedFile> uploadedFiles;
	
	@Transient
	private String date;

	@PrePersist
	public void prePersist() {
		createDate = new Date();
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", subject=" + subject + ", content=" + content + ", createDate=" + createDate
				+ ", hit=" + hit + ", userId=" + userId + ", userName=" + userName + "]";
	}
}
