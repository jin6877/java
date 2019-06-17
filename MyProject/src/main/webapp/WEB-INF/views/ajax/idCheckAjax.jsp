<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="${context}/head.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function(){
		$('#idCheck').click(function(){
			var idValue = $('#id').val();
// 			alert(idValue);
			var mydata = { "id": idValue };
			$.ajax({
// 				url:"/member/member/memberIdcheck.jsp?id="+idValue,
				url:"/member/member/memberIdcheck.jsp",
				data: mydata,
				type : "get",
				success:function(data){
					$('#myCheck').html('통신성공 = '+ data);
				},
				error:function(){
					$('#myCheck').html('통신에러');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<div id="myCheck">
				</div>
				<input id="id" type="text" class="form-control"/>
				<button class="btn btn-success" id="idCheck">아이디 중복확인</button>
			</div>		
		</div>
	</div>
</body>
</html>