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
	
	<table class="table table-striped- table-bordered table-hover" id="lessonTable">
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
	<div class="text-right m--margin-top-30">
		<a href="${contextName}/lesson/regist" class="btn btn-success m-btn m-btn--icon">
			<span><i class="fa fa-plus"></i><span>&nbsp;등 록&nbsp;</span></span>
		</a>
		<button type="button" id="lessonDeleteBtn" class="btn btn-danger m-btn m-btn--icon m--margin-left-10">
			<span><i class="fa fa-trash-alt"></i><span>&nbsp;삭 제&nbsp;</span></span>
		</button>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();
	
	var dataTable = {
		ele: "#lessonTable",
		table: null,
		option: {
			columns: [{
				width: "35px"
			}, {
				data: "id"
		    }, {
		    	width: "6%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
		    	render: function(data, type, row, meta) {
		    		return row.subject.name;
		    	}
		    }, {
		    	render: function(data, type, row, meta) {
		    		return '<a class="m-link m-link--state m-link--primary m--font-boldest" ' +
		    			'href="${pageContext.request.contextPath}/lesson/update?id=' + row.id + '">' + row.name + '</a>';
		    	}
		    }, {
		    	render: function(data, type, row, meta) {
		    		return row.teacher.name;
		    	}
		    }, {
		    	render: function(data, type, row, meta) {
		    		return row.teacher.tel;
		    	}
		    }, {
		    	data: "status"
		    }, {
		    	width: "10%",
		    	render: function(data, type, row, meta) {
		    		return '<a class="m-link m-link--state m-link--accent" href="${pageContext.request.contextPath}/lesson/detail?id=' + row.id + '">상세보기</a>';
		    	}
		    }]
		},
		param: function() {
			var param = new Object();
			param.lessonSearchType = $("#searchTypeSelect option:selected").val();
			param.content = $("#content_input").val();
			return param;
		},
		init: function() {
			this.table = Datatables.check(this.ele, this.option, " 총 _TOTAL_ 개 강좌가 있습니다.");
			this.search();
		},
		search: function() {
			Datatables.rowsAdd(this.table, contextPath + "/lesson/search", this.param());
		}
	}
	
	dataTable.init();
	
	$("#search_button").click(function() {
		dataTable.search();
	});
	
	$("#lessonDeleteBtn").click(function() {
		
	});
</script>