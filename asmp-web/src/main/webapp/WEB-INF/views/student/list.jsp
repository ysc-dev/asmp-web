<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="학생 관리" />
  	<c:param name="lastname" value="학생 조회" />
</c:import>

<div class="m-content">
	<div class="m-stack m-stack--ver m-stack--general m--padding-bottom-10">
		<form class="form-inline">
			<div class="form-group">
				<select class="form-control m-bootstrap-select m_selectpicker" id="gradeSelect" data-width="100" title="학년">
					<option value="0">전체</option>
					<c:forEach var="item" begin="1" end="6" step="1">
						<option value="${item}">${item}학년</option>
					</c:forEach>
				</select>
				
				<select class="form-control m-bootstrap-select m_selectpicker m--margin-left-15" id="classSelect" data-width="100" title="반">
					<option value="0">전체</option>
					<c:forEach var="item" begin="1" end="10" step="1">
						<option value="${item}">${item}반</option>
					</c:forEach>
				</select>
				
				<select class="form-control m-bootstrap-select m_selectpicker m--margin-left-15" id="numberSelect" data-size="11" data-width="100" title="번호">
					<option value="0">전체</option>
					<c:forEach var="item" begin="1" end="30" step="1">
						<option value="${item}">${item}번</option>
					</c:forEach>
				</select>
				
				<input id="name_input" type="text" class="form-control m-input m--margin-left-15" placeholder="이름" />
				
				<button id="search_button" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
					<span><i class="fa fa-search"></i><span>검 색</span></span>
				</button>
			</div>
		</form>
	</div>
	<table class="table table-striped- table-bordered table-hover" id="studentTable">
		<thead class="text-center">
			<tr>
				<th></th>
				<th>연번</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>이름</th>
				<th>학부모 전화번호</th>
				<th>자유수강권자 여부</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody class="text-center"></tbody>
	</table>
	<div class="text-right m--margin-top-30">
		<a href="${contextName}/student/regist" class="btn btn-success m-btn m-btn--icon">
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
		ele: "#studentTable",
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
				data: "grade"
		    }, {
		    	data: "classType"
		    }, {
		        data: "number"
		    }, {
	    		render: function(data, type, row, meta) {
		    		return '<a class="m-link m-link--state m-link--primary" ' +
		    			'href="${pageContext.request.contextPath}/student/update?id=' + row.id + '">' + row.name + '</a>';
		    	}
		    }, {
		    	data: "parentTel"
		    }, {
		    	width: "15%",
		    	render: function(data, type, row, meta) {
		    		return row.lesson ? 'O' : 'X';
		    	}
		    }, {
		    	width: "10%",
		    	render: function(data, type, row, meta) {
		    		return '<a class="m-link m-link--state m-link--accent" href="${pageContext.request.contextPath}/student/detail?id=' + row.id + '">상세보기</a>';
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
			param.grade = $("#gradeSelect option:selected").val();
			param.classType = $("#classSelect option:selected").val();
			param.number = $("#numberSelect option:selected").val();
			param.name = $("#name_input").val();
			
			$.ajax({
				url: contextPath + "/student/search",
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