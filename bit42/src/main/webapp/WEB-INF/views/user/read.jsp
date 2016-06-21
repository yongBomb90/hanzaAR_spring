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

#emails{
position: relative; left: 345px; bottom: 35px;
}
</style>

<body>


<article class="container">
   <div class="page-header">
      <h1>
         회원수정 <small>user</small>
      </h1>
   </div>

   <div class="col-md-6 col-md-offset-3">

         <div class="form-group">
            <label for="InputEmail">아이디</label> <input type="text"
               class="form-control" name="userid" value="${MemberVO.userid}" id = "userid"
               placeholder="아이디" readonly="readonly">
         </div>
         <div class="form-group">
            <label for="password">비밀번호</label> <input type="password"
               class="form-control" name="userpw" value="${MemberVO.userpw}"
               id="userpw" placeholder="비밀번호" readonly="readonly">
         </div>
         <div class="form-group">
            <label for="pass-check">비밀번호 확인</label> <input type="password" value="${MemberVO.userpw}"
               class="form-control" id="pswCheck" value="${MemberVO.userpw}" 
               placeholder="비밀번호 확인" readonly="readonly">
            <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
         </div>
         <div class="form-group">
            <label>이름</label> <input type="text" class="form-control" id = "username"
               name="username" value="${MemberVO.username}"
               placeholder="이름을 입력해 주세요" readonly="readonly">
         </div>
         <div class="form-group">
            <label>휴대폰 번호</label>
            <div class="input-group">
               <input type="tel" class="form-control" name="phonenumber" id = "phonenumber"
                  value="${MemberVO.phonenumber}" placeholder="- 없이 입력해 주세요" readonly="readonly">

            </div>
         </div>
         <div class="form-group">
            <label>이메일</label>
            <div class="input-group">
               <input type="text" class="form-control" name="email" value="${MemberVO.email}" id = "email"
                  placeholder="이메일" readonly="readonly">
            
              <select id = "emails" name = "emails" class ="form-control" disabled>
                 <option value="@naver.com" >@naver.com</option>
                  <option value="@gmail.com" >@gmail.com</option>
                  <option value="@daum.net">@daum.net</option>
                  <option value="@nate.com">@nate.com</option>
                  <option value="@" >이메일에 직접입력</option>
                   </select>
            </div>
         </div>
         
         <button type="submit" class="btn btn-warning col-lg-3" id="btnModify"><span style="margin-right: 5px"></span>회원수정</button>
           <button type="submit"   class="btn btn-warning col-lg-3" id="savebtn" ><span style="margin-right: 5px"></span>저장</button>
            <button type="submit"   class="btn btn-primary col-lg-3" id="team42"><span style="margin-right: 5px"></span>돌아가기</button>
   </div>

      
          


   
         

   </article>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script>





$(document).ready(function(){

	   
	   var emailchecker = true;
	   var memberemail =  '${MemberVO.email}';
	   var $selectid = $("#emails")
	   var list = memberemail.split("@");
	   var sellist = $("option")
	   var temp = '@'+list[1];
	   for(var i=0; i<sellist.length; i++){
		   console.log($(sellist[i]).val());
		   if(temp == $(sellist[i]).val())
			  {
			    $(sellist[i]).attr( 'selected', 'selected' )
			    emailchecker= false;
			  }
	  }
	   if(emailchecker){
		   var past = $selectid.html();
		   past = past +'<option value="${MemberVO.email}" id = "${MemberVO.email}" selected = "selected">'+temp+'</option>'
		   $selectid.html(past);
	   }
	   console.log(list[0]);
	   console.log(list[1]);
	   $("#email").val(list[0]);
	  $("#savebtn").hide();

	  
	  $("#btnModify").on("click", function(){
	
		  if(confirm("수정페이지로 이동 하시겠습니까?") == true){
		  var inputlist = document.querySelectorAll('input')
		   for(var z=1; z<inputlist.length; z++){
		      
			   inputlist[z].readOnly = false;
		   }
		   $("#btnModify").hide();
		   $("#savebtn").show()
		   $("select")[0].disabled = false;
		  }else{
			  alert("취소되었습니다.")
		  }
		  });   
	
	
	$("#savebtn").on("click", function() {
		
		if(confirm("수정하시겠습니까?")== true){
		var formData = new FormData();
		   var pass =document.getElementById('userpw').value;
		   var passCheck =document.getElementById('pswCheck').value;
		   var temp = $("#email").val()
	         var templist = temp.split("@")
		     var emails = $("#email").val()+ $("#emails").val();
	         if(pass!=passCheck){
			    alert('패스워드 다시입력');
				return false;
			   }
	        
		
	         if($("#emails").val()== "@"){
	     
			   if(templist.length == 2 && templist[1]){
	      		 emails =  $("#email").val();
	      	   }else{
	      		 alert('정확한 이메일을 입력하세요.');
	      		   return false;
	      		   
	      	   }
			
				
	         }
		   
		   
	

	 	 formData.append("userid", $("#userid").val());
   		formData.append("userpw", $("#userpw").val());
   		formData.append("username", $("#username").val());
  		 formData.append("phonenumber", $("#phonenumber").val());
   		formData.append("email", emails);
   		
   		formData.append("gubun", $("#gubun").val());
   
   $.ajax({
       url : '/user/update',
       data : formData,
       datatype : 'text',
       processData : false,
       contentType : false,
       type : 'POST',
       success : function(data) {
          alert("수정되었습니다.");
         
          
          location.href = "/user/read";
       }
    })
	}else{
		alert("취소되었습니다.")
	}
	
	
	});



   
   $("#team42").on("click", function() {
 	
	   location.href = "/";
 	
   });

})

</script>




  
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>