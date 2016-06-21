<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/resources/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
   
    .btn3d.btn-success {
    box-shadow:0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #32B695, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#48cfad;
   }
   
   .btn-glyphicon { padding:8px; background:#ffffff; margin-right:4px; }
   .icon-btn { padding: 1px 15px 3px 2px; border-radius:50px;}
   
   .select{
      width:100px;
      height: 32px;
   }
   #keywordInput{
      width:300px;
      height: 32px;
   }
</style>

<body>


<div>
<div class="col-lg-8 col-lg-offset-2">
      <h2 id="tables-striped">자유 게시판&nbsp;&nbsp;&nbsp;&nbsp; 
      </h2>

      <br>

       <div style="float: left; width: 100px;">
            <select name="searchType" class="form-control select" >
            
               <option value="n" <c:out value="${cri.searchType == null? 'selected' : '' } " />>  --- </option>
               <option value="t" <c:out value ="${cri.searchType eq 't'? 'selected' : '' } " />> 제목 </option>
               <option value="c" <c:out value ="${cri.searchType eq 'c'? 'selected' : '' } " />> 내용 </option>
               <option value="w" <c:out value ="${cri.searchType eq 'w'? 'selected' : '' } " />> 작성자 </option>           
               
            </select> 
         </div>
         
         <div style="float: left; width: 300px;"> 
            <input  class= "form-control" type = "text" name ='keyword' id="keywordInput" value= "${cri.keyword }" >
         </div>
         
         <button type="submit" class="btn btn-primary" id = "searchBtn" ><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
         <button type="submit" class="btn btn-warning" id = "listSet" ><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></button>
         
         
         
      
   <div style=float:right>
      
      <a  id="btn" class="btn icon-btn btn-success" href="#"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>게시물 등록</a>
<!--       <button  type="button" class="btn btn-success btn-lg btn3d">게시물 등록</a></button>       -->      
   </div>


<table class="table table-hover">

      <tr>
         <th><h1 style="font-size: x-large">
                     <span style="font-weight: bolder">NO.</span>
                  </h1></th>
         <th width = "55%" ><h1 style="font-size: x-large">
                     <span style="font-weight: bolder">제목</span>
                  </h1></th>
         <th><h1 style="font-size: x-large">
                     <span style="font-weight: bolder">작성자</span>
                  </h1></th>
         <th><h1 style="font-size: x-large">
                     <span style="font-weight: bolder">조회수</span>
                  </h1></th>
      </tr>

      <c:forEach items="${list}" var="BoardVO">

         <tr>
            <td class="col-lg-2"><span style="font-size: 20px;">${BoardVO.bno }</span></td>
            <td class="col-lg-2"><span style="font-size: 20px;">
            <a href='/board/read${maker.makeSearch(maker.cri.page)}&bno=${BoardVO.bno}'>
            
            <c:forEach begin="1" end="${BoardVO.depth }">
               <img style="width: 40px; height: 30px;" src="/resources/img/reply.png">
            </c:forEach>
            ${BoardVO.title } &nbsp; &nbsp; [${BoardVO.replycnt}]</a></span></td> 
            
            <td class="col-lg-2"><span style="font-size: 20px;">${BoardVO.userid }</span></td>
            <td class="col-lg-2"><span style="font-size: 20px;" class="badge bg-red">${BoardVO.cnt }</span></td>
         </tr>

      </c:forEach>

   </table>


    <div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">
            <ul class="pagination pagination-lg">

               <c:if test="${maker.prev}">
                  <li>
                  <a href="list${maker.makeSearch(maker.startPage-1)}"><i class="fa fa-long-arrow-left"></i></a>
                  </li>
               </c:if>

               <c:forEach begin="${maker.startPage }" end="${maker.endPage }" var="idx">
                  <li 
                    <c:out value="${maker.cri.page == idx?'class =active':''}"/>>
                     <a href="list${maker.makeQuery(idx)}">${idx }</a>
                  </li>
               </c:forEach>

               <c:if test="${maker.next && maker.endPage > 0}">
                  <li><a
                     href="list${maker.makeSearch(maker.endPage+1)}">
                     <i class="fa fa-long-arrow-right"></i></a>
                     </li>
               </c:if>
            </ul>
         </div>
   </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<script>
   $(document).ready(function() {
      $("#btn").on("click", function(event) {
         location.href = "register/0";
      });
      
      $("#searchBtn").on("click", function(event){
         self.location = "list" + '${maker.makeQuery(1)}' + "&searchType="
                     + $("select option:selected").val()
                     +   "&keyword=" + $('#keywordInput').val();
      });
      
      $("#listSet").on("click", function(event){
         location.href = "list";
      });

   });
</script>
</body>




</html>
<%@include file="/resources/include/footer.jsp"%>