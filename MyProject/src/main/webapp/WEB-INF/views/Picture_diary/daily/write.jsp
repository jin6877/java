<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.myproject.web.member.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../../head.jsp"%>
<script type="text/javascript">
	var beforefile = ""; 
	function doupload() {
// 		beforefile = $('file').val();
		var form = $('#fileUploadForm')[0];
		var data = new FormData(form);
// 		var fso = new ActiveXObject("Scripting.FileSystem Object");
// 		var newFolderName = fso.CreateFolder("d:\\newfolder");
		
		
		data.append("beforefile", beforefile);
		$.ajax({
			type :"POST",
			enctype : 'multipart/form-data;charset=UTF-8',
			url : "${context}/fileupload/ajax",
// 			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
// 				alert(' data ='+data );
// 				beforefile = data;
// 				var formDataSerialized = $(data).serialize();
				  console.log(data);
				  console.log( unescape(decodeURIComponent(data)) ); 
// 				$('#imgdiv').append('asdfasdf');
// 				$('#imgdiv').append('<img id="imgpath" src="${context}/resources/fileupload/'+data+'"');
	$('#imgdiv').append('<img id="imgpath" src="${context}/resources/fileupload/'+data+'" width="100%"/>');

// 				$('#imgpath').attr('src','${context}/resources/fileupload/'+data);
			},
			error : function(e) {
				alert("에러");
				alert(e.status);
				alert(e.responseText);
			}
		});
	}
</script>
</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="../../menu.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../../menu2.jsp"%>
				<div class="container-fluid">
					<h1 class="h3 mb-2 text-gray-800">일상툰</h1>
					<p class="mb-4">글쓰기</p>
					
					<div class="card shadow mb-4">
						<form action="${context}/Picture_diary/daily/daily_lifeInsert" method="post" id="fileUploadForm" enctype="multipart/form-data">
							<div class="card-header py-3">
								<h6 class="m-1 font-weight-bold text-primary">title</h6>
									<div class="input-group">
										<input id="titleArea" name="title" type="text" class="form-control border-1 col-sm-12" >
										<input type="file" id="file" name="pfile" /> 
										<input onclick="doupload();" type="button" value="저장" />
									</div>
									<div>
										<div class="col">
											
										</div>
									</div>
							</div>
							<div id="imgdiv" class="card-body" contentEditable="true">
<%-- 								<img id="imgpath" src="/resources/${imgpath}" width="100%" />  --%>
							</div>
							<div class="text-right justify-content-end" style="padding: 10px;">
										<button class="btn btn-success btn-icon-split mr-1"> 
											<span class="text">저장</span>
										</button>
										<a href="${context}/Picture_diary/daily_life" class="btn btn-success btn-icon-split "> 
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
