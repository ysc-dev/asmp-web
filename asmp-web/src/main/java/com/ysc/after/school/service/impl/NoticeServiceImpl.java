package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.CommonEnum.NoticeSearchType;
import com.ysc.after.school.domain.db.Notice;
import com.ysc.after.school.domain.param.SearchParam;
import com.ysc.after.school.repository.NoticeRepository;
import com.ysc.after.school.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeRepository NoticeRepository;
	
	@Override
	public Notice get(int id) {
		return NoticeRepository.findOne(id);
	}

	@Override
	public List<Notice> getList() {
		return NoticeRepository.findAll();
	}

	@Override
	public boolean regist(Notice Notice) {
		if (isNew(Notice)) {
			return NoticeRepository.save(Notice) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(Notice Notice) {
		if (!isNew(Notice)) {
			return NoticeRepository.save(Notice) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(Notice Notice) {
		NoticeRepository.delete(Notice);
		return true;
	}

	private boolean isNew(Notice Notice) {
		return !NoticeRepository.exists(Notice.getId());
	}

	@Override
	public List<Notice> getList(SearchParam param) {
		NoticeSearchType searchType = param.getNoticeSearchType();
		if (searchType == NoticeSearchType.전체) {
			return getList();
		} else {
			if (!param.getContent().isEmpty()) {
				if (searchType == NoticeSearchType.제목) {
					return NoticeRepository.findBySubjectContaining(param.getContent());
				} else if (searchType == NoticeSearchType.작성자) {
					return NoticeRepository.findByUserNameContaining(param.getContent());
				} else if (searchType == NoticeSearchType.내용) {
					return NoticeRepository.findByContentContaining(param.getContent());
				}
			}
		}
		
		return null;
	}

	@Override
	public Integer backId(int id) {
		return NoticeRepository.backId(id);
	}

	@Override
	public Integer nextId(int id) {
		return NoticeRepository.nextId(id);
	}
}
