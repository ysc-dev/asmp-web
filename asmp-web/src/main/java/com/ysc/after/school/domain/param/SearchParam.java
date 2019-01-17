package com.ysc.after.school.domain.param;

import lombok.Data;

@Data
public class SearchParam {

	private String searchType;
	
	private String content;
	
	private int grade;
	
	private int classType;
	
	private int number;
	
	private String name;
}
