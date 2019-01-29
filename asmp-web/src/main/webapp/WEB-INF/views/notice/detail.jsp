<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/notice.css" rel="stylesheet" type="text/css" />

<sec:authentication property="principal" var="user"></sec:authentication>

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
					<input type="hidden" id="noticeId" value="${notice.id}" />
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
							onclick="fileDownloadClick(${uploadedFile.id})">
								${uploadedFile.fileName}<c:if test="${!status.last}">,</c:if>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="content">
			<textarea class="form-control m-input" name="content" rows="18" readonly>${notice.content}</textarea>
		</div>
		<div class="comment-list">
			<c:forEach var="comment" items="${comments}" varStatus="status">
				<div class="m-stack m-stack--ver m-stack--general">
					<div class="m-stack__item m-stack__item--left">
						<p><strong>${comment.userName}</strong> (${comment.createDate})</p>
						<p class="">${comment.content}</p>
					</div>
					<c:if test="${user.role == 'ADMIN' || user.userId == comment.userId}">
						<div class="m-stack__item m-stack__item--right m-stack__item--top">
							<a href="#" onclick="deleteComment(${comment.id})" class="m-link m-link--state m-link--danger m--font-boldest m--margin-right-10">삭제</a>
							<a href="#" onclick="updateComment(${comment.id})" class="m-link m-link--state m-link--info m--font-boldest">수정</a>
						</div>
					</c:if>
				</div>
				<c:if test="${!status.last}">
					<div class="m-divider">
						<span></span>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="comment-regist">
			<div class="text">
				<span>Comment ${fn:length(comments)}</span>
			</div>
			<textarea class="form-control m-input" id="commentInput" rows="3"></textarea>
			<div class="text-right">
				<button type="button" id="commentRegistBtn" class="btn btn-info m-btn m-btn--icon m--margin-top-10">&nbsp;&nbsp;댓글 입력&nbsp;&nbsp;</button>
			</div>
		</div>
		<div class="button">
			<div class="m-stack m-stack--ver m-stack--general">
				<div class="m-stack__item m-stack__item--left">
					<a href="${contextName}/notice/list" class="btn btn-secondary m-btn m-btn--icon">
						<span><i class="fa fa-list-ul"></i><span>&nbsp;목 록&nbsp;</span></span>
					</a>
					<a href="${contextName}/notice/regist" class="btn btn-success m-btn m-btn--icon m--margin-left-10">
						<span><i class="fa fa-edit"></i><span>&nbsp;글쓰기&nbsp;</span></span>
					</a>
				</div>
				<div class="m-stack__item m-stack__item--right">
					<button type="button" class="btn btn-secondary m-btn m-btn--icon" onclick="backMove(${notice.id})">
						<span><i class="la la-arrow-left"></i><span>&nbsp;이전글&nbsp;</span></span>
					</button>
					<button type="button" class="btn btn-secondary m-btn m-btn--icon m--margin-left-10" onclick="nextMove(${notice.id})">
						<span><span>다음글&nbsp;&nbsp;</span><i class="la la-arrow-right"></i></span>
					</button>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade" id="update_modal" role="dialog">
	<div class="modal-dialog comment-update-modal" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">
					<i class="flaticon-edit-1"></i>&nbsp;&nbsp;&nbsp;댓글 수정&nbsp;&nbsp;
				</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group row">
						<label class="col-2 form-control-label m--font-boldest">글쓴이:</label>
						<label id="userName" class="col-8 content"></label>
					</div>
					<div class="form-group row">
						<label class="col-2 form-control-label m--font-boldest">날짜:</label>
						<label id="createDate" class="col-8 content"></label>
					</div>
					<div class="form-group">
						<label for="conent-text" class="form-control-label m--font-boldest">내용:</label>
						<textarea class="form-control" id="conent-text" rows="4"></textarea>
					</div>
					<input type="hidden" id="commentId" />
				</form>
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-info m-btn--icon" id="commentUpdateBtn">
					<span><i class="flaticon-edit"></i><span>&nbsp;수 정</span></span>
				</button>
	    	</div>
		</div>
	</div>
