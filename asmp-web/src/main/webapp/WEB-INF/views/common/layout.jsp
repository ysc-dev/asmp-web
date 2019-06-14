<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp" %>

<!DOCTYPE html>
<html>
<tiles:insertAttribute name="head" ignore="true"/>
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-aside-left--enabled m-aside-left--skin-light m-aside-left--fixed m-aside-left--offcanvasm-aside--offcanvas-default">
	<div class="m-grid m-grid--hor m-grid--root m-page">
		<div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">
			<tiles:insertAttribute name="aside" ignore="true"/>
			
			<div class="m-grid__item m-grid__item--fluid m-wrapper">
				<tiles:insertAttribute name="content" ignore="true"/>
			</div>
		</div>
	</div>
</body>