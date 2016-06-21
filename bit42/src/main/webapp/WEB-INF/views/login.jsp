<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

    
     <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="self.close()">×</button>
                        <h1 class="text-center">Login</h1>
                    </div>
                    <div class="modal-body">
                        <form class="form col-md-12 center-block" action ="/loginPost" method = "post">
                            <div class="form-group">
                                <input type="text" class="form-control input-lg" placeholder="USERID" name = "userid" id ="userid">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control input-lg" placeholder="Password" name = userpw id = "userpw">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-lg btn-block" type = "submit" id = "login">Sign In</button>
                                <span class="pull-right"><a href="/user/register">Register</a></span>
                            </div>
                            <div>
                            <label>
                            <input type = "checkbox" name = "userCookie">Remember Me 
                            </label>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
    
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>


$(document).ready(function(){

   var logins = "${plogin}";
   if(logins){
      alert("${plogin}")
   }
   
   $(".btn").on("click", function(){
        console.log("cancel-----btn");
        $('.modal').attr('class', 'modal hide')
        location.href = "/";
     });   
   
   $(".close").on("click", function(){
        console.log("cancel");
        $('.modal').attr('class', 'modal hide')
        location.href = "/";
     });   
   
       
   }); 

</script>
</html>
<%@include file="/resources/include/footer.jsp"%>