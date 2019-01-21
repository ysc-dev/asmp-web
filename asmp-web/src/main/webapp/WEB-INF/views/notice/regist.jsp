<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/notice.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="lastname" value="관리자 공지사항" />
</c:import>

<div class="m-content">
	<form:form id="noticeRegistForm" role="form" class="notice-regist" modelAttribute="notice" 
		method="POST" enctype="multipart/form-data">
		<div class="title">
			<span>게시물 작성</span>
		</div>
		<div class="subject">
			<div class="m-stack m-stack--ver m-stack--general">
				<div class="m-stack__item m-stack__item--middle" style="width: 80px;">
					<label class="col-form-label">제목 : </label>
				</div>
				<div class="m-stack__item m-stack__item--center m-stack__item--middle m-stack__item--fluid">
					<input type="text" class="form-control form-control-sm m-input m-input--air" name="subject" required>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="m-stack m-stack--ver m-stack--general">
				<div class="m-stack__item m-stack__item--middle" style="width: 80px;">
					<label class="col-form-label">내용</label>
				</div>
				<div class="m-stack__item m-stack__item--center m-stack__item--middle m-stack__item--fluid">
					<textarea class="form-control m-input m-input--air" name="content" rows="18" required></textarea>
				</div>
			</div>
		</div>
		<div id="attachmentDiv" class="file">
			<div class="m-stack m-stack--ver m-stack--general">
				<div class="m-stack__item m-stack__item--middle" style="width: 65px;">
					<label class="col-form-label">첨부파일</label>
				</div>
				
				<div data-repeater-list="" class="m-stack__item m-stack__item--fluid">
					<div data-repeater-item class="form-group m-form__group row align-items-center">
						<div class="col-md-5">
							<div class="custom-file">
							  	<input type="file" class="custom-file-input" id="customFile" name="files" required>
							  	<label class="custom-file-label form-control-sm m--margin-left-15" for="customFile">파일을 선택하세요</label>
							</div>
						</div>
					</div>
					<div data-repeater-item class="form-group m-form__group row">
						<div class="col-md-5">
							<div class="custom-file">
							  	<input type="file" class="custom-file-input" id="customFile2" name="files">
							  	<label class="custom-file-label form-control-sm m--margin-left-15" for="customFile2">파일을 선택하세요</label>
							</div>
						</div>
						<div class="col-md-1">
							<a data-repeater-delete="" href="#" class="btn btn-danger m-btn m-btn--icon m-btn--icon-only btn-sm">
								<i class="la la-close"></i>
							</a>
						</div>
					</div>
					<div data-repeater-item class="form-group m-form__group row">
						<div class="col-md-5">
							<div class="custom-file">
							  	<input type="file" class="custom-file-input" id="customFile3" name="files">
							  	<label class="custom-file-label form-control-sm m--margin-left-15" for="customFile3">파일을 선택하세요</label>
							</div>
						</div>
						<div class="col-md-1">
							<a data-repeater-delete="" href="#" class="btn btn-danger m-btn m-btn--icon m-btn--icon-only btn-sm">
								<i class="la la-close"></i>
							</a>
						</div>
					</div>
					<div data-repeater-item class="form-group m-form__group row">
						<div class="col-md-5">
							<div class="custom-file">
							  	<input type="file" class="custom-file-input" id="customFile4" name="files">
							  	<label class="custom-file-label form-control-sm m--margin-left-15" for="customFile4">파일을 선택하세요</label>
							</div>
						</div>
						<div class="col-md-1">
							<a data-repeater-delete="" href="#" class="btn btn-danger m-btn m-btn--icon m-btn--icon-only btn-sm">
								<i class="la la-close"></i>
							</a>
						</div>
					</div>
					<div data-repeater-item class="form-group m-form__group row">
						<div class="col-md-5">
							<div class="custom-file">
							  	<input type="file" class="custom-file-input" id="customFile5" name="files"> 
							  	<label class="custom-file-label form-control-sm m--margin-left-15" for="customFile5">파일을 선택하세요</label>
							</div>
						</div>
						<div class="col-md-1">
							<a data-repeater-delete="" href="#" class="btn btn-danger m-btn m-btn--icon m-btn--icon-only btn-sm">
								<i class="la la-close"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="button">
			<button type="submit" class="btn btn-success m-btn m-btn--icon">
				<span>&nbsp;<i class="fa fa-edit"></i><span>&nbsp;글저장&nbsp;</span>&nbsp;</span>
			</button>
			<a href="${contextName}/notice/list" class="btn btn-secondary m-btn m-btn--icon m--margin-left-15">
				<span>&nbsp;<i class="fa fa-list-ul"></i><span>&nbsp;목 록&nbsp;</span>&nbsp;</span>
			</a>
		</div>
	</form:form>
</div>

<script>
	$("#attachmentDiv").repeater({
	    initEmpty: !1,
	    defaultValues: {
	        "text-input": "foo"
	    },
	    show: function() {
	        $(this).slideDown()
	    },
	    hide: function(e) {
	        $(this).slideUp(e)
	    }
	});
	
	$("#noticeRegistForm").submit(function(e) {
		e.preventDefault(); // avoid to execute the actual submit of the form.
		
		var form = $(this);
	    var url = form.attr('action');
	    var formData = new FormData($("#noticeRegistForm")[0]);
		
		$.ajax({
			type: "POST",
           	url: url,
           	data: formData, // serializes the form's elements.
           	processData: false,
           	contentType: false,
           	success: function(response) {
           		swal({
       				title: "공지사항 등록이 되었습니다.", 
       				type: "success"
       			}).then(function(e) {
       				location.replace("${contextName}/notice/list");
       			});
           	},
            error: function(response) {
            	swal({title: "공지사항 등록을 실패하였습니다.", type: "error"})
            }
		});
	});
</script>