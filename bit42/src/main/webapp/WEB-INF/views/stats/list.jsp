<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<style>

.update-nag{
  display: inline-block;
  font-size: 14px;
  text-align: left;
  background-color: #fff;
  height: 40px;
  -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.2);
  box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
  margin-bottom: 10px;
}

.update-nag:hover{
    cursor: pointer;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.4);
  box-shadow: 0 1px 1px 0 rgba(0,0,0,.3);
}

.update-nag > .update-split{
  background: #337ab7;
  width: 33px;
  float: left;
  color: #fff!important;
  height: 100%;
  text-align: center;
}

.update-nag > .update-split > .glyphicon{
  position:relative;
  top: calc(50% - 9px)!important; /* 50% - 3/4 of icon height */
}
.update-nag > .update-split.update-success{
  background: #5cb85c!important;
}

.update-nag > .update-split.update-danger{
  background: #d9534f!important;
}

.update-nag > .update-split.update-info{
  background: #5bc0de!important;
}



.update-nag > .update-text{
  line-height: 19px;
  padding-top: 11px;
  padding-left: 45px;
  padding-right: 20px;
}
</style>
<body>

<div class="col-lg-8 col-lg-offset-2 " >
<h2 id="tables-striped">통계 게시판</h2>
<hr>
<div class="container">
	<div class="row">
    
		<div class="col-md-12">
          <div class="update-nag">
            <div class="update-split"><i class="glyphicon glyphicon-log-in"></i></div>
            <div class="update-text" id = "visitToday">오늘 방문자 수 ${visitToday }</div>
          </div>
        </div>
    
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-info"><i class="glyphicon glyphicon-home"></i></div>
            <div class="update-text">전체 방문자 수 ${visitTotal }</div>
          </div>
        </div>

        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-success"><i class="glyphicon glyphicon-user"></i></div>
            <div class="update-text">회원 수 ${memberCount }</div>
          </div>
        </div>
        
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-danger"><i class="glyphicon glyphicon-qrcode"></i></div>
            <div class="update-text">마커 수 ${markerCount }</div>
          </div>
        </div>        
        
	</div>
</div>
</div>

	<div class="testdiv col-lg-8 col-lg-offset-2 " ></div>


	<div class="testdiv2 col-lg-8 col-lg-offset-2 "></div>


 <!-- Modal -->
  
  <div class="modal modal1">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
            <div class="modal-header">                
                <h1 class="text-center">방문자 ID </h1>
            </div>
            <div class="modal-body">



  <table id="rare" class="table table-striped table-hover table-responsive table-condensed">
        <tr>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">USERID</span></h1>
            </th>
            
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">REGDATE</span></h1>
            </th>
            
        </tr>
        <tbody class="visituser">
	        <c:forEach items = "${list}" var = "MemberVO">
	        <tr>
	            <td class="col-lg-2">
	                <span style="font-size: 20px;">${MemberVO.userid}</span>
	            </td>
	
	        
	            <td class="col-lg-1"><span style="font-size: 20px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
	                  value="${MemberVO.visitcount}" />
	                </span>
	            </td>
	            </tr>
	          </c:forEach>
          </tbody>
	</table>
         <div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">

<ul class="pagination pagination-lg" >
   
 
   		 <c:if test="${pageMaker.prev}">
   
            <li>
               <a href="/stats/visit?page=$(pageMaker.startPage - 1)}" class="modal-page">&laquo;</a>
            </li>
         </c:if>

         <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
            var="idx">
            <li <c:out value="${pageMaker.cri.page == idx}"/>>
               <a href="/stats/visit?page=${idx}" class="modal-page">${idx}</a>
            </li>
         </c:forEach>

         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li>
               <a href="/stats/visit?page=${pageMaker.endPage +1}" class="modal-page">&raquo;</a>
            </li>
         </c:if>


      </ul>

    <div >
 
    </div>

</div>  
                     
             </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<script id ="template" type="text/x-handlebars-template">
	    	{{#each .}}			
			<tr >
	            <td class="col-lg-2">
	                <span style="font-size: 20px;">{{userid}}</span>
	            </td>
	
	            <td class="col-lg-1">					
	            <span class="time" style="font-size: 20px;">
				{{visitcount}}</span>
	            </td>
            </tr>			
			{{/each}}
</script>

	<script>

	
	

	$("#visitToday").on("click",function(event){
		 event.preventDefault()
	    $('.modal1').css({ "display":"block" }); 
		    
		
	})
	$(".cancel").on("click", function(){
	 
	       $('.modal').css({ "display":"none" });
	       
		});
	
	 var source = $("#template").html();
	 var template = Handlebars.compile(source);

	
	$(".modal-page").on("click",function(event){
		event.preventDefault()
		console.log("uri: " + event.target.getAttribute("href"));
		
		$.get(event.target.getAttribute("href"),function(result){
			console.log(result);
			var date = new Date(""+result[0].visitcount);
			console.log(date);
			
			var html = template(result);
			
			$(".visituser").html("");						
			//$("#rare").after(html); 
			$(".visituser").append(html);
		});
	})
	
	
	
	
	$(document).ready(function () {
		 $.get("/hanza/gradestotal", function(d){
			 var total = '${hanzaCount}'
				var str ='<div class="box-header with-border"><h3 class="box-title">급수 별 한자 개수(총 한자 수: ${hanzaCount })</h3></div>'
			for(var i=0; i<d.length; i++){
				console.log(d[i]);
				var percent = ((d[i].total/total)*100);
				console.log(d[i].total);
				console.log(percent);
				console.log(total);
				 str =str+'<div class="progress">'+
		          d[i].total+' 개<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="'+percent+'" aria-valuemin="0" aria-valuemax="100" style="width:'+percent+'%">'+
			   			'<span class="progress-text" >'+d[i].grade+'급  </span>'+
			        '</div></div>'
				
			}
			$(".testdiv").html(str)
		});
		 
		 $.get("/admin/child/gradestotal", function(d){
			 var total = '${childCount}'
				var str ='<div class="box-header with-border"><h3 class="box-title">급수 별 아이 수(총 아이 수: ${childCount})</h3></div>'
			for(var i=0; i<d.length; i++){
				console.log(d[i]);
				var percent = ((d[i].total/total)*100);
				console.log(d[i].total);
				console.log(percent);
				console.log(total);
				 str =str+'<div class="progress">'+
		          d[i].total+' 명<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="'+percent+'" aria-valuemin="0" aria-valuemax="100" style="width:'+percent+'%">'+
			   			'<span class="progress-text" >'+d[i].grade+'급  </span>'+
			        '</div></div>'
				
			}
			$(".testdiv2").html(str)
		});
		 
	})

</script>
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>
