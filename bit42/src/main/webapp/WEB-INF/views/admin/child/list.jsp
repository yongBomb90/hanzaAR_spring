<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="/resources/include/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-5 col-lg-offset-1">
      <h2 id="tables-striped">자녀 관리</h2>
      </div>

      <div class="col-lg-2 col-lg-offset-10">
      <button class="btn btn-primary btn-lg" onClick="self.location='/admin/child/register';" >자녀등록</button>
       </div>
<div class="col-lg-10 col-lg-offset-1">
    
      
<div class="panel panel-primary" style="width:100%">



    
   <div class='box-body'>

      <select name="searchType" style="width:100px;height:40px;">
         <option value="n"
            <c:out value="${cri.searchType == null?'selected':''}"/>>
            ---</option>
         <option value="c"
            <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>cname</option>
         <option value="r" 
            
            <c:out value="${cri.searchType eq 'r'?'selected':''}"/>>regdate

            </option>

         <option value="u"
            <c:out value="${cri.searchType eq 'u'?'selected':''}"/>>
            userid</option>
         <option value="cr"
            <c:out value="${cri.searchType eq 'cr'?'selected':''}"/>>
            cname+regdate</option>
         <option value="ur"
            <c:out value="${cri.searchType eq 'ur'?'selected':''}"/>>
            userid+regdate</option>

         
   
      </select> 
      
      <input type="text" name='keyword' id="keywordInput" style="width:300px;height:40px;"
         value='${cri.keyword }'>
            
      
            
         <input type="date" id="sdate" name="sdate" style="height:40px;">    <!-- 얘도 검색조건  -->
         

      
      <button id='searchBtn' class="btn btn-primary btn-lg" style="width:100px;height:40px;">Search</button>

   </div>
    
<table class="table table-striped table-hover table-responsive table-condensed">
   <tr>
   
      <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder">USERID</span></h1>
      </th>
      <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder">CNO</span></h1>
      </th>
      <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder">CNAME</span></h1>
      </th>
      
            <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder">AGE</span></h1>
      </th>
      
      <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder">SCHOOL</span></h1>
      </th>
      
      <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder">REGDATE</span></h1>
      </th>
      
      <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder">ChildIMG</span></h1>
      </th>
      <th>
         <h1 style="font-size:x-large"><span style="font-weight:bolder"></span></h1>
      </th>
      </tr>
      
      <c:forEach items="${list}" var ="childVO">
      <tr>
      <td class="col-lg-2">
                <span style="font-size: 20px;">${childVO.userid}</span>
            </td>
            
         <td class="col-lg-1">
                <span style="font-size: 20px;">${childVO.cno}</span>
            </td>
              <td class="col-lg-2"><a
               href='/admin/child/read${pageMaker.makeSearch(pageMaker.cri.page)}&cno=${cnildVO.cno}'></a>
                <span style="font-size: 20px;">${childVO.cname}</span>
            </td>
            
         <%-- <td><a href='/admin/child/read${pageMaker.makeQuery(pageMaker.cri.page)}&cno=${childVO.cno}'>${childVO.cname }</a></td> --%>
         
         <td class="col-lg-1">
                <span style="font-size: 20px;">${childVO.cage}</span>
            </td>
            
         <td class="col-lg-2">
                <span style="font-size: 20px;">${childVO.school}</span>
            </td>
            
         <%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${childVO.regdate }"/></td> --%>
          <td class="col-lg-1"><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${childVO.regdate}" />
                <span style="font-size: 20px;"></span>
            </td>
            
            
             <td><img id='imgs'  src="/admin/child/downimg?fileName=${childVO.s_imgpath }"></td>
           
          
         <td class="col-lg-3">                                    
                <button type="button"  cusvo="${childVO.userid}" class="btn btn-warning col-lg-3" cusid = "/admin/child/modify?cno=${childVO.cno}&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}"><span style="margin-right: 5px"></span>수정</button>

                <button type="button"  cusvo="${childVO.userid}" class="btn btn-info col-lg-3 col-lg-offset-1" cusid = "/admin/child/read?cno=${childVO.cno}&page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}" cusmethod = "get"><span style="margin-right: 5px"></span>보기</button>

                <button type="button"  cusvo="${childVO.userid}" class="delbtn btn btn-danger col-lg-3 col-lg-offset-1" cusid = "/admin/child/remove?cno=${childVO.cno}&userid=${childVO.userid}" cusmethod = "DELETE"><span style="margin-right: 5px"></span>삭제</button>
            </td>
   </tr>
   </c:forEach>
</table>
</div>


<!-- modify modal -->
<div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">

<ul class="pagination pagination-lg" >
   
   <c:if test="${pageMaker.prev}">
   
            <li>
               <a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
            </li>
         </c:if>

         <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
            var="idx">
            <li
               <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
               <a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
            </li>
         </c:forEach>

         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li>
               <a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a>
            </li>
         </c:if>


      </ul>

    </div>
</div>
<script
      src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
   <script>
   
      var success = "${result}";
      if (success) {
         alert(success)
      }
      $(document).ready(
            function() {

               
                  
               
                  $('#searchBtn').on(
                     "click",
                     function(event) {
                        alert($("#sdate").val())
                        
                        
                        if($("select option:selected").val()=='u'||$("select option:selected").val()=='c'){
                           
                           self.location = "list"
                              + '${pageMaker.makeQuery(1)}'
                              + "&searchType="
                              + $("select option:selected").val()
                              + "&keyword="
                              + $('#keywordInput').val()
                        }else{
                        
                           self.location = "list"
                              + '${pageMaker.makeQuery(1)}'
                              + "&searchType="
                              + $("select option:selected").val()
                              + "&keyword="
                              + $('#keywordInput').val()
                              + "&sdate="
                              + $('#sdate').val();
                        }
                        
                  
                     });
               
                   $(".btn").on("click", function(event) {
                        var locations = $(event.target).attr('cusid');
                        var method = $(event.target).attr('cusmethod');
                        var userid = $(event.target).attr('cusvo');
                       
                         
                       
                        if(locations){
                        if(method == 'DELETE'){
                         
                           
                           $.ajax({
                                
                                 url : locations,
                                type : method,
                                success : function(data) {
                                   alert("삭제성공")
                                   location.reload();  
                                }
                             })
                           
                        }else{
                         
                           location.href = locations; 
                        }
                        }
                          
                    });
                
            });
      
   
   </script>

</body>
</html>
<%@include file="/resources/include/footer.jsp"%>