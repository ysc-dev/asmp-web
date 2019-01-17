<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강사 관리" />
  	<c:param name="lastname" value="강사 조회" />
</c:import>

<div class="m-content">
	<div class="m-stack m-stack--ver m-stack--general m--padding-bottom-10">
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control m-bootstrap-select m_selectpicker" id="searchTypeSelect" data-width="120">
					<option value="0">전체</option>
					<option value="0">이름</option>
					<option value="0">담당과목</option>
				</select>
				
				<input id="content_input" type="text" class="form-control m-input m--margin-left-15" placeholder="검색내용" />
				
				<button id="search_button" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
					<span><i class="fa fa-search"></i><span>검 색</span></span>
				</button>
			</div>
		</form>
	</div>
	<table class="table table-striped- table-bordered table-hover" id="teacherTable">
		<thead class="text-center">
			<tr>
				<th></th>
				<th>번호</th>
				<th>소속</th>
				<th>담당과목</th>
				<th>이름</th>
				<th>연락처</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody class="text-center"></tbody>
	</table>
	<div class="text-right m--margin-top-30">
		<a href="${contextName}/teacher/regist" class="btn btn-success m-btn m-btn--icon">
			<span><i class="fa fa-user-plus"></i><span>&nbsp;등 록&nbsp;</span></span>
		</a>
		<button type="button" class="btn btn-danger m-btn m-btn--icon m--margin-left-10">
			<span><i class="fa fa-trash-alt"></i><span>&nbsp;삭 제&nbsp;</span></span>
		</button>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();
	
	var dataTable = {
		ele: "#teacherTable",
		table: null,
		option: {
			columns: [{
				width: "30px"
			},{
		    	width: "8%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    },{
				data: "affiliation"
		    }, {
		    	data: "subject"
		    }, {
		    	data: "name"
		    }, {
		    	data: "tel"
		    }, {
		    	width: "10%",
		    	render: function(data, type, row, meta) {
		    		return '<a class="m-link m-link--state m-link--accent" href="${contextName}/teacher/detail?id=' + row.id + '">상세보기</a>';
		    	}
		    }]
		},
		init: function() {
			this.table = createTable.check(this.ele, this.option);
			this.search();
		},
		search: function() {
			var table = this.table;
			table.clear().draw();
			
			var param = new Object();
			param.searchType = $("#searchTypeSelect option:selected").val();
			param.content = $("#content_input").val();
			
			$.ajax({
				url: contextPath + "/teacher/search",
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