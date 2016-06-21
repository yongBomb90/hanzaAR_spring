var video, canvas, context, imageData, detector, cubecheck, audio,wrong,$grp, $circlediv;
    window.onload = onLoad;
    audio = new Audio("/resources/sound/effectsound.mp3")
    wrong = new Audio("/resources/sound/wrong.wav")
    var bgm = new Audio("/resources/sound/teambgm.mp3")
    var imglist = new Array();
    imglist.push("image/gif");
    imglist.push("image/jpeg");
    imglist.push("image/ief");
    imglist.push("image/tiff");
    imglist.push("image/png");
    var vdolist = new Array();
    vdolist.push("video/mpeg");
    vdolist.push("video/mp4");
    vdolist.push("video/x-msvideo");
    vdolist.push("video/x-sgi-movie");
    var mp3list = new Array();
    mp3list.push("audio/mpeg3");
    mp3list.push("audio/ogg");
    mp3list.push("audio/mp3");
    var internet = new Array();
    internet.push("internet");
    
   $grp = $("#grp");
    var grades = $grp.attr("cusid")
    console.log(grades)
    function onLoad() {
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
                	console.log(poinmarker.id+1)
                	console.log(grades)
                 	
                $.get("/msg/read/"+grades+","+(poinmarker.id+1), function (result) {//function는 콜백이다.
                	if(result){
                		if(poinmarker.id>100){
                			bgm.volume = 0.7;
                		bgm.play();
                		}
                			audio.play();
                		
                	movediv (result.filetype,result.savename,result.filename,result.content)
                	}
                	console.log(result)
                 });
                	cubecheck = true;
                }
                
        }
        else{
             cubecheck = false;
         }
   }
    function movediv (filetype,savename,filename,content) {
    	var str = "<h3>"+content+"<h3>";
    	var check = true;
    	console.log(filetype)
    	if(savename != 'msg'){
    	if(imglist.indexOf(filetype)!= -1){
    		str += "<img src='/msg/image?fileName="+savename+"' style = ' width='640' height='360''>";
    		check = false;
    	}
    	if(mp3list.indexOf(filetype)!= -1){
    		str += "<audio controls>"+
			"<source src='/msg/audio?fileName="+savename+"' type='"+filetype+"'/>"+
	    	"</audio>";
    		check = false;
		}
    	if(vdolist.indexOf(filetype)!= -1){
    		console.log("오디오")
    		str += "<video  width='640' height='360' controls='controls' autoplay ㅏ>"+
    			"<source src='/msg/video?fileName="+savename+"' type='"+filetype+"'/>"+
    	    	"</video>";
    		check = false;
    	}
    	if(internet.indexOf(filetype)!= -1){
    		console.log('인터넷')
    		window.open(content, 'newWindow');
    		check = false;
    	}
    	if(check){
    		console.log("다운")
    		self.location = "/msg/down?fileName="+savename+"&name="+filename;
        }
    	}
    	$grp.html(str)
    	
    }