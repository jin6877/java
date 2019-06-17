<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../head.jsp"%>
<script>
$('document').ready(function(){
});
</script>
<style>
#textArea:disabled {
	background: #fff;
}
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="../menu.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../menu2.jsp"%>
				<div class="container-fluid">
					<span>조회수 : ${ThirtyDto.views_cnt}</span>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<div>
								<h3>${ThirtyDto.title}</h3>
							</div>
						</div>
						<div style="margin: 20px;">
							<textarea id="textArea" name="text" disabled
								class="form-control col-sm-12" rows="24">${ThirtyDto.text}
						 </textarea>
							<div class="text-right justify-content-end"
								style="padding: 10px;">
								<c:if test="${sessionScope.logininfo.email eq 'root@root'}">
									<a href="${context}/Posts/update?idx=${ThirtyDto.idx}"
										class="btn btn-success btn-icon-split"> <span class="text">수정</span>
									</a>
									<a href="${context}/Posts/delete?idx=${ThirtyDto.idx}"
										class="btn btn-success btn-icon-split"> <span class="text">삭제</span>
									</a>
								</c:if>
								<a href="${context}/Posts/thirty"
									class="btn btn-success btn-icon-split "> <span class="text">목록</span>
								</a>
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
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>
		</div>
	</div>
</body>

</html>
