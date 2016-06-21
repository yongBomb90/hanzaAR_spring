<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.btn3d.btn-success {
    box-shadow:0 0 0 1px #31c300 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #32B695, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#48cfad;
}
</style>
<body>

<div class="col-lg-8 col-lg-offset-2">
		<h2 id="tables-striped">마커 관리&nbsp;&nbsp;&nbsp;&nbsp;
		</h2>
		<div style=float:right>
		<button type="button" class="btn btn-success btn-lg btn3d"><a href="/admin/marker/register">마커 등록</a></button>		
		</div>
			<table class="table table-hover">
				<tr>
					<th>
						<h1 style="font-size: x-large">
							<span style="font-weight: bolder">MARKER ID</span>
						</h1>
					</th>
					<th>
						<h1 style="font-size: x-large">
							<span style="font-weight: bolder">MARKER PATH</span>
						</h1>
					</th>
					<th>
						<h1 style="font-size: x-large">
							<span style="font-weight: bolder">MARKER IMAGE</span>
						</h1>
					</th>
				</tr>

				<c:forEach items="${list}" var="markerVO">

					<tr>
						<td class="col-lg-2"><span style="font-size: 20px;"><a
								href='/admin/marker/read${pageMaker.makeQuery(pageMaker.cri.page)}&markerid=${markerVO.markerid}'>${markerVO.markerid}</a></span>
						</td>

						<td class="col-lg-2"><span style="font-size: 20px;">${markerVO.markerpath}</span>
						</td>

						<td class="col-lg-1"><span style="font-size: 20px;"><img
								id='imgs' style="width: 100px; height: 100px"
								src="/admin/marker/downmarker?fileName=${markerVO.markerpath}"></span></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
				<div class="dataTables_paginate paging_simple_numbers text-center"
				id="example1_paginate">
				<ul class="pagination pagination-lg">

					<c:if test="${pageMaker.prev}">
						<li>
						<a href="list${pageMaker.makeQuery(pageMaker.startPage-1)}"><i class="fa fa-long-arrow-left"></i></a>
						</li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<li 
						  <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="list${pageMaker.makeQuery(idx)}">${idx }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeQuery(pageMaker.endPage+1) }">
							<i class="fa fa-long-arrow-right"></i></a>
							</li>
					</c:if>
				</ul>
			</div>

</body>
</html>
<%@include file="/resources/include/footer.jsp"%>
