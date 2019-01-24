package com.ysc.after.school.service;

import java.util.List;

import com.ysc.after.school.domain.db.Notice;
import com.ysc.after.school.domain.param.SearchParam;

public interface NoticeService extends CRUDService<Notice> {

	List<Notice> getList(SearchParam param);

	Notice get(int id);

	Integer backId(int id);
	
	Integer nextId(int id);
}
