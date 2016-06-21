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
<h1>등록된아이는 총 ${cri.total}명 입니다 </h1>
 <button class="mbtn btn btn-primary btn-lg" 
               onClick="self.location='/user/child/register'"
               style="margin-top: 5%">등록</button>   
               
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
               <a href="/user/child/list/${(cri.startpage-1)}" >&laquo;</a>
              
            </li>
    </c:if>
       <c:forEach begin="${cri.startpage}" end="${cri.endpage }" var="idx">
            <li
               <c:out value="${cri.page == idx?'class =active':''}"/>>
               <a href="/user/child/list/${idx}"  >${idx}</a>
            </li>
       </c:forEach>

         <c:if test="${cri.next}">
            <li>
               <a href="/user/child/list/${(cri.endpage+1)}" >&raquo;</a>
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
         
                          <div class="form-group col-md-6 col-md-offset-6 ">
                     	     이름<input type="text" class="form-control input-lg namediv"  name = "namediv"  readonly>
                                       </div>                    
                       <div class="form-group col-md-6 col-md-offset-6 ">
                    	 학교<input type="text" class="form-control input-lg schooldiv"  name = "schooldiv" readonly >
                                       </div>
                           <div class="form-group col-md-6 col-md-offset-6 ">
                           
                  	 	생년월일  <input type="date" class="form-control input-lg agediv"  name = "agediv" readonly >
                  	 		<input type="text" class="form-control input-lg age"  name = "agediv" readonly >

                                      </div>
                       <div class="form-group col-md-6 col-md-offset-6 grade">
            	 		  급수  <input type="text" class="form-control input-lg cleveldiv"  name = "cleveldiv"  readonly>
            	 		  <select class="clevelselect form-control select input-lg" name="searchType">
					               <option value="8">8</option>
					               <option value="7">7</option>
					               <option value="6">6</option>
					               <option value="5">5</option>
					               <option value="4">4</option>
					               <option value="3">3</option>
                  		  </select>
                        </div>
                       
                       <div class="form-group col-md-6 col-md-offset-6 deep">
               			단계   <input type="text" class="form-control input-lg deepdiv"  name = "deepdiv" readonly >
               			
							<select name="depthsel" class="deepselect form-control input-lg" > </select>
                        </div>
                       
                       <div id="dropzone" style="position:absolute; left:0px; top:0px; ">
                           <img style="position:absolute; left:0px; top:0px; width:239px; height:239px; margin-left: 50%; margin-top: 25%"  id="thumImg" src=""> 
                           
  
                       </div>   
                       <center>
                       <button type="button" class="dbtn btn btn-info btn-lg delbtn" >삭제</button>
                       <button type="button" class="dbtn btn btn-info btn-lg modbtn" >수정</button>
                       <button type="button" class="dbtn btn btn-info btn-lg choicebtn" >선택</button>
                       <button type="button" class="dbtn btn btn-info btn-lg savebtn" >저장</button>
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
var formData = new FormData();

$(".savebtn").hide();
$(".clevelselect").hide();
$(".deepselect").hide();
$(".age").hide();

var $clv;
var $cdp;

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
           $clv = child.clevel;
           $cdp = child.deep;
           
           selectorreload($clv);
           $(".namediv").val(child.cname);
           $(".schooldiv").val(child.school);
           $(".age").val(child.cage);
           $(".agediv").val(child.age);
           $(".cleveldiv").val(child.clevel);
           $(".deepdiv").val(child.deep);
           var path = "/user/child/downimg?fileName="+child.s_imgpath
           $("#thumImg").attr("src", path);  
           curcno = child.cno;
           
        }
     }); 
	
})

$(".modbtn").on("click", function(){
	var inputlist = document.querySelectorAll('input')
	for(var z=0; z<inputlist.length; z++){
		inputlist[z].readOnly = false;
	}
	console.log($clv);
	console.log($cdp);
	$(".clevelselect option[value='"+$clv+"']").attr("selected", true);
	$(".deepselect option[value='"+$cdp+"']").attr("selected", true);
	$(".modbtn").hide();
	$(".savebtn").show();
	$(".clevelselect").show();
	$(".deepselect").show();
	$(".cleveldiv").hide();
    $(".deepdiv").hide();
});	

