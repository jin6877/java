<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../head.jsp"%>

<script type="text/javascript">

$('document').ready(function() {
     $('#titleArea').val('${DailyTextDTO.title}'+'(수정됨)');
});

</script type="text/javascript">

</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="../../menu.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../../menu2.jsp"%>
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">일상</h1>
					<p class="mb-4">일상툰</p>
					<div class="card shadow mb-4">
							<form action="${context}/Picture_diary/daily/DailyUpdateProc" method="post" id="join">
							<input type="hidden" name="idx" value="${DailyTextDTO.idx}">
							<input type="hidden" name="date" value="${DailyTextDTO.upload_date}">
						<div class="card-header py-3">
							<h6 class="m-1 font-weight-bold text-primary">title</h6>
							<div class="input-group">
								<input id="titleArea" name="title" type="text" class="form-control border-1 col-sm-12">
							</div>
						</div>
						<div class="card-body">
							<div class="card-body" contentEditable="true">
								<c:forEach items="${fileNames}" var="fileName">
							</div>
								<img id="imgpath" src="${context}/resources/fileupload/${DailyDTO.title}/${fileName}" width="100%" />
							</c:forEach></textarea>
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
