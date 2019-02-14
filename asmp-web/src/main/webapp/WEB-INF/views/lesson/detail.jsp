<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/lesson.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강좌 관리" />
  	<c:param name="middlename" value="강좌 조회" />
  	<c:param name="lastname" value="강좌 상세정보" />
</c:import>

<div class="m-content">
	<div class="row lesson-body">
		<div class="col-md-11">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<h3 class="m-portlet__head-text">
								(강좌명) ${lesson.name}
							</h3>
						</div>
					</div>
					<div class="m-portlet__head-tools">
						<a href="${contextName}/lesson/list" class="btn btn-secondary m-btn m-btn--icon">
							<span><i class="fa fa-list-ul"></i><span>&nbsp;목 록&nbsp;</span></span>
						</a>
					</div>
				</div>
				<form role="form" class="m-form m-form--fit m-form--label-align-right">
					<div class="m-portlet__body">
						<div class="m-form__section m-form__section--first row">
							<div class="col-md-5">
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">과&nbsp;&nbsp;목&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<input class="form-control m-input" type="text" value="${lesson.subject.name}" readonly>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">강&nbsp;&nbsp;사&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<input class="form-control m-input" type="text" value="${lesson.teacher.name}" readonly>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">연락처&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<input class="form-control m-input" type="text" value="${lesson.teacher.tel}" readonly>
									</div>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group m-form__group">
									<textarea class="form-control m-input" rows="8" maxlength="150" readonly>${lesson.introduction}</textarea>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<h3 class="m-portlet__head-text">
								반별 정보
							</h3>
						</div>
					</div>
					<div class="m-portlet__head-tools">
						<button id="managementBtn" type="button" class="btn btn-primary m-btn--icon btn-sm">
							<span>&nbsp;<i class="fa fa-user-friends"></i><span>&nbsp;수강인원 관리&nbsp;</span>&nbsp;</span>
						</button>
					</div>
				</div>
				<div class="m-portlet__body">
					<table class="table table-striped- table-bordered table-hover" id="lessionInfoTable">
						<thead class="text-center">
							<tr>
								<th></th>
								<th></th>
								<th>반</th>
								<th>대상학년</th>
								<th>요일</th>
								<th>시간</th>
								<th>장소</th>
								<th>수강료</th>
								<th>교재비별도 여부</th>
								<th>정원</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<c:forEach var="lessonInfo" items="${lesson.lessonInfos}" varStatus="status">
								<tr>
									<td></td>
									<td>${lessonInfo.id}</td>
									<td>${lessonInfo.classType}</td>
									<td>${lessonInfo.grade}</td>
									<td>${lessonInfo.week}</td>
									<td>${lessonInfo.startTime} ~ ${lessonInfo.endTime}</td>
									<td>${lessonInfo.location}</td>
									<td>${lessonInfo.tuition}</td>
									<td>${lessonInfo.textbook ? 'O' : 'X'}</td>
									<td>${lessonInfo.fixedNumber}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<h3 class="m-portlet__head-text">
								반별 인원 정보
							</h3>
						</div>
					</div>
					<div class="m-portlet__head-tools">
						<div class="form-inline">
							<div class="form-group">
								<select class="form-control m-bootstrap-select m_selectpicker form-control-sm select-sm" id="searchTypeSelect" data-width="160">
									<c:forEach var="searchType" items="${searchTypes}" varStatus="status">
										<option value="${searchType}">${searchType}</option>
									</c:forEach>
								</select>
								
								<div class="class-div display-none">
									<select class="form-control m-bootstrap-select m_selectpicker form-control-sm select-sm" id="classTypeSelect" data-width="100">
										<option value="ALL">전체</option>
										<c:forEach var="lessonInfo" items="${lesson.lessonInfos}" varStatus="status">
											<option value="${lessonInfo.classType}">${lessonInfo.classType}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="grade-div display-none">
									<select class="form-control m-bootstrap-select m_selectpicker form-control-sm select-sm" id="gradeSelect" data-width="100">
										<option value="0">전체</option>
										<c:forEach var="item" begin="1" end="6" step="1">
											<option value="${item}">${item}학년</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="freedom-div display-none">
									<select class="form-control m-bootstrap-select m_selectpicker form-control-sm select-sm" id="freedomSelect" data-width="120">
										<option value="ALL">전체</option>
										<option value="true">해당</option>
										<option value="false">해당없음</option>
									</select>
								</div>
								 
								<button id="search_button" type="button" class="btn btn-info m-btn m-btn--icon btn-sm m--margin-left-5">
									<span><i class="fa fa-search"></i><span>검 색</span></span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="m-portlet__body">
					<table class="table table-striped- table-bordered table-hover" id="managementTable">
						<thead class="text-center">
							<tr>
								<th>반</th>
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
	
	var table = Datatables.singleCheck("#lessionInfoTable");
	var dataTable = {
		ele: "#managementTable",
		table: null,
		option: {
			columns: [{
				data: "lessonInfo.classType"
		    }, {
		    	data: "student.grade"
		    }, {
		    	data: "student.classType"
		    }, {
		    	data: "student.number"
		    }, {
		    	data: "student.name"
		    }, {
		    	data: "student.tel"
		    }, {
		    	data: "student.parentTel"
		    }, {
	    		render: function(data, type, row, meta) {
		    		return row.student.freedom ? 'O' : '';
		    	}
		    }, {
		    	data: "student.createDate"
		    }]
		},
		param: function() {
			var param = new Object();
			param.lessonId = "${lesson.id}";
			param.searchType = $("#searchTypeSelect option:selected").val();
			param.classType = $("#classTypeSelect option:selected").val();
			param.grade = $("#gradeSelect option:selected").val();
			param.freedom = $("#freedomSelect option:selected").val();
			return param;
		},
		init: function() {
			this.table = Datatables.row(this.ele, this.option, 10, null);
			this.search();
		},
		search: function() {
			Datatables.rowsAdd(this.table, contextPath + "/lesson/detail/search", this.param());
		}
	}
	
	dataTable.init();
	
	/** 수강인원 관리 버튼 클릭 시 */
	$("#managementBtn").click(function() {
		var ids = $.map(table.rows('.selected').data(), function(item) {
	        return item[1];
	    })[0];
		
		if (ids) {
			location.href = "management?lessonId=${lesson.id}&lessonInfoId=" + ids;
		} else {
			swal({title: "반별 정보를 선택하세요.", type: "warning"});
		}
	});
	
	$("#searchTypeSelect").change(function() {
		var value = this.value;
		if (value == "전체") {
			$(".class-div").addClass("display-none");
			$(".grade-div").addClass("display-none");
			$(".freedom-div").addClass("display-none");
		} else if (value == "반") {
			$(".class-div").removeClass("display-none");
			$(".grade-div").addClass("display-none");
			$(".freedom-div").addClass("display-none");
		} else if (value == "학년") {
			$(".class-div").addClass("display-none");
			$(".grade-div").removeClass("display-none");
			$(".freedom-div").addClass("display-none");
		} else if (value == "자유수강권여부") {
			$(".class-div").addClass("display-none");
			$(".grade-div").addClass("display-none");
			$(".freedom-div").removeClass("display-none");
		}
	});
	
	$("#search_button").click(function() {
		dataTable.search();
	});
</script>