<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>
<c:set var="contextName">${pageContext.request.contextPath}</c:set>

<!-- BEGIN: Left Aside -->
<div id="m_aside_left" class="m-grid__item	m-aside-left m-aside-left--skin-light">
	<!-- BEGIN: Aside Menu -->
	<div id="m_ver_menu" class="m-aside-menu m-aside-menu--skin-light m-aside-menu--submenu-skin-light" 
			m-menu-vertical="1" m-menu-scrollable="1" m-menu-dropdown-timeout="500" style="position: relative;">
		<div class="logo text-center">
			<a href="${contextName}/" class="">
				<img alt="" src="${contextName}/resources/images/logo1.png">
			</a>
		</div>
		<div class="m-portlet">
			<c:choose>
				<c:when test="${loginUser == null}">
					<div class="login-body">
						<span>관리자 로그인</span>
						<form class="login-container m--margin-top-15" action="${pageContext.request.contextPath}/loginProcess" method="POST">
							<div class="m-stack m-stack--ver m-stack--general">
								<div class="m-stack__item m-stack__item--center m-stack__item--middle m-stack__item--fluid"> 
									<input type="text" class="form-control form-control-sm m-input m-input--air" id="userId" name="userId" placeholder="아이디">
									<input type="password" class="form-control form-control-sm m-input m-input--air m--margin-top-10" 
										id="password" name="password" placeholder="비밀번호">
								</div>
								<div class="m-stack__item m-stack__item--center m-stack__item--middle m--padding-left-10" style="width: 85px;">
									<button type="submit" class="btn btn-success btn-sm m-btn--air login-btn">로그인</button>
								</div>
							</div>
						</form>
						<div class="m-divider m--margin-top-15">
							<span></span>
						</div>
						<div class="m--margin-top-15 text-center">
							<a href="#" class="m-link m-link--state m-link--primary">아이디 찾기</a> 
							<label class="vetical-line">&nbsp;&nbsp;|&nbsp;&nbsp;</label>
							<a href="#" class="m-link m-link--state m-link--info">비밀번호 찾기</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="login-success-body">
						<span>로그인 정보</span>
						<div class="m-divider m--margin-top-10">
							<span></span>
						</div>
						<div class="user-info">
							<label class="m--font-brand">안녕하세요,&nbsp;</label>
							<label class="m--font-success">${loginUser.name}님</label>
							<label class="m--font-brand">&nbsp;환영합니다.</label>
						</div>
						<div class="text-right">
							<a href="${contextName}/logout" 
								class="btn m-btn--pill btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder">로그아웃</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="m-portlet aside-menu-portlet">
			<div class="m-portlet__body">
				<div class="m-scrollable" data-scrollable="false" data-height="635" data-scrollbar-shown="true">
					<ul class="m-menu__nav  m-menu__nav--dropdown-submenu-arrow"> 
						<li id="notice" class="m-menu__item" aria-haspopup="true">
							<a href="${contextName}/notice/list" class="m-menu__link">
								<i class="m-menu__link-icon flaticon-list-1"></i>
								<span class="m-menu__link-title"> 
									<span class="m-menu__link-wrap"> 
										<span class="m-menu__link-text">관리자 공지사항</span>
									</span>
								</span>
							</a>
						</li>
						<li id="student" class="m-menu__item m-menu__item--submenu m-menu__item--open" aria-haspopup="true">
							<a href="javascript:;" class="m-menu__link">
								<i class="m-menu__link-icon flaticon-layers"></i>
								<span class="m-menu__link-text">학생 관리</span>
							</a>
							<div class="m-menu__submenu">
								<ul class="m-menu__subnav">
									<li id="student_regist" class="m-menu__item " aria-haspopup="true"> 
										<a href="${contextName}/student/regist" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">학생 등록</span>
										</a>
									</li>
									<li id="student_list" class="m-menu__item " aria-haspopup="true">
										<a href="${contextName}/student/list" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">학생 조회</span>
										</a>
									</li>
									<li id="student_freedom" class="m-menu__item " aria-haspopup="true">
										<a href="${contextName}/student/freedom" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">자유수강권자 조회</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li id="teacher" class="m-menu__item m-menu__item--submenu m-menu__item--open" aria-haspopup="true">
							<a href="javascript:;" class="m-menu__link">
								<i class="m-menu__link-icon flaticon-layers"></i>
								<span class="m-menu__link-text">강사 관리</span>
							</a>
							<div class="m-menu__submenu">
								<ul class="m-menu__subnav">
									<li id="teacher_regist" class="m-menu__item " aria-haspopup="true">
										<a href="${contextName}/teacher/regist" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">강사 등록</span>
										</a>
									</li>
									<li id="teacher_list" class="m-menu__item " aria-haspopup="true">
										<a href="${contextName}/teacher/list" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">강사 조회</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="m-menu__item m-menu__item--submenu m-menu__item--open" aria-haspopup="true">
							<a href="javascript:;" class="m-menu__link">
								<i class="m-menu__link-icon flaticon-layers"></i>
								<span class="m-menu__link-text">방과 후 수업 관리</span>
							</a>
							<div class="m-menu__submenu">
								<ul class="m-menu__subnav">
									<li id="lesson_subject" class="m-menu__item " aria-haspopup="true">
										<a href="${contextName}/lesson/subject" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">방과 후 과목 관리</span>
										</a>
									</li>
									<li id="lesson_regist" class="m-menu__item " aria-haspopup="true">
										<a href="${contextName}/lesson/regist" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">강좌 생성</span>
										</a>
									</li>
									<li id="lesson_list" class="m-menu__item " aria-haspopup="true">
										<a href="${contextName}/lesson/list" class="m-menu__link">
											<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
											<span class="m-menu__link-text">강좌 조회</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END: Left Aside -->

<script>
    var pathName = this.location.pathname;
    var menuName = pathName.split("/")[2];
    var subMenuName = pathName.split("/")[3];
    
    if (menuName == 'notice') {
    	$("li#" + menuName).addClass("m-menu__item--active");
    } else {
    	$("li#" + menuName).addClass("m-menu__item--expanded m-menu__item--open");
    	$("li#" + menuName + "_" + subMenuName).addClass("m-menu__item--active");
    }
</script>