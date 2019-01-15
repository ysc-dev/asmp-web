<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/student.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="학생 관리" />
  	<c:param name="lastname" value="학생 등록" />
</c:import>