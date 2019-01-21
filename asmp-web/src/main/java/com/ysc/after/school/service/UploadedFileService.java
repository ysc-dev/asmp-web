package com.ysc.after.school.service;

import com.ysc.after.school.domain.db.UploadedFile;

public interface UploadedFileService extends CRUDService<UploadedFile> {

	UploadedFile get(int id);

}
