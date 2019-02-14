package com.ysc.after.school.domain.param;

import lombok.Data;

/**
 * 강좌 관련 검색 조건
 * 
 * @author hgko
 *
 */
@Data
public class LessonSearchParam {
	
	private int lessonId;
	
	private LessonDetailSearch searchType;
	
	private String classType;
	
	private int grade;
	
	private String freedom;
	
	public enum LessonDetailSearch {
		전체, 반, 학년, 자유수강권여부
	}
}
