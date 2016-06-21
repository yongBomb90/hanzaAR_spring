<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>

   .btn-glyphicon { padding:8px; background:#ffffff; margin-right:4px; }
   .icon-btn { padding: 1px 15px 3px 2px; border-radius:50px;}
</style>
<body>

<div class="col-lg-8 col-lg-offset-2">

		<h2 id="tables-striped">질문과 답변&nbsp;&nbsp;&nbsp;&nbsp;
		</h2>
		
		   <br>


       <div style="float: left; width: 100px;">
            <select name="searchType" class="form-control select" >
            
               <option value="n" <c:out value="${cri.searchType == null? 'selected' : '' } " />>  --- </option>
               <option value="t" <c:out value ="${cri.searchType eq 't'? 'selected' : '' } " />> 제목 </option>
               <option value="c" <c:out value ="${cri.searchType eq 'c'? 'selected' : '' } " />> 내용 </option>
               <option value="w" <c:out value ="${cri.searchType eq 'w'? 'selected' : '' } " />> 작성자 </option>           
               <option value="tc" <c:out value ="${cri.searchType eq 'tc'? 'selected' : '' } " />> 제목+내용 </option>           
               <option value="cw" <c:out value ="${cri.searchType eq 'cw'? 'selected' : '' } " />> 내용+작성자 </option>           
               <option value="tcw" <c:out value ="${cri.searchType eq 'tcw'? 'selected' : '' } " />> 전체 </option>           
               
            </select> 
         </div>
         
                  <div style="float: left; width: 300px;"> 
            <input  class= "form-control" type = "text" name ='keyword' id="keywordInput" value= "${cri.keyword }" >
         </div>
         
         <button type="submit" class="btn btn-primary" id = "searchBtn" ><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
         <button type="submit" class="btn btn-warning" id = "listSet" ><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></button>
         

      <div style=float:right>
      <a  id="btn" class="btn icon-btn btn-success" href="/qna/register"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>QnA 등록</a>   
      </div>
         <table class="table table-hover">
            <tr>
               <th>
                  <h1 style="font-size: x-large">
                     <span style="font-weight: bolder">No.</span>
                  </h1>
               </th>
               <th>
                  <h1 style="font-size: x-large">
                     <span style="font-weight: bolder">제목</span>
                  </h1>
               </th>
               <th>
                  <h1 style="font-size: x-large">
                     <span style="font-weight: bolder">작성자</span>
                  </h1>
               </th>
               <th>
                  <h1 style="font-size: x-large">
                     <span style="font-weight: bolder">작성시간</span>
                  </h1>
               </th>
            </tr>


            <c:forEach items="${list}" var="qnaVO">

               <tr>
                  <td class="col-lg-1"><span style="font-size: 20px;">${qnaVO.qno}</span>
                  </td>

                  <td class="col-lg-2">
                  
                  <c:if test="${qnaVO.secret eq 'y'}">
                     <c:choose>
                      <c:when test="${login.userid == qnaVO.userid}">
                           <a href='/qna/read${pageMaker.makeSearch(pageMaker.cri.page)}&qno=${qnaVO.qno}'><span style="font-size: 20px;">${qnaVO.title}<strong>&nbsp;[ ${qnaVO.replycnt} ]</strong></a></span>
                        </c:when>
                        <c:when test="${login.gubun eq 'a'}">
                           <a href='/qna/read${pageMaker.makeSearch(pageMaker.cri.page)}&qno=${qnaVO.qno}'><span style="font-size: 20px;">${qnaVO.title}<strong>&nbsp;[ ${qnaVO.replycnt} ]</strong></a></span>
                        </c:when>      
                     
                      <c:otherwise><span class="glyphicon glyphicon-lock" style="font-size: 20px;">비밀글입니다</span></c:otherwise>
                     
                     </c:choose>
                  </c:if>
                  <c:if test="${qnaVO.secret eq 'n'}">
                  <a href='/qna/read${pageMaker.makeSearch(pageMaker.cri.page)}&qno=${qnaVO.qno}'><span style="font-size: 20px;">${qnaVO.title}<strong>&nbsp;[ ${qnaVO.replycnt} ]</strong></a></span>                  
                  </c:if>
                  
                  </td>
                  
                     <td class="col-lg-1"><span style="font-size: 20px;">${qnaVO.userid}</span>
                  </td>
                  
                  <td class="col-lg-1"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaVO.regdate}" />         
                <span style="font-size: 20px;"></span>
            </td>


               
               </tr>
            </c:forEach>
         </table>

      
            <div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">
            <ul class="pagination pagination-lg">

               <c:if test="${pageMaker.prev}">
                  <li>
                  <a href="list${pageMaker.makeSearch(pageMaker.startPage-1)}"><i class="fa fa-long-arrow-left"></i></a>
                  </li>
               </c:if>

               <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                  <li 
                    <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
                     <a href="list${pageMaker.makeSearch(idx)}">${idx }</a>
                  </li>
               </c:forEach>

               <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                  <li><a
                     href="list${pageMaker.makeSearch(pageMaker.endPage+1) }">
                     <i class="fa fa-long-arrow-right"></i></a>
                     </li>
               </c:if>
            </ul>
         </div>
      </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<script>
   $(document).ready(function() {
      
      $('#searchBtn').on(
            "click",
            function(event) {

               self.location = "list"
                     + '${pageMaker.makeQuery(1)}'
                     + "&searchType="
                     + $("select option:selected").val()
                     + "&keyword="
                     + $('#keywordInput').val();

            });
      
      $("#listSet").on("click", function(event){
         location.href = "list";
      });

   });
</script>
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>