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
	<div class="box-header with-border">
		<h3 class="box-title">공지사항</h3>
	</div>
	
	<form role="form" method="post">
		<input type='hidden' name='nno' value="${noticeVO.nno}">
		<input type='hidden' name='page' value="${cri.page }">
		<input type='hidden' name='pageNum' value="${cri.pageNum }">	
	</form>

	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				name='title' class="form-control" value="${noticeVO.title}"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="content" rows="3"
				readonly="readonly">${noticeVO.content}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> <input type="text"
				name="writer" class="form-control" value="${noticeVO.userid}"
				readonly="readonly">
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
	 <c:if test="${login.userid == noticeVO.userid}">
		<button type="submit" class="btn btn-warning" id="btnModify">수정</button>
		<button type="submit" class="btn btn-danger" id="btnRemove">삭제</button>
		</c:if>
		<button type="submit" class="btn btn-primary" id="btnListAll">글 목록</button>
 </div> 
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

	<script>
	
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#btnModify").on("click", function() {
				formObj.attr("action", "/notice/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$("#btnRemove").on("click", function() {
			   
				formObj.attr("action", "/notice/remove");
				formObj.submit();
			});

			$("#btnListAll").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/notice/list");
				formObj.submit();
			});

		});
	</script>
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>
