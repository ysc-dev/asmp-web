<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>

<link href="${pageContext.request.contextPath}/css/lesson.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="방화 후 수업 관리" />
  	<c:param name="lastname" value="방과 후 과목 관리" />
</c:import>

<div class="m-content row">
	<div class="col-md-4">
		<div class="subject-add-body">
			<label>과목 그룹 추가</label>
			<form class="form-inline">
				<input id="subjectGroupInput" type="text" class="form-control m-input"/>
					
				<button id="groupRegistBtn" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
					<span><i class="fa fa-plus-circle"></i><span>등 록</span></span>
				</button>
			</form>
		</div>
		
		<div class="m-divider m--margin-top-30 m--margin-bottom-30">
			<span></span>
		</div>
		
		<div class="subject-list-body m--margin-top-30">
			<label class="m--margin-bottom-10">과목 그룹 리스트</label>
			<table class="table table-striped- table-bordered table-hover" id="subjectGroupTable">
				<thead class="text-center">
					<tr>
						<th>연번</th>
						<th>이름</th>
					</tr>
				</thead>
				<tbody class="text-center"></tbody>
			</table>
		</div>
	</div>
	<div class="col-md-1 ">
		<div class="m-divider-vertical">
			<span></span>
		</div>
	</div>
	<div class="col-md-7">
		<div class="subject-add-body">
			<label>방과 후 과목 추가</label>
			<form class="form-inline">
				<div class="form-group">
					<select class="form-control m-bootstrap-select m_selectpicker" id="subjectGroupSelect">
						<option value="0">- 선 택 -</option>
						<c:forEach var="subjectGroup" items="${subjectGroups}" varStatus="status">
							<option value="${subjectGroup.id}">${subjectGroup.name}</option>
		 				</c:forEach>
					</select>
					
					<input id="subjectInput" type="text" class="form-control m-input m--margin-left-15"/>
					
					<button id="registBtn" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
						<span><i class="fa fa-plus-circle"></i><span>등 록</span></span>
					</button>
				</div>
			</form>
		</div>
		
		<div class="m-divider m--margin-top-30 m--margin-bottom-30">
			<span></span>
		</div>
		
		<div class="subject-list-body m--margin-top-30">
			<label class="m--margin-bottom-10">수강 과목 리스트</label>
			<table class="table table-striped- table-bordered table-hover" id="subjectTable">
				<thead class="text-center">
					<tr>
						<th></th>
						<th></th>
						<th>연번</th>
						<th>그룹</th>
						<th>과목</th>
						<th>진행중인 강좌 수</th>
					</tr>
				</thead>
				<tbody class="text-center"></tbody>
			</table>
		</div>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();

	var groupDataTable = {
		ele: "#subjectGroupTable",
		table: null,
		info: " [총 _TOTAL_ 그룹]",
		option: {
			columns: [{
		    	width: "15%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
				data: "name"
		    }]
		},
		init: function() {
			this.table = Datatables.basic(this.ele, this.option, this.info, 'asc');
			Datatables.rowsAdd(this.table, contextPath + "/lesson/subjectGroup/search", new Object());
		}
	}

	var dataTable = {
		ele: "#subjectTable",
		table: null,
		info: " [총 _TOTAL_ 과목]",
		option: {
			columns: [{
				width: "35px"
			}, {
				data: "id"
		    }, {
		    	width: "12%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
		    	width: "25%",
				data: "groupName"
		    }, {
				data: "name"
		    }, {
		    	width: "15%",
		    	data: "number"
		    }]
		},
		init: function() {
			this.table = Datatables.check(this.ele, this.option, this.info, 10);
			Datatables.rowsAdd(this.table, contextPath + "/lesson/subject/search", new Object());
		}
	}
	
	groupDataTable.init();
	dataTable.init();
	
	$("#groupRegistBtn").click(function() { 
		var group = $("#subjectGroupInput").val();
		if (group == '') {
			swal({title: "과목 그룹을 입력하세요.", type: "warning"});
			return;
		}
		
		$.ajax({
			url: contextPath + "/lesson/subjectGroup/regist",
      		data: {"name": group},
      		type: "POST",
           	success: function(response) {
           		location.href = "subject";
           	},
            error: function(response) {
            	swal({title: "과목 그룹 추가를 실패하였습니다.", type: "error"})
            }
		});
	});
	
	$("#registBtn").click(function() {
		var groupId = $("#subjectGroupSelect option:selected").val();
		if (groupId == 0) {
			swal({title: "과목 그룹을 선택하세요.", type: "warning"});
			return;
		}
		
		var subject = $("#subjectInput").val();
		if (subject == '') {
			swal({title: "과목을 입력하세요.", type: "warning"});
			return;
		}
		
		$.ajax({
			url: contextPath + "/lesson/subject/regist",
      		data: {"name": subject, "groupId" : groupId},
      		type: "POST",
           	success: function(response) {
           		location.href = "subject";
           	},
            error: function(response) {
            	swal({title: "과목 추가를 실패하였습니다.", type: "error"})
            }
		});
	});
</script>