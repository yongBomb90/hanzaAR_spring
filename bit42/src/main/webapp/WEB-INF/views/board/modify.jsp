<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file="/resources/include/header.jsp"%>
   
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>

.thumbnail{

    height: 100px;
    margin: 10px;    
}

.form-control{color : black;}

body {
    padding-top: 50px;
    padding-bottom: 50px;
}

.price-box {
    margin: 0 auto;
    background: #E9E9E9;
   border-radius: 10px;
   padding: 40px 15px;
   width: 1000px;
}

.ui-widget-content {
   border: 1px solid #bdc3c7;
   background: #e1e1e1;
   color: #222222;
   margin-top: 4px;
}

.ui-state-default, .ui-widget-content .ui-state-default{
background:transparent !important;
border:none !important;
}


.ui-corner-all {
   border-radius: 20px;
}


.ui-state-default,
.ui-widget-content .ui-state-default {
   border: 1px solid #f9f9f9;
   background: #3498db;
}

.ui-slider-horizontal .ui-slider-handle {
   margin-left: -0.5em;
}

.ui-slider .ui-slider-handle {
   cursor: pointer;
}

.ui-slider a,
.ui-slider a:focus {
   cursor: pointer;
   outline: none;
}

.price, .lead p {
   font-weight: 600;
   font-size: 32px;
   display: inline-block;
   line-height: 60px;
}

h4.great {
   background: #00ac98;
   margin: 0 0 25px -60px;
   padding: 7px 15px;
   color: #ffffff;
   font-size: 18px;
   font-weight: 600;
   border-radius: 5px;
   display: inline-block;
   -moz-box-shadow:    2px 4px 5px 0 #ccc;
     -webkit-box-shadow: 2px 4px 5px 0 #ccc;
     box-shadow:         2px 4px 5px 0 #ccc;
}

.total {
   border-bottom: 1px solid #7f8c8d;
   /*display: inline;
   padding: 10px 5px;*/
   position: relative;
   padding-bottom: 20px;
}

.total:before {
   content: "";
   display: inline;
   position: absolute;
   left: 0;
   bottom: 5px;
   width: 100%;
   height: 3px;
   background: #7f8c8d;
   opacity: 0.5;
}

.price-slider {
   margin-bottom: 70px;
}

.price-slider span {
   font-weight: 200;
   display: inline-block;
   color: #7f8c8d;
   font-size: 13px;
}

.form-pricing {
   background: #ffffff;
   padding: 20px;
   border-radius: 4px;
}

.price-form {
   background: #ffffff;
   margin-bottom: 10px;
   padding: 20px;
   border: 1px solid #eeeeee;
   border-radius: 4px;
   /*-moz-box-shadow:    0 5px 5px 0 #ccc;
     -webkit-box-shadow: 0 5px 5px 0 #ccc;
     box-shadow:         0 5px 5px 0 #ccc;*/
}

.form-group {
   margin-bottom: 0;
   
}

.form-group span.price {
   font-weight: 200;
   display: inline-block;
   color: #7f8c8d;
   font-size: 14px;
}

.help-text {
   display: block;
   margin-top: 32px;
   margin-bottom: 10px;
   color: #737373;
   position: absolute;
   /*margin-left: 20px;*/
   font-weight: 200;
   text-align: right;
   width: 188px;
}

.price-form label {
   font-weight: 200;
   font-size: 21px;
}

img.payment {
   display: block;
    margin-left: auto;
    margin-right: auto
}

.ui-slider-range-min {
   background: #2980b9;
}

/* HR */

hr.style {
   margin-top: 0;
    border: 0;
    border-bottom: 1px dashed #ccc;
    background: #999;
   }
}


 #custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}

.textarea{
   width:100%; 
   height:200px; 
   border:0;
   overflow:auto; 
   scrollbar-face-color: #ffffff; 
   scrollbar-shadow-color: #cccccc; 
   scrollbar-highlight-color:#cccccc; 
   scrollbar-3dlight-color: #ffffff; 
   scrollbar-darkshadow-color: #ffffff; 
   scrollbar-track-color: #ffffff; 
   scrollbar-arrow-color: #ffffff; 
   background-color:transparent;
   filter: chroma(color=ffffff); 
}
</style>

