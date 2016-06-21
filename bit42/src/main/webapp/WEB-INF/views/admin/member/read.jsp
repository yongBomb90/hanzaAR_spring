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
			회원정보 <small>관리자권한</small>
		</h1>
	</div>
	<div class="col-md-6 col-md-offset-3">
		
			<div class="form-group">
				<label for="InputEmail">아이디</label> <input type="text"
					class="form-control" name="userid" value="${MemberVO.userid}"
					placeholder="아이디" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="InputEmail"> 구분</label> <input type="text"
					class="form-control" name="userid" value="${MemberVO.gubun}"
					placeholder="아이디" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label> <input type="password"
					class="form-control" name="userpw" value="${MemberVO.userpw}" readonly="readonly"
					id="psw" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<label for="pass-check">비밀번호 확인</label> <input type="password"
					class="form-control" id="pswCheck" name="userpw"  readonly="readonly"
					placeholder="비밀번호 확인">
				<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" class="form-control" 
					name="username" value="${MemberVO.username}" readonly="readonly"
					placeholder="이름을 입력해 주세요">
			</div>
			<div class="form-group">
				<label>휴대폰 번호</label>
				<div class="input-group">
					<input type="tel" class="form-control" name="phonenumber" readonly="readonly"
						value="${MemberVO.phonenumber}" placeholder="- 없이 입력해 주세요">

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
			<input type="hidden" name="page" value="${cri.page}"> <input
				type="hidden" name="pageNum" value="${cri.pageNum}"> <input
				type="hidden" name='searchType' value="${cri.searchType}" id = "searchType"> <input
				type="hidden" name='keyword' value="${cri.keyword}" id = "keyword">
				<input type="hidden" name='sdate' value="${cri.sdate}" id = "sdate" >
			<div class="form-group text-center">
				
				<button type="submit" class="btn btn-warning" id ="cancle">
					돌아가기<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		
	</div>

	</article>
	  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
	<script>
	

   		 var sdate = $("#sdate").val();
	  var search = $("#searchtype").val();
	  var keyword = $("#keyword").val()
	
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
	  
	  
	  
	  
	 $("#cancle").on("click", function(){

			 if(sdate + search + keyword == ""){
		
			 location.href = "/admin/member/list?page=${cri.page}&pageNum=${cri.pageNum}";
			 }else if(sdate != ""){
				
				 location.href = "/admin/member/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&sdate=${cri.sdate}";
				 
			 }else if(search+keyword != ""){
				
				 location.href = "/admin/member/list?page=${cri.page}&pageNum=${cri.pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			 }
		
	      
	        })
	
	</script>



</body>
</html>
<%@include file="/resources/include/footer.jsp"%>