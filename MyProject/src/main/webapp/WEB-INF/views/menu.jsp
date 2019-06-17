<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="context" value="${pageContext.request.contextPath}" />
<ul	class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${context}/">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					사라작가 <sup>사라툰</sup>
				</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<a class="nav-link"	href="${context}/greeting">
					<i class="fas fa-fw fa-tachometer-alt"></i> 
					<span>인사말</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">contents</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				
				<a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> 
					<i class="fas fa-fw fa-folder"></i>
					<span>그림일기</span>
				</a>
<!-- 김진웅 20190513  				<a><span id="menuoepn">메뉴펼침</span></a> -->
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="${context}/Picture_diary/daily/daily_life">일상툰</a> 
						<a class="collapse-item" href="${context}/Picture_diary/love/love">연애툰</a>
					</div>
				</div>
			</li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> 
				<i class="fas fa-fw fa-align-right"></i> 
					<span>글</span>
				</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">글</h6>
						<a class="collapse-item" href="${context}/Posts/thirty">서른을 사는 글</a> 
<!-- 						<a class="collapse-item" href="utilities-border.html">그냥 일기</a>  -->
<!-- 						<a class="collapse-item" href="utilities-animation.html">와닿는 글</a> -->
					</div>
				</div>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->

			
		</ul>
		
		
		