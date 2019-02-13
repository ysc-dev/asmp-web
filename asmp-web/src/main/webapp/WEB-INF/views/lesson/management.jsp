<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/lesson.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강좌 관리" />
  	<c:param name="middlename" value="강좌 상세정보" />
  	<c:param name="lastname" value="수강인원 관리" />
</c:import>

<div class="m-content lesson-management-body">
	<div class="m-portlet">
		<div class="m-portlet__head">
			<div class="m-portlet__head-caption">
				<div class="m-portlet__head-title">
					<h3 class="m-portlet__head-text m--font-brand">
						${lesson.name} - ${lessonInfo.classType}반
					</h3>
				</div>
			</div>
			<div class="text-right m--padding-top-15">
				<select id="classTypeSelect" class="form-control m-bootstrap-select m_selectpicker" data-width="100">
					<c:forEach var="lessonInfo" items="${lesson.lessonInfos}" varStatus="status">
						<option value="${lessonInfo.classType}">${lessonInfo.classType}</option>
	 				</c:forEach>
				</select>
				<button id="searchBtn" type="button" class="btn btn-success m-btn--icon m--margin-left-5">
					<span>&nbsp;<i class="fa fa-search"></i><span>조 회</span>&nbsp;</span>
				</button>
			</div>
		</div>
		
		<form class="m-form m-form--fit m-form--label-align-right">
			<div class="m-portlet__body">
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lesson.subject.name}" readonly> 
					</div>
					
					<label class="col-md-1 col-form-label">강&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lesson.teacher.name}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">연&nbsp;&nbsp;락&nbsp;&nbsp;처&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lesson.teacher.tel}" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row m--padding-top-5">
					<label class="col-md-1 offset-md-1 col-form-label">대상학년&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lessonInfo.grade}" readonly> 
					</div>
					
					<label class="col-md-1 col-form-label">요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lessonInfo.week}" readonly> 
					</div>
					
					<label class="col-md-1 col-form-label">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lessonInfo.startTime} ~ ${lessonInfo.endTime}" readonly> 
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon">
								<i class="flaticon-users-1 m--font-black"></i>
							</span>
							<h3 class="m-portlet__head-text">
								수강중인 인원
							</h3>
						</div>
					</div>
				</div>
				<div class="m-portlet__body">
					<table class="table table-striped- table-bordered table-hover" id="lessoningTable">
						<thead class="text-center">
							<tr>
								<th></th>
								<th></th>
								<th>연번</th>
								<th>학년</th>
								<th>반</th>
								<th>번호</th>
								<th>이름</th>
								<th>학생 연락처</th>
								<th>학부모 연락처</th>
								<th>자유수강권 여부</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody class="text-center"></tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon">
								<i class="flaticon-users-1 m--font-black"></i>
							</span>
							<h3 class="m-portlet__head-text">
								대기중인 인원
							</h3>
						</div>
					</div>
				</div>
				<div class="m-portlet__body">
					<table class="table table-striped- table-bordered table-hover" id="waitingTable">
						<thead class="text-center">
							<tr>
								<th></th>
								<th></th>
								<th>연번</th>
								<th>학년</th>
								<th>반</th>
								<th>번호</th>
								<th>이름</th>
								<th>학생 연락처</th>
								<th>학부모 연락처</th>
								<th>자유수강권 여부</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody class="text-center"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();
</script>