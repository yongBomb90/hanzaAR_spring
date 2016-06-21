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

<div class="col-lg-8 col-lg-offset-2">
<h2 id="tables-striped">한자관리(급수별관리)</h2>
<button class="btn btn-primary btn-lg insertbtn">한자입력</button>
<button class="btn btn-primary btn-lg searchlistbtn">한자 찾기</button>
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
                <h1 style="font-size:x-large"><span style="font-weight:bolder">횟수</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">급수</span></h1>
            </th>
            <th>
                <h1 style="font-size:x-large"><span style="font-weight:bolder">마커ID</span></h1>
            </th>
            <th></th>
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
                <span style="font-size: 20px;">${vo.getWritecount()}</span>
            </td>

            <td class="col-lg-1">
                <span style="font-size: 20px;">${vo.getGrade()}</span>
            </td>
          <td class="col-lg-1">
                <span style="font-size: 20px;">${vo.getMarkerid()}</span>
            </td>
          
            <td class="col-lg-3">
                <button  class="btn btn-warning col-lg-3 readbtn" custemid="${vo.getHanza()}" ><span style="margin-right: 5px"></span>보기</button>

                <button class="btn btn-info col-lg-3 col-lg-offset-1 modifybtn"  custemid="${vo.getHanza()}" ><span style="margin-right: 5px"></span>수정</button>

                <button class="deletebtn btn btn-danger col-lg-3 col-lg-offset-1" custemid="${vo.getHanza()}"><span style="margin-right: 5px"></span>삭제</button>
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
<div class="modal modal1">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 5%">
            <div class="modal-header">                
                <h1 class="text-center">한자 수정</h1>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                             한자<input type="text" class="form-control input-lg"  readyonly id="hanzainput"  >
                    </div>
                       <div class="form-group">
                            뜻음<input type="text" class="form-control input-lg" id="hanzameaninput" >
                    </div>                    
                    <div class="form-group">
                              횟수<input type="text" class="form-control input-lg" id="hanzawritectninput" >
                    </div>
                    
                    <div class="form-group">
                            급수<input type="text" class="form-control input-lg" id="gradeinput" >
                    </div>
                    
                    <div class="form-group">
                                                         마커아이디<input type="text" class="form-control input-lg" id="markerinput" >
                    </div>
                    
                    <button class="btn btn-primary btn-lg btn-block c" id='updatebtn'>수정</button>                     
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>
        
        <div class="modal modal2">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 5%">
            <div class="modal-header">                
                <h1 class="text-center">한자 입력</h1>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                             한자<input type="text" class="form-control input-lg"  readyonly id="ihanzainput"  >
                    </div>
                       <div class="form-group">
                            뜻음<input type="text" class="form-control input-lg" id="ihanzameaninput" >
                    </div>                    
                    <div class="form-group">
                              횟수<input type="text" class="form-control input-lg" id="ihanzawritectninput" >
                    </div>
                    
                    <div class="form-group">
                            급수<input type="text" class="form-control input-lg" id="igradeinput" >
                    </div>
                    
                    <div class="form-group">
                                                         마커아이디<input type="text" class="form-control input-lg" id="imarkerinput" >
                    </div>
                    
                    <button class="btn btn-primary btn-lg btn-block c" id='insertbtn2'>입력</button>                     
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>
        <div class="modal modal3">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 5%">
            <div class="modal-header">                
                <h1 class="text-center">한자 </h1>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                             한자<input type="text" class="form-control input-lg"  readyonly id="rhanzainput"  >
                    </div>
                       <div class="form-group">
                            뜻음<input type="text" class="form-control input-lg" readyonly id="rhanzameaninput" >
                    </div>                    
                    <div class="form-group">
                              횟수<input type="text" class="form-control input-lg" readyonly id="rhanzawritectninput" >
                    </div>
                    
                    <div class="form-group">
                            급수<input type="text" class="form-control input-lg" readyonly id="rgradeinput" >
                    </div>
                    
                    <div class="form-group">
                                                         마커아이디<input type="text" class="form-control input-lg" readyonly id="rmarkerinput" >
                    </div>
                     <div class="form-group imgdiv" >
                                                       
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
            location.href = "/admin/hanza/"+address;
            check = false;
         }
      }
      
      if(check){
      alert("검색창을 입력해주세요")
      }
      });
   
   
