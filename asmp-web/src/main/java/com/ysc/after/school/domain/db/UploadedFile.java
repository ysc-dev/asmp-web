package com.ysc.after.school.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ysc.after.school.domain.Domain;

import lombok.Data;

/**
 * 첨부파일 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_uploaded_file")
@Data
public class UploadedFile implements Domain {

	@Id
	@GeneratedValue
	private int id;
	
	/** 파일 이름 */
	@Column(nullable = false, length = 100)
	private String fileName;

	/** 파일 데이터 */
	@Column(columnDefinition = "longblob")
	private byte[] content;

	/** 파일 확장자 */
	@Column(nullable = false, length = 100)
	private String contentType;

	@ManyToOne
	@JoinColumn(name = "notice_id")
    @JsonIgnore
    private Notice notice;
	
}
