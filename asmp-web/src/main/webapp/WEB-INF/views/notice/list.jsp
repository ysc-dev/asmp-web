<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/notice.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="lastname" value="관리자 공지사항" />
</c:import>

<div class="m-content">
	<div class="m-stack m-stack--ver m-stack--general m--padding-bottom-10">
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
				<a href="${contextName}/notice/regist" class="btn m-btn m-btn--icon btn-primary">
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
					<span id="modal_title_info"></span>
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
    					'href="${pageContext.request.contextPath}/notice/detail?id=' + row.id + '">' + row.subject + "</a>"
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
		init: function() {
			this.table = createTable.basic(this.ele, this.option);
			this.search();
		},
		search: function() {
			var table = this.table;
			table.clear().draw();
			
			var param = new Object();
			param.noticeSearchType = $("#searchTypeSelect option:selected").val();
			param.content = $("#content_input").val();
			
			$.ajax({
				url: contextPath + "/notice/search",
				type: "post",
				data: JSON.stringify(param),
				contentType: "application/json",
				success: function(data) {
					table.rows.add(data).draw();
			   	}
			});
		}
	}
	
	dataTable.init();
	
	$("#search_button").click(function() {
		dataTable.search();
	});
	
	// 리스트에서 첨부파일 버튼 클릭 시
	function previewAttachment(id) {
		$.ajax({
      		url: contextPath + "/notice/get",
      		data: {"id": id},
      		type: "get",
      		dataType: "json",
      		success: function(response) {
      			$.each(response.uploadedFiles, function(index, value) {
      			  	console.log(value);
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
      		url: contextPath + "/notice/getFile",
      		data: {"id": id},
      		type: "get",
      		dataType: "json",
      		success: function(response) {
      			console.log(response);
	          	fileDownload(response);
     		}
		});
	}
	
	// 전체 첨부파일 다운로드 
	$("#allDownladButton").click(function() {
		var noticeId = $("#selectedNoticeId").val();
		
		$.ajax({
      		url: contextPath + "/notice/get",
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
	
	function fileDownload(data) {
	  	var file = base64ToArrayBuffer(data.content);
       	var a = document.createElement('a');
       	a.href = window.URL.createObjectURL(new Blob([file]));
       	a.download = data.fileName;
       	// Firefox에서 다운로드 안되는 문제 수정용 코드
       	// (Firefox는 a가 화면에 실존할 때만 다운로드 가능)
       	document.body.appendChild(a);
       	a.click();
       	document.body.removeChild(a); 
	}
</script>