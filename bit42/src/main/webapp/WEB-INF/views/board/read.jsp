<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@include file="/resources/include/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<style>

   .btn-glyphicon { padding:8px; background:#ffffff; margin-right:4px; }
   .icon-btn { padding: 1px 15px 3px 2px; border-radius:50px;}

input{
border :0;
width:100%;
}
    #file {
        width: 300px;
        heigh: 100px;
    }
    .colorgraph {
     height: 5px;
     border-top: 0;
     background: #c4e17f;
     border-radius: 5px;
     background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
     background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
     background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
     background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}

 .form-control{color: black;}
 
 
 
@import url(http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css);

.timeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;
}

.timeline:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 25px;
  margin-right: -1.5px;
}

.timeline > li {
  margin-bottom: 20px;
  position: relative;
}

.timeline > li:before,
.timeline > li:after {
  content: " ";
  display: table;
}

.timeline > li:after {
  clear: both;
}

.timeline > li > .timeline-panel {
  width: calc( 100% - 75px );
  float: right;
  border: 1px solid #d4d4d4;
  border-radius: 2px;
  padding: 20px;
  position: relative;
  -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

.timeline > li > .timeline-panel:before {
  position: absolute;
  top: 26px;
  left: -15px;
  display: inline-block;
  border-top: 15px solid transparent;
  border-right: 15px solid #ccc;
  border-left: 0 solid #ccc;
  border-bottom: 15px solid transparent;
  content: " ";
}

.timeline > li > .timeline-panel:after {
  position: absolute;
  top: 27px;
  left: -14px;
  display: inline-block;
  border-top: 14px solid transparent;
  border-right: 14px solid #fff;
  border-left: 0 solid #fff;
  border-bottom: 14px solid transparent;
  content: " ";
}

.timeline > li > .timeline-badge {
  color: #fff;
  width: 50px;
  height: 50px;
  line-height: 50px;
  font-size: 1.4em;
  text-align: center;
  position: absolute;
  top: 16px;
  left: 0px;
  margin-right: -25px;
  background-color: #999999;
  z-index: 100;
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom-right-radius: 50%;
  border-bottom-left-radius: 50%;
}

.timeline-badge.info {
  background-color: #5bc0de !important;
}


</style>
<body>






<form role="form" method="post">
    <input type="hidden" name="bno" value="${BoardVO.bno }">
    <input type="hidden" name="page" value="${cri.page }">
    <input type="hidden" name="pageNum" value="${cri.pageNum }">
    <input type="hidden" name="loginId" id ="loginID" value="${login.userid }">
    
</form>

<center> <h1>${BoardVO.bno}번 글</h1> </center>


<div class="form-group col-lg-6 col-lg-offset-3">

   <div align="right">
      <img style="height: 20px; width: 20px" src="/resources/img/clock.png"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${BoardVO.regdate}" />
   </div>

      <hr class="colorgraph">
      
   
   <label for="title"> 제목 </label>
   
   <input type="text" placeholder="" id="title" class="form-control"  readonly="readonly" value="${BoardVO.title }">
   <p>
   <p>
   
   <label for="content"> 내용 </label>
   <textarea placeholder="" id="content" rows="5" class="form-control" readonly="readonly" > ${BoardVO.content } </textarea>
   
   <p>
   <p>
   
   <label for="userid"> 아이디 </label>
   <input type="text" placeholder="" id="userid" class="form-control"   readonly="readonly"  value="${BoardVO.userid }">
   <br>

   
   <label for=file> 첨부한 파일 </label> (이미지를 클릭하면 다운로드 할 수 있습니다.) 
   <div class="form-group">
      <c:forEach items="${FileVO}" var="FileVO">   
      
      
           <div  class="form-group" style="float: left; width: 10%; height: 200%;">
               <img id='imgs' custompath="${FileVO.filepath}"  customname="${FileVO.getFilename()}"
                class="img-thumbnail filebtn" alt="Cinque Terre" width="100" height="100"
                  src="/board/down?filename=${FileVO.filepath }&name=${FileVO.getFilename()}"> ${FileVO.getFilename()} 
            </div>
      </c:forEach>
   </div>
</div>

<div class="form-group col-lg-6 col-lg-offset-3">

   <!-- 좋아요 start -->
   <div style=" width: 300px;" class="col-lg-offset-5">

         <img class="goodbtn" src="/resources/img/좋아요.png" style="width: 40px; height: 40px;  ">
         
         <input type="text" value="${GoodCountVO.count }" style="font-size: 20pt; font-color: blue; float: right; width: 85%;" class="count" readonly> 
   </div>
   
      <!-- 좋아요 end -->
   
      
   <br>
   <br>

<center>

   <c:if test="${not empty login }">
      <c:if test="${login.userid eq BoardVO.userid }">
          <div class="userbtn">
            <a class="btn icon-btn btn-info modify" href="#"><span class="glyphicon btn-glyphicon glyphicon-share img-circle text-info"></span>수정</a>
            <a class="btn icon-btn btn-danger remove" href="#"><span class="glyphicon btn-glyphicon glyphicon-trash img-circle text-danger"></span>삭제</a>
         </div>
       </c:if>
   </c:if>
    
   <a class="btn icon-btn btn-warning cancle" href="#"><span class="glyphicon btn-glyphicon glyphicon-minus img-circle text-warning"></span>목록가기</a>
   <a class="btn icon-btn btn-primary reply"  href="#"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-primary"></span>답글달기</a>
</center>

<hr class="colorgraph">



<br>


<!--  -------------------------------  댓글 -----------------------------------------  -->

 <ul class="timeline">
 
 <div>
   <input type="text" name='replybno' id="replybno" value="${BoardVO.bno }" hidden> 
   <input type="text" name='replygno' id="replygno" value="${BoardVO.gno }" hidden> 
</div>


        <li>
          <div class="timeline-badge warning"><i class="fa fa-sun-o"></i></div>
          <div class="timeline-panel">
          

           
               <div class="timeline-heading">
                 <input type="text" name='replcontent' id="replcontent" placeholder=" 댓글 내용을 적으세요. " >
               </div>
               <br>
               <div class="timeline-body" align="right">
                <input type="text"name='replyuserid' id="replyuserid" value= "${MemberVO.userid }" readonly >         
              </div>

           <br>
           
           <div align="right" >
             <button type="button" class="btn btn-primary replybtn">댓글달기</button>
               <button class="btn-warning  updatebtn" hidden>댓글수정</button>
               <button class="btn-warning  canclebtn" hidden>취소</button>
            </div>
            

            
            
          </div>
        </li>
         
</ul>






<!-- 댓글 list start -->
   <ul class="timeline">
   
      <c:forEach items="${ReplyVO}" var="ReplyVO">
      
         <li>
            <div class="timeline-badge info"><i class="fa fa-smile-o"></i></div>
            <div class="timeline-panel">
               <div class="timeline-heading">
                  <div align="right">
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ReplyVO.regdate}" />
                    </div>
           
                  <h4 class="timeline-title">${ReplyVO.content }</h4>
               </div>
               
               <div class="timeline-body">
               <p>${ReplyVO.userid } </p>              
               
               </div>
               
               
               <div align="right" class="userreplybtn" cusid="${ReplyVO.userid}">
                  <button data-user="${ReplyVO.userid }" data-con="${ReplyVO.content }" data-rno="${ReplyVO.rno }"  
                     class="btn btn-info btn-sm updateReply">수정</button>
                  <button data-rno="${ReplyVO.rno }" class="btn btn-success btn-sm deleteReply">삭제</button>
               </div>
               
            </div>
         </li>
         
      </c:forEach>
   </ul>

