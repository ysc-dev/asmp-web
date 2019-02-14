package com.ysc.after.school.domain.db;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.ysc.after.school.domain.Domain;
import com.ysc.after.school.domain.LessonForm;
import com.ysc.after.school.service.util.DateUtil;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 강좌 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_lesson")
@Data
@ToString(exclude = {"lessonInfos"})
@NoArgsConstructor
public class Lesson implements Domain {

	@Id
	@GeneratedValue
	private int id;
	
	/** 강좌명 */
	@Column(nullable = false, length = 20)
	private String name;
	
	/** 과목 */
	@ManyToOne
    @JoinColumn(name = "subject_id")
	private Subject subject;
	
	/** 강사 */
	@OneToOne
    @JoinColumn(name = "teacher_id")
	private Teacher teacher;
	
	/** 강좌 소개 */
	@Lob
	@Column
	private String introduction;
	
	@OneToMany(mappedBy = "lesson", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<LessonInfo> lessonInfos;
	
	@Column(nullable = false, length = 20)
	private String status;
	
	@Column(nullable = false, length = 20)
	private String createDate;
	
	public Lesson(LessonForm lessonForm) {
		this.id = lessonForm.getId();
		this.name = lessonForm.getName();
		this.introduction = lessonForm.getIntroduction();
		this.status = lessonForm.getStatus();
	}
	
	@Getter
	public enum LessonStatus {
		모집중("모집중"), 진행중("진행중"), 신설예정("신설예정");
		
		private String name;
		
		private LessonStatus(String name) {
			this.name = name;
		}
	}
	
	@PrePersist
	public void prePersist() {
		createDate = DateUtil.convertDate(new Date());
	}
}
