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
import lombok.Getter;
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
	
	@OneToMany(mappedBy = "lesson", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<LessonInfo> lessonInfos;
	
	@Column(nullable = false, length = 20)
	private String status;
	
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

	@Override
	public String toString() {
		return "Lesson [id=" + id + ", name=" + name + ", subject=" + subject + ", teacher=" + teacher
				+ ", introduction=" + introduction + ", status=" + status + "]";
	}
}