<!-- 댓글 list end -->


       

<br>

<hr class="colorgraph">




</div> <!-- 전체div -->


    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    
<script>
    
   
            
         var userid="${MemberVO.userid}";
            var $userreplybtn=$(".userreplybtn");
            for(var i = 0; i <$userreplybtn.length; i++){
               var reid = $($userreplybtn[i]).attr("cusid");
               if(reid != userid){
                  console.log(reid)
                  $($userreplybtn[i]).hide();
               }
            }
            
          var replyid = "${ReplyVO };"
          console.log(replyid); 

        var formData; 

        $(document).ready(function() {
           
            var form = $("form[role='form']");
            console.log(form);

            $(".modify").on("click", function() {
                form.attr("action", "/board/modify");
                form.attr("method", "get");
                form.submit();
            });
            $(".remove").on("click", function() {
                alert("게시물이 삭제되었습니다.");
                form.attr("action", "/board/remove");
                form.submit();
            });



            $(".filebtn").on("click", function(event) {
               alert($(event.target).attr("customname") + " 다운로드!");
               var path = $(event.target).attr("custompath");
               var names = $(event.target).attr("customname");

               
               self.location = "/board/down?filename="+path+"&name="+names;
               });

            $(".cancle").on("click", function() {
                self.location = "/board/list?page=${cri.page}&pageNum=${cri.pageNum}";
            });
            $(".reply").on("click", function() {
                self.location = '/board/register/${BoardVO.bno }';
            });
            
            
         $(".goodbtn").on("click", function(){ //좋아요 버튼 
               
               var good = $(".count").val();
               good++;
               
               formData = new FormData();
               formData.append("bno",$("#replybno").val());
               formData.append("count", good);
                 
                 $.ajax({
                    url : '/board/goodCount',
                    data : formData,
                    datatype : 'text',
                    processData : false,
                    contentType : false,
                    type : 'POST',
                    success : function(data) {                    	
                          $(".count").val(good);

                    }
                 }) 
            });
            
            $(".replybtn").on("click", function() { //댓글 등록
                
               if($("#replcontent").val()){
               formData = new FormData();
               formData.append("content", $("#replcontent").val());
                formData.append("userid", $("#replyuserid").val());
                formData.append("bno", $("#replybno").val());
                console.log(formData)
                
                $.ajax({
                    url : '/board/read',
                    data : formData,
                    datatype : 'text',
                    processData : false,
                    contentType : false,
                    type : 'POST',
                    success : function(data) {
                       alert("댓글이 작성되었습니다.");
                          location.reload();
                     }
                })
               }else{
                  alert("댓글내용을 작성해주세요");
               }
                
            });
            

            $(".deleteReply").on("click", function(event) {
                event.originalEvent.preventDefault();
                var idx = $(event.target).attr("data-rno");
                alert("댓글이 삭제되었습니다.");
                formData = new FormData();
                formData.append("rno", idx);

                $.ajax({
                    url : '/board/replyremove/' + idx,
                    type : 'delete',
                    success : function(data) {
                        location.reload();
                    }
                })

            });

            $(".updateReply").on("click", function(event) {
                event.originalEvent.preventDefault();
                var idx = $(event.target).attr("data-rno");
                var content = $(event.target).attr("data-con");
                var userid = $(event.target).attr("data-user");
                console.log(idx);
                console.log(content);
                console.log(userid);

                $(".replybtn").hide();
                $(".updatebtn").show();
                $(".canclebtn").show();
                
                $("#replcontent").val(content);
                $("#replyuserid").val(userid);

                $(".updatebtn").on("click", function() {

                    var rrno = idx;
                    var rcontent = $("#replcontent").val();
                   if(rcontent){
                    $.post("/board/replyupdate", {
                        rno : rrno,
                        content : rcontent
                    }, function(data) {
                        location.reload();
                    });
                   }else{
                      alert("수정 내용을 작성해주세요")
                   }
                });
                
                $(".canclebtn").on("click", function(){
                   location.reload();
                })
            });
            
            $(".loginbtn").on("click", function(){
               self.location = "/login";
            })
        })
        
    </script>
</body>

</html>
    <%@include file="/resources/include/footer.jsp"%>