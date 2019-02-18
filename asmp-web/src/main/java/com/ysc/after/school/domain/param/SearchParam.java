package com.ysc.after.school.domain.param;

import lombok.Data;

/**
 * 검색 조건 공통 클래스
 * 
 * @author hgko
 *
 */
@Data
public class SearchParam {
	
	private NoticeSearchType noticeSearchType;
	
	private LessonSearchType lessonSearchType;
	
	private String searchType;
	
	private String content;
	
	/** 학년 */
	private int grade;
	
	/** 반 */
	private int classType;
	
	/** 이름 */
	private String name;
	
	private int lessonId;
	
	private long lessonInfoId;
	
	/**
	 * 공지사항 검색조건 
	 */
	public enum NoticeSearchType {
		전체, 제목, 내용, 작성자
	}
	
	public enum LessonSearchType {
		전체, 과목, 강좌명, 강사명, 상태
	}
}
