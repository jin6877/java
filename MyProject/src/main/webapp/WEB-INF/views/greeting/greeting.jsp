<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<%@ include file="../head.jsp"%>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="../menu.jsp"%>

		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<%@ include file="../menu2.jsp"%>
			<div class="d-flex flex-column">
				<c:if test="${sessionScope.logininfo.email eq 'root@root'}">
					<ul class="navbar-nav ml-auto">
					<li class="mr-2"><a href="${context}/greeting/update"
						class="btn btn-success btn-icon-split"> <span class="text">수정</span>
					</a></li>
				</ul>
				</c:if>
				
				
			</div>
			<div id="content">

				<div class="container-fluid">

					<!-- Page Heading -->
					<h3 class="mb-4 text-gray-800 text-center">인사말</h3>

					<div class="justify-content-center text-center" style="margin: 0 auto;">
						<div>
									${GreetingText.text}
						</div>
						<div>
							<img src="${context}/resources/img/sarah.PNG" style="width:20%">
						</div>

					</div>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- 	<div class="container"> -->
	<!-- 		<div class="row"> -->
	<!-- 			<div class="col-sm-4 mx-auto" style="background-color: red !important;"> -->
	<!-- 			asdasdasd -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
</body>

</html>
