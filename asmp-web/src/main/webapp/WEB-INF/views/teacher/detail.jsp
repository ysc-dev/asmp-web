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
		<div class="m-portlet__head">
			<div class="m-portlet__head-caption">
				<div class="m-portlet__head-title">
					<span class="m-portlet__head-icon">
						<i class="flaticon-user m--font-brand"></i>
					</span>
					<h3 class="m-portlet__head-text m--font-brand">
						강사 상세정보
					</h3>
				</div>
			</div>
			<div class="m-portlet__head-tools">
				<ul class="m-portlet__nav">
					<li class="m-portlet__nav-item">
						<a href="${contextName}/teacher/update?id=${teacher.id}" class="btn btn-success m-btn m-btn--icon m--margin-right-5">
							<span><i class="fa fa-user-edit"></i><span>&nbsp;수 정&nbsp;</span></span>
						</a>
					</li>
					<li class="m-portlet__nav-item">
						<a href="${contextName}/teacher/list" class="btn btn-secondary m-btn m-btn--icon">
							<span><i class="fa fa-list-ul"></i><span>&nbsp;목 록&nbsp;</span></span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<form class="m-form m-form--fit m-form--label-align-right">
			<div class="m-portlet__body">
				<div class="form-group m-form__group row m--padding-top-0">
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
						담당 수업
					</h3>
				</div>
			</div>
		</div>
		<div class="m-portlet__body m-form">
			<div class="m-form__section m-form__section--first">
				<div class="m-form__heading m--padding-left-50">
					<h3 class="m-form__heading-title">강좌 정보</h3>
				</div>
				<div class="m--padding-left-50 m--padding-right-50">
					<table class="table table-striped- table-bordered table-hover" id="lessonTable">
						<thead class="text-center">
							<tr>
								<th>연번</th>
								<th>과목</th>
								<th>강좌명</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<c:forEach var="lesson" items="${lessons}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${lesson.subject.name}</td>
									<td>${lesson.name}</td>
									<td>${lesson.status}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space"></div>
			
			<div class="m-form__section">
				<div class="m-form__heading m--padding-left-50">
					<h3 class="m-form__heading-title">반 정보</h3>
				</div>
				<div class="m--padding-left-50 m--padding-right-50">
					<table class="table table-striped- table-bordered table-hover" id="lessonInfoTable">
						<thead class="text-center">
							<tr>
								<th>반</th>
								<th>대상학년</th>
								<th>요일</th>
								<th>시간</th>
								<th>장소</th>
								<th>수강료</th>
								<th>교재비별도 여부</th>
								<th>정원</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<c:forEach var="lessonInfo" items="${lessonInfos}" varStatus="status">
								<tr>
									<td>${lessonInfo.classType}</td>
									<td>${lessonInfo.grade}</td>
									<td>${lessonInfo.week}</td>
									<td>${lessonInfo.startTime} ~ ${lessonInfo.endTime}</td>
									<td>${lessonInfo.location}</td>
									<td>${lessonInfo.tuition}</td>
									<td>${lessonInfo.textbook ? 'O' : 'X'}</td>
									<td>${lessonInfo.fixedNumber}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
Datatables.custom("#lessonTable");
Datatables.custom("#lessonInfoTable");
</script>