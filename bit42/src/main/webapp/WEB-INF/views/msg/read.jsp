<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<body style="text-align: center; font-family: monospace; ">
<%@include file="/resources/include/msgheader.jsp"%>
<div id="grp" cusid ="${clogin.cno}" style="margin-top:2%;  width:100%; "></div>

	 <video id="video" autoplay="true" style="display:none;"></video><!-- webcam video-->
    <canvas id="canvas" style="width:640px; height:420px;  border-radius: 100px; "></canvas><!--웹캠띄우는 canvas-->
<script src = "/resources/css/msgread.js"></script>

</body>
</html>