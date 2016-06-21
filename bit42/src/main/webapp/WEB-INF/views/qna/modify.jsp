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
      <h3 class="box-title">질문 수정</h3>
   </div>
   <!-- /.box-header -->
   <!-- form start -->
   <form role="form" action="modify" method="post">
      <input type='hidden' name='page' value="${cri.page }">
      <input type='hidden' name='pageNum' value="${cri.pageNum }">   
      <input type='hidden' name='searchType' value="${cri.searchType }">   
      <input type='hidden' name='keyword' value="${cri.keyword }">   
   
      <div class="box-body">
      <div style=float:right>
         <c:if test="${qnaVO.secret eq 'y'}">
            <label>이 글은 비밀글입니다.</label>
            <input type="checkbox" name="secret" value="y" checked> 비밀글 설정 
         </c:if>
         <c:if test="${qnaVO.secret eq 'n'}">      
         <input type="checkbox" name="secret" value="y"> 비밀글 설정 
         </c:if>
      </div>
      <div class="form-group">
                     <label for="exampleInputEmail1">NO.</label> <input type="text"
                        name='qno' class="form-control" value="${qnaVO.qno}"
                        readonly="readonly">
                  </div>
                  
         <div class="form-group">
            <label for="exampleInputEmail1">제목</label> <input type="text"
               name='title' class="form-control" placeholder="제목을 입력해주세요." value="${qnaVO.title}">
         </div>
         <div class="form-group">
            <label for="exampleInputPassword1">내용</label>
            <textarea class="form-control" name="content" rows="3"
               placeholder="여기에 내용을 작성해주세요." >${qnaVO.content}</textarea>
         </div>
         <div class="form-group">
            <label for="exampleInputEmail1">Writer</label> <input type="text"
               name="userid" class="form-control" placeholder="Enter Writer" readonly="readonly" value="${qnaVO.userid}">
         </div>
      </div>
   </form>
<div class="box-footer">
      <button type="submit" class="btn btn-danger" id="modify">수정</button>
      <button type="submit" class="btn btn-primary" id="cancel">취소</button>
   </div>
</div>
</div>

   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

   <script>
      $(document).ready(function() {

         var formObj = $("form[role='form']");

         console.log(formObj);

         

         $("#modify").on("click", function() {
            formObj.submit();
             console.log(formObj);
         });

         $("#cancel").on("click", function() {
            formObj.submit();
             console.log(formObj);
             self.location = "/qna/list?page=${cri.page}&pageNum=${cri.pageNum}"
                   +"&searchType = ${cri.searchType}&keyword=${cri.keyword}";
         });

      });
   </script>

</body>
</html>
<%@include file="/../resources/include/footer.jsp"%>