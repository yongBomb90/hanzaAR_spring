<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@include file="/resources/include/header.jsp"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> gradedepth</h1>
<div class="col-lg-8 col-lg-offset-2">
            <ul id="filters" class="clearfix">
               <c:forEach var="gidx" begin="3" end="8" >
                <c:set var="cidx" value="${past}" />
               <c:choose>
                 <c:when test="${cidx == (11-gidx)}">
              <li><span class="filter active gradebtn" customid="${11-gidx}">${11-gidx}급</span></li>
                </c:when>
               <c:otherwise>
                <li><span class="filter gradebtn" customid="${11-gidx}">${11-gidx}급</span></li>
               </c:otherwise>
             </c:choose>
               </c:forEach>
             </ul>
        

</div>


<div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">

<ul class="pagination pagination-lg" >
   
   <c:if test="${pagemaker.prev}">
            <li>
               <a href="" class="sidepagebtn" custemid = "${past},${pagemaker.getStartPage()-1}">&laquo;</a>
              
            </li>
    </c:if>
       <c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage }" var="idx">
            <li
               <c:out value="${pagemaker.cri.page == idx?'class =active':''}"/>>
               <a href=""  class="pagebtn" custemid = "${past},${idx}">${idx} 단계</a>
            </li>
       </c:forEach>

         <c:if test="${pagemaker.isNext()}">
            <li>
               <a href=""  class="sidepagebtn" custemid = "${past},${pagemaker.getEndPage()+1}">&raquo;</a>
            </li>
         </c:if>
      </ul>
</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<script>


   $(".gradebtn").on("click",function (event) {
      event.preventDefault();
      var uri = event.target.getAttribute("customid")+",1";
      self.location = "/play/voice/gradedepth/"+uri;
   })
   
   $(".pagebtn").on("click", function(event){
      event.preventDefault();
      var uri = event.target.getAttribute("custemid");
      alert(uri);
      self.location = "/play/voice/study/"+uri;
   })
   
   
    $(".sidepagebtn").on("click", function(event){
      event.preventDefault();
      var uri = event.target.getAttribute("custemid");
      alert(uri);
      self.location = "/play/voice/gradedepth/"+uri;
   })
   


</script>

</body>
</html>
<%@include file="/resources/include/footer.jsp"%>