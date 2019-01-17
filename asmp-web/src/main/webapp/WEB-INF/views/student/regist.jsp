<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/student.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="학생 관리" />
  	<c:param name="lastname" value="학생 등록" />
</c:import>

<div class="m-content">
	<div class="row student-regist-body">
		<div class="col-md-10">
			<div class="m-portlet">
				<form:form role="form" class="m-form m-form--fit" modelAttribute="studentData" method="POST" 
						action="${contextName}/student/regist" enctype="multipart/form-data">
					<div class="m-portlet__body portlet-form-body">
						<div class="form-group m-form__group row">
							<label for="name-input" class="col-md-2 offset-md-3 col-form-label">이&nbsp;&nbsp;름</label>
							<div class="col-md-3">
								<input class="form-control m-input" type="text" name="name" id="name-input" required>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="name-input" class="col-md-2 offset-md-3 col-form-label">소&nbsp;&nbsp;속</label>
							<div class="col-md-4">
								<input class="form-control m-input" type="text" name="name" id="name-input" required>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">학년/반/번호</label>
							<div class="col-md-5">
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="grade" data-width="120">
									<c:forEach var="item" begin="1" end="6" step="1">
										<option value="${item}">${item}학년</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="classType" data-width="120">
									<c:forEach var="item" begin="1" end="10" step="1">
										<option value="${item}">${item}반</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker" data-size="11" name="number" data-width="120">
									<c:forEach var="item" begin="1" end="30" step="1">
										<option value="${item}">${item}번</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">생년월일</label>
							<div class="col-md-5">
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="year" data-width="120">
									<c:forEach var="item" begin="1970" end="2020" step="1">
										<option value="${item}">${item}년</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="month" data-width="120">
									<c:forEach var="item" begin="1" end="12" step="1">
										<option value="${item}">${item}월</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker" data-size="11" name="day" data-width="120">
									<c:forEach var="item" begin="1" end="31" step="1">
										<option value="${item}">${item}일</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">성&nbsp;&nbsp;별</label>
							<div class="col-md-5">
								<div class="m-radio-inline">
									<label class="m-radio m-radio--check-bold m-radio--state-brand m--margin-right-25">
										<input type="radio" value="MALE" name="SEX" checked> 남성
										<span></span>
									</label>
									<label class="m-radio m-radio--check-bold m-radio--state-brand">
										<input type="radio" value="FEMALE" name="SEX"> 여성
										<span></span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">연락처</label>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">학부모 연락처</label>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">주&nbsp;&nbsp;소</label>
						</div>
					</div>
					<div class="m-portlet__foot text-center">
						<div class="align-items-center">
							<button type="submit" class="btn btn-success m-btn--icon m--margin-right-10">
								<span><i class="fa fa-user-plus"></i><span>&nbsp;등 록&nbsp;</span></span>
							</button>
							<a href="${contextName}/student/list" class="btn btn-secondary m-btn--icon">
								<span><i class="la la-close"></i><span>&nbsp;취 소&nbsp;</span></span>
							</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();
</script>