$(".cancel").on("click", function(){
	       console.log("cancel");
	       var inputlist = document.querySelectorAll('input')
	   	for(var z=0; z<inputlist.length; z++){
	   		inputlist[z].readOnly = true;;
	   	}
	    $(".clevelselect").hide();
	   	$(".deepselect").hide();
	   	$(".cleveldiv").show();
	    $(".deepdiv").show(); 
	   	$(".savebtn").hide();
	   	$(".modbtn").show();
	       $('.modal').css({ "display":"none" });
	       
		});
		
$(".delbtn").on("click", function(){
	 $.ajax({
         type : 'delete',
         url : '/user/child/remove?cno=' + curcno,                   
         dataType : 'text',
         success : function(result) {
            console.log(result);
            alert('삭제되었습니다.');
            location.reload();
         }
      });
});	

$(".savebtn").on("click", function(){
	  var cno = curcno;
      var cname =$(".namediv").val();
       var school = $(".schooldiv").val();
       var age =  $(".agediv").val();
       var clevel =$(".clevelselect").val();
       var deep = $(".deepselect").val();
       var cage =  $(".age").val();
       formData.append("cname", cname);
       formData.append("school", school);
       formData.append("age", age);
       formData.append("cage", cage);
       formData.append("clevel", clevel);
       formData.append("deep", deep);
       formData.append("cno", cno);
      $.ajax({
           type : 'post',
           url : '/admin/child/modifys',                   
           data : formData,
       datatype : 'text',
       processData : false,
       contentType : false,
           success : function(result) {
              //console.log(result);
              alert('수정되었습니다.');
              location.reload();
           }
        });
});	

var $dropzone = $('#dropzone');
$dropzone.on("dragenter dragover", function(event) {
    event.preventDefault();
});

$dropzone.on("drop", function(event) {
    event.preventDefault();
    formData = new FormData();
     var file = event.originalEvent.dataTransfer.files[0];
     console.log(file);
    formData.append("file", file);
      console.log(formData);
    
       var reader = new FileReader();
        reader.onload =function (e) {
            $('#thumImg').attr('src', e.target.result);
       
    }
    
    reader.readAsDataURL(file);
    
});


$('.choicebtn').on('click', function(event){
	var childid = "child"+curcno;
	
	console.log(childid);
	console.log($("#"+childid).attr("src"));
	
    
	$("#briefInfo").attr("src",$("#"+childid).attr("src"));
	$("#childName").html($(".namediv").val());
	$("#childAge").html($(".age").val()+"세");
	$("#childLv").html($(".cleveldiv").val()+"급");
	
	 $.ajax({
	        type : 'get',
	        url : '/admin/child/Uread?cno='+curcno,                   
	        dataType : 'text',
	        success : function(result) {
	           child = $.parseJSON(result);  
	           var formDatas = new FormData();
	           formDatas.append("userid",child.userid);
	           formDatas.append("cno", child.cno);
	           $.ajax({
	               url : '/user/child/choice',
	               data : formDatas,
	               datatype : 'text',
	               processData : false,
	               contentType : false,
	               type : 'POST',
	               success : function(data) {
	                  alert('선택');
	                  //location.reload();
	               }
	            })
	        }
	     }); 
 });
 
$('.clevelselect').change(function(){
    
    var grade = $('.clevelselect option:selected').val() 
    selectorreload(grade);
  
});

var selectorreload = function(grade){
	      $.get("/hanza/gradecnt/"+grade,function(data){
	           var str = "";
	            for(var i=1; i<=data; i++){
	               str= str + '<option value="'+i+'">'+i+'</option>'
	            }
	            
	            $(".deepselect").html(str);
	          })
	      
	   }
	
</script>
<%@include file="/resources/include/footer.jsp"%>
</body>
</html>