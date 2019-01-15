<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/tagLib.jsp"%>

<style>
.m-subheader .m-separator {
    margin: 20px 0 10px 0 !important;
}
</style>

<div class="m-subheader">
	<div class="d-flex align-items-center">
		<div class="mr-auto">
			<h3 class="m-subheader__title m-subheader__title--separator">${param.lastname}</h3>
			<ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
				<li class="m-nav__item m-nav__item--home">
					<a href="#" class="m-nav__link m-nav__link--icon">
					   <i class="m-nav__link-icon la la-home"></i>
					</a>
				</li>
				<c:if test="${param.firstname ne null}">
					<li class="m-nav__separator">-</li>
					<li class="m-nav__item">
						<a href="" class="m-nav__link">
							<span class="m-nav__link-text">${param.firstname}</span>
						</a>
					</li>
				</c:if>
				<c:if test="${param.middlename ne null}">
					<li class="m-nav__separator">-</li>
					<li class="m-nav__item">
						<a href="" class="m-nav__link">
							<span class="m-nav__link-text">${param.middlename}</span>
						</a>
					</li>
				</c:if>
				<li class="m-nav__separator">-</li>
				<li class="m-nav__item">
					<a href="" class="m-nav__link">
						<span class="m-nav__link-text">${param.lastname}</span>
					</a>
				</li>
			</ul>
 		</div>
	</div>
	
	<div class="m-separator m-separator--dashed"></div>
</div>
