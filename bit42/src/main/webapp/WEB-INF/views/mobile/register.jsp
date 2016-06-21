<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/resources/include/mobileheader.jsp"%>
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
        <h1>자녀 등록 <small>일반 사용자</small></h1>
    </div>
    <div class="col-md-6 col-md-offset-3">
           
           
            <div class="form-group">
            <label >부모 id</label>
                <input type="text" class="form-control" id = "userid"  value="${MemberVO.userid }" readonly="readonly">
            </div>
            <div class="form-group">
                <label >자녀 이름</label>
                <input type="text" class="form-control" id ="cname" placeholder="자녀의 이름을 입력해주세요">
            </div>
             <div class="form-group">
                <label >자녀 학교</label>
                <input type="text" class="form-control" id ="school" placeholder="자녀의 학교를 입력해주세요">
            </div>
              <div class="form-group">
                <label >자녀 나이</label>

                <input type="date" class="form-control" id ="age" placeholder="자녀의 나이를 입력해주세요">           
             </div>
             
             
              <div class="form-group">
                <label >자녀 급수</label>
               

                
                  <select class="clevelselect form-control select" name="searchType">
	               <option value="8">8</option>
	               <option value="7">7</option>
	               <option value="6">6</option>
	               <option value="5">5</option>
	               <option value="4">4</option>
	               <option value="3">3</option>
                  </select>
                
            </div>
              <div class="form-group">

                <label >단계 선택</label>                
                 <select name="depthsel" class="deepselect form-control" > </select>                 
            </div>
            
  			
            <div class="form-group text-center">
                <button id="regbtn" class="btn btn-info">자녀 추가<i class="fa fa-check spaceLeft"></i></button>
                <button id="regcan" class="btn btn-warning">취소<i class="fa fa-times spaceLeft"></i></button>
                
            </div>
      </div>
</article>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

<script>
	

    var $btn = $("#regbtn");
    var $imgname = $("#imgname");
    var $dropzone = $('#dropzone');
    var formData = new FormData();
    $(document).ready(function() {
    	
    	var gstr ;
    	
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
    		      
    		   };
    	
    	$.get("/hanza/gradecnt/8",function(data){
    		
    	    var str = "";
    	     for(var i=1; i<=data; i++){
    	        str= str + '<option value="'+i+'">'+i+'</option>'
    	     }
    	     
    	     $(".deepselect").html(str);
    	     
    	   })
    	

   
        
        $btn.on("click", function(event) {
       
         formData.append("userid", $('#userid').val());
         formData.append("cname", $("#cname").val());
         formData.append("school", $("#school").val());
         
         formData.append("age", $("#age").val());
       
         formData.append("clevel", $('.clevelselect').val());
         formData.append("deep", $('.deepselect').val());
         
         console.log(formData);
         
          $.ajax({
            url : '/mobile/child/register',
            data : formData,
            datatype : 'text',
            processData : false,
            contentType : false,
            type : 'POST',
            success : function(data) {
               alert(data);
               location.href = "/mobile/childlist/0";
            },
            error :function(data){
         	   formData.delete("userid");
         	   formData.delete("title");
         	   formData.delete("content");
            }
         })
         
      });
        
        $("#regcan").on("click", function() {
        	
           location.href = "/mobile/childlist/0";
           
      });

    });



</script>
</body>
</html>
<%@include file="/resources/include/mobilefooter.jsp"%>