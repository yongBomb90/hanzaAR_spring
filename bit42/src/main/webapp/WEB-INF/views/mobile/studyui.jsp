<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resources/include/playheader.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/css/studyui.css" rel="stylesheet">
</head>
<body>
<a href="/mobile/gradedepth/${past},${depth}">
<img src="/resources/img/home.png" style="position: absolute; left: 0px; top: 0px; width: 100px; height: 100px; margin-left: 35%; margin-top: 60%">
</a>


<div class="container" style="margin-top: 50%">
    <div id="carousel">
     <c:forEach var="hanzavo" items="${list}">
      <figure><img class="hanza" src="/img/playhanzabimg/${hanzavo.hanza}" alt="" cusid = '${hanzavo.hanza}'></figure>
    </c:forEach>
      </div>
</div>

  <div class="modal modal3">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
            <div class="modal-header">                
                <h1 class="text-center">한자 </h1>
            </div>
            <div class="modal-body">
            
                    <div class="form-group cancel" id="imgdiv" >
                               </div>
                       <div class="form-group" id="rhanzameaninput">
                              </div>      
                    <div class="form-group" id="writecntinp" >
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
<script>
	  $(".hanza").on("click",function (event) {
    	 var idx = $(event.target).attr("cusid");
    	 $.get("/hanza/read/"+idx, function(data){
		 console.log(data)
		           $('.modal3').css({ "display":"block" });
		          $('#rhanzameaninput').html("<center><h1>"+data.mean+"</h1></center>")
		           $('#writecntinp').html("<center>획수 : "+data.writecount+"</center>")
		            $('#imgdiv').html("<center><img  src='/img/playhanzabimg/"+data.hanza+"'></center>")
		      });
		       
    	 
     });
	  $(".cancel").on("click", function(){
	       console.log("cancel");
	       $('.modal').css({ "display":"none" });
	       
		});

	  
	

</script>
</body>
</html>