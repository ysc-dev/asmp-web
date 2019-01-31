package com.ysc.after.school.domain.db;

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
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.ysc.after.school.domain.Domain;
import com.ysc.after.school.domain.LessonForm;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 강좌 관리 도메인
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "tb_lesson")
@Data
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
	@ManyToOne
    @JoinColumn(name = "teacher_id")
	private Teacher teacher;
	
	/** 강좌 소개 */
	@Lob
	@Column(nullable = false)
	private String introduction;
	
	@OneToMany(mappedBy = "lesson", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<LessonInfo> lessonInfos;
	
	public Lesson(LessonForm lessonForm) {
		this.name = lessonForm.getName();
		this.introduction = lessonForm.getIntroduction();
	}
}
