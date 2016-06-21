<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@include file="/resources/include/mobileheader.jsp"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h1> 단계 선택</h1>
<img src="/user/child/downimg?fileName=${childVO.s_imgpath}" style="border-radius: 100px;">
    <h3> 최근까지 학습한 단계는 ${grade} 급의  ${deep} 단계입니다</h3>
    <button class="btn btn-warning btn-lg nextlevelbtn" cusid = "${grade}" cuslev = "${deep}">다음단계로</button>
    
</center>

<div class="property" style="height: 100%; background-color: white;">
<div class="container">
    <div class="row mar-b-60">
        <div class="col-lg-10 col-lg-offset-1">
            <!--tab start-->
            <section class="tab wow fadeInLeft">
                <header class="panel-heading tab-bg-dark-navy-blue">
                    <ul class="nav nav-tabs nav-justified ">
                    	<c:forEach var="idx" begin="3" end="${11-childVO.clevel}">
                    	<c:if test="${11-idx==childVO.clevel}">
                    	<li class="active ">
                    	   <a data-toggle="tab" href="#${11-idx}" class="gradebtn" cusid="${11-idx}">
                               ${11-idx}
                            </a>
                        </li>
                    	</c:if>
                    	<c:if test="${11-idx!=childVO.clevel}">
                    	<li >
                            <a data-toggle="tab" href="#${11-idx}" class="gradebtn" cusid="${11-idx}">
                               ${11-idx}
                            </a>
                        </li>
                        </c:if>
                    	</c:forEach>
                    
                    </ul>
                </header>


                <div class="panel-body">
                <div class="tab-content tasi-tab depthtable">
                	<c:forEach var="idx" begin="3" end="8">
                		
                        	<c:if test="${11-idx==childVO.clevel}">
                        <div id="${11-idx}" class="tab-pane fade in active" >
                       	</div>
                   		 </c:if>
                   		 <c:if test="${11-idx!=childVO.clevel}">
                   		 <div id="${11-idx}" class="tab-pane fade " >
                        </div>
                   		  </c:if>
                      </c:forEach>
                
                  </div>
                </div>
            </section>
            <!--tab end-->
        </div>

    </div>
</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script type="text/javascript">
var curgrade = '${childVO.clevel}';
var uri = '${childVO.clevel}';

$.get("/hanza/gradecnt/"+uri,function(data){
	 var str ="";
	if( '${childVO.deep}'<data){
		data = '${childVO.deep}'
	}
	for(var i=1; i<=data; i++){
		if(i <data){
    		if((i%3) == 0){
    			str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-danger btn-lg startbtn" cusid="'+i+'">'+i+'단계</button></a><br><br>'
            }else{
        		str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-danger btn-lg startbtn" cusid="'+i+'">'+i+'단계</button></a>>>>'
            }
    	}
    	else{
    		if(curgrade == '${childVO.clevel}'){
   			 str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-warning btn-lg startbtn" cusid="'+i+'">'+i+'단계(아이단계)</button></a>'
   	     }else{
   			 str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-danger btn-lg startbtn" cusid="'+i+'">'+i+'단계</button></a>'
   	            
   		 }		
    	}
	}
	$("#"+uri).html(str)
   });






$(".gradebtn").on("click", function(event){
    var uri = $(event.target).attr("cusid");
    curgrade = uri;
    $.get("/hanza/gradecnt/"+uri,function(data){
        var str ="";
        if(uri == '${childVO.clevel}'){
    	if( '${childVO.deep}'<data){
    		data = '${childVO.deep}'
    	}}
    	for(var i=1; i<=data; i++){
        	if(i <data){
        		if((i%3) == 0){
        			str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-danger btn-lg startbtn" cusid="'+i+'">'+i+'단계</button></a><br><br>'
                }else{
            		str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-danger btn-lg startbtn" cusid="'+i+'">'+i+'단계</button></a>>>>'
                }
        	}
        	else{
        		 if(curgrade == '${childVO.clevel}'){
        			 str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-warning btn-lg startbtn" cusid="'+i+'">'+i+'단계(아이단계)</button></a>'
        	     }else{
        			 str = str+ '<a href="/mobile/study/'+curgrade+','+i+'" ><button class="btn btn-danger btn-lg startbtn" cusid="'+i+'">'+i+'단계</button></a>'
        	            
        		 }
        	}
    	}
    	$("#"+uri).html(str)
       });
    

  })

    $(".nextlevelbtn").on("click", function(event){
    	var grade = $(event.target).attr("cusid");
    	var deep = $(event.target).attr("cuslev");
    	 $.get("/hanza/gradecnt/"+grade,function(data){
    		 if(data>deep){
    			 deep++;
    			 self.location="/mobile/study/"+grade+","+deep;
    		 }else{
    			 if(grade !=3){
    				 grade--
    			 self.location="/mobile/study/"+grade+",1";
    			 }else{
    				 self.location="/mobile/study/"+(grade)+","+(deep);
    			 }
    		 }
    		 
    	 });
    	 
    	
    })
    
   

</script>

</body>
</html>
<%@include file="/resources/include/mobilefooter.jsp"%>