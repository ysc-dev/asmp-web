<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/teacher.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강사 관리" />
  	<c:param name="middlename" value="강사 조회" />
  	<c:param name="lastname" value="강사 상세정보" />
</c:import>

<div class="m-content">
	<div class="m-portlet teacher-detail-body">
		<form class="m-form m-form--fit m-form--label-align-right">
			<div class="m-portlet__body">
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${teacher.name}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${teacher.sex.name}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">계&nbsp;약&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" 
							value="${teacher.contractYear}년 ${teacher.contractMonth}월 ${teacher.contractDay}일" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">생년월일&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${teacher.year}년 ${teacher.month}월 ${teacher.day}일" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;속&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${teacher.affiliation}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${teacher.status}" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">연 락 처&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${teacher.tel}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">담당 과목&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${teacher.subject}" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-5">
						<input type="text" class="form-control m-input" value="${teacher.address} ${teacher.detailAddress}" readonly>
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
						진행중인 수업
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
						최근 6개월 강의이력
					</h3>
				</div>
			</div>
		</div>
		<div class="m-portlet__body">
		
		</div>
	</div>
	
	<div class="m-divider">
		<span></span>
	</div>
	
	<div class="m--margin-top-20 text-right">
		<a href="${contextName}/teacher/list" class="btn btn-secondary m-btn m-btn--icon">
			<span><i class="fa fa-list-ul"></i><span>&nbsp;목 록&nbsp;</span></span>
		</a>
	</div>
</div>