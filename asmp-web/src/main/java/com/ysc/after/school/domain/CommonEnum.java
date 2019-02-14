package com.ysc.after.school.domain;

import lombok.Getter;

/**
 * 학생 조회, 등록, 수정 시 정보 모음
 * 
 * @author hgko
 *
 */
public class CommonEnum {

	/**
	 * 성별
	 */
	@Getter
	public enum Sex {
		MALE("남성"), 
		FEMALE("여성");
		
		private String name;
		
		private Sex(String name) {
			this.name = name;
		}
	}
	
	/**
	 * 담당과목
	 */
	public enum Subject {
		영어, 수학;
	}
	
	/**
	 * 학생 비고 란
	 *
	 */
	@Getter
	public enum Reason {
		INFO_0(""),
		INFO_1("기초생활 수급자"),
		INFO_2("한 부모 가정 자녀"),
		INFO_3("차상위 계층 자녀"),
		INFO_4("저소득층 자녀"),
		INFO_5("학교장 추천");
		
		private String name;
		
		private Reason(String name) {
			this.name = name;
		}
	}
	
	/**
	 * 강사 상태
	 *
	 */
	public enum TeacherStatus {
		재직, 퇴직;
	}
	
	/**
	 * 강좌 생성 시 데이터
	 *
	 */
	@Getter
	public enum ClassType {
		A, B, C, D;
	}
	
	public enum GradeType {
		단일학년, 다학년
	}
}
