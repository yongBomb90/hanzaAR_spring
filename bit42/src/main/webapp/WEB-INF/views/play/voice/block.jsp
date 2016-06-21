<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/include/playheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>jQuery UI Effects - Effect demo</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <style>
        .ans{ width: 152px; height:227px;
            position:absolute;
            background-image: url("/resources/img/brick.jpg");
        }


        #container {
            border: solid;
            width: 760px; height: 454px;
            position: absolute;
            top: 300px;
            left: 600px;
            background-image: url("/resources/img/VoiceHideback.PNG");
        }
    </style>
</head>
<body>
<center>

    <a href='/play/voice/gradedepth/${grade},${deep}'><button class="btn btn-primary btn-lg gradebtn">단계선택으로 가기</button></a>
</center>
<div id="container" >
    <c:forEach var="what" items="${volist}">
        <div class="ans" customid = "${what.hanza} " cuslist =  "${what.mean}"></div>
    </c:forEach>
</div>

<select name="effects" id="effectTypes" hidden>
    <option value="explode">Explode</option>
</select>


<div class="modal modal3">
    <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
        <div class="modal-header">
            <h1 class="text-center">축하합니다  다음단계로 넘어가세요</h1>
        </div>
        <div class="modal-body">
            <center>
                <div class="form-group cancel" id="imgdiv" >
                    <img src="/resources/img/축하.gif">

                </div>
                <button class="btn btn-warning btn-lg nextlevelbtn" cusid='${grade}' cuslev='${deep}'>다음단계</button></a>

            </center>
        </div>
        <div class="modal-footer">
            <div class="col-md-12">
                <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
        </div>
    </div>
</div>

 <div class="modal modal3">
      <div class="modal-content col-md-6 col-md-offset-3"style="margin-top: 10%">
            <div class="modal-header">                
                <h1 class="text-center">축하합니다  다음단계로 넘어가세요</h1>
            </div>
            <div class="modal-body">
               <center>
                    <div class="form-group cancel" id="imgdiv" >
                     <img src="/resources/img/축하.gif">  
                    
        </div>
        <button class="btn btn-primary btn-lg nextlevelbtn" cusid='${grade}' cuslev='${deep}'>다음단계</button></a>
          
                     </center>
           
        </div>
        <div class="modal-footer">
            <div class="col-md-12">
                <button class="btn cancel"   data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
        </div>
        </div>


    </div>


<script>

	var winwid = document.body.clientWidth;
    var winwid = window.innerWidth
    var container = document.querySelector("#container");
    var leftsize = Math.ceil((winwid/2)-380);
    container.style.left = leftsize+"px"
    var listsize = "${volist.size()}"
    var correctcnt = 9;
    var elements = document.querySelectorAll(".ans")
    var map = new Map();
    for(var cnt=0; cnt<elements.length; cnt++){
        elements[cnt].style.top = 227*(cnt%2)+"px";
        elements[cnt].style.left = 152*(cnt%5)+"px";
    }
    var recognition = new webkitSpeechRecognition();// webkitSpeechRecognition는 webSpeechAPI 인터페이스를 가지고 있는 객체이다.
    recognition.lang = "ko-KR"; //lang은 언어를 설정하는 속성이다.
    var target;
    var check = false;
    var click = true;
    var last = "${page}";
    $(document).ready(function(targetid) {
        function runEffect() {
            var selectedEffect = $( "#effectTypes" ).val();
            var options = {};
            target.effect( selectedEffect, options, 500);
            correctcnt++;
            if(correctcnt >= listsize){

                $.get("/admin/child/stateup/${grade},${deep}", function(data){
                    if(data == "fail"){
                        alert("실패")
                    }else{
                        $('.modal3').css({ "display":"block" });
                        $.ajax({
                            url : "http://121.166.177.103:3667/push?token=${login.token}&childname=${clogin.cname}",
                            processData : false,
                            contentType : false,
                            type : 'GET',
                            success : function(data) {
                              // alert(data);
                              
                            },
                        	error : function(data){
                        		//alert(data);
                        	}
                         })
                
                        
                    }
                });

               
            }
        };//깨지는 효과

        $( "#container" ).click(function(event) {
            if(click) {
                target = $(event.target)
                targetsrc = target.attr("customid");
                if(targetsrc){
                    recognition.start();
                    target.css({"background-image": "url(/img/hanzaimgwb/"+targetsrc+")"});
                    click = false;
                }
            }
        });



        recognition.onresult = function(event) {
            var result = event.results[0][0].transcript;
            console.log("hanza : "+target.attr("customid"));
            console.log("result: "+event.results[0][0].transcript);
            console.log("result: "+event.results[0][0].transcript);
            var jungdab = target.attr("cuslist");
            jungdab = jungdab.replace(" ", "");
            result = result.replace(" ", "");
            console.log("jungdab: "+jungdab);
            if(jungdab == result){
                check = false;
                runEffect(target);
            }else{
            	check = false;
                runEffect(target);
                //check = true;
               //console.log("틀림");
            }
        }
        recognition.onend = function () {
            if(check) {
                recognition.start();
            }else{
                click = true;
            }
        }
    });
    $(".cancel").on("click", function(){
        console.log("cancel");
        $('.modal').css({ "display":"none" });

    });
    $(".nextlevelbtn").on("click", function(event){
        var grade = $(event.target).attr("cusid");
        var deep = $(event.target).attr("cuslev");
        $.get("/hanza/gradecnt/"+grade,function(data){
            if(data>deep){
                deep++;
                self.location="/play/voice/study/"+grade+","+deep;
            }else{
                if(grade !=3){
                    grade--
                    self.location="/play/voice/study/"+grade+",1";
                }else{
                    self.location="/play/voice/study/"+(grade)+","+(deep);
                }
            }

        });


    })
   $(".cancel").on("click", function(){
       console.log("cancel");
       $('.modal').css({ "display":"none" });
       
   });
   $(".nextlevelbtn").on("click", function(event){
      var grade = $(event.target).attr("cusid");
      var deep = $(event.target).attr("cuslev");
       $.get("/hanza/gradecnt/"+grade,function(data){
          if(data>deep){
             deep++;
             self.location="/play/voice/study/"+grade+","+deep;
          }else{
             if(grade !=3){
                grade--
             self.location="/play/voice/study/"+grade+",1";
             }else{
                self.location="/play/voice/study/"+(grade)+","+(deep);
             }
          }
          
       });
       
      
   })

</script>
</body>
</html>