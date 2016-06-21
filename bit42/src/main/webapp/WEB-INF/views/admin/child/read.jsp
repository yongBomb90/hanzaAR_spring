<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="/resources/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#file{
		width: 300px;
		heigh: 100px;
	}
</style>
<body>


	<form role="form" method="post">
	             <input type="hidden" name="cno" value="${childVO.cno }"/>
           <input type="hidden" name="page" value="${cri.page }"/>
           <input type="hidden" name="pageNum" value="${cri.pageNum }"/>
	</form>
	<form id="data" >
	
	<article class="container">
    <div class="page-header">
        <h1>회원가입 <small>관리자권한</small></h1>
    </div>
    <div class="col-md-6 col-md-offset-3">
           
           

           
           
            <div class="form-group">
            <label >부모 아이디</label>
                <input type="text" class="form-control" id = "userid" value="${childVO.userid}" readonly="readonly">
            </div>
            <div class="form-group">
                <label >자녀 이름</label>
                <input type="text" class="form-control" id ="cname" value ="${childVO.cname}" readonly="readonly">
            </div>
             <div class="form-group">
                <label >자녀 학교</label>
                <input type="text" class="form-control" id ="school" value ="${childVO.school}" readonly="readonly">
            </div>
              <div class="form-group">
                <label >자녀 나이</label>
                <input type="text" class="form-control" id ="age" value ="${childVO.age}" readonly="readonly">
            </div>
              <div class="form-group">
                <label >자녀 급수</label>
                <input type="text" class="form-control" id ="clevel" value ="${childVO.clevel}" readonly="readonly">
            </div>
              <div class="form-group">
                <label >단계 선택</label>
                <input type="text" class="form-control" id ="deep" value ="${childVO.deep}" readonly="readonly">
            </div>
            
            <div class="form-group filelist" style="text-align: center">
 			<img class="center-block" id='imgs' style="width: 100px; height: 100px" src="/admin/child/downimg?fileName=${childVO.imgpath}">
 			</div>
 
 <input type="hidden" name="page" value="${cri.page}"> <input
				type="hidden" name="pageNum" value="${cri.pageNum}"> <input
				type="hidden" name='searchType' value="${cri.searchType}" id = "searchType"> <input
				type="hidden" name='keyword' value="${cri.keyword}" id = "keyword">
				<input type="hidden" name='sdate' value="${cri.sdate}" id = "sdate" >
 
 <div class="form-group" style=" text-align: center ">
   	<input type="button" class="btn-warning" value="Modify">
   	<input type="button"  cusmethod="post" cusid="/admin/child/remove" class="btn-danger" value="Remove">
   	<input type="button" class="btn-info" id="list" value="List All">
   </div>
 </div>
            </article>
	
	<%-- <input type="hidden" name="cno" value="${childVO.cno }"/>

	이름<input type = "text" name ="cname" value ="${childVO.cname}" readonly="readonly">
	학겨<input type = "text" name ="school" value = "${childVO.school}" readonly="readonly">
	나이<input type = "text" name ="age" value = "${childVO.age}" readonly="readonly">
	급수<input type = "text" name ="clevel" value = "${childVO.clevel}" readonly="readonly">
	파일경로<input type = "text" name ="imgpath" value = "${childVO.imgpath}" readonly="readonly"> --%>

	
   </form>
   
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
   <script>
   var formData = new FormData();

   $(document).ready(function () {
	   var formObj = $("form[role='form']");
	   var sdate = $("#sdate").val();
		  var search = $("#searchtype").val();
		  var keyword = $("#keyword").val() ;
		  

	    $(".btn-warning").on("click",function () {
	        self.location="/admin/child/modify?cno=${childVO.cno}&page=${Cri.page}";
	        
	        
	    });

	    $(".btn-danger").on("click",function () {
	  
	    	
			  $.ajax({
					
			  		url : "/admin/child/remove?cno=${childVO.cno}&userid=${childVO.userid}",
					type : 'DELETE',
					success : function(data) {
						alert(data)
						self.location ="/admin/child/list?&page=${Cri.page}"; 
					}
				})
	    	
	    });

	    $("#list").on("click",function () {

			 if(sdate + search + keyword == ""){
			
			 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}";
			 }else if(sdate != ""){
					
				 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}";
				 
			 }else if(search+keyword != ""){
				
				 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			 }
	    });
	})
   </script>
   
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>