<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/../resources/include/header.jsp"%>
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

	<div class="col-lg-5 col-lg-offset-4">
		<h2 id="tables-striped">REGISTER MARKER</h2>
<div class="container fileDrop">
    <blockquote class="quote-box">
      <p class="quotation-mark">File Drop Here</p><br><br><br><br><br><br><br><hr>
      <div class="blog-post-actions filelist">
        <img id='imgs' style="width: 100px; height: 100px" src="">
				<div class="filename"></div>
      </div>
    </blockquote>
			<button id=btn class=btn-primary>등록</button>
		</div>
</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
	<script>
    var filename = "";
    var formData;
    var str="";

    $(document).ready(function() {

        $(".fileDrop").on("dragenter dragover", function(event) {
            event.preventDefault();
        });

        $(".fileDrop").on("drop", function(event) {
            event.preventDefault();
            formData = new FormData();
            var files = event.originalEvent.dataTransfer.files;
            formData.append("files", files[0]);
            console.log(formData);
           
            $(".filename").html(files[0].name+"    <a href='', data-src="+files[0].name+">X</a>");
        

					  var reader = new FileReader();
            reader.onload =function (e) {
                $('#imgs').attr('src', e.target.result);
            }
            reader.readAsDataURL(files[0]);

        });

        $("#btn").on("click", function(event) {

            $.ajax({
                url : '/admin/marker/register',
                data : formData,
                datatype : 'text',
                processData : false,
                contentType : false,
                type : 'POST',
                success : function(data) {
                    alert(data);
                    location.href = "/admin/marker/list";
                }
            })
        });
        
		$(".filename").on("click", function(event){
			
			 var that = $(this);
		
		   $.ajax({
			    url:"/admin/marker/deleteFile?fileName=${markerVO.markerpath}",
			   type:"post",
			   data: {fileName:$(this).attr("data-src")},
			   dataType:"text",
			   success:function(result){
				   if(result == 'deleted'){
					   that.parent("div").remove();
				   }
			   }
		   });
	});

    });
</script>

</body>
</html>
<%@include file="/../resources/include/footer.jsp"%>
