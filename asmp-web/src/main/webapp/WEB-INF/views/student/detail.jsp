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
		<div class="m-portlet__head">
			<div class="m-portlet__head-caption">
				<div class="m-portlet__head-title">
					<span class="m-portlet__head-icon">
						<i class="flaticon-user m--font-brand"></i>
					</span>
					<h3 class="m-portlet__head-text m--font-brand">
						학생 상세정보 
					</h3>
				</div>
			</div>
			<div class="m-portlet__head-tools">
				<ul class="m-portlet__nav">
					<li class="m-portlet__nav-item">
						<button type="button" class="btn btn-success m-btn m-btn--icon m--margin-right-5">
							<span><i class="fa fa-user-edit"></i><span>&nbsp;수 정&nbsp;</span></span>
						</button>
					</li>
					<li class="m-portlet__nav-item">
						<a href="${contextName}/student/list" class="btn btn-secondary m-btn m-btn--icon">
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
					
					<label class="col-md-2 col-form-label">사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${student.reason.name}" readonly>
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
			<table class="table table-striped- table-bordered table-hover" id="attendTable">
				<thead class="text-center">
					<tr>
						<th>연번</th>
						<th>과목</th>
						<th>강좌명</th>
						<th>반</th>
						<th>강사명</th>
						<th>연락처</th>
						<th>상태</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class="text-center"></tbody>
			</table>
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
			<table class="table table-striped- table-bordered table-hover" id="standByTable">
				<thead class="text-center">
					<tr>
						<th>연번</th>
						<th>과목</th>
						<th>강좌명</th>
						<th>반</th>
						<th>강사명</th>
						<th>연락처</th>
						<th>상태</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class="text-center"></tbody>
			</table>
		</div>
	</div>
</div>

<script>

</script>