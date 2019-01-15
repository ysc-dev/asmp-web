package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ysc.after.school.domain.db.Notice;
import com.ysc.after.school.repository.NoticeRepository;
import com.ysc.after.school.service.NoticeService;

public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeRepository NoticeRepository;

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
}
