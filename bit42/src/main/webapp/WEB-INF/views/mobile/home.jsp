<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="/resources/include/mobileheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bigimg{width: 100%; height: 100%; border: solid}

.block{
	height:200px;
	margin: 10px 0;
	vertical-align:middle;
}


</style>

</head>

<body style="height: 100%">

<div class="gray-bg" style="height: 100%">
    <div class="fof">
            <!-- 404 error -->
        <div class="container  error-inner wow flipInX animated" data-wow-animation-name="flipInX" style="visibility: visible; animation-name: flipInX;">
            <c:if test="${childvo != null}">
            <img src="/user/child/downimg?fileName=${childvo.s_imgpath}" style="border-radius: 100px;">
            <h1>${childvo.cname}</h1>
            <h3>${childvo.cage}세 </h3>
            <h4>${childvo.school}</h4>
            <p class="text-center">현재 아이는 ${childvo.clevel} 급 입니다</p>
            </c:if>
             <c:if test="${childvo == null}">
             <img src="/user/child/downimg?fileName=defaultchild.png" style="border-radius: 100px;">
            <h3>아이를 등록해주세요</h3>
            </c:if>
          </div>
        <!-- /404 error -->
        </div>
    </div>
   
        
</body>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

</html>
<%@include file="/resources/include/mobilefooter.jsp"%>