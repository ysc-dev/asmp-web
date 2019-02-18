<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/lesson.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강좌 관리" />
  	<c:param name="middlename" value="강좌 상세정보" />
  	<c:param name="lastname" value="수강인원 관리" />
</c:import>

<div class="m-content lesson-management-body">
	<div class="m-portlet">
		<div class="m-portlet__head">
			<div class="m-portlet__head-caption">
				<div class="m-portlet__head-title">
					<h3 class="m-portlet__head-text m--font-brand">
						${lesson.name} - ${lessonInfo.classType}반
					</h3>
				</div>
			</div>
			<div class="text-right m--padding-top-15">
				<select id="classTypeSelect" class="form-control m-bootstrap-select m_selectpicker" data-width="100">
					<c:forEach var="lessonInfo" items="${lesson.lessonInfos}" varStatus="status">
						<option value="${lessonInfo.id}">${lessonInfo.classType}</option>
	 				</c:forEach>
				</select>
				<button id="classSearchBtn" type="button" class="btn btn-success m-btn--icon m--margin-left-10">
					<span><i class="fa fa-search"></i><span>조 회</span></span>
				</button>
				<a href="${contextName}/lesson/detail?id=${lesson.id}" class="btn btn-secondary m-btn--icon m--margin-left-50">
					<span><i class="fa fa-arrow-left"></i><span>뒤로가기</span></span>
				</a>
			</div>
		</div>
		
		<form class="m-form m-form--fit m-form--label-align-right">
			<div class="m-portlet__body">
				<div class="form-group m-form__group row">
					<label class="col-md-1 offset-md-1 col-form-label">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lesson.subject.name}" readonly> 
					</div>
					
					<label class="col-md-1 col-form-label">강&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lesson.teacher.name}" readonly>
					</div>
					
					<label class="col-md-1 col-form-label">연&nbsp;&nbsp;락&nbsp;&nbsp;처&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lesson.teacher.tel}" readonly>
					</div>
				</div>
				<div class="form-group m-form__group row m--padding-top-5">
					<label class="col-md-1 offset-md-1 col-form-label">대상학년&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lessonInfo.grade}" readonly> 
					</div>
					
					<label class="col-md-1 col-form-label">요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lessonInfo.week}" readonly> 
					</div>
					
					<label class="col-md-1 col-form-label">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간&nbsp;&nbsp;&nbsp;&nbsp;:</label>
					<div class="col-md-2">
						<input type="text" class="form-control m-input" value="${lessonInfo.startTime} ~ ${lessonInfo.endTime}" readonly> 
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon">
								<i class="flaticon-users-1 m--font-black"></i>
							</span>
							<h3 class="m-portlet__head-text">
								수강중인 인원
							</h3>
						</div>
					</div>
					<div class="m-portlet__head-tools">
						<button id="deleteBtn" type="button" class="btn btn-danger m-btn--icon btn-sm">
							<span>&nbsp;<i class="fa fa-trash-alt"></i><span>&nbsp;삭 제&nbsp;</span>&nbsp;</span>
						</button>
					</div>
				</div>
				<div class="m-portlet__body">
					<table class="table table-striped- table-bordered table-hover" id="lessoningTable">
						<thead class="text-center">
							<tr>
								<th></th>
								<th></th>
								<th>연번</th>
								<th>학년</th>
								<th>반</th>
								<th>번호</th>
								<th>이름</th>
								<th>학생 연락처</th>
								<th>학부모 연락처</th>
								<th>자유수강권 여부</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody class="text-center"></tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon">
								<i class="flaticon-users-1 m--font-black"></i>
							</span>
							<h3 class="m-portlet__head-text">
								대기중인 인원
							</h3>
						</div>
					</div>
					<div class="m-portlet__head-tools">
						<button id="registBtn" type="button" class="btn btn-brand m-btn--icon btn-sm">
							<span>&nbsp;<i class="fa fa-user-plus"></i><span>&nbsp;등 록&nbsp;</span>&nbsp;</span>
						</button>
					</div>
				</div>
				<div class="m-portlet__body">
					<form class="form-inline m--margin-bottom-10">
						<div class="form-group">
							<select class="form-control m-bootstrap-select m_selectpicker form-control-sm select-sm" id="gradeSelect" data-width="100" title="학년">
								<option value="0">전체</option>
								<c:forEach var="item" begin="1" end="6" step="1">
									<option value="${item}">${item}학년</option>
								</c:forEach>
							</select>
							
							<select class="form-control m-bootstrap-select m_selectpicker form-control-sm select-sm" id="classSelect" data-width="100" title="반">
								<option value="0">전체</option>
								<c:forEach var="item" begin="1" end="10" step="1">
									<option value="${item}">${item}반</option>
								</c:forEach>
							</select>
							
							<input id="name_input" type="text" class="form-control m-input form-control-sm" placeholder="이름" />
							
							<button id="search_button" type="button" class="btn btn-info m-btn m-btn--icon btn-sm m--margin-left-15">
								<span><i class="fa fa-search"></i><span>검 색</span></span>
							</button>
						</div>
					</form>
					<table class="table table-striped- table-bordered table-hover" id="waitingTable">
						<thead class="text-center">
							<tr>
								<th></th>
								<th></th>
								<th>연번</th>
								<th>학년</th>
								<th>반</th>
								<th>번호</th>
								<th>이름</th>
								<th>학생 연락처</th>
								<th>학부모 연락처</th>
								<th>자유수강권 여부</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody class="text-center"></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();
	
	$("#classSearchBtn").click(function() {
		var lessonInfoId = $("#classTypeSelect option:selected").val();
		console.log(lessonInfoId);
		location.href = "management?lessonId=${lesson.id}&lessonInfoId=" + lessonInfoId;
	});
	
	var lessoningTable = {
		ele: "#lessoningTable",
		table: null,
		option: {
			columns: [{
				width: "5%"
			}, {
				data: "id"
		    }, {
		    	width: "5%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
		    	width: "5%",
				data: "student.grade"
		    }, {
		    	width: "5%",
		    	data: "student.classType"
		    }, {
		    	width: "5%",
		        data: "student.number"
		    }, {
		    	data: "student.name"
		    }, {
		    	data: "student.tel"
		    }, {
		    	data: "student.parentTel"
		    }, {
		    	width: "12%",
		    	render: function(data, type, row, meta) {
		    		return row.student.freedom ? '<i class="la la-circle"></i>' : '';
		    	}
		    }, {
		    	data: "student.createDate"
   			}]
		},
		init: function() {
			this.table = Datatables.customCheck(this.ele, this.option);
			this.search();
		},
		search: function() {
			var param = new Object();
			param.lessonInfoId = "${lessonInfo.id}"
			Datatables.rowsAdd(this.table, contextPath + "/lesson/management/lessoning/search", param);
		}
	}
	
	var waitingTable = {
		ele: "#waitingTable",
		table: null,
		option: {
			columns: [{
				width: "5%"
			}, {
				data: "id"
		    }, {
		    	width: "5%",
		    	render: function(data, type, row, meta) {
		    		return meta.row + 1
		    	}
		    }, {
		    	width: "5%",
				data: "grade"
		    }, {
		    	width: "5%",
		    	data: "classType"
		    }, {
		    	width: "5%",
		        data: "number"
		    }, {
		    	data: "name"
		    }, {
		    	data: "tel"
		    }, {
		    	data: "parentTel"
		    }, {
		    	width: "12%",
		    	render: function(data, type, row, meta) {
		    		return row.freedom ? '<i class="la la-circle"></i>' : '';
		    	}
		    }, {
		    	data: "createDate"
   			}]
		},
		init: function() {
			this.table = Datatables.customCheck(this.ele, this.option);
			this.search();
		},
		search: function() {
			var param = new Object();
			param.lessonId = "${lesson.id}"
			param.lessonInfoId = "${lessonInfo.id}"
			param.grade = $("#gradeSelect option:selected").val();
			param.classType = $("#classSelect option:selected").val();
			param.number = $("#numberSelect option:selected").val();
			param.name = $("#name_input").val();
			
			Datatables.rowsAdd(this.table, contextPath + "/lesson/management/waiting/search", param);
		}
	}
	
	lessoningTable.init();
	waitingTable.init();
	
	$("#search_button").click(function() {
		waitingTable.search();
	});
	
	/** 등록버튼 클릭 시 */
	$("#registBtn").click(function() {
		var selectArray = []; 
		
		var checkedRows = waitingTable.table.rows('.active').data();
		$.each(checkedRows, function(index, data){
			selectArray.push({
				studentId: data.id,
				lessonId: "${lesson.id}",
				lessonInfoId: "${lessonInfo.id}"
			});
		});
		
		if (selectArray.length == 0) {
			swal({title: "등록하려는 학생을 선택하세요.", type: "warning"});
		} else {
			console.log(selectArray);
			swal({
		        title: "선택된 학생을 등록하시겠습니까?",
		        type: "info",
		        confirmButtonText: "등록",
		        confirmButtonClass: "btn btn-info m-btn m-btn--custom",
		        showCancelButton: true, 
		        cancelButtonText: "취소",
		    }).then(function(e) {
		    	$.ajax({
		    		url: contextPath + "/lesson/management/regist",
		    		type: "POST",
		    		data: JSON.stringify(selectArray),
					contentType: "application/json",
		    		success: function(response) {
		    			lessoningTable.search();
		    			waitingTable.search();
		           	},
		            error: function(response) {
		            	swal({title: "학생 등록을 실패하였습니다.", type: "error"})
		            }
		    	}); 
		    });
		}
	});
	
	$("#deleteBtn").click(function() {
		var selectArray = [];
		
		var checkedRows = lessoningTable.table.rows('.active').data();
		$.each(checkedRows, function(index, data){
			selectArray.push({id: data.id});
		});
		
		if (selectArray.length == 0) {
			swal({title: "삭제하려는 학생을 선택하세요.", type: "warning"});
		} else {
			swal({
		        title: "선택된 수강중인  학생을 삭제하시겠습니까?",
		        text: "삭제하면 되돌릴 수 없습니다!",
		        type: "warning",
		        confirmButtonText: "삭제",
		        confirmButtonClass: "btn btn-danger m-btn m-btn--custom",
		        showCancelButton: true, 
		        cancelButtonText: "취소",
		    }).then(function(e) {
		    	$.ajax({
		    		url: contextPath + "/lesson/management/delete",
		    		type: "POST",
		    		data: JSON.stringify(selectArray),
					contentType: "application/json",
		    		success: function(response) {
		    			lessoningTable.search();
		    			waitingTable.search();
		           	},
		            error: function(response) {
		            	swal({title: "수강중인 학생 삭제를 실패하였습니다.", type: "error"})
		            }
		    	}); 
		    });
		}
	});
</script>