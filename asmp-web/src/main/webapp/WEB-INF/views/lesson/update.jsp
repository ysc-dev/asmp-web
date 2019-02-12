<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/lesson.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="방과 후 수업 관리" />
  	<c:param name="middlename" value="강좌 조회" />
  	<c:param name="lastname" value="강좌 수정" />
</c:import>

<div class="m-content">
	<div class="row lesson-regist-body">
		<div class="col-md-11">
			<div class="m-portlet">
				<form:form id="lessonUpdateForm" role="form" class="m-form m-form--fit m-form--label-align-right" modelAttribute="lesson" method="POST">
					<div class="m-portlet__body">
						<div class="m-form__section m-form__section--first row">
							<div class="col-md-5">
								<div class="m-form__heading">
									<h3 class="m-form__heading-title">강좌 기본 정보</h3>
								</div>
								<div class="form-group m-form__group row">
									<label for="nameInput" class="col-md-3 offset-md-1 col-form-label">강좌명&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<input class="form-control m-input" type="text" name="name" id="nameInput" value="${lesson.name}" required>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">과&nbsp;&nbsp;목&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<form:select id="subjectSelect" class="form-control m-bootstrap-select m_selectpicker" path="subject">
											<c:forEach var="subject" items="${subjects}" varStatus="status">
												<form:option value="${subject.id}" label="${subject.name}"/>
							 				</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label class="col-md-3 offset-md-1 col-form-label">강&nbsp;&nbsp;사&nbsp;&nbsp;:</label>
									<div class="col-md-7">
										<form:select class="form-control m-bootstrap-select m_selectpicker" path="teacher">
											<c:forEach var="teacher" items="${teachers}" varStatus="status">
												<form:option value="${teacher.id}" label="${teacher.name}"/>
							 				</c:forEach>
							 				<form:option value="0" label="미배정"/>
										</form:select>
									</div>
								</div>
								<input type="hidden" name="id" value="${lesson.id}">
								<input type="hidden" name="status" value="${lesson.status}">
							</div>
							
							<div class="col-md-6">
								<div class="m-form__heading">
									<h3 class="m-form__heading-title">강좌 소개</h3>
								</div>
								<div class="form-group m-form__group">
									<textarea class="form-control m-input" id="introduction" name="introduction" rows="8" maxlength="150"
										placeholder="수업계획, 목표 강의소개 150자이내" required>${lesson.introduction}</textarea>
								</div>
							</div>
						</div>
						
						<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space"></div>
						
						<div class="m-form__section">
							<div class="m-form__heading m--padding-left-50">
								<h3 class="m-form__heading-title">반 생성</h3>
							</div>
							<div class="m-stack m-stack--ver m-stack--general">
								<div class="m-stack__item text-right" style="width: 13%">
									<label class="col-form-label">반&nbsp;&nbsp;&nbsp;&nbsp;:</label>
								</div>
								<div class="m-stack__item m--padding-left-35">
									<select id="classTypeSelect" class="form-control m-bootstrap-select m_selectpicker" data-width="150">
										<c:forEach var="classType" items="${classTypes}" varStatus="status">
											<option value="${classType}">${classType}</option>
						 				</c:forEach>
									</select>
								</div>
							</div>
							<div class="m-stack m-stack--ver m-stack--general m--margin-top-15">
								<div class="m-stack__item text-right" style="width: 13%">
									<label class="col-form-label">대상학년&nbsp;&nbsp;:</label>
								</div>
								<div class="m-stack__item m--padding-left-35">
									<div class="form-inline">
										<div class="form-group">
											<div class="m-radio-inline m--padding-top-8">
												<label class="m-radio m-radio--info">
													<input type="radio" name="gradeType" value="단일학년" checked> 단일학년
													<span></span>
												</label>
												<label class="m-radio m-radio--info">
													<input type="radio" name="gradeType" value="다학년"> 다학년
													<span></span>
												</label>
											</div>
										</div>
										<div id="singleGradeDiv" class="form-group m--margin-left-70">
											<select id="singleGradeSelect" class="form-control m-bootstrap-select m_selectpicker" data-width="150">
												<c:forEach var="item" begin="1" end="6" step="1">
													<option value="${item}">${item}학년</option>
												</c:forEach>
											</select>
										</div>
										<div id="multiGradeDiv" class="form-group m--margin-left-70 display-none">
											<select id="lowGradeSelect" class="form-control m-bootstrap-select m_selectpicker" data-width="150">
												<c:forEach var="item" begin="1" end="6" step="1">
													<option value="${item}">${item}학년</option>
												</c:forEach>
											</select>
											
											<label class="m--margin-left-15 m--margin-right-15">~</label>
											
											<select id="highGradeSelect" class="form-control m-bootstrap-select m_selectpicker" data-width="150">
												<c:forEach var="item" begin="2" end="6" step="1">
													<option value="${item}">${item}학년</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="m-stack m-stack--ver m-stack--general m--margin-top-15">
								<div class="m-stack__item text-right" style="width: 13%">
									<label class="col-form-label">요&nbsp;&nbsp;일&nbsp;&nbsp;:</label>
								</div>
								<div class="m-stack__item m--padding-left-35 m--padding-top-8">
									<div class="m-checkbox-inline">
										<label class="m-checkbox m-checkbox--info">
											<input type="checkbox" value="월" name="week_group[]"> 월요일<span></span>
										</label>
										<label class="m-checkbox m-checkbox--info">
											<input type="checkbox" value="화" name="week_group[]"> 화요일<span></span>
										</label>
										<label class="m-checkbox m-checkbox--info">
											<input type="checkbox" value="수" name="week_group[]"> 수요일<span></span>
										</label>
										<label class="m-checkbox m-checkbox--info">
											<input type="checkbox" value="목" name="week_group[]"> 목요일<span></span>
										</label>
										<label class="m-checkbox m-checkbox--info">
											<input type="checkbox" value="금" name="week_group[]"> 금요일<span></span>
										</label>
										<label class="m-checkbox m-checkbox--info">
											<input type="checkbox" value="토" name="week_group[]"> 토요일<span></span>
										</label>
										<label class="m-checkbox m-checkbox--info">
											<input type="checkbox" value="일" name="week_group[]"> 일요일<span></span>
										</label>
									</div>
								</div>
							</div>
							<div class="m-stack m-stack--ver m-stack--general m--margin-top-15">
								<div class="m-stack__item text-right" style="width: 13%">
									<label class="col-form-label">시&nbsp;&nbsp;간&nbsp;&nbsp;:</label>
								</div>
								<div class="m-stack__item m--padding-left-20">
									<div class="col-md-3">
										<div class="input-group" id="timeRangePicker">
											<input type="text" class="form-control m-input" readonly />
											<div class="input-group-append">
												<span class="input-group-text"><i class="la la-calendar-check-o"></i></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="m-stack m-stack--ver m-stack--general m--margin-top-15">
								<div class="m-stack__item text-right" style="width: 13%">
									<label class="col-form-label">장&nbsp;&nbsp;소&nbsp;&nbsp;:</label>
								</div>
								<div class="m-stack__item m--padding-left-35">
									<input class="form-control m-input col-md-3" id="locationInput" type="text">
								</div>
							</div>
							<div class="m-stack m-stack--ver m-stack--general m--margin-top-15">
								<div class="m-stack__item text-right" style="width: 13%">
									<label class="col-form-label">수강료&nbsp;&nbsp;:</label>
								</div>
								<div class="m-stack__item m--padding-left-35">
									<div class="m-stack m-stack--ver m-stack--general">
										<div class="m-stack__item" style="width: 15%">
											<input class="form-control m-input" id="tuitionInput" type="number" min="0">
										</div>
										<div class="m-stack__item" style="width: 5%">
											<label class="col-form-label m--margin-left-5">원</label>
										</div>
										<div class="m-stack__item m--padding-top-8">
											<label class="m-checkbox m-checkbox--success m--margin-left-40">
												<input type="checkbox" id="textbookCheck"> 교재비 별도 여부<span></span>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="m-stack m-stack--ver m-stack--general m--margin-top-15">
								<div class="m-stack__item text-right" style="width: 13%">
									<label class="col-form-label">정&nbsp;&nbsp;원&nbsp;&nbsp;:</label>
								</div>
								<div class="m-stack__item m--padding-left-35">
									<div class="m-stack m-stack--ver m-stack--general">
										<div class="m-stack__item" style="width: 15%">
											<input class="form-control m-input" id="fixedNumberInput" type="number" min="0">
										</div>
										<div class="m-stack__item">
											<label class="col-form-label m--margin-left-5">명</label>
										</div>
										<div class="m-stack__item text-right">
											<button id="classRegistBtn" type="button" class="btn btn-info m-btn--icon m--margin-right-50">
												<span>&nbsp;<i class="fa fa-plus"></i><span>&nbsp;등 록&nbsp;</span>&nbsp;</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space"></div>
						
						<div class="m-form__section">
							<div class="m-form__heading m--padding-left-50 m--margin-bottom-5">
								<div class="m-stack m-stack--ver m-stack--general">
									<div class="m-stack__item">
										<h3 class="m-form__heading-title">반별 정보</h3>
									</div>
									<div class="m-stack__item text-right m--padding-right-20">
										<button id="classDeleteBtn" type="button" class="btn btn-danger m-btn--icon btn-sm">
											<span>&nbsp;<i class="fa fa-trash-alt"></i><span>&nbsp;제 거&nbsp;</span>&nbsp;</span>
										</button>
									</div>
								</div>
							</div>
							<div class="m--padding-left-50 m--padding-right-50">
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
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="m-portlet__foot text-center">
						<div class="align-items-center">
							<button type="submit" class="btn btn-success m-btn--icon m--margin-right-15">
								<span>&nbsp;<i class="fa fa-edit"></i><span>&nbsp;완 료&nbsp;</span>&nbsp;</span>
							</button>
							<a href="${contextName}/lesson/list" class="btn btn-secondary m-btn--icon">
								<span>&nbsp;<i class="la la-close"></i><span>&nbsp;취 소&nbsp;</span>&nbsp;</span>
							</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script>
	$(".m_selectpicker").selectpicker();
	
	$("#introduction").maxlength({
	    threshold: 150,
	    warningClass: "m-badge m-badge--primary m-badge--rounded m-badge--wide",
	    limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide"
	});
	
	$("input[type=radio][name=gradeType]").change(function() {
		if (this.value == "단일학년") {
			$("#singleGradeDiv").removeClass("display-none");
			$("#multiGradeDiv").addClass("display-none");
		} else {
			$("#singleGradeDiv").addClass("display-none");
			$("#multiGradeDiv").removeClass("display-none");
		}
	});
	
	var startTime = "09:00";
	var endTime = "09:50";
	
	$("#timeRangePicker .form-control").val(startTime + " ~ " + endTime);
	$("#timeRangePicker").daterangepicker({
		buttonClasses: "m-btn btn",
	    applyClass: "btn-primary",
	    cancelClass: "btn-secondary",
		timePicker: true,
	    timePicker24Hour: true,
	    timePickerIncrement: 10,
	    startDate: startTime,
	    endDate: endTime,
	    locale: {
	        format: 'HH:mm'
	    }
	}, function(start, end, label) {
		startTime = start.format("HH:mm"); 
		endTime = end.format("HH:mm");
		$("#timeRangePicker .form-control").val(startTime + " ~ " + endTime)
	}).on('show.daterangepicker', function (ev, picker) {
	    picker.container.find(".calendar-table").hide();
	});
	
	$("#lowGradeSelect").change(function() {
		$("#highGradeSelect").empty();
		
		var low = Number($("#lowGradeSelect option:selected").val());
		low = low > 5 ? 6 : low + 1;
		for (var i = low; i <= 6; i++) {
			console.log(i);
			$("#highGradeSelect").append($('<option>', {
			    value: i,
			    text: i + "학년"
			}));
		}
		
		$("#highGradeSelect").selectpicker('refresh');
	});
	
	var lessonInfos = [];
	var lessonInfoId = 0;
	
	function getLessonInfoData() {
		var array = ${lessonInfos};
		$.each(array, function(index, data){
			data.infoId = lessonInfoId++;
			lessonInfos.push(data);
		});	
	}
	
	var dataTable = {
		ele: "#lessionInfoTable",
		table: null,
		option: {
			columns: [{
				width: "35px"
			}, {
				data: "infoId"
		    }, {
				data: "classType"
		    }, {
		    	data: "grade"
		    }, {
		        data: "week"
		    }, {
	    		render: function(data, type, row, meta) {
		    		return row.startTime + " ~ " + row.endTime;
		    	}
		    }, {
		    	data: "location"
		    }, {
		    	data: "tuition"
		    }, {
		    	width: "10%",
		    	render: function(data, type, row, meta) {
		    		return row.textbook ? 'O' : 'X';
		    	}
		    }, {
		    	data: "fixedNumber"
		    }]
		},
		init: function() {
			getLessonInfoData();
			this.table = Datatables.customCheck(this.ele, this.option);
			Datatables.refresh(this.table, lessonInfos);
		}
	}
	
	dataTable.init();
	
	/** 등록 버튼 클릭 시 */
	$("#classRegistBtn").click(function() {
		var weekInfo = $('input:checkbox[name="week_group[]"]:checked').map(function() {
            return $(this).val();
        }).get().join(",");
		
		var lessonInfo = new Object();
		lessonInfo.classType = $("#classTypeSelect option:selected").val();
		lessonInfo.gradeType = $("input[type=radio][name=gradeType]").val();
		lessonInfo.week = weekInfo;
		lessonInfo.startTime = startTime;
		lessonInfo.endTime = endTime;
		lessonInfo.location = $("#locationInput").val();
		lessonInfo.tuition = $("#tuitionInput").val();
		lessonInfo.fixedNumber = $("#fixedNumberInput").val();
		lessonInfo.textbook = $('input:checkbox[id="textbookCheck"]').is(":checked");
		
		if (lessonInfo.gradeType == '단일학년') {
			lessonInfo.grade = $("#singleGradeSelect option:selected").val();
		} else {
			var low = $("#lowGradeSelect option:selected").val()
			var high = $("#highGradeSelect option:selected").val()
			lessonInfo.grade = low + "-" + high;
		}
		
		if (lessonInfo.week == '') {
			swal({title: "요일을 선택하세요.", type: "warning"});
			return;
		}
		
		if (lessonInfo.location == '') {
			$("#locationInput").focus();
			swal({title: "장소를 입력하세요.", type: "warning"});
			return;
		}
		if (lessonInfo.tuition == '') {
			$("#tuitionInput").focus();
			swal({title: "수강료를 입력하세요.", type: "warning"});
			return;
		}
		if (lessonInfo.fixedNumber == '') {
			$("#fixedNumberInput").focus();
			swal({title: "정원을 입력하세요.", type: "warning"});
			return;
		}
		
		lessonInfo.infoId = lessonInfoId++;
		lessonInfos.push(lessonInfo);
		Datatables.refresh(dataTable.table, lessonInfos);
		
		$("#locationInput").val('');
		$("#tuitionInput").val('');
		$("#fixedNumberInput").val('');
	});
	
	/** 제거 버튼 클릭 시 */
	$("#classDeleteBtn").click(function() {
		var selectArray = []; 
		
		var checkedRows = dataTable.table.rows('.active').data();
		$.each(checkedRows, function(index, data){
			lessonInfos = $.grep(lessonInfos, function(o, i) {
				return o.infoId != data.infoId; 
			});
		});	
		
		Datatables.refresh(dataTable.table, lessonInfos);
	});
	
	$("#lessonUpdateForm").submit(function(e) {
		e.preventDefault();
		
		var subject = $("#subjectSelect option:selected").val();
		if (subject == '') {
			swal({title: "먼저 과목을 추가하세요.", type: "warning"});
			return;
		}
		
		var form = $(this);
		var lesson = form.serializeObject();
		lesson.lessonInfos = lessonInfos;
		
		$.ajax({
           	url: form.attr('action'),
			type: "POST",
           	data: JSON.stringify(lesson),
			contentType: "application/json",
           	success: function(response) {
           		swal({
       				title: "강좌 수정 되었습니다.", 
       				type: "success"
       			}).then(function(e) {
       				location.href = "list";
       			});
           	},
            error: function(response) {
            	swal({title: "강좌 수정을 실패하였습니다.", type: "error"});
            }
		});
	});
</script>
