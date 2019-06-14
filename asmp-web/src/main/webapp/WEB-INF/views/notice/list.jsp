<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>

<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="lastname" value="관리자 공지사항" />
</c:import>

<div class="m-content">
	<div class="m-stack m-stack--ver m-stack--general">
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control m-bootstrap-select m_selectpicker" id="searchTypeSelect" data-width="100">
					<c:forEach var="searchType" items="${searchTypes}" varStatus="status">
						<option value="${searchType}">${searchType}</option>
	 				</c:forEach>
				</select>
				
				<input id="content_input" type="text" class="form-control m-input m--margin-left-15" />
				
				<button id="search_button" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
					<span><i class="fa fa-search"></i><span>검 색</span></span>
				</button>
			</div>
		</form>
		<c:if test="${loginUser != null}">
			<div class="m-stack__item m-stack__item--right">
				<a href="${pageContext.request.contextPath}/notice/regist.do" class="btn m-btn m-btn--icon btn-primary">
					<span><i class="fa fa-edit"></i><span>글쓰기</span></span>
				</a>
			</div>
		</c:if>
	</div>
	
	<table class="table table-striped- table-bordered table-hover" id="noticeTable">
		<thead class="text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회</th>
				<th>첨부</th>
			</tr>
		</thead>
		<tbody class="text-center"></tbody>
	</table>
</div>

<div class="modal fade" id="download_modal" role="dialog">
	<div class="modal-dialog notice-modal" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">
					<i class="flaticon-download"></i>&nbsp;&nbsp;&nbsp;첨부파일 다운로드&nbsp;&nbsp;
				</h3>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<label class="col-3 title">제목 :</label>
					<label id="subject" class="col-8 content"></label>
				</div>
				<div class="row">
					<label class="col-3 title">글쓴이 :</label>
					<label id="userName" class="col-8 content"></label>
				</div>
				<div class="row">
					<label class="col-3 title">날짜 :</label>
					<label id="createDate" class="col-8 content"></label>
				</div>
				<div class="m-form__seperator"></div>
				<div class="m--margin-top-10">
					<span class="title">첨부파일</span>
					<div id="fileInfo" class="download-file-list">
						
					</div>
					<c:forEach var="uploadedFile" items="${notice.uploadedFiles}" varStatus="status">
						<a href="#" class="m-link m-link--state m-link--info m--margin-right-5"
							onclick="fileDownload(${uploadedFile.id})">
								${uploadedFile.fileName}<c:if test="${!status.last}">,</c:if>
						</a>
					</c:forEach>
				</div>
				<input type="hidden" id="selectedNoticeId" />
			</div>
			<div class="modal-footer">
		        <button type="button" class="btn btn-info m-btn--icon" id="allDownladButton">
					<span><i class="flaticon-download-1"></i><span>&nbsp;전체 다운로드</span></span>
				</button>
	    	</div>
		</div>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();
	
	var dataTable = {
		ele: "#noticeTable",
		table: null,
		option: {
			columns: [{
		    	width: "10%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
	        	render: function(data, type, row, meta) {
		    		return '<a class="m-link m--font-boldest"' + 
    					'href="${pageContext.request.contextPath}/notice/detail.do?id=' + row.id + '">' + row.subject + "</a>"
		    	}
		    }, {
		    	width: "15%",
		        data: "userName"
		    }, {
		    	width: "15%",
		    	render: function(data, type, row, meta) {
		    		return moment(new Date(row.createDate)).format("YYYY-MM-DD");
		    	}
		    }, {
		    	width: "10%",
		    	data: "hit"
		    }, {
		    	width: "10%",
		    	render: function(data, type, row, meta) {
		    		return '<a href="#" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" ' +
	    			'onClick="previewAttachment(\'' + row.id + '\', \'download\')"><i class="flaticon-attachment"></i></a>'
		    	}
		    }]
		},
		param: function() {
			var param = new Object();
			param.noticeSearchType = $("#searchTypeSelect option:selected").val();
			param.content = $("#content_input").val();
			return param;
		},
		init: function() {
			this.table = Datatables.row(this.ele, this.option, 20, null, " _TOTAL_ 개의 게시물이 있습니다.");
			this.search();
		},
		search: function() {
			Datatables.rowsAdd(this.table, contextPath + "/notice/search.do", this.param());
		}
	}
	
	dataTable.init();
	
	$("#search_button").click(function() {
		dataTable.search();
	});
	
	// 리스트에서 첨부파일 버튼 클릭 시
	function previewAttachment(id) {
		$.ajax({
      		url: contextPath + "/notice/get.do",
      		data: {"id": id},
      		type: "get",
      		dataType: "json",
      		success: function(response) {
      			$("#fileInfo").empty();
      			$.each(response.uploadedFiles, function(index, value) {
      			  	var element = '<a href="#" class="m-link m-link--state m-link--success m--margin-top-5" ' +
      			  		'onclick="eathFileDownload(' + value.id + ')">' + (index + 1) + ') ' +value.fileName + '</a><br>';
      			  	$("#fileInfo").append(element);
      			});
      			
				$("#subject").text(response.subject);
				$("#userName").text(response.userName); 
				$("#createDate").text(response.date);
      			$("#selectedNoticeId").val(id);
	          	$("#download_modal").modal("toggle");
     		}
		});
	}
	
	// 개별 첨부파일 다운로드
	function eathFileDownload(id) {
		$.ajax({
      		url: contextPath + "/notice/getFile.do",
      		data: {"id": id},
      		type: "get",
      		dataType: "json",
      		success: function(response) {
	          	fileDownload(response);
     		}
		});
	}
	
	// 전체 첨부파일 다운로드 
	$("#allDownladButton").click(function() {
		var noticeId = $("#selectedNoticeId").val();
		
		$.ajax({
      		url: contextPath + "/notice/get.do",
      		data: {"id": noticeId},
      		type: "get",
      		dataType: "json",
      		success: function(response) {
      			$.each(response.uploadedFiles, function(index, value) {
	  	          	fileDownload(value);
      			});
     		}
		});
	});
</script>