$(".modifybtn").on("click",function (event) {
    var hanza = event.target.getAttribute("custemid")
    $.get("/admin/hanza/modify/"+hanza, function(data){
       $('.modal1').css({ "display":"block" });
       $('#hanzainput').val(data.hanza)
       $('#hanzameaninput').val(data.mean)
       $('#hanzawritectninput').val(data.writecount)
       $('#gradeinput').val(data.grade)
       $('#markerinput').val(data.markerid)
        });
    
    
})
$(".readbtn").on("click",function (event) {
    var hanza = event.target.getAttribute("custemid")
       $.get("/admin/hanza/modify/"+hanza, function(data){
          
          $('.modal3').css({ "display":"block" });
          $('#rhanzainput').val(data.hanza)
          $('#rhanzameaninput').val(data.mean)
          $('#rhanzawritectninput').val(data.writecount)
          $('#rgradeinput').val(data.grade)
          $('#rmarkerinput').val(data.markerid)
          var id = data.markerid
            $.get("/admin/marker/"+id, function(mvo){
          var imghtml ='<center><img style="width: 100px; height: 100px" src="/admin/marker/downmarker?fileName='+mvo.markerpath+'"></center>';
          console.log(imghtml)
          $('.imgdiv').html(imghtml);
            });
           });
       
    
})
$(".cancel").on("click", function(){
               console.log("cancel");
               $('.modal').css({ "display":"none" });
               
});
$("#updatebtn").on("click", function(){
    var hanza =$('#hanzainput').val();
     var mean =$('#hanzameaninput').val();
     var grade =$('#gradeinput').val();
     var markerid =$('#markerinput').val();
     var writecount =$('#hanzawritectninput').val();
     var list = new Array();
     list[0] = hanza;
     list[1] = mean;
     list[2] = grade;
     list[3] = markerid;
     list[4] = writecount;
     var check = true;
     for(var i = 0; i<list.length; i++){
         if(list[i] == "" || list[i] == 0 ){
           check  =  false;
         }
     }
     if(check){
        $.post("/admin/hanza/modify",
                 {   hanza: hanza,
                     mean: mean,
                     grade:grade,
                     markerid:markerid,
                     writecount:writecount
                 },
                 function(data){
                     alert(data)
                     location.reload();
                 });
    }else {
        alert( "모든요소를 입력해주세요" );
    }
    
});

$(".insertbtn").on("click",function (event) {
   $('.modal2').css({ "display":"block" });
})

$("#insertbtn2").on("click",function (event) {
    var hanza =$('#ihanzainput').val();
     var mean =$('#ihanzameaninput').val();
     var grade =$('#igradeinput').val();
     var markerid =$('#imarkerinput').val();
     var writecount =$('#ihanzawritectninput').val();
     var list = new Array();
     list[0] = hanza;
     list[1] = mean;
     list[2] = grade;
     list[3] = markerid;
     list[4] = writecount;
     var check = true;
     for(var i = 0; i<list.length; i++){
         if(list[i] == "" || list[i] == 0 ){
           check  =  false;
         }
     }
    if(check){
        $.post("/admin/hanza/insert",
                 {   hanza: hanza,
                     mean: mean,
                     grade:grade,
                     markerid:markerid,
                     writecount:writecount
                 },
                 function(data){
                     alert( data );
                     location.reload();
                 });
    }else {
        alert( "모든요소를 입력해주세요" );
    }
})
$(".deletebtn").on("click",function (event) {
       var hanza = event.target.getAttribute("custemid")
           $.ajax({
               url:"/admin/hanza/read/"+hanza,
                 datatype:'text',
               type:'DELETE',
               success:function(data){
                 alert(data)
                 location.reload();
              }});
})
$(".pagebtn").on("click",function (event) {
   event.preventDefault();
   var uri = event.target.getAttribute("custemid")
   self.location = "/admin/hanza/"+uri;
})

$(".gradebtn").on("click",function (event) {
   event.preventDefault();
   var uri = event.target.getAttribute("customid")+",1";
   self.location = "/admin/hanza/"+uri;
})

$(".searchlistbtn").on("click",function (event) {
    self.location = "/admin/hanza/searchlist/1"
    })
</script>
   
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>