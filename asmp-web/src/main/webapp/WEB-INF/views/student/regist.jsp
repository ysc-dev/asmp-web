<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/student.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="학생 관리" />
  	<c:param name="lastname" value="학생 등록" />
</c:import>

<div class="m-content">
	<div class="row student-regist-body">
		<div class="col-md-10">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon"> 
								<i class="flaticon-user-add m--font-brand"></i>
							</span>
							<h3 class="m-portlet__head-text m--font-brand">
								학생 정보 등록&nbsp;&nbsp;&nbsp;&nbsp;<small><span class="m--font-orange">별표(*)</span>는 필수입력 사항입니다.</small>
							</h3>
						</div>			
					</div>
				</div>
				<form:form id="studentRegistForm" role="form" class="m-form m-form--fit" modelAttribute="student" method="POST" 
						action="${contextName}/student/regist">
					<div class="m-portlet__body portlet-form-body">
						<div class="form-group m-form__group row">
							<label for="nameInput" class="col-md-2 offset-md-3 col-form-label">
								이&nbsp;&nbsp;름&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-3">
								<input class="form-control m-input" type="text" name="name" id="nameInput" required>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								소&nbsp;&nbsp;속
							</label>
							<div class="col-md-4">
								<input class="form-control m-input" type="text" name="affiliation" value="${user.name}" readonly>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								학년/반/번호&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-5">
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="grade" data-width="120">
									<c:forEach var="item" begin="1" end="6" step="1">
										<option value="${item}">${item}학년</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="classType" data-width="120">
									<c:forEach var="item" begin="1" end="10" step="1">
										<option value="${item}">${item}반</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker" data-size="11" name="number" data-width="120">
									<c:forEach var="item" begin="1" end="30" step="1">
										<option value="${item}">${item}번</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								생년월일&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-5">
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="year" data-width="120">
									<c:forEach var="item" begin="2000" end="2020" step="1">
										<option value="${item}">${item}년</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" name="month" data-width="120">
									<c:forEach var="item" begin="1" end="12" step="1">
										<option value="${item}">${item}월</option>
									</c:forEach>
								</select>
								<select class="form-control m-bootstrap-select m_selectpicker" data-size="11" name="day" data-width="120">
									<c:forEach var="item" begin="1" end="31" step="1">
										<option value="${item}">${item}일</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								성&nbsp;&nbsp;별&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-5">
								<div class="m-radio-inline">
									<label class="m-radio m-radio--check-bold m-radio--state-brand m--margin-right-25">
										<input type="radio" value="MALE" name="sex" checked> 남성
										<span></span>
									</label>
									<label class="m-radio m-radio--check-bold m-radio--state-brand">
										<input type="radio" value="FEMALE" name="sex"> 여성
										<span></span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="telInput" class="col-md-2 offset-md-3 col-form-label">연락처</label>
							<div class="col-md-4">
								<input type="tel" class="form-control m-input" name="tel" id="telInput" 
									pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder="예) 010-1234-5678">
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="parentTelInput" class="col-md-2 offset-md-3 col-form-label">
								학부모 연락처&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-4">
								<input type="tel" class="form-control m-input" name="parentTel" id="parentTelInput" 
									pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" required placeholder="예) 010-1234-5678">
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label"> 
								주&nbsp;&nbsp;소&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-2">
								<input type="text" class="form-control m-input" name="postcode" id="postcode" placeholder="우편번호" readonly>
							</div>
							<div class="col-md-2 postcode-btn">
								<button type="button" class="btn btn-info m-btn--air" onclick="execDaumPostcode()"> 
									우편번호 찾기
								</button>
							</div>
							<div class="col-md-4 offset-md-5">
								<input type="text" class="form-control m-input m--margin-top-10"
									name="address" id="address" placeholder="도로명 주소" readonly>
							</div>
							<div class="col-md-4 offset-md-5">
								<input type="text" class="form-control m-input m--margin-top-10" 
									name="detailAddress" placeholder="상세 주소" required>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label"> 
								자유수강권 여부&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-2">
								<div class="m-radio-inline">
									<label class="m-radio m-radio--check-bold m-radio--state-brand m--margin-right-25">
										<input type="radio" value="false" name="freedom" checked> 아니요
										<span></span>
									</label>
									<label class="m-radio m-radio--check-bold m-radio--state-brand">
										<input type="radio" value="true" name="freedom"> 예
										<span></span>
									</label>
								</div>
							</div>
							<div class="col-md-5">
								<label class="col-form-label m--margin-right-20">사유 :</label> 
								<select id="reasonSelect" class="form-control m-bootstrap-select m_selectpicker" name="reason" data-width="180" disabled>
									<c:forEach var="reason" items="${reasons}" varStatus="status">
										<c:if test="${reason.name ne ''}">
											<option value="${reason}">${reason.name}</option>
										</c:if>
					 				</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="m-portlet__foot text-center">
						<div class="align-items-center">
							<button type="submit" class="btn btn-success m-btn--icon m--margin-right-15">
								<span>&nbsp;<i class="fa fa-user-plus"></i><span>&nbsp;등 록&nbsp;</span>&nbsp;</span>
							</button>
							<a href="${contextName}/student/list" class="btn btn-secondary m-btn--icon">
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
	
	$("#telInput, #parentTelInput").keyup(function(event) {
		event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenTel(_val) ;
	});
	
	$("input[type=radio][name=freedom]").change(function() {
		if (this.value == "true") {
			$('#reasonSelect').prop('disabled', false);
		  	$('#reasonSelect').selectpicker('refresh');
		} else {
			$('#reasonSelect').prop('disabled', true);
		  	$('#reasonSelect').selectpicker('refresh');
		}
	});
	
	/** 우편번호 찾기 */
	function execDaumPostcode() {
		daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	                $("#postcode").val(data.zonecode);
	            	$("#address").val(data.roadAddress);
	            }
	        }).open();
		});
	}
	
	$("#studentRegistForm").submit(function(e) {
		e.preventDefault(); // avoid to execute the actual submit of the form.
		if ($("#postCode").val() == '') {
			swal({title: "우편번호를 조회하여 주소를 입력하세요.", type: "warning"});
			return;
		}
		
		var form = $(this);
	    var url = form.attr('action');
		
		$.ajax({
			type: "POST",
           	url: url,
           	data: form.serialize(), // serializes the form's elements.
           	success: function(response) {
           		swal({
       				title: "학생 등록이 되었습니다.", 
       				type: "success"
       			}).then(function(e) {
       				//location.replace("${contextName}/student/list");
       				location.href = "list";
       			});
           	},
            error: function(response) {
            	swal({title: "학생 등록을 실패하였습니다.", type: "error"})
            }
		});
	});
</script>