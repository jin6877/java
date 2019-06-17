<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>join</title>
<!-- Custom styles for this template-->
<link href="${context}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<%@ include file="../head.jsp"%>

<script>
 	var check = 0;
$('document').ready(function(){
	$('#doSubmitCheck').click(function(){
		
		if( $('#InputEmail').val() == ""){
			alert("Email을 입력하시오.");
		}
		else if(check != 1){
			alert("Email 중복확인을 하시오.");
		}
		else if( $('#InputName').val() == ""){
			alert("Name을 입력하시오.");
		}
		else if( $('#InputPassword').val() == ""){
			alert("Password을 입력하시오.");
		}
		else if( $('#InputPassword').val() != $('#RepeatPassword').val()){
			alert("Password를 확인하세요.");
		}
		else{
			$('#join').submit();
		}
	});
	
	$('#modalEmail').click(function(){
		$('#emailcheck').val( $('#InputEmail').val() );
		$('#emailcheckModal').modal('show');
		check = 1;
		/*
		var obj1 = {
			name : '이름',
			gender : '남자',
			doA : function(){
				return 'aaaaa';
			}
		};
		alert(obj1.name);
		alert(obj1.gender);
		alert( obj1.doA() );
		json -> javascript object 
		*/
		var email = $('#emailcheck').val();
		$.ajax( {
			url: "${context}/member/emailcheck",
			type : "post",
			data : { "email": email},
			success : function(result){
				if( result =='success'){
					$('#checkprint').html('사용가능한 아이디 입니다.');
				}
				else{
					$('#checkprint').html('사용 불가능 아이디 입니다.');
				}
			},
			error: function(e){
				alert(e.status);
				alert(e.responseText);
				$('#checkprint').html('ajax 통신에러 입니다.');
			}
			
		} );
	});
	
	
	});	


// function doSubmitCheck(){
// 	$('#asdf').val = ''
// 	alert(문제가)
	
// 	$(#'myform').submit();
// }
</script>
</head>

<body class="bg-gradient-success">

	<div class="modal fade" id="emailcheckModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">이메일 아이디 중복확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input id="emailcheck" type="text" class="form-control" /> <span
						id="checkprint"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<div id="wrapper">
		<%@ include file="../menu.jsp"%>
		<div class="container">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">회원가입</h1>
								</div>
								<form action="${context}/member/joinProc" method="post"
									id="join">
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="email" class="form-control form-control-user"
												id="InputEmail" placeholder="Email Address" name="email">
										</div>
										<div class="col-sm-6">
											<button type="button" id="modalEmail" class="btn btn-success">중복확인</button>
										</div>
									</div>
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="InputName" placeholder="name" name="name">
									</div>
									<div class="form-group row">
										<div class="col-sm-6 mb-3 mb-sm-0">
											<input type="password" class="form-control form-control-user"
												id="InputPassword" placeholder="Password" name="pw">
										</div>
										<div class="col-sm-6">
											<input type="password" class="form-control form-control-user"
												id="RepeatPassword" placeholder="Repeat Password" name="pw2">
										</div>
									</div>
									<button id="doSubmitCheck" type="button"
										class="btn btn-success btn-user btn-block">회원가입</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="${context}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${context}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${context}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${context}/resources/js/sb-admin-2.min.js"></script>

</body>

</html>
