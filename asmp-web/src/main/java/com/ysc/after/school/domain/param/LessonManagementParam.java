package com.ysc.after.school.domain.param;

import lombok.Data;

/**
 * 수강인원 관리 등록 관련 도메인
 * 
 * @author hgko
 *
 */
@Data
public class LessonManagementParam {
	
	private int studentId;
	
	private int lessonId;
	
	private int lessonInfoId;
}