<body>



   <form role="form" method="post">
      <input type="hidden" name="page" value="${cri.page }">
       <input type="hidden" name="pageNum" value="${cri.pageNum }">
   </form>


<div class="form-group"> <h1> 수정 </h1></div>

<div class="container">

      <div class="col-lg-6 col-lg-offset-3 price-box" >
      

        <div class="form-horizontal form-pricing">
      
      <input type="text" name='bno' id="bno" value="${BoardVO.bno }" hidden>
            
           <div id="custom-search-input">
                <div class="input-group col-md-12">
                   <h4 class="great">제목</h4>
                    <input type="text" name='title' id="title" class="form-control input-lg" value="${BoardVO.title}"  />
                </div>
          </div>
          
          
          <div id="custom-search-input">
                <div class="input-group col-md-12">
                   <h4 class="great">글쓴이</h4>
                    <input type="text" name='userid' id="userid" class="form-control input-lg" value="${BoardVO.userid}" readonly="readonly" />
                </div>
          </div>
          
           
          <div class="price-slider">
          <div class="input-group col-md-12">
                <h4 class="great">내용</h4>
               <textarea   name='content' id="content" class="textarea fileDrop" > ${BoardVO.content}</textarea>
               </div>
          </div>

          <div class="price-form">
                <label > 첨부한 파일 </label> 
               <hr class="style">
            
               <div class="form-group total filelist" style = "height:150px; " id="filelist">
                    <c:forEach items="${FileVO}" var="FileVO">          
                 <div  class="form-group" style="float: left; width: 200px;">
                     <img id='imgs' custompath="${FileVO.filepath}"  customname="${FileVO.getFilename()}"
                      class="img-thumbnail filebtn" alt="Cinque Terre" width="100" height="100"
                        src="/board/down?filename=${FileVO.filepath }&name=${FileVO.getFilename()}"> 
                        <div>${FileVO.getFilename()}</div> 
                  </div>
               </c:forEach>
               </div>

          </div>
          
          
          
          <center>
            <div class="col-sm-12">
               <button type="submit" id="btn" class="btn btn-primary btn-lg"><i class="fa fa-save"></i>수정하기</button>
               <button class="btn btn-success btn-lg cancle" ><i class="fa fa-repeat"></i>돌아가기</button>
            </div>
            
            </center>
            
        </div>
      </div>

</div>





   
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

   <script>
      var filename = "";
      var formData = new FormData();
      
      $(document).ready(function() {

         $(".fileDrop").on("dragenter dragover", function(event) {
            event.preventDefault();
         });

         $(".fileDrop").on("drop", function(event) {
            event.preventDefault();

            var files = event.originalEvent.dataTransfer.files;
              var output = document.getElementById("filelist");
            
            for(var i = 0; i< files.length; i++)
               {
                   var file = files[i];

                   if(!file.type.match('image'))
                     continue;
                   
                   var picReader = new FileReader();
                   
                   picReader.addEventListener("load",function(event){
                       
                       var picFile = event.target;
                       
                       $("#filelist").empty();
                       
                       var div = document.createElement("div");
                       
                       div.innerHTML = "<div style = 'float: left; width: 10%;'>" +"<img class='thumbnail' src='" + picFile.result + "'" +
                               "title='" + picFile.name + "'/>" + "</div>";
                       
                       output.insertBefore(div,null);            
                   
                   });
                   picReader.readAsDataURL(file);
                   
                   formData.append("files", files[i]);
               }                               
            
         });
         
         $("#btn").on("click", function(event) {
            formData.append("bno", $("#bno").val());
            formData.append("userid", $("#userid").val());
            formData.append("title", $("#title").val());
            formData.append("content", $("#content").val());
            console.log(formData)
             $.ajax({
               url : '/board/modify',
               data : formData,
               datatype : 'text',
               processData : false,
               contentType : false,
               type : 'POST',
               success : function(data) {
                  alert(data);
                  location.href = "/board/list?page=${cri.page}&pageNum=${cri.pageNum}";
               }
            })
         });
         
         $(".cancle").on("click",function(){
            location.href = "/board/read?page=${cri.page}&pageNum=${cri.pageNum}&bno=${BoardVO.bno}";
         })

      });
   </script>


</body>
</html>
<%@include file="/resources/include/footer.jsp"%>