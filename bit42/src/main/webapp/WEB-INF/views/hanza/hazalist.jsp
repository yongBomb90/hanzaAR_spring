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
<style type="text/css">
#bigimg{width: 100%; height: 100%; border: solid}
</style>

</head>
<body>

<div class="col-lg-8 col-lg-offset-2">
<h2 id="tables-striped">마커자료실</h2>
</div>
<div class="col-lg-8 col-lg-offset-2">
            <ul id="filters" class="clearfix">
               <c:forEach var="gidx" begin="3" end="8" >
                <c:set var="cidx" value="${past}" />
               <c:choose>
                 <c:when test="${cidx == (11-gidx)}">
              <li><span class="filter active gradebtn" customid="${11-gidx}" >${11-gidx}급</span></li>
                </c:when>
               <c:otherwise>
                <li><span class="filter gradebtn" customid="${11-gidx}" >${11-gidx}급</span></li>
               </c:otherwise>
             </c:choose>
               </c:forEach>
             </ul>
</div>
 <div class="col-lg-6 col-lg-offset-2">
     <select name="searchType" class="typeselect" >
         </select> 
      
       <select name="depthsel" class="depthselect" >
        </select> 
      
       <button  class="btn btn-warning searchbtn" ><span style="margin-right: 5px"></span>찾기</button>
 </div>
<div class="col-lg-8 col-lg-offset-2">
<div class="panel panel-primary" style="width:100%">
    <div class="row">
        <div class="col-xs-12">
        </div>
    </div>
    <table class="table table-striped table-hover table-responsive table-condensed">
        <tr>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">한자</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">뜻음</span></h1>
            </th>
             <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">급수</span></h1>
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
            <td class="col-lg-2">
                <span style="font-size: 20px;">${vo.getHanza()}</span>
            </td>

            <td class="col-lg-2">
                <span style="font-size: 20px;">${vo.getMean()}</span>
            </td>

            <td class="col-lg-1">
                <span style="font-size: 20px;">${vo.getGrade()}</span>
            </td>
          <td class="col-lg-1 makerimg" id = "${vo.getMarkerid()}">
          <a href="">
               <img  cusid ="${vo.getMarkerid()}"  class = "bigshow" style="width: 100px; height: 100px" src = "/img/marker/${vo.getMarkerid()}">
          </a>
               </td>
                <td class="col-lg-1 makerimg" >
         <input type="checkbox" class='check' name='mycheck' value="${vo.getMarkerid()} " cusid="${vo.getGrade()}급   ${vo.getMean()}" >
    </td>
        </tr>
</c:forEach>

    </table>
    </div>
<div class="dataTables_paginate paging_simple_numbers text-center"
            id="example1_paginate">
<ul class="pagination pagination-lg" >
   <c:if test="${pagemaker.prev}">
            <li>
               <a href="" class="pagebtn" custemid = "${past},${pagemaker.getStartPage()-1}">&laquo;</a>
              
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
               <a href=""  class="pagebtn" custemid = "${past},${pagemaker.getEndPage()+1}">&raquo;</a>
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
   var pgrade = "${past}";
   var pdepth = "${depth}";
   var gstr ;
   for (var z=3; z<9; z++){
      if(pgrade != z){
      gstr= gstr + '<option value="'+z+'">'+z+'</option>'}
      else{
      gstr= gstr + '<option value="'+z+'"selected="">'+z+'</option>'
      }
   }
   $(".typeselect").html(gstr);  
   
   $.get("/hanza/gradecnt/"+pgrade,function(data){
        var str = "";
         for(var i=1; i<=data; i++){
            if(i!=pdepth){
            str= str + '<option value="'+i+'">'+i+'</option>'
            }
            else{
            str= str + '<option value="'+i+'"selected="">'+i+'</option>' 
            }
         }
         
         $(".depthselect").html(str);
   })
   
   
   var selectorreload = function(grade){
      $.get("/hanza/gradecnt/"+grade,function(data){
           var str = "";
            for(var i=1; i<=data; i++){
               str= str + '<option value="'+i+'">'+i+'</option>'
            }
            
            $(".depthselect").html(str);
          })
      
   }
   
   $('.magnefig').each(function(){
       $(this).magnificPopup({
               type:'image',
               removalDelay: 300,
               mainClass: 'mfp-fade'
          })
   });
   
   
   
   
   $('.typeselect').change(function(){
      
        var grade = $('.typeselect option:selected').val() 
        selectorreload(grade);
      
   });
   $(".searchbtn").on("click",function (event) {

      var type = $('.typeselect').val();
      var keyword = $('.depthselect').val();
      var address = type+","+keyword;
      var check = true;
      if(type){
         if(keyword){
            location.href = "/hanza/"+address;
            check = false;
         }
      }
      
      if(check){
      alert("검색창을 입력해주세요")
      }
      });
   
   
$(".bigshow").on("click",function (event) {
         event.preventDefault()
         var markerid = $(event.target).attr('cusid');
         $('.modal3').css({ "display":"block" });
           var imghtml ='<center><img id = "bigimg" src="/img/marker/'+markerid+'" style = ""></center>';
          $('.imgdiv').html(imghtml);
   
})
$(".cancel").on("click", function(){
               console.log("cancel");
               $('.modal').css({ "display":"none" });
               
});
$(".pagebtn").on("click",function (event) {
   event.preventDefault();
   var uri = event.target.getAttribute("custemid")
   self.location = "/hanza/"+uri;
})

$(".gradebtn").on("click",function (event) {
   event.preventDefault();
   var uri = event.target.getAttribute("customid")+",1";
   self.location = "/hanza/"+uri;
})


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
</html>
<%@include file="/resources/include/footer.jsp"%>