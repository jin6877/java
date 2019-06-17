<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <c:set var="context" value="${pageContext.request.contextPath}" /> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../head.jsp"%>
</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="../../menu.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../../menu2.jsp"%>
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">일상</h1>
					<p class="mb-4">일상을 그림으로 표현하였습니다.</p>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">일상툰 </h6>
							
						</div>
							<c:if test="${sessionScope.logininfo.email eq 'root@root'}">
					<ul class="navbar-nav ml-auto">
					<li class="mr-2"><a href="${context}/Picture_diary/daily/write"
						class="btn btn-success btn-icon-split"> <span class="text">글쓰기</span>
					</a></li>
				</ul>
				</c:if>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" cellspacing="0">
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
										<c:forEach items="${dailyList}" var="dto" varStatus="i">
					 								<tr>
							 							<td>${dto.idx}</td>
							 							<td onClick="location.href='${context}/Picture_diary/daily/read?idx=${dto.idx}'" style="cursor:pointer;">
															<c:if test="${fn:length(dto.title) > 35 }">
																${fn:substring(dto.title,0,35) } ...
															</c:if>
															<c:if test="${fn:length(dto.title) <= 35 }">
																${dto.title}
															</c:if>
														</td>
<%-- 							 							<td>${dto.text}</td> --%>

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

			</div>

		</div>
		<a class="scroll-to-top rounded" href="#page-top">
			 <i class="fas fa-angle-up"></i>
		</a>
	</div>
</body>

</html>
