<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="lastname" value="관리자 공지사항" />
</c:import>

<div class="m-content">
	<div class="m-stack m-stack--ver m-stack--general m--padding-bottom-10">
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control m-bootstrap-select m_selectpicker" id="searchTypeSelect" data-width="100">
					<option value="">전체</option>
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">작성자</option>
				</select>
				
				<input id="content_input" type="text" class="form-control m-input m--margin-left-15" />
				
				<button id="search_button" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
					<span><i class="fa fa-search"></i><span>검 색</span></span>
				</button>
			</div>
		</form>
		<div class="m-stack__item m-stack__item--right">
			<a href="${contextName}/notice/regist" class="btn m-btn m-btn--icon btn-primary">
				<span><i class="fa fa-edit"></i><span>글쓰기</span></span>
			</a>
		</div>
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
	    			'onClick="previewOrDownload(\'' + row.stdDrwId + '\', \'download\')"><i class="flaticon-download"></i></a>'
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
			param.searchType = $("#searchTypeSelect option:selected").val();
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
</script>