<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/student.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="학생 관리" />
  	<c:param name="middlename" value="학생 조회" />
  	<c:param name="lastname" value="학생 상세정보" />
</c:import>

<div class="m-content">
	<div class="m-portlet student-detail-body">
		<form class="m-form m-form--fit m-form--label-align-right">
			<div class="m-portlet__body">
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.name}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.sex.name}" readonly>
					</div>
					
					<label class="col-md-2 col-form-label">자유 수강권 여부&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-1">
						<input type="text" class="form-control m-input" value="${student.isLesson}" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">생년월일&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.year}년 ${student.month}월 ${student.day}일" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.grade}학년 ${student.classType}반 ${student.number}번" readonly>
					</div>
					
					<label class="col-md-2 col-form-label">비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.studentInfo.name}" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">연 락 처&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.tel}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">학부모 연락처&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.parentTel}" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-5">
						<input type="text" class="form-control m-input" value="${student.address} ${student.detailAddress}" readonly>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div class="m-portlet">
		<div class="m-portlet__head">
			<div class="m-portlet__head-caption">
				<div class="m-portlet__head-title">
					<span class="m-portlet__head-icon">
						<i class="flaticon-web m--font-info"></i>
					</span>
					<h3 class="m-portlet__head-text m--font-info">
						수강중인 수업
					</h3>
				</div>
			</div>
		</div>
		<div class="m-portlet__body">
		
		</div>
	</div>
	
	<div class="m-portlet">
		<div class="m-portlet__head">
			<div class="m-portlet__head-caption">
				<div class="m-portlet__head-title">
					<span class="m-portlet__head-icon">
						<i class="flaticon-web m--font-success"></i>
					</span>
					<h3 class="m-portlet__head-text m--font-success">
						대기중인 수업
					</h3>
				</div>
			</div>
		</div>
		<div class="m-portlet__body">
		
		</div>
	</div>
	
	<div class="m-portlet">
		<div class="m-portlet__head">
			<div class="m-portlet__head-caption">
				<div class="m-portlet__head-title">
					<span class="m-portlet__head-icon">
						<i class="flaticon-web m--font-primary"></i>
					</span>
					<h3 class="m-portlet__head-text m--font-primary">
						최근 6개월 수강이력
					</h3>
				</div>
			</div>
		</div>
		<div class="m-portlet__body">
		
		</div>
	</div>
</div>