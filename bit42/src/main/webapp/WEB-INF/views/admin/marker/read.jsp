<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

	<div class="col-lg-8 col-lg-offset-2">
		<h2 id="tables-striped">MARKER READ</h2>

		<form role="form" method="post">
			<input type='hidden' name='markerid' value="${markerVO.markerid }">
			<input type='hidden' name='page' value="${cri.page }">
			<input type='hidden' name='pageNum' value="${cri.pageNum }">			
		</form>
		<div class="pricing-table wow fadeInUp animated"
			data-wow-animation-name="fadeInUp"
			style="visibility: visible; animation-name: fadeInUp;">

			<ul class="list-unstyled">
				<li><input type="text" name='markerid' class='form-control'
					value="${markerVO.markerid }" readonly="readonly"></li>
				<li><input type="text" name='markerpath' class='form-control'
					value="${markerVO.markerpath }" readonly="readonly"></li>
			</ul>
			<div class="filelist">
				<img id='imgs' class="img-thumbnail" alt="Cinque Terre" width="100" height="100"
					src="/admin/marker/downmarker?fileName=${markerVO.markerpath }">
				<div class="pricing-head filename"></div>
			</div>
		</div>
		<div class="price-actions">
			<button type="submit" class="btn-danger" id="btnModify">MODIFY</button>
			<button type="submit" class="btn-warning" id="btnRemove">REMOVE</button>
			<button type="submit" class="btn-info" id="btnListAll">LISTALL</button>

		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#btnModify").on("click", function() {
				formObj.attr("action", "/admin/marker/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$("#btnRemove").on("click", function() {
			    $.post("/admin/marker/deleteFile?fileName=${markerVO.markerpath}", function(){
		               
		          });
				formObj.attr("action", "/admin/marker/remove");
				formObj.submit();
			});

			$("#btnListAll").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/admin/marker/list");
				formObj.submit();
			});

		});
	</script>
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>
