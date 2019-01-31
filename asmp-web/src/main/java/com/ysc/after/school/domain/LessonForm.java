package com.ysc.after.school.domain;

import java.util.List;

import com.ysc.after.school.domain.db.LessonInfo;

import lombok.Data;

@Data
public class LessonForm {

	/** 강좌명 */
	private String name;
	
	/** 과목 */
	private int subject;
	
	/** 강사 */
	private int teacher;
	
	/** 강좌 소개 */
	private String introduction;
	
	private List<LessonInfo> lessonInfos;
}
