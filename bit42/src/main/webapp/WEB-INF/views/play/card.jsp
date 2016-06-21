<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<body style="text-align: center; font-family: monospace; background-color: #2E2E2E;">
<%@include file="/resources/include/playheader.jsp"%>
<style>
    #particles-js {
        position: absolute;
        width: 100%;
        height: 100%;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: 50% 50%;
        z-index: -990;
    }
</style>
<div id="grp" cusid ="${grade}" ></div>
<button class="btn btn-warning col-lg-1 readbtn" id="bgmbtn" style=" position: absolute; left: 0px; top: 0px; z-index: 1000;"> <span style="margin-right: 5px"></span>음악</button> <!--bgm player-->
<div id="particles-js"></div><!--snow 효과주는 js-->
<div id="outer" style="position: absolute; left: 0px; top:0px; z-index: -1000 "></div><!--하늘 효과주는 js-->
	<canvas id="stage" width="500" height="100" style=" position: absolute; left: 0px; top: 0px" ></canvas>
	 <div class="textdiv">
    <canvas id="text" width="500" height="500" style="position: absolute; left: 0px; top: 0px"></canvas>
    </div>
     <video id="video" autoplay="true" style="display:none;"></video><!-- webcam video-->
    <canvas id="canvas" style="width:640px; height:420px;  border-radius: 100px; "></canvas><!--웹캠띄우는 canvas-->
<script src = "/resources/css/cardfile.js"></script>
<script type="text/javascript">
console.log("${grade}")

$(".textdiv").hide();
var bgm = new Audio("/resources/sound/bgm.mp3")
$("#bgmbtn").on("click",function (event) {
	bgm.volume = 0.1;
    if(bgm.currentTime != 0){
        bgm.pause();
        bgm.currentTime = 0;
    }else{
        bgm.play();
    }
})
</script>
</body>
</html>