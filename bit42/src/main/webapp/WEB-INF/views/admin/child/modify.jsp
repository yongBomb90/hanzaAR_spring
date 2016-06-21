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
  blockquote{
    border-left:none
}

.quote-badge{
    background-color: rgba(0, 0, 0, 0.2);   
}

.quote-box{
    
    overflow: hidden;
    margin-top: -50px;
    padding-top: -100px;
    border-radius: 17px;
    background-color: #4ADFCC;
    margin-top: 25px;
    color:white;
    width: 425px;
    box-shadow: 2px 2px 2px 2px #E0E0E0;
    
}

.quotation-mark{
    
    margin-top: -10px;
    font-weight: bold;
    font-size:30px;
    color:white;
    font-family: "Times New Roman", Georgia, Serif;
    
}
  
</style>
<body>

<article class="container">
    <div class="page-header">
        <h1>회원가입 <small>관리자권한</small></h1>
    </div>
    <div class="col-md-6 col-md-offset-3">
           
           
            <div class="form-group">
                <input type="hidden" class="form-control" id = "userid" value="${MemberVO.userid}" readonly="readonly">
            </div>
            <div class="form-group">
                <label >자녀 이름</label>
                <input type="text" class="form-control" id ="cname" value="${ChildVO.cname}" >
            </div>
             <div class="form-group">
                <label >자녀 학교</label>
                <input type="text" class="form-control" id ="school" value="${ChildVO.school}" >
            </div>
              <div class="form-group">
                <label >자녀 나이</label>
                <input type="text" class="form-control" id ="age" value="${ChildVO.age}" >
            </div>
              <div class="form-group">
                <label >자녀 급수</label>
                <input type="text" class="form-control" id ="clevel" value="${ChildVO.clevel}" >
            </div>
              <div class="form-group">
                <label >단계 선택</label>
                <input type="text" class="form-control" id ="deep" value="${ChildVO.deep}" >
            </div>
            
            <input type="hidden" name="page" value="${cri.page}" id = "page"> 
			<input type="hidden" name="pageNum" value="${cri.pageNum}" id = "pagenum"> 
			<input type="hidden" name='searchType' value="${cri.searchType}" id = "searchtype"> 
				<input type="hidden" name='keyword' value="${cri.keyword}" id = "keyword">
			<input type="hidden" name='sdate' value="${cri.sdate}" id = "sdate">
             
             <div class="container" id="dropzone">
             
    <blockquote class="quote-box">
      <p class="quotation-mark">File Drop Here</p><br><br><br><br><br><br><br><hr>
     
      imgname<input type="text" id = "imgname" readonly>
      
       
    </blockquote>
			
		</div>

          
            <div class="form-group text-center">
               <button id="regbtn" class="btn btn-info" data-idx="${ChildVO.cno}">수정<i class="fa fa-check spaceLeft"></i></button>
                <button  id="regcan" class="btn btn-warning">취소<i class="fa fa-times spaceLeft"></i></button>
                
            </div>
      </div>
</article>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<script>
    var $btn = $("#regbtn");
    var $imgname = $("#imgname");
    var $dropzone = $('#dropzone');
    var formData = new FormData();
	
     var sdate = $("#sdate").val();
	  var search = $("#searchtype").val();
	  var keyword = $("#keyword").val()
    $(document).ready(function() {

        $dropzone.on("dragenter dragover", function(event) {
            event.preventDefault();
        });

        $dropzone.on("drop", function(event) {
            event.preventDefault();
             var file = event.originalEvent.dataTransfer.files[0];
            formData.append("file", file);
              console.log(formData);
            $imgname.val(file.name);

			var reader = new FileReader();
			reader.onload = function(e) {
				$('#c_img').attr('src', e.target.result);
				$('#c_img').attr('class', 'thumbnail');
				//console.log(e.target.result)
			}
		});

		$btn.on("click", function(event) {
            var cno = $(event.target).attr("data-idx");
            var cname = $("#cname").val();
             var school = $("#school").val();
             var age = $("#age").val();
             var clevel = $("#clevel").val();
             var deep = $("#deep").val();
         	var page = $("#page").val();
         	var pagenum = $("#pagenum").val();
             var sdate = $("#sdate").val();
			  var search = $("#searchtype").val();
			  var keyword = $("#keyword").val()
             
             console.log(cno);
			console.log(cname);
			console.log(school);
			console.log(age);
			console.log(clevel);
			console.log(deep);
			
			formData.append("cname", cname);
			formData.append("school", school);
			formData.append("age", age);
			formData.append("clevel", clevel);
			formData.append("deep", deep);
			formData.append("cno", cno);
			
			formData.append("page", page);
			formData.append("pagenum", pagenum);
		
	
			formData.append("sdate", sdate);
			formData.append("searchtype", search);
			formData.append("keyword", keyword);
	
			console.log(formData);
			$.ajax({
				url : '/admin/child/modifys',
				data : formData,
				datatype : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					alert(data);
					

       			 if(sdate + search + keyword == ""){
       				
       				 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}";
       				 }else if(sdate != ""){
       					
       					 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}";
       					 
       				 }else if(search+keyword != ""){
       				
       					 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
       				 }
				
				
				}
			})
		});
		 $("#regcan").on("click", function(){
				
			 if(sdate + search + keyword == ""){
				
			 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}";
			 }else if(sdate != ""){
						
				 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}";
				 
			 }else if(search+keyword != ""){
					
				 location.href = "/admin/child/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			 }
		
	      
	        })

	});
</script>
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>