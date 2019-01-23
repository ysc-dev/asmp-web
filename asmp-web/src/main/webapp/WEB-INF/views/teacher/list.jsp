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
					<option value="ALL">전체</option>
					<option value="NAME">이름</option>
					<option value="SUBJECT">담당과목</option>
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
		<button type="button" id="teacherDeleteBtn" class="btn btn-danger m-btn m-btn--icon m--margin-left-10">
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
			}, {
				data: "id"
		    }, {
		    	width: "8%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
				data: "affiliation"
		    }, {
		    	data: "subject"
		    }, {
	    		render: function(data, type, row, meta) {
		    		return '<a class="m-link m-link--state m-link--primary" ' +
		    			'href="${pageContext.request.contextPath}/teacher/update?id=' + row.id + '">' + row.name + '</a>';
		    	}
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
			this.table = Datatables.check(this.ele, this.option);
			this.search();
		},
		search: function() {
			var param = new Object();
			param.searchType = $("#searchTypeSelect option:selected").val();
			param.content = $("#content_input").val();
			
			Datatables.rowsAdd(this.table, contextPath + "/teacher/search", param);
		}
	}
	
	dataTable.init();
	
	$("#search_button").click(function() {
		dataTable.search();
	});
	
	// 강사 정보 삭제 버튼 클릭 시
	$("#teacherDeleteBtn").click(function() {
		var selectArray = []; 
		
		var checkedRows = dataTable.table.rows('.active').data();
		$.each(checkedRows, function(index, data){
			selectArray.push({id: data.id});
		});
		
		if (selectArray.length == 0) {
			swal({title: "삭제하려는 강사를 선택하세요.", type: "warning"});
		} else {
			swal({
		        title: "선택된 강사를 삭제하시겠습니까?",
		        text: "삭제하면 되돌릴 수 없습니다!",
		        type: "warning",
		        confirmButtonText: "삭제",
		        confirmButtonClass: "btn btn-danger m-btn m-btn--custom",
		        showCancelButton: true, 
		        cancelButtonText: "취소",
		    }).then(function(e) {
		    	if (e.value) {
		    		$.ajax({
			    		url: contextPath + "/teacher/delete",
			    		type: "POST",
			    		data: JSON.stringify(selectArray),
						contentType: "application/json",
			    		success: function(response) {
			           		swal({
			           			title: "선택된 강사 정보가 삭제되었습니다.",
			       				type: "success"
			       			}).then(function(e) {
			       				location.href = "list";
			       			});
			           	},
			            error: function(response) {
			            	swal({title: "강사 정보 삭제를 실패하였습니다.", type: "error"})
			            }
			    	}); 
		    	}
		    });
		}
	});
</script>