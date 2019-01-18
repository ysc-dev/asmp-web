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

	private String searchType;
	
	private String content;
	
	/** 학년 */
	private int grade;
	
	/** 반 */
	private int classType;
	
	/** 번호 */
	private int number;
	
	/** 이름 */
	private String name;
}
