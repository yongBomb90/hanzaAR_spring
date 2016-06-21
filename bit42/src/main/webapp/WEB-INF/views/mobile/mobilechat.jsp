<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
       <%@include file="/resources/include/mobileheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style> 
	.ball{
	margin-top: 3%
	}   
	.roommsg .about-testimonial-content  :before {
        background-color:#c1e2b3;
        top: -8px;
        content: "";
        display: block;
        height: 14px;
        left: 60px;
        position: absolute;
        transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        width: 15px;
        display: none\0/;
        _display: none;
    }
    .inroommsg{
    background-color: #c1e2b3;
    }
    .wismsgfrom .about-testimonial-content  :before {
        background-color:#f991ac;
        top: -8px;
        content: "";
        display: block;
        height: 14px;
        left: 60px;
        position: absolute;
        transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        width: 15px;
        display: none\0/;
        _display: none;
    }
     .inwismsgfrom{
    background-color: #f991ac;
    }
   .allmsg .about-testimonial-content  :before {
        background-color:#a991f9;
        top: -8px;
        content: "";
        display: block;
        height: 14px;
        left: 60px;
        position: absolute;
        transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        width: 15px;
        display: none\0/;
        _display: none;
    }
     .inallmsg{
    background-color: #a991f9;
    }
   
	.mymsg {
    margin-top: 55px;
    padding: 20px;
    position: relative;
     background-color: #b1b0b5;
      border-radius: 10px;
     text-align: center;
	}
	.mywmsg {
    margin-top: 55px;
    padding: 20px;
    position: relative;
     background-color: #f991ac;
      border-radius: 10px;
     text-align: center;
	}
	.mkroomresult {
    margin-top: 55px;
    padding: 20px;
    position: relative;
     background-color: #ef5c48;
      border-radius: 10px;
     text-align: center;
	}
	.roombtn {
    margin-left: 1%;
   
	}
	.userbtn {
    margin-left: 1%;
   
	}
	
</style>
</head>
<body style="height: 100%; width: 100%">
<div>
<ul class="slides about-flex-slides">

<div class="chatroomtitle about-testimonial boxed-style about-flexslider" style="height:300px; overflow-x:hidden;overflow-y:scroll; ">
</div>
</ul>
</div>

<div class="ctrdiv" style="width:100%; ">
<div class="input-group margin">
 <input type="text" class="form-control msgipt">
 <span class="input-group-btn">
 <button class="btn btn-info btn-flat sendbtn" type="button">보내기</button>
 </span>
</div>

<button class="btn btn-success rlistbtn">방리스트</button>
<button class="btn btn-success mvroombtn">방이동하기</button>
<button class="btn btn-success orderbtn">명령문</button>
<button class="btn btn-success ulistbtn">방유저목록</button>
<button class="btn btn-success alluserbtn">모든유저목록</button>
</div>

 <!-- Modal -->
  <div class="modal modal1">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
            <div class="modal-header">                
                <h1 class="text-center">방 리스트 </h1>
            </div>
            <div class="modal-body">
         			 <div class= "roomlist">
         			 
         			 </div>
         			 
         			 </div>
            <div class="modal-footer">
                <div class="col-md-12">
                	<button class="btn btn-success mkroombtn"  data-dismiss="modal" aria-hidden="true">방만들기</button>
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>
        
 <!-- Modal -->
  <div class="modal modal2">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
            <div class="modal-header">                
                <h1 class="text-center">명령어창 </h1>
            </div>
            <div class="modal-body">
         			 <div>
         			 
         			 	<span>
                   			귓속말
                 		 </span>
                 		 :: w/받는사람/메시지
                 	</div>
                 	<div>
         			 	<a href="#">
                   			외치기
                 		 </a>
                 		 :: !/메시지
                 	</div>
                 	<div>
         			 	<a href="#">
                   			방만들기
                 		 </a>
                 		 :: mk/방이름
                 	</div>
         			<div>
         			 	<a href="#">
                   			방이동
                 		 </a>
                 		 :: mv/방이동
                 	</div>
                 	<div>
         			 	<a href="#">
                   			방리스트
                 		 </a>
                 		 :: rlist
                 	</div>
         			 
         			 </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>
         <!-- Modal -->
  <div class="modal modal3">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
            <div class="modal-header">                
                <h1 class="text-center">유저 리스트 </h1>
            </div>
            <div class="modal-body userlist">
         			 
         			 </div>
         			 
         			 </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
            </div>
        </div>
        </div>
        
