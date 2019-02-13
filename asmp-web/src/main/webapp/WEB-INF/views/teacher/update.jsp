<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>
<link href="${contextName}/css/teacher.css" rel="stylesheet" type="text/css" />

<c:import url="/WEB-INF/views/common/subheader.jsp" >
  	<c:param name="firstname" value="강사 관리"/>
  	<c:param name="middlename" value="강사 상세정보"/>
  	<c:param name="lastname" value="강사 수정"/>
</c:import>

<div class="m-content">
	<div class="row teacher-regist-body">
		<div class="col-md-10">
			<div class="m-portlet">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon"> 
								<i class="flaticon-user-add"></i>
							</span>
							<h3 class="m-portlet__head-text m--font-brand">
								강사 정보 수정&nbsp;&nbsp;&nbsp;&nbsp;<small><span class="m--font-orange">별표(*)</span>는 필수입력 사항입니다.</small>
							</h3>
						</div>			
					</div>
				</div>
				<form:form id="teacherUpdateForm" role="form" class="m-form m-form--fit" commandName="teacher" method="POST" >
					<div class="m-portlet__body portlet-form-body">
						<div class="form-group m-form__group row">
							<label for="nameInput" class="col-md-2 offset-md-3 col-form-label">
								이&nbsp;&nbsp;름&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-3">
								<input class="form-control m-input" type="text" name="name" id="nameInput" value="${teacher.name}" readonly>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								생년월일&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-5">
								<form:select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" path="year" data-width="120">
									<c:forEach var="item" begin="1970" end="2020" step="1">
										<form:option value="${item}" label="${item}년" />
									</c:forEach>
								</form:select>
								<form:select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" path="month" data-width="120">
									<c:forEach var="item" begin="1" end="12" step="1">
										<form:option value="${item}" label="${item}월"/>
									</c:forEach>
								</form:select>
								<form:select class="form-control m-bootstrap-select m_selectpicker" data-size="11" path="day" data-width="120">
									<c:forEach var="item" begin="1" end="31" step="1">
										<form:option value="${item}" label="${item}일"/>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								성&nbsp;&nbsp;별&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-5">
								<div class="m-radio-inline">
									<label class="m-radio m-radio--check-bold m-radio--state-brand m--margin-right-25">
										<form:radiobutton value="MALE" path="sex" label="남성" />
										<span></span>
									</label>
									<label class="m-radio m-radio--check-bold m-radio--state-brand">
										<form:radiobutton value="FEMALE" path="sex" label="여성" /> 
										<span></span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="telInput" class="col-md-2 offset-md-3 col-form-label">
								연락처&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-4">
								<input type="tel" class="form-control m-input" name="tel" id="telInput" value="${teacher.tel}" required
									pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder="예) 010-1234-5678">
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="affiliationInput" class="col-md-2 offset-md-3 col-form-label">
								소&nbsp;&nbsp;속&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-4">
								<input class="form-control m-input" type="text" name="affiliation" value="${teacher.affiliation}" 
									id="affiliationInput" required>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								담당과목&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-2">
								<form:select class="form-control m-bootstrap-select m_selectpicker" path="subject" items="${subjects}">
								</form:select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label"> 
								주&nbsp;&nbsp;소&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-2">
								<input type="text" class="form-control m-input" name="postcode" id="postcode" value="${teacher.postcode}" 
									placeholder="우편번호" readonly>
							</div>
							<div class="col-md-2 postcode-btn">
								<button type="button" class="btn btn-info m-btn--air" onclick="execDaumPostcode()"> 
									우편번호 찾기
								</button>
							</div>
							<div class="col-md-4 offset-md-5">
								<input type="text" class="form-control m-input m--margin-top-10" value="${teacher.address}" 
									name="address" id="address" placeholder="도로명 주소" readonly>
							</div>
							<div class="col-md-4 offset-md-5">
								<input type="text" class="form-control m-input m--margin-top-10"  value="${teacher.detailAddress}" 
									name="detailAddress" placeholder="상세 주소" required>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								계약일자&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-5">
								<form:select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" data-size="10"
										path="contractYear" data-width="120">
									<c:forEach var="item" begin="2000" end="2020" step="1">
										<form:option value="${item}" label="${item}년" />
									</c:forEach>
								</form:select>
								<form:select class="form-control m-bootstrap-select m_selectpicker m--margin-right-10" 
										path="contractMonth" data-width="120">
									<c:forEach var="item" begin="1" end="12" step="1">
										<form:option value="${item}">${item}월</form:option>
									</c:forEach>
								</form:select>
								<form:select class="form-control m-bootstrap-select m_selectpicker" data-size="11" 
										path="contractDay" data-width="120">
									<c:forEach var="item" begin="1" end="31" step="1">
										<form:option value="${item}">${item}일</form:option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label class="col-md-2 offset-md-3 col-form-label">
								상&nbsp;&nbsp;태&nbsp;&nbsp;<span class="m--font-orange vertical-middle">*</span>
							</label>
							<div class="col-md-2">
								<form:select class="form-control m-bootstrap-select m_selectpicker" path="status" items="${teacherStatus}">
								</form:select>
							</div>
						</div>
					</div>
					<div class="m-portlet__foot text-center">
						<div class="align-items-center">
							<button type="submit" class="btn btn-success m-btn--icon m--margin-right-15">
								<span>&nbsp;<i class="fa fa-user-edit"></i><span>&nbsp;수 정&nbsp;</span>&nbsp;</span>
							</button>
							<a href="${contextName}/teacher/detail?id=${teacher.id}" class="btn btn-secondary m-btn--icon">
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
	
	$("#telInput").keyup(function(event) {
		event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenTel(_val) ;
	});
	
	/** 우편번호 찾기 */
	function execDaumPostcode() {
		daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                $("#postcode").val(data.zonecode);
	            	$("#address").val(data.roadAddress);
	            }
	        }).open();
		});
	}
	
	$("#teacherUpdateForm").submit(function(e) {
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
           		console.log(response);
           		swal({
       				title: "강사 수정이 되었습니다.", 
       				type: "success"
       			}).then(function(e) {
       				location.replace("${contextName}/teacher/list");
       			});
           	},
            error: function(response) {
            	swal({title: "강사 수정을 실패하였습니다.", type: "error"})
            }
		});
	});
</script>