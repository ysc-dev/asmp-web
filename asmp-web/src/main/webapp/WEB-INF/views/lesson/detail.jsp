<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/lesson.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강좌 관리" />
  	<c:param name="middlename" value="강좌 조회" />
  	<c:param name="lastname" value="강좌 상세정보" />
</c:import>

<div class="m-content">
	<div class="row lesson-regist-body">
		<div class="col-md-11">
			<div class="m-portlet">
				<form role="form" class="m-form m-form--fit m-form--label-align-right">
					<div class="m-portlet__body">
						<div class="m-form__section m-form__section--first row">
							<div class="col-md-5">
								<div class="m-form__heading">
									<h3 class="m-form__heading-title">(강좌명) ${lesson.name}</h3>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">과&nbsp;&nbsp;목&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<input class="form-control m-input" type="text" value="${lesson.subject.name}" readonly>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">강&nbsp;&nbsp;사&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<input class="form-control m-input" type="text" value="${lesson.teacher.name}" readonly>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">연락처&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<input class="form-control m-input" type="text" value="${lesson.teacher.tel}" readonly>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="m-form__heading">
									<h3 class="m-form__heading-title">강좌 소개</h3>
								</div>
								<div class="form-group m-form__group">
									<textarea class="form-control m-input" rows="8" maxlength="150" readonly>${lesson.introduction}</textarea>
								</div>
							</div>
						</div>
						
						<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space"></div>
						
						<div class="m-form__section">
							<div class="m-form__heading m--padding-left-50 m--margin-bottom-0">
								<div class="m-stack m-stack--ver m-stack--general">
									<div class="m-stack__item">
										<h3 class="m-form__heading-title">반별 정보</h3>
									</div>
									<div class="m-stack__item text-right m--padding-right-20">
										<button id="classDeleteBtn" type="button" class="btn btn-primary m-btn--icon btn-sm">
											<span>&nbsp;<i class="fa fa-user-friends"></i><span>&nbsp;수강인원 관리&nbsp;</span>&nbsp;</span>
										</button>
									</div>
								</div>
							</div>
							<div class="m--padding-left-50 m--padding-right-50">
								<table class="table table-striped- table-bordered table-hover" id="lessionInfoTable">
									<thead class="text-center">
										<tr>
											<th></th>
											<th></th>
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
										<c:forEach var="lessonInfo" items="${lesson.lessonInfos}" varStatus="status">
											<tr>
												<td></td>
												<td>${lessonInfo.id}</td>
												<td>${lessonInfo.classType}</td>
												<td>${lessonInfo.grade}</td>
												<td>${lessonInfo.week}</td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space"></div>
						
						<div class="m-form__section">
							<div class="m-form__heading m--padding-left-50 m--margin-bottom-0">
								<div class="m-stack m-stack--ver m-stack--general">
									<div class="m-stack__item">
										<h3 class="m-form__heading-title">반별 인원 정보</h3>
									</div>
									<div class="m-stack__item text-right m--padding-right-20">
										
									</div>
								</div>
							</div>
							<div class="m--padding-left-50 m--padding-right-50">
								<table class="table table-striped- table-bordered table-hover" id="studentTable">
									<thead class="text-center">
										<tr>
											<th>반</th>
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
									<tbody class="text-center">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
Datatables.singleCheck("#lessionInfoTable");
</script>