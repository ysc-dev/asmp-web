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
			<span>${notice.subject}</span>
		</div>
		<div class="subject m-form">
			<div class="m-form__group m-form__group--inline">
				<div class="m-form__label">
					<label>글쓴이 :</label>
					<label class="m--margin-left-5">${notice.userName}</label>
					
					<label class="m--margin-left-40">날짜 :</label>
					<label class="m--margin-left-5">${notice.date}</label>
					
					<label class="m--margin-left-40">조회수 :</label>
					<label class="m--margin-left-5">${notice.hit}</label>
				</div>
			</div>
		</div>
		<div class="file m-form">
			<div class="m-form__group m-form__group--inline">
				<div class="m-form__label">
					<i class="la la-file-text m--margin-right-5"></i>
					<label class="m--margin-right-10">첨부파일 :</label>
					<c:forEach var="uploadedFile" items="${notice.uploadedFiles}" varStatus="status">
						<a href="#" class="m-link m-link--state m-link--info m--margin-right-5"
							onclick="fileDownload(${uploadedFile.id})">${uploadedFile.fileName}</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="content">
			<textarea class="form-control m-input m-input--air" name="content" rows="18" readonly>${notice.content}</textarea>
		</div>
		<div class="comment">
		
		</div>
		<div class="button">
			<a href="${contextName}/notice/list" class="btn btn-secondary m-btn m-btn--icon">
				<span><i class="fa fa-list-ul"></i><span>&nbsp;목 록&nbsp;</span></span>
			</a>
			<a href="${contextName}/notice/regist" class="btn btn-success m-btn m-btn--icon m--margin-left-10">
				<span><i class="fa fa-edit"></i><span>&nbsp;글쓰기&nbsp;</span></span>
			</a>
		</div>
	</form>
</div>

<script>
	// 첨부파일 다운로드
	function fileDownload(id) {
		$.ajax({
      		url: contextPath + "/notice/getFile",
      		data: {"id": id},
      		type: "get",
      		dataType: "json",
      		success: function(response) {
	        	var file = base64ToArrayBuffer(response.content);
	          	var a = document.createElement('a');
	          	a.href = window.URL.createObjectURL(new Blob([file]));
	          	a.download = response.fileName;
	          	// Firefox에서 다운로드 안되는 문제 수정용 코드
	          	// (Firefox는 a가 화면에 실존할 때만 다운로드 가능)
	          	document.body.appendChild(a);
	          	a.click();
	          	document.body.removeChild(a); 
     		}
		});
	}
</script>