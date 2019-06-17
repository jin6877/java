<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.jsp" />
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<%@ include file="menu.jsp"%>

		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<%@ include file="menu2.jsp"%>
			
			<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">인기글</h1>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">일상툰</h6>
							<span style="margin: auto; cursor:pointer;"onClick="location.href='${context}/Picture_diary/daily/daily_life'">more</span>
							
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="">
									<thead>
										<tr>
											<th>num</th>
											<th>제목</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>num</th>
											<th>제목</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${dailyList}" var="dto" varStatus="i">
					 								<tr>
							 							<td>${dto.idx}</td>
							 							<td onClick="location.href='${context}/Picture_diary/daily/read?idx=${dto.idx}'" style="cursor:pointer;">
															${dto.title}
														</td>
							 							<td style="width: 200px;">
							 								${dto.upload_date}
						 								</td>
							 							<td>${dto.views_cnt}</td>
							 						</tr>
					 					</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">연애툰</h6>
							<span style="margin: auto; cursor:pointer;"onClick="location.href='${context}/Picture_diary/love/love'">more</span>
							
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="">
									<thead>
										<tr>
											<th>num</th>
											<th>제목</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>num</th>
											<th>제목</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${loveList}" var="dto" varStatus="i">
							 						<tr>
							 							<td>${dto.idx}</td>
							 							<td onClick="location.href='${context}/Picture_diary/love/read?idx=${dto.idx}'" style="cursor:pointer;">
														${dto.title}
														</td>
							 							<td style="width: 200px;">
							 								${dto.upload_date}
						 								</td>
							 							<td>${dto.views_cnt}</td>
							 						</tr>
					 					</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">서른을 사는 글 </h6>
							<span style="margin: auto; cursor:pointer;"onClick="location.href='${context}/Posts/thirty'">more</span>
							
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="">
									<thead>
										<tr>
											<th>num</th>
											<th>제목</th>
<!-- 											<th>내용</th> -->
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>num</th>
											<th>제목</th>
<!-- 											<th>내용</th> -->
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${ThirtyList}" var="dto" varStatus="i">
					 								<tr>
							 							<td>${dto.idx}</td>
							 							<td onClick="location.href='${context}/Posts/read?idx=${dto.idx}'" style="cursor:pointer;">
																${dto.title}
														</td>
<%-- 							 							<td>${dto.text}</td> --%>

							 							<td style="width: 200px;">
							 								${dto.write_date}
						 								</td>
						 								<td>${dto.views_cnt}</td>
							 							
							 						</tr>
					 					</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- End of Main Content -->

			<div id="content">
				<!-- 				Topbar -->

				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					
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
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


</body>

</html>
