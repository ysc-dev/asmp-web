<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/lesson.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="방화 후 수업 관리" />
  	<c:param name="lastname" value="방과 후 과목 관리" />
</c:import>

<div class="m-content">
	<div class="subject-add-body  m--padding-left-15">
		<label>방과 후 과목 추가</label>
		<form class="form-inline">
			<div class="form-group">
				<input id="subjectInput" type="text" class="form-control m-input" placeholder="" />
				
				<button id="registBtn" type="button" class="btn btn-info m-btn m-btn--icon m--margin-left-15">
					<span><i class="fa fa-plus-circle"></i><span>등 록</span></span>
				</button>
			</div>
		</form>
	</div>
	
	<div class="m-divider m--margin-top-30 m--margin-bottom-30">
		<span></span>
	</div>
	
	<div class="subject-list-body row m--padding-left-15">
		<div class="col-md-6">
			<label>방과 후 수업 과목 리스트</label>
			<table class="table table-striped- table-bordered table-hover" id="subjectTable">
				<thead class="text-center">
					<tr>
						<th></th>
						<th></th>
						<th>연번</th>
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
		    	width: "15%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
				data: "name"
		    }, {
		    	width: "30%",
				data: "number"
		    }]
		},
		init: function() {
			this.table = Datatables.check(this.ele, this.option, this.info, 10);
			Datatables.rowsAdd(this.table, contextPath + "/lesson/subject/search", new Object());
		}
	}
	
	dataTable.init();
	
	$("#registBtn").click(function() {
		var subject = $("#subjectInput").val();
		if (subject == '') {
			swal({title: "과목을 입력하세요.", type: "warning"});
			return;
		}
		
		$.ajax({
			url: contextPath + "/lesson/subject/regist",
      		data: {"name": subject},
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