</div>

<script>
	/** 첨부파일 다운로드 **/
	function fileDownloadClick(id) {
		$.ajax({
      		url: contextPath + "/notice/getFile",
      		data: {"id": id},
      		type: "get",
      		dataType: "json",
      		success: function(response) {
      			fileDownload(response);
     		}
		});
	}
	
	/** 댓글 입력 버튼 클릭 시 */
	$("#commentRegistBtn").click(function() {
		var content = $("#commentInput").val();
		var noticeId = $("#noticeId").val();
		if (content) {
			$.ajax({
	    		url: contextPath + "/comment/regist",
	    		type: "POST",
	    		data: {"noticeId": noticeId, "content": content},
	    		success: function(response) {
	    			swal({
	           			title: "댓글 등록되었습니다.",
	       				type: "success"
	       			}).then(function(e) {
	       				location.reload();
	       			});
	    		},
	    		error: function(response) {
	            	swal({title: "댓글 등록을 실패하였습니다.", type: "error"})
	            }
	    	});
		} else {
			swal({title: "댓글 내용을 입력하세요.", type: "warning"});
		}
	});
	
	/** 댓글 삭제 버튼 클릭시 */
	function deleteComment(id) {
		swal({
	        title: "삭제하시겠습니까?",
	        type: "warning",
	        confirmButtonText: "삭제",
	        confirmButtonClass: "btn btn-danger m-btn m-btn--custom",
	        showCancelButton: true, 
	        cancelButtonText: "취소",
	    }).then(function(e) {
	    	if (e.value) {
	    		$.ajax({
		    		url: contextPath + "/comment/delete",
		    		type: "POST",
		    		data: {"id": id},
		    		success: function(response) {
		    			location.reload();
		           	},
		            error: function(response) {
		            	swal({title: "댓글 삭제를 실패하였습니다.", type: "error"})
		            }
		    	}); 
	    	}
	    });
	}
	
	/** 댓글 수정 버튼 클릭 시 */
	function updateComment(id) {
		$.ajax({
      		url: contextPath + "/comment/get",
      		data: {"id": id},
      		type: "GET",
      		dataType: "json",
      		success: function(response) {
				$("#userName").text(response.userName); 
				$("#createDate").text(response.createDate);
      			$("#conent-text").val(response.content);
      			$("#commentId").val(response.id);
      			$("#update_modal").modal("toggle");
     		}
		});
	}
	
	/** 모달창에서 댓글 수정 버튼 클릭 시 */
	$("#commentUpdateBtn").click(function() {
		$("#update_modal").modal("toggle");
		
		var id = $("#commentId").val();
		console.log(id);
		var content = $("#conent-text").val();
		if (content) {
			$.ajax({
	      		url: contextPath + "/comment/update",
	      		data: {"id": id, "content": content},
	      		type: "POST",
	      		success: function(response) {
	      			location.reload();
	     		},
	            error: function(response) {
	            	swal({title: "댓글 수정을 실패하였습니다.", type: "error"})
	            }
			});
		} else {
			swal({title: "댓글 내용을 입력하세요.", type: "warning"});
		}
	});
	
	/** 이전글 버튼 클릭시 */
	function backMove(id) {
		$.ajax({
      		url: contextPath + "/notice/back",
      		data: {"id": id},
      		type: "GET",
      		dataType: "json",
      		success: function(response) {
      			if (response == 0) {
      				swal({title: "처음 공지사항 글입니다.", type: "info"});
      			} else {
      				location.replace("${contextName}/notice/detail?id=" + response);
      			}
     		}
		});
	}
	
	/** 다음글 버튼 클릭시 */
	function nextMove(id) {
		$.ajax({
      		url: contextPath + "/notice/next",
      		data: {"id": id},
      		type: "GET",
      		dataType: "json",
      		success: function(response) {
				if (response == 0) {
					swal({title: "마지막 공지사항 글입니다.", type: "info"});
      			} else {
      				location.replace("${contextName}/notice/detail?id=" + response);
      			}
     		}
		});
	}
</script>