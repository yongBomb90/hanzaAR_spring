<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@include file="/resources/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/resources/css/childlist.css" rel="stylesheet">
</head>
<body >
<center>
<h1>메시지를 보낼 아이를 선택하세요 </h1>

 </center>
<div class="accordian"  >
    <ul >
    <c:forEach items="${list}" var="cvo">
    <li>
           <div class="image_title">
                <a href="#">${cvo.cname}</a>
            </div>
         <a href="#" >
          <img class="childbtn"  id="child${cvo.cno}" cusid = '${cvo.cno}' src="/user/child/downimg?fileName=${cvo.imgpath }"   style=" width: 350px; height: 350px; margin:0 auto;">
          	</a>
   	</li>
    </c:forEach>
</ul>
</div>
 <div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">
<ul class="pagination pagination-lg" >
   <c:if test="${cri.prev}">
            <li>
               <a href="/msg/${(cri.startpage-1)}" >&laquo;</a>
              
            </li>
    </c:if>
       <c:forEach begin="${cri.startpage}" end="${cri.endpage }" var="idx">
            <li
               <c:out value="${cri.page == idx?'class =active':''}"/>>
               <a href="/msg/${idx}"  >${idx}</a>
            </li>
       </c:forEach>

         <c:if test="${cri.next}">
            <li>
               <a href="/msg/${(cri.endpage+1)}" >&raquo;</a>
            </li>
         </c:if>
      </ul>
</div>
  
  <!-- Modal -->
  <div class="modal modal1">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
            <div class="modal-header">                
                <h1 class="text-center">아이정보 </h1>
            </div>
            <div class="modal-body">
         			 <div id="dropzone" >
                          <center> <img style=" width:239px; height:239px; margin-left: 3%; margin-top: 0%"  id="thumImg" src=""> 
                           </center>
  
                       </div>   
                          <div class="form-group col-md-12 ">
                     	     이름<input type="text" class="form-control input-lg namediv"  name = "namediv"  readonly>
                                       </div>    
                        <div style="margin-left: 2%">
                    	 마커번호  <select name="makerid" class="makerid" >
                    	
                    	</select> 
        				</div>
        				 <div class="form-group col-md-6 col-md-offset-6 ">
        				 <img style=" width:100px; height:100px; margin-left: 3%; margin-top: 0%"  id="markerImg" src=""> 
                         </div>   
                        <div class="form-group col-md-12  ">
                                               파일
                                               
                    	<input type="file" class="file"   >
                                       </div>             
                       <div class="form-group col-md-12  ">
                    	메시지<input type="text" class="form-control input-lg msginpt"    >
                                       </div>
                   
                       <center>
                        <button type="button" class="dbtn btn btn-info btn-lg sendbtn" >보내기</button>
                         <button type="button" class="dbtn btn btn-info btn-lg listbtn" >메시지리스트</button>
          			   </center>
             </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>

<div style="height:250px">
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script type="text/javascript">
var curcno;
var markerimgreload = function(){
	var markerid = $('.makerid option:selected').val() 
    var path = "/img/marker/"+markerid;
    $("#markerImg").attr("src", path); 
}

$(".listbtn").on("click",function(event){
	self.location = "/msg/list/"+curcno+",1"
})
$(".childbtn").on("click",function(event){
	 event.preventDefault()
	 var idx = $(event.target).attr("cusid");
    $(event.target).attr("cusid");
    $('.modal1').css({ "display":"block" }); 
    $.ajax({
        type : 'get',
        url : '/admin/child/Uread?cno=' + idx,                   
        dataType : 'text',
        success : function(result) {
           child = $.parseJSON(result);
           $(".namediv").val(child.cname);
            var path = "/user/child/downimg?fileName="+child.s_imgpath
           $("#thumImg").attr("src", path);  
           $('.file').val("")
           curcno = child.cno;
           $.ajax({
               type : 'get',
               url : '/msg/makerlist/' + curcno,                   
               dataType : 'text',
               success : function(result) {
            	   var list  = $.parseJSON(result);
                   var str = "";
                   for(var i = 1; i<1024; i++){
                	   var check = true;
                	   for(var z = 0; z<list.length; z++){
                		   if(list[z] == i){
                			    check = false;
                		   }
                       } 
                	   if(check){
                		   str = str+"<option value='"+i+"'>"+i+"</option>"
                       	
                	   }
                   }
                   $('.makerid').html(str)
                   markerimgreload();
            	 }
            }); 
         }
     }); 
})
$(".cancel").on("click", function(){
	        $('.modal').css({ "display":"none" });
});
$(".sendbtn").on("click", function(){
    var msg = $(".msginpt").val();
    var userid = "${login.userid}";
    var cno = "${clogin.cno}";
    var markerid = $('.makerid option:selected').val();
    var file = $('.file')[0].files[0];
   	var formData = new FormData();
    formData.append("userid", userid);
    formData.append("content", msg);
    formData.append("cno", curcno);
    formData.append("markerid", markerid);
    formData.append("file", file);
    $.ajax({
            url : '/msg/reg/',
            data : formData,
            datatype : 'text',
            processData : false,
            contentType : false,
            type : 'POST',
            success : function(data) {
               alert(data);
               $('.modal').css({ "display":"none" });
            },
      })
   
});

$('.makerid').change(function(){
	markerimgreload();
});
		

	
</script>
<%@include file="/resources/include/footer.jsp"%>
</body>
</html>