<script src="https://cdn.socket.io/socket.io-1.4.5.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<script>
	console.log("${clogin}")
	console.log("${login}")
    var chatdiv =  document.querySelector('.chatroomtitle');
    var ctrdiv =  document.querySelector('.ctrdiv');
    var height = Math.ceil((window.innerHeight-70) * 0.8);
    chatdiv.style.height=height+'px';
    var socket = io("http://121.166.177.103:3667/");
    var user = { userid:'${clogin.userid}',
                  childname:'${clogin.cname}',
                   school:'${clogin.school}',
                   room :'${clogin.school}',
                   grade:'${clogin.clevel}',
                   img:'${clogin.s_imgpath}',
                   token:'${login.token}'};
    socket.emit('login', user);
    document.querySelector(".sendbtn").addEventListener('click',function (event) {
        var inpmsg= document.querySelector('.msgipt').value;
        var arrinpmsg = inpmsg.split('/');
        console.log(arrinpmsg)
        console.log(arrinpmsg[0])
        console.log(arrinpmsg.length)
        
        switch (arrinpmsg[0]) {
        case 'rlist'    :
            if(arrinpmsg.length >= 1){
            	socket.emit('rooomlist',user);
                break;
            }
        case '!'   :
            if(arrinpmsg.length >= 2){
            	console.log("!걸림")
            	  user.msg = arrinpmsg[1];
                  socket.emit('allmsg', user);
                  break;
            }
        case 'mk'  :
            if(arrinpmsg.length >= 2){
            	console.log("mk걸림")
            	 user.mkroom= arrinpmsg[1];
                 socket.emit('mkroom', user);
                 break;
			}
        case 'mv'  :
            if(arrinpmsg.length >= 2){
            	console.log("mv걸림::"+arrinpmsg[1])
            	user.mvroom = arrinpmsg[1];
            	user.msg = user.userid+"가 방을 나갔습니다";
            	socket.emit('mvroom', user);
            	break;
            }
        case 'w'    :
            if(arrinpmsg.length >= 3){
            	console.log("w걸림")
            	user.msg = arrinpmsg[2];
                user.to = arrinpmsg[1];
                socket.emit('wismsgto',user);
                break;
            }
       
        default :
        	console.log("default걸림")
        	user.msg = inpmsg;
        	socket.emit('message', user);
            break;
    }

       	
    })
 
    document.querySelector(".alluserbtn").addEventListener('click',function (event) {
         socket.emit('alluser', user);
    })
    
    document.querySelector(".ulistbtn").addEventListener('click',function (event) {
    	socket.emit('rooomuserlist',user);
    })
     document.querySelector(".rlistbtn").addEventListener('click',function (event) {
    	socket.emit('rooomlist',user);
    })
    document.querySelector(".mkroombtn").addEventListener('click',function (event) {
        document.querySelector('.msgipt').value = "mk/";
        $('.modal').css({ "display":"none" });
    })
    document.querySelector(".mvroombtn").addEventListener('click',function (event) {
        user.mvroom = document.querySelector('.msgipt').value;
        document.querySelector('.msgipt').value = "mv/"
       
    })
   $(".orderbtn").on('click',function (event) {
    	$('.modal2').css({ "display":"block" }); 
    })
    
     $(".cancel").on("click", function(event){
	          $('.modal').css({ "display":"none" });
	   });
    $(".roomlist").on("click", function(event){
    	var roomname = $(event.target).attr('cusid');
    	user.mvroom = roomname;
    	user.msg = user.userid+"가 방을 나갔습니다";
        socket.emit('mvroom', user);
        $('.modal').css({ "display":"none" });
     });
    $(".userlist").on("click", function(event){
    	var name = $(event.target).attr('cusid');
    	document.querySelector('.msgipt').value = "w/"+name+"/"
    	$('.modal').css({ "display":"none" });
     });
    socket.on('rooomuserlist', function (data) {
    	var userlist = document.querySelector('.userlist');
    	var str = "";
    	 for(var i = 0; i<data.length; i++){
        	console.log(data[i])
        	if(data[i] == user.userid){
        		str = str + "<button class='btn btn-warning userbtn'  cusid = '"+data[i]+"' >"+data[i]+"</button>";
            }else{
        	str = str + "<button class='btn btn-primary userbtn'  cusid = '"+data[i]+"' >"+data[i]+"</button>";
        	}
        }
    	$(userlist).html(str);
    	$('.modal3').css({ "display":"block" });
    });
    socket.on('visit', function (data) {
        chatdiv.innerHTML=chatdiv.innerHTML+'<center><li>'+data+'방에 입장하였습니다'+'</li></center>'
        user.room = data;
        user.msg = user.userid+'가 입장하였습니다';
        socket.emit('visit', user);
    });
    socket.on('roommsg', function (data) {
    	console.log(data)
    	if(data.userid == user.userid){
    		 var msgli =  document.createElement("li");
    		var typediv =  document.createElement("div");
    		 var msgdiv =  document.createElement("div");
        	  $(msgdiv).addClass('in'+data.type);
        	 var msgp =  document.createElement("p");
        	  $(msgp).html('<div style=" text-align: right;">'+data.msg+'<div>');
        	 msgdiv.appendChild(msgp);
        	 msgli.appendChild(msgdiv);
        	 typediv.appendChild(msgli);
        	 $(typediv).addClass("mymsg");
        	 $(typediv).addClass("ball");
        	 chatdiv.appendChild(typediv);
    	}else{
    	 data.type = 'roommsg'
    	 var ball = mkmsgarea(data);
         chatdiv.appendChild(ball);
    	}
    });
    socket.on('rooomlist', function (data) {
    	
    	var roomlist = document.querySelector('.roomlist');
    	var str = "";
    	 for(var i = 0; i<data.length; i++){
        	console.log(data[i])
        	str = str + "<button class='btn btn-primary roombtn'  cusid = '"+data[i]+"' >"+data[i]+"</button>";
        }
    	$(roomlist).html(str);
    	$('.modal1').css({ "display":"block" }); 
    })
    socket.on('mkroomresult', function (data) {
    	 var msgli =  document.createElement("li");
 		var typediv =  document.createElement("div");
 		 var msgdiv =  document.createElement("div");
     	  $(msgdiv).addClass('in'+data.type);
     	 var msgp =  document.createElement("p");
     	  $(msgp).html('<div style=" text-align: right;">'+data.msg+'<div>');
     	 msgdiv.appendChild(msgp);
     	 msgli.appendChild(msgdiv);
     	 typediv.appendChild(msgli);
     	 $(typediv).addClass("mkroomresult");
     	 $(typediv).addClass("ball");
     	 chatdiv.appendChild(typediv);
    })
    socket.on('mvroomresult', function (data) {
    	 var msgli =  document.createElement("li");
  		var typediv =  document.createElement("div");
  		 var msgdiv =  document.createElement("div");
      	  $(msgdiv).addClass('in'+data.type);
      	 var msgp =  document.createElement("p");
      	  $(msgp).html('<div style=" text-align: right;">'+data.msg+'<div>');
      	 msgdiv.appendChild(msgp);
      	 msgli.appendChild(msgdiv);
      	 typediv.appendChild(msgli);
      	 $(typediv).addClass("mkroomresult");
      	 $(typediv).addClass("ball");
      	 chatdiv.appendChild(typediv);
    })
    socket.on('wismsgfrom', function (data) {
    	if(data.userid == user.userid){
   		 var msgli =  document.createElement("li");
   		var typediv =  document.createElement("div");
   		 var msgdiv =  document.createElement("div");
       	  $(msgdiv).addClass('in'+data.type);
       	 var msgp =  document.createElement("p");
       	  $(msgp).html('<div style=" text-align: right;">'+data.msg+'<div>');
       	 msgdiv.appendChild(msgp);
       	 msgli.appendChild(msgdiv);
       	 typediv.appendChild(msgli);
       	 $(typediv).addClass("mywmsg");
       	 $(typediv).addClass("ball");
       	 chatdiv.appendChild(typediv);
   	}else{
   		data.type = 'wismsgfrom'
   	   	 	var ball = mkmsgarea(data);
   	        chatdiv.appendChild(ball);
   	}
    	
    })
    socket.on('allmsg', function (data) {
    	console.log(data)
   	 	data.type = 'allmsg'
   	 	var ball = mkmsgarea(data);
        chatdiv.appendChild(ball);
    })
    
    var mkmsgarea = function(data){
    	 var typediv =  document.createElement("div");
    	 var msgli =  document.createElement("li");
    	 var imgdiv =  document.createElement("div");
    	 $(imgdiv).addClass("about-testimonial-image");
    	 $(imgdiv).html('<img  src="/user/child/downimg?fileName='+data.img+'">');
    	 var atag =  document.createElement("a");
    	 $(atag).addClass("about-testimonial-author");
    	 $(atag).html(data.childname);
    	 var childspan  =  document.createElement("span");
    	 $(childspan).addClass("about-testimonial-company");
    	 $(childspan).html(data.userid);
    	 var msgdiv =  document.createElement("div");
    	 $(msgdiv).addClass('about-testimonial-content');
    	  $(msgdiv).addClass('in'+data.type);
    	 var msgp =  document.createElement("p");
    	 $(msgp).addClass("about-testimonial-quote");
    	 $(msgp).html(data.msg);
    	 msgdiv.appendChild(msgp);
    	 msgli.appendChild(imgdiv);
    	 msgli.appendChild(atag);
    	 msgli.appendChild(childspan);
    	 msgli.appendChild(msgdiv);
    	 typediv.appendChild(msgli);
    	 $(typediv).addClass(data.type);
    	 $(typediv).addClass("ball");
    	 return typediv;
    	 
    }


</script>
</body>
<%@include file="/resources/include/mobilefooter.jsp"%>
</html>