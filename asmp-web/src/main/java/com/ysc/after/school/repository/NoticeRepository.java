package com.ysc.after.school.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.ysc.after.school.domain.db.Notice;

public interface NoticeRepository extends DefaultRepository<Notice, Integer> {

	List<Notice> findBySubjectContaining(String content);

	List<Notice> findByUserNameContaining(String content);

	List<Notice> findByContentContaining(String content);

	@Query(value = "SELECT IFNULL(id, 0) FROM tb_notice WHERE id < ?1 ORDER BY id DESC LIMIT 1", nativeQuery = true)
	Integer backId(int id);
	
	@Query(value = "SELECT IFNULL(id, 0) FROM tb_notice WHERE id > ?1 ORDER BY id LIMIT 1", nativeQuery = true)
	Integer nextId(int id);
}
