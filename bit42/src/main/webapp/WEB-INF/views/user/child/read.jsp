<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


	<form id="data">
	
	<input type="hidden" name="cno" value="${childVO.cno }"/>

	이름<input type = "text" name ="cname" value ="${childVO.cname}" readonly="readonly">
	학겨<input type = "text" name ="school" value = "${childVO.school}" readonly="readonly">
	나이<input type = "text" name ="age" value = "${childVO.age}" readonly="readonly">
	급수<input type = "text" name ="clevel" value = "${childVO.clevel}" readonly="readonly">
	파일경로<input type = "text" name ="imgpath" value = "${childVO.imgpath}" readonly="readonly">

	<div class="filelist">
 	<img id='imgs' style="width: 100px; height: 100px" src="/user/child/downimg?fileName=${childVO.imgpath}">
 </div>
   </form>
   
   <div class="box-footer">
   	<button type="submit" class="btn-warning">Modify</button>
   	<button type="submit" cusmethod="post" cusid="/user/child/remove" class="btn-danger">Remove</button>
   	<button type="submit" class="list">List All</button>
   </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
   <script>
   $(document).ready(function () {
	   


	    $(".btn-warning").on("click",function () {
	        self.location="/user/child/modify?cno=${childVO.cno}";
	        
	    });

	    $(".btn-danger").on("click",function () {
	    	
	    	self.location="/user/child/remove?cno=${childVO.cno}";
	       
	    });

	    $(".list").on("click",function () {
	        self.location ="/user/child/listAll";
	    });
	})
   </script>
   
</body>
</html>