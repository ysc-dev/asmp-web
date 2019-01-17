<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/teacher.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강사 관리" />
  	<c:param name="lastname" value="강사 수정" />
</c:import>

<div class="m-content">
	<div class="row student-regist-body">
		<div class="col-md-10">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon"> 
								<i class="flaticon-user-add"></i>
							</span>
							<h3 class="m-portlet__head-text m--font-brand">
								학생 정보 수정&nbsp;&nbsp;&nbsp;&nbsp;<small><span class="m--font-orange">별표(*)</span>는 필수입력 사항입니다.</small>
							</h3>
						</div>			
					</div>
				</div>
				<form:form id="studentUpdateForm" commandName="student" role="form" class="m-form m-form--fit" method="POST">
					<div class="m-portlet__body portlet-form-body">
						<div class="form-group m-form__group row">
							<label for="nameInput" class="col-md-2 offset-md-3 col-form-label">
								이&nbsp;&nbsp;름&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-3"> 
								<form:input class="form-control m-input" type="text" path="name" id="nameInput" />
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>