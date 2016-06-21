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
#idchecker{
position: relative;border-bottom: 100px; left: 495px; bottom: 530px;
}
#emails{
position: relative; left: 345px; bottom: 35px;
}

</style>
<body>



<article class="container">
    <div class="page-header">
        <h1>회원가입 <small>user</small></h1>
    </div>

    <div class="col-md-6 col-md-offset-3">
        
            <div class="form-group">
                <label for="InputEmail">아이디</label> 
                <input type="text" class="form-control" name = "userid" id ="userid" placeholder="아이디">
            </div>
            
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" name = "userpw" id ="userpw" placeholder="비밀번호">
            </div>
            <div class="form-group">
                <label for="pass-check">비밀번호 확인</label>
                <input type="password" class="form-control" id ="pswCheck" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
                <label>이름</label>
                <input type="text" class="form-control" id ="username" name = "username" placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
                <label>휴대폰 번호</label>
                <div class="input-group">
                    <input type="text" class="form-control" id ="phonenumber" name = "phonenumber" placeholder="- 없이 입력해 주세요">

                </div>
            </div>
            <div class="form-group">
                <label>이메일</label>
                <div class="input-group">
                    <input type="text" class="form-control" id ="email"  name = "email" placeholder="이메일 아이디">
                    <select id = "emails" name = "email" class ="form-control">

        		 	<option value="@naver.com">@naver.com</option>
        		 	<option value="@gmail.com">@gmail.com</option>
        		 	<option value="@daum.net">@daum.net</option>
        		 	<option value="@nate.com">@nate.com</option>
        		 	<option value="@">이메일에 직접입력</option>
           			 </select>
                </div>
            </div>
            
              <div class="form-group" style="display:none" >
                <label> 구분</label>
          <select id = "gubun" name = "gubun" >
 
         <option value="u">u</option>
            </select>
                
            </div>
       
            
      
         
            <div class="form-group text-center">
                <button type="submit" class="btn btn-info" id = "register">회원가입<i class="fa fa-check spaceLeft"></i></button>
                <button class="btn btn-info" id = "cancle">취소<i class="fa fa-check spaceLeft"></i></button>
            </div>
        
         <button type="submit"  id="idchecker" class = "btn btn btn-danger col-lg-3 col-lg-offset-1">아이디체크<i class="fa fa-times spaceLeft"></i></button>
         </div>

</article>
      <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <script >

   var formData = new FormData();   

    
    $("#idchecker").on("click",function(e){
       var id =document.getElementById('userid').value;
       $.get("/admin/member/idchecker?userid="+id,function(data){
         if(data == 'possible'){
    	   alert("사용 가능한 아이디 입니다")
    	  
         }else{
        	 alert("존재 하는 아이디 입니다.")
         }
       })
    })
   
      $("#register").on("click", function(event){
         
    	if(confirm("회원가입 하시겠습니까?") == true){
         var pass =document.getElementById('userpw').value;
         var passCheck =document.getElementById('pswCheck').value;
         var temp = $("#email").val()
         var templist = temp.split("@")
         if(pass!=passCheck){
             alert('패스워드 다시입력');
         return false;
            }

         

         var email =  $("#email").val()+ $("#emails").val();
         if($("#emails").val()== "@"){

      	   if(templist.length == 2 && templist[1]){
      		 
      		 email =  $("#email").val();
      	   }else{
      		 alert('정확한 이메일을 입력하세요.');
      		   return false;
      		   
      	   }
      	   

            if(templist.length == 2 && templist[1]){
               alert(temp)
             email =  $("#email").val();
            }else{
             alert('정확한 이메일을 입력하세요.');
               return false;
               
            }
            

         }
       
         
         formData.append("userid", $("#userid").val());
           formData.append("userpw", $("#userpw").val());
           formData.append("username", $("#username").val());
           formData.append("phonenumber", $("#phonenumber").val());
   
         
         formData.append("email", email);
           formData.append("gubun", $("#gubun").val());
            console.log(formData);
           
         $.ajax({
               url : '/user/register',
               data : formData,
               datatype : 'text',
               processData : false,
               contentType : false,
               type : 'POST',
               success : function(data) {
                  alert("회원가입 축하드립니다!!");
                  location.href = "/";
               }
            })
       
    	}else{
    		alert("취소되었습니다.")
    	}
    	
      
      })
    
     
    $("#cancle").on("click", function(){
            location.href = "/";
         })
    
         
   
   </script>
   
   
   
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>