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
@import url(http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css);

.replytimeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;
}

.replytimeline:before {
  top: 0;
  bottom: 0;
  position: absolute;
  content: " ";
  width: 3px;
  background-color: #eeeeee;
  left: 25px;
  margin-right: -1.5px;
}

.replytimeline > li {
  margin-bottom: 20px;
  position: relative;
}

.replytimeline > li:before,
.replytimeline > li:after {
  content: " ";
  display: table;
}

.replytimeline > li:after {
  clear: both;
}

.replytimeline > li > .replytimeline-panel {
  width: calc( 100% - 75px );
  float: right;
  border: 1px solid #d4d4d4;
  border-radius: 2px;
  padding: 20px;
  position: relative;
  -webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

.replytimeline > li > .replytimeline-panel:before {
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

.replytimeline > li > .replytimeline-panel:after {
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

.replytimeline > li > .replytimeline-badge {
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

.replytimeline-badge.info {
  background-color: #5bc0de !important;
}
</style>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
		
	<div class="col-lg-8 col-lg-offset-2">
	<div class="box-header with-border">
		<h3 class="box-title">질문과 답변</h3>
	</div>
	
	<form role="form" method="post">
		<input type='hidden' name='qno' value="${qnaVO.qno}">
		<input type='hidden' name='page' value="${cri.page }">
		<input type='hidden' name='pageNum' value="${cri.pageNum }">	
		<input type='hidden' name='searchType' value="${cri.searchType }">	
		<input type='hidden' name='keyword' value="${cri.keyword }">	
		
	</form>

	<div class="box-body">
		<div style=float:right>
			<c:if test="${qnaVO.secret eq 'y'}">
				<label>이 글은 비밀글입니다.</label>
			</c:if>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				name='title' class="form-control" value="${qnaVO.title}"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="content" rows="3"
				readonly="readonly">${qnaVO.content}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> <input type="text"
				name="writer" class="form-control" value="${qnaVO.userid}"
				readonly="readonly">
		</div>
	</div>
	<!-- /.box-body -->

	<div class="box-footer">
	 <c:if test="${login.userid == qnaVO.userid}">
		<button type="submit" class="btn btn-warning" id="btnModify">수정</button>
		<button type="submit" class="btn btn-danger" id="btnRemove">삭제</button>
	</c:if>
		<button type="submit" class="btn btn-primary" id="btnListAll">글 목록</button>
	</div>	
	</div>
<!-- 댓글 --------------------------------------------------------------------------->	
	<div class="col-lg-8 col-lg-offset-2">
 			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">QnA 댓글</h3>
				</div>
				 <ul class="replytimeline">
				<li>
				<c:if test="${not empty login }">
				<div class="replytimeline-badge warning"><i class="fa fa-sun-o"></i></div>
				<div class="replytimeline-panel">
				 <div class="replytimeline-heading">
					<label for="exampleInputEmail1">작성자</label> 
					<input class="form-control" type="text" value="${login.userid}" id="newReplyWriter" readonly="readonly">
					</div>
					<br>
            <div class="replytimeline-body"> 
						<label for="exampleInputEmail1">내용</label> 
						<input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
					</div>
					<br>

				</div>
				
				<div align="right">
					<button type="button" class="btn btn-primary" id="replyAddBtn">댓글 등록</button>
				</div>
				</c:if>
				
		</li>
		</ul>
			</div>

			<!-- The time line -->
			<ul class="timeline replytimeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv">
				<span class="bg-green">댓글 목록 
				<small id='replycntSmall'>[ ${qnaVO.replycnt} ]</small>
				</span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
 </div>  
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>      

		
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-qrno={{qrno}}>
<div class="replytimeline-badge info">
<i class="fa fa-smile-o"></i></div>
 <div class="replytimeline-panel" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-title"><strong>{{qrno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer" align="right">
		{{#eqReplyer replyer}}
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">수정</a>
		{{/eqReplyer}}
    </div>
  </div>			
</li>
{{/each}}
</script>

<script>
 	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		var hours = dateObj.getHours();
		var minutes = dateObj.getMinutes();

		return year + "/" + month + "/" + date + " " + hours + ":" + minutes;
	}); 
	
	Handlebars.registerHelper("eqReplyer", function(replyer,block) {
			var accum='';
			if(replyer == '${login.userid}'){
				accum += block.fn();
			}
			return accum;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var qno = ${qnaVO.qno};
	
	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("["+data.pageMaker.totalCount+"]");

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + qno + "/1");

	});
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+qno+"/"+replyPage);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({qno:qno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+qno+"/"+replyPage );
						replytextObj.val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-qrno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var qrno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+qrno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+qno+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var qrno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/replies/'+qrno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+qno+"/"+replyPage );
					}
			}});
	});
	
</script>
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#btnModify").on("click", function() {
				formObj.attr("action", "/qna/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$("#btnRemove").on("click", function() {
			   
				formObj.attr("action", "/qna/remove");
				formObj.submit();
			});

			$("#btnListAll").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/qna/list");
				formObj.submit();
			});

		});
	</script>
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>
