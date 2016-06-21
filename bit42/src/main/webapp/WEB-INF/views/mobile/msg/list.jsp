<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
       <%@include file="/resources/include/mobileheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<h1>메시지 리스트</h1>
</center>
<div class="col-lg-6 col-lg-offset-3">
<div class="panel panel-primary" style="width:100%">
    <div class="row">
        <div class="col-xs-12">
        </div>
    </div>
    <table class="table table-striped table-hover table-responsive table-condensed">
        <tr>
        <th></th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">메시지</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">파일</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">파일타입</span></h1>
            </th>
             <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">마커</span></h1>
            </th>
            <th></th>
              
            <th>
            <button class="btn btn-primary btn-lg insertbtn" id = "print">인쇄</button>
            <br>
            <button class="btn btn-success btn-xs"  id = "choicetotal">전체</button>
            <button class="btn btn-success btn-xs" id = "choicecancel">취소</button>
            
            </th>
            
        </tr>
      
      <c:forEach items = "${list}" var = "vo">
        <tr>
        <th></th>
            <td class="col-lg-2">
                <span style="font-size: 20px;">${vo.getContent()}</span>
            </td>

            <td class="col-lg-2">
                <span style="font-size: 20px;">${vo.getFilename()}</span>
            </td>
<td class="col-lg-2">
                <span style="font-size: 20px;">${vo.getFiletype()}</span>
            </td>
           
          <td class="col-lg-1 makerimg" id = "${vo.getMarkerid()}">
          <a href="">
               <img  cusid ="${vo.getMarkerid()}"  class = "bigshow" style="width: 100px; height: 100px" src = "/img/marker/${vo.getMarkerid()}">
          </a>
          </td>
                <td class="col-lg-1 makerimg" >
         <input type="checkbox" class='check' name='mycheck' value="${vo.getMarkerid()} " cusid="${vo.getMarkerid()}" >
    	</td>
    	
    	<th>
    			
                <center>
                <button class="deletebtn btn btn-danger col-lg-3 col-lg-offset-1" custemid="${vo.getMno()}"><span style="margin-right: 5px"></span>삭제</button>
           <center>
          </th>
          
            
        </tr>
</c:forEach>

    </table>
    </div>
<div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">
<ul class="pagination pagination-lg" >
   <c:if test="${pagemaker.prev}">
            <li>
               <a href="" class="pagebtn" custemid = "${past},${pagemaker.getStartpage()-1}">&laquo;</a>
              
            </li>
    </c:if>
       <c:forEach begin="${pagemaker.startpage}" end="${pagemaker.endpage }" var="idx">
            <li
               <c:out value="${pagemaker.page == idx?'class =active':''}"/>>
               <a href=""  class="pagebtn" custemid = "${past},${idx}">${idx}</a>
            </li>
       </c:forEach>

         <c:if test="${pagemaker.isNext()}">
            <li>
               <a href=""  class="pagebtn" custemid = "${past},${pagemaker.getEndpage()+1}">&raquo;</a>
            </li>
         </c:if>
      </ul>
</div>
</div>
        
    <div class="modal modal3" >
      <div class="modal-content col-md-4 col-md-offset-4" style="margin-top: 5%;">
            <div class="modal-header">                
                <h1 class="text-center">마커 </h1>
            </div>
            <div class="modal-body ">
                     <div class="form-group imgdiv col-md-6 col-md-offset-3">
                    </div>
             </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
   
   <script type="text/javascript">
   var mycheck = document.getElementsByName('mycheck');
 
$(".bigshow").on("click",function (event) {
         event.preventDefault()
         var markerid = $(event.target).attr('cusid');
         $('.text-center').html('마커아이디   ' +markerid );
         $('.modal3').css({ "display":"block" });
           var imghtml ='<center><img id = "bigimg" src="/img/marker/'+markerid+'" style = "width:60%; height:60%"></center>';
          $('.imgdiv').html(imghtml);
   
})
$(".cancel").on("click", function(){
               console.log("cancel");
               $('.modal').css({ "display":"none" });
               
});
$(".pagebtn").on("click",function (event) {
   event.preventDefault();
   var uri = event.target.getAttribute("custemid")
   self.location = "/mobliemsg/list/"+uri;
})
$(".deletebtn").on("click",function (event) {
	var mno = $(event.target).attr("custemid");
	 $.ajax({
		 url : "/msg/del/"+mno,
         type : "DELETE",
         success : function(data) {
         alert("삭제되었습니다.")
         location.reload();  
          }
      })
	
	
});



$("#choicetotal").on("click",function (event) {
   for(i=0; i < mycheck.length; i++){
       mycheck[i].checked = true;
   }
   
})
$("#choicecancel").on("click",function (event) {
   for(i=0; i < mycheck.length; i++){
       mycheck[i].checked = false;
   }
   
})
$("#print").on("click",function (event) {
   var idx = 0;
   var position = 0;
   for(i=0; i < mycheck.length; i++){
       if(mycheck[i].checked){
          idx++
       }
   }
    if(idx>0){
         var strFeature = "";
         strFeature += "width=800, height=500, all=no";
         objWin = window.open('', 'Print', strFeature);
         
         objWin.document.write("<html lang='en'><head><meta charset='UTF-8'><title>Title</title></head>");
         objWin.document.write("<style>td{width: 180px; height: 250px; border: solid}img{width: 150px; height: 150px}@media print {#pr { display:none; }}</style><body ><center>");
         objWin.document.write('<div><input id = "pr"type="button" value="프린트" onclick="window.print();"/></div><br>');
         objWin.document.write("<table style='border: solid'>");
         objWin.document.write("<tr><td></td><td></td><td></td></tr>");
         objWin.document.write("<tr><td></td><td></td><td></td></tr>");
         objWin.document.write("<tr><td></td><td></td><td></td></tr>");
         objWin.document.write("</table>");
         if(idx==10){
            objWin.document.write("<div style='height: 500px'></div>");
            objWin.document.write("<table style='border: solid'><tr><td></td></tr></table>");
         }
         objWin.document.write("</center>");
         objWin.document.write("<script>");
         objWin.document.write(" var tdlist = document.querySelectorAll('td');");
         for(i=0; i < mycheck.length; i++) {
             if(mycheck[i].checked){
                 var mmid = mycheck[i].value;
                 var mean = mycheck[i].getAttribute('cusid');
                 var imgsrc = '<img src="/img/marker/'+mmid+'">';
                 var imghtml ="tdlist["+position+"].innerHTML ='<center>"+imgsrc+"<br><h3>"+mean+"</h3></center>';";
                 objWin.document.write(imghtml);
                 position++
                 }
         }
       objWin.document.write('</'+'script>'+' </body>  </html>');
        var printf = function(){window.print();}
         }else{
             alert('인쇄할 것을 선택하세요');
         }
   
})

 
           
    
</script>
   
</body>
<%@include file="/resources/include/mobilefooter.jsp"%>
</html>