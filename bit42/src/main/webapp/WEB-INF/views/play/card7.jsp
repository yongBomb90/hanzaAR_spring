<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<body style="text-align: center; font-family: monospace; background-color: #FFFFFF;">
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
<div class="circlediv">
    <canvas id="c" style="display: block;
        position: absolute;
        left: 0px; top: 0px;
        width: 100%;
        height: 100%;
        z-index: -990;"></canvas>
</div>

<div id="grp" cusid ="${grade}" ></div>
<div id="outer" style="position: absolute; left: 0px; top:0px; z-index: -1000 "></div><!--하늘 효과주는 js-->

<button class="btn btn-warning col-lg-1 readbtn" id="bgmbtn" style=" position: absolute; left: 0px; top: 0px; z-index: 1000;"> <span style="margin-right: 5px"></span>음악</button> <!--bgm player-->
	<canvas id="stage" width="500" height="100" style=" position: absolute; left: 0px; top: 0px" ></canvas>
	 <div class="textdiv">
    <canvas id="text" width="500" height="500" style="position: absolute; left: 0px; top: 0px"></canvas>
    </div>
     <video id="video" autoplay="true" style="display:none;"></video><!-- webcam video-->
    <canvas id="canvas" style="margin-top: 15%;width:640px; height:420px;  border-radius: 100px; "></canvas><!--웹캠띄우는 canvas-->
<script type="text/javascript">

var video, canvas, context, imageData, detector, cubecheck, audio,wrong,$grp, $circlediv;
window.onload = onLoad;
audio = new Audio("/resources/sound/effectsound.mp3")
wrong = new Audio("/resources/sound/wrong.wav")
$circlediv = $('.circlediv');

$grp = $("#grp");
var grades = $grp.attr("cusid")
console.log(grades)
function onLoad() {
	$circlediv.hide();
    cubecheck = false;
     video = document.getElementById("video");//웹캠
    canvas = document.getElementById("canvas");//캔버스
    context = canvas.getContext("2d"); //2D 드로잉 컨텍스트를 가져온다.
    canvas.width = parseInt(canvas.style.width);//넓이(X)
    canvas.height = parseInt(canvas.style.height);//높이(Y)
   
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;//웹캠사용 코드
     if (navigator.getUserMedia){
        function successCallback(stream){
            if (window.webkitURL) {
                video.src = window.webkitURL.createObjectURL(stream);
            } else if (video.mozSrcObject !== undefined) {
                video.mozSrcObject = stream;
            } else {
                video.src = stream;
            }
        }
        function errorCallback(error){
            console.log("The following error occured: " + error);
        }
        navigator.getUserMedia({video: true}, successCallback, errorCallback); //----- webcam
        detector = new AR.Detector(); //aruco.js에 있는 AR.Detector 객체 생성
        colorparticle.init();
         requestAnimationFrame(tick);
     }
}//onload end
function snapshot(){ //웹캠을 캔버스에 그려주는 함수
    context.drawImage(video, 0, 0, canvas.width, canvas.height);
    imageData = context.getImageData(0, 0, canvas.width, canvas.height);
}
function tick(){
    requestAnimationFrame(tick);
       if (video.readyState === video.HAVE_ENOUGH_DATA){
        snapshot();
        var markers = detector.detect(imageData); // aruco.js
        drawId(markers); // 마커의 id를 그려주고, 큐브를 돌림*/
       }
}
var id = 1;
function drawId(markers){
    var poinmarker,corners, corner, x, y, i, j;
    context.strokeStyle = "blue";
    context.lineWidth = 1;
    if(markers.length != 0) {
            poinmarker =  markers[0];
            corners = markers[0].corners;
          	x = Infinity;
            y = Infinity;
            for (j = 0; j !== corners.length; ++j) {
                corner = corners[j];
                x = Math.min(x, corner.x);
                y = Math.min(y, corner.y);
            }
            context.strokeText(poinmarker.id, x, y);
            
            
            if(!cubecheck) {
            	
             $.get("/hanza/marker/"+grades+","+(poinmarker.id+1), function (result) {//function는 콜백이다.
            	 if(result){
            	 threejsCube.cube("/img/hanzabimg/"+result.hanza);
            	 colorparticle.createText( result.hanza+" "+result.mean);
            	 colorparticle.domarkertext( result.hanza+" "+result.mean);
            	 audio.play();
            	 $circlediv.show();
            	 }
            	 else{
            		 wrong.play();
            	 	 colorparticle.createText( "잘못된마커");
                	 colorparticle.domarkertext( "잘못된마커");
            	 }
             });
            cubecheck = true;
            }
            movediv(x +document.querySelector("#canvas").offsetLeft-200, y+document.querySelector("#canvas").offsetTop-200 );
    }
    else{
        threejsCube.erase()
        cubecheck = false;
       
        $circlediv.hide();
    }
}
function movediv (x,y) {
    $("#grp").css({
        "position" : "absolute",
        "top" : y + "px",
        "left" : x + "px"
    });
    
}
</script>
<script src = "/resources/css/circleshow.js"></script>
<script type="text/javascript">

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