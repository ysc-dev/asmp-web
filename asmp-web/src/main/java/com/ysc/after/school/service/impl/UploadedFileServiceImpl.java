package com.ysc.after.school.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysc.after.school.domain.db.UploadedFile;
import com.ysc.after.school.repository.UploadedFileRepository;
import com.ysc.after.school.service.UploadedFileService;

@Service
public class UploadedFileServiceImpl implements UploadedFileService {

	@Autowired
	private UploadedFileRepository uploadedFileRepository;
	
	@Override
	public UploadedFile get(int id) {
		return uploadedFileRepository.findOne(id);
	}

	@Override
	public List<UploadedFile> getList() {
		return uploadedFileRepository.findAll();
	}

	@Override
	public boolean regist(UploadedFile uploadedFile) {
		if (isNew(uploadedFile)) {
			return uploadedFileRepository.save(uploadedFile) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(UploadedFile uploadedFile) {
		if (!isNew(uploadedFile)) {
			return uploadedFileRepository.save(uploadedFile) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(UploadedFile uploadedFile) {
		uploadedFileRepository.delete(uploadedFile);
		return true;
	}

	private boolean isNew(UploadedFile uploadedFile) {
		return !uploadedFileRepository.exists(uploadedFile.getId());
	}
}
