<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="context" value="${pageContext.request.contextPath}" />
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<c:if test="${ not empty sessionScope.logininfo.email }">
					<ul class="navbar-nav ml-auto">
						${ sessionScope.logininfo.email } 님 반갑습니다.
					<li><a href="${context}/member/logOut"
						class="btn btn-success btn-icon-split"> <span class="text">로그아웃</span>
					</a></li>
					</ul>
				</c:if>
				<c:if test="${empty sessionScope.logininfo.email}">
					<ul class="navbar-nav ml-auto">
					<li class="mr-2"><a href="${context}/member/join"
						class="btn btn-success btn-icon-split"> <span class="text">회원가입</span>
					</a></li>
					<li><a href="${context}/member/login"
						class="btn btn-success btn-icon-split"> <span class="text">로그인</span>
					</a></li>
				</ul>
				</c:if>
			</nav>
		
		
		