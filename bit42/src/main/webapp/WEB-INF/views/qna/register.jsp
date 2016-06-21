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
      <h3 class="box-title">REGISTER QnA</h3>
   </div>
   <!-- /.box-header -->
   <!-- form start -->
   <form role="form" method="post">
      <div class="box-body">
      <div style=float:right>
      <input type="checkbox" name="secret" value="y"> 비밀글 설정 
   </div>
         <div class="form-group">
            <label for="exampleInputEmail1">Title</label> <input type="text"
               name='title' class="form-control" placeholder="Enter Title">
         </div>
         <div class="form-group">
            <label for="exampleInputPassword1">Content</label>
            <textarea class="form-control" name="content" rows="3"
               placeholder="Enter ..."></textarea>
         </div>
         <div class="form-group">
            <label for="exampleInputEmail1">Writer</label> 
            <input type="text" name="userid" class="form-control" value="${MemberVO.userid }" readonly="readonly">
         </div>
      </div>
      <!-- /.box-body -->

      <div class="box-footer">
         <button type="submit" class="btn btn-primary">Submit</button>
      </div>
   </form>

</div>
</div>

</body>
</html>
<%@include file="/../resources/include/footer.jsp"%>