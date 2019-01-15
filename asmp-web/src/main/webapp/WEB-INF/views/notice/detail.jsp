<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/notice.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="lastname" value="관리자 공지사항" />
</c:import>

<div class="m-content">
	<form class="notice-detail">
		<div class="title">
			<span>제목은 아무것도 아닙니다.</span>
		</div>
		<div class="subject m-form">
			<div class="m-form__group m-form__group--inline">
				<div class="m-form__label">
					<label>글쓴이 :</label>
					<label class="m--margin-left-5">관리자</label>
					
					<label class="m--margin-left-40">날짜 :</label>
					<label class="m--margin-left-5">2019-01-01 19:45</label>
					
					<label class="m--margin-left-40">조회수 :</label>
					<label class="m--margin-left-5">10</label>
				</div>
			</div>
		</div>
		<div class="file">
		
		</div>
		<div class="file">
		
		</div>
		<div class="button">
		
		</div>
	</form>
</div>