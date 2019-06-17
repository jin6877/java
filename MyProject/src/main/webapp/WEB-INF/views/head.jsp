<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String con = request.getContextPath(); %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Dashboard</title>
<link href="<%=con%>/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${context}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${context}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">

<script src="${context}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${context}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${context}/resources/js/sb-admin-2.min.js"></script>


<!-- 테이블 필터링 -->
<script src="${context}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${context}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
<script src="${context}/resources/js/demo/datatables-demo.js"></script>

<!-- Page level plugins -->
<%-- <script src="${context}/resources/vendor/chart.js/Chart.min.js"></script> --%>

<!-- Page level custom scripts -->
<%-- <script src="${context}/resources/js/demo/chart-area-demo.js"></script> --%>
<%-- <script src="${context}/resources/js/demo/chart-pie-demo.js"></script> --%>