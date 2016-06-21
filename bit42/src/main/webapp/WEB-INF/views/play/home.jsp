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

.block{
	height:200px;
	margin: 10px 0;
	vertical-align:middle;
}


</style>

</head>

<body style="height: 100%">

<div class="gray-bg">
    <div class="fof">
            <!-- 404 error -->
        <div class="container  error-inner wow flipInX animated" data-wow-animation-name="flipInX" style="visibility: visible; animation-name: flipInX;">
            <img src="/user/child/downimg?fileName=${childvo.s_imgpath}" style="border-radius: 100px;">
            <h1>${childvo.cname}</h1>
            <h3>${childvo.cage}세 </h3>
            <h4>${childvo.school}</h4>
            <p class="text-center">현재 아이는 ${childvo.clevel} 급 입니다</p>
            <button type="button"  id="start" class="btn btn-info btn-lg" > 현급수 시작하기</button>
            
             <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">급수선택하기</button>

 
        </div>
        <!-- /404 error -->
        </div>
    </div>
   
        
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">급수를 선택해주세요 </h4>
        </div>
        <div class="modal-body">
          	<c:forEach var = "idx" begin="3" end="8">
           	<div class="form-group ">
           	<center>
           	 <a class="btn btn-info" href="/play/card/${idx}">${idx}급수 시작하기</a>
           	 </center>
           	</div>
           	</c:forEach>
           
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
        
        
        
        
</body>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script type="text/javascript">
console.log("ssssss")
console.log("${childvo}")
console.log("${childvo}")
$(".gradebtn").on("click",function (event) {
	event.preventDefault()
	$('.modal').css({ "display":"block" });
	
})
$(".cancel").on("click", function(){
     $('.modal').css({ "display":"none" });
               
});
$("#start").on("click", function(){
	location.href = "/play/card/${childvo.clevel}";
              
});

</script>
</html>
<%@include file="/resources/include/footer.jsp"%>