<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/../resources/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-8 col-lg-offset-2">
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">공지사항 글 쓰기</h3>
	</div>
	<!-- /.box-header -->
	<!-- form start -->
	<form role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">제목</label> <input type="text"
					name='title' class="form-control" placeholder="제목을 입력해주세요.">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="content" rows="3"
					placeholder="여기에 내용을 작성해주세요."></textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label> <input type="text"
					name="userid" class="form-control"  value="${MemberVO.userid }" readonly="readonly">
			</div>
		</div>
		<!-- /.box-body -->
			<button type="submit" class="btn btn-primary">등록</button>
			<a class="btn btn-danger" href="/notice/list">취소</a>
	</form>
			
</div>
</div>
</body>
</html>
<%@include file="/../resources/include/footer.jsp"%>
