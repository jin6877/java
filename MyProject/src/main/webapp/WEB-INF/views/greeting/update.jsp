<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../head.jsp"%>

<script type="text/javascript">

$('document').ready(function() {
     $('#titleArea').val('${DailyTextDTO.title}'+'(수정됨)');
});

</script type="text/javascript">

</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="../menu.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../menu2.jsp"%>
				<div class="container-fluid">
					<div class="card shadow mb-4">
							<form action="${context}/greeting/updateProc" method="post" id="join">
							<input type="hidden" name="date" value="${DailyTextDTO.upload_date}">
						<div class="card-header py-3">
							<h6 class="m-1 font-weight-bold text-primary">인사말</h6>
						</div>
						<div class="card-body">
						<div class="card-body">
							<input class="card-body form-control" type="text" name="text" value="${GreetingText.text}">	
						</div>
						</div>
						<div class="text-right justify-content-end" style="padding: 10px;">
									<button class="btn btn-success btn-icon-split mr-1"> 
										<span class="text">저장</span>
									</button>
									<a href="${context}/Picture_diary/daily/Daily" class="btn btn-success btn-icon-split "> 
										<span class="text">닫기</span>
									</a>
						</div>
							</form>
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
