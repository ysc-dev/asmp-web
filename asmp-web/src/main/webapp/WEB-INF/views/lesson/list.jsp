<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="방과 후 과목 관리" />
  	<c:param name="lastname" value="강좌 조회" />
</c:import>

<div class="m-content">
	<form class="form-inline m--margin-bottom-5">
		<div class="form-group">
			<select class="form-control m-bootstrap-select m_selectpicker" id="searchTypeSelect" data-width="110">
				<c:forEach var="searchType" items="${searchTypes}" varStatus="status">
					<option value="${searchType}">${searchType}</option>
 				</c:forEach>
			</select>
			
			<input id="content_input" type="text" class="form-control m-input m--margin-left-15" placeholder="검색내용" />
			
			<button id="search_button" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
				<span><i class="fa fa-search"></i><span>검 색</span></span>
			</button>
		</div>
	</form>
	
	<table class="table table-striped- table-bordered table-hover" id="noticeTable">
		<thead class="text-center">
			<tr>
				<th></th>
				<th></th>
				<th>연번</th>
				<th>과목</th>
				<th>강좌명</th>
				<th>강사명</th>
				<th>연락처</th>
				<th>상태</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody class="text-center"></tbody>
	</table>
</div>

<script>
	$(".m_selectpicker").selectpicker();
</script>