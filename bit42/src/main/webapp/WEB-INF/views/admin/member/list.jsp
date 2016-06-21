<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="/resources/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>


<body>


<div class="col-lg-1 col-lg-offset-1">
<h2 id="tables-striped">회원 관리</h2>
   </div>

   <div class="col-lg-3" style="margin-top: 1%">
      <button type="submit" name="submit" class="btn btn-primary btn-lg" required="required" onClick="self.location='/admin/member/register';" id = "userCreate">User등록</button>
      </div>
     <div class="col-lg-10 col-lg-offset-1">

<div class="panel panel-primary" style="width:100%">


    <div class="row">
        <div class="col-xs-12">
        </div>
    </div>
    
    
    
   <div class='box-body'>

      <select name="searchType" style="width:100px;height:40px;">
         <option value="n"
            <c:out value="${cri.searchType == null?'selected':''}"/>>
            ---</option>
         <option value="t"
            <c:out value="${cri.searchType eq 't'?'selected':''}"/>>userid</option>
         <option value="c" 
            
            <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>regdate

            </option>

         <option value="w"
            <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
            username</option>
         <option value="tc"
            <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
            userid+regdate</option>
         <option value="cw"
            <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
            username+regdate</option>

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
                <h1 style="font-size:x-large"><span style="font-weight:bolder">USERNAME</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">PHONENUMBER</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">EMAIL</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">REGDATE</span></h1>
            </th>
            <th></th>
        </tr>
   


      <c:forEach items = "${list}" var = "MemberVO">
        <tr>
            <td class="col-lg-2">
                <span style="font-size: 20px;">${MemberVO.userid}</span>
            </td>

            <td class="col-lg-2">
                <span style="font-size: 20px;">${MemberVO.username}</span>
            </td>

            <td class="col-lg-1">
                <span style="font-size: 20px;">${MemberVO.phonenumber}</span>
            </td>

            <td class="col-lg-1">
                <span style="font-size: 20px;">${MemberVO.email}</span>
            </td>

            <td class="col-lg-1"><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${MemberVO.regdate}" />
                <span style="font-size: 20px;"></span>
            </td>
         
            <td class="col-lg-3">                                    
                <button type="button"  cusvo="${MemberVO.userid}" class="btn btn-warning col-lg-3" 
                cusid = "/admin/member/update?userid=${MemberVO.userid}&page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}"><span style="margin-right: 5px"></span>수정</button>

                <button type="button"  cusvo="${MemberVO.userid}" class="btn btn-info col-lg-3 col-lg-offset-1" cusid = "/admin/member/read?userid=${MemberVO.userid}&page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}" cusmethod = "get"><span style="margin-right: 5px"></span>보기</button>

                <button type="button"  cusvo="${MemberVO.userid}" class="delbtn btn btn-danger col-lg-3 col-lg-offset-1" cusid = "/admin/member/remove?userid=${MemberVO.userid}&page=${cri.page}&pageNum=${cri.pageNum}" cusmethod = "DELETE"><span style="margin-right: 5px"></span>삭제</button>
            </td>
        </tr>

   
</c:forEach>

    </table>

    </div>

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

    <div >
 
    </div>

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
                        
                        
                        
                        if($("select option:selected").val()=='t'||$("select option:selected").val()=='w'){
                           
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
                      
                      if(confirm("삭제 하시겠습니까?")==true){  
                        $.ajax({
                             
                              url : locations,
                             type : method,
                             success : function(data) {
                                alert("삭제되었습니다.")
                                location.reload();  
                             }
                          })
                      }else{
                    	  alert("취소되었습니다.")
                      } 
                     }else{
                      
                        location.href = locations; 
                     }
                     }
                       
                 });
                 
                 
            
            
            
            });
      
   
   
   </script>
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>