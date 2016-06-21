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

   .btn-glyphicon { padding:8px; background:#ffffff; margin-right:4px; }
   .icon-btn { padding: 1px 15px 3px 2px; border-radius:50px;}
</style>
<body>

<div class="col-lg-8 col-lg-offset-2">
		<h2 id="tables-striped">공지사항&nbsp;&nbsp;&nbsp;&nbsp;
		</h2>
		<c:if test="${not empty login}">                     
        <c:if test="${login.gubun eq 'a'}">
		<div style=float:right>
		<a  id="btn" class="btn icon-btn btn-success" href="/notice/register"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>공지사항 등록</a>	
		</div>
				</c:if>
		</c:if>
			<table class="table table-hover">
				<tr>
					<th>
						<h1 style="font-size: x-large">
							<span style="font-weight: bolder">No.</span>
						</h1>
					</th>
					<th>
						<h1 style="font-size: x-large">
							<span style="font-weight: bolder">제목</span>
						</h1>
					</th>

					<th>
						<h1 style="font-size: x-large">
							<span style="font-weight: bolder">작성자</span>
						</h1>
					</th>
					
					<th>
						<h1 style="font-size: x-large">
							<span style="font-weight: bolder">작성시간</span>
						</h1>
					</th>
				</tr>

				<c:forEach items="${list}" var="noticeVO">

					<tr>
						<td class="col-lg-1"><span style="font-size: 20px;">${noticeVO.nno}</span>
						</td>

						<td class="col-lg-2"><a
								href='/notice/read${pageMaker.makeQuery(pageMaker.cri.page)}&nno=${noticeVO.nno}'><span style="font-size: 20px;">${noticeVO.title}</a></span>
						</td>
						
						
							<td class="col-lg-1"><span style="font-size: 20px;">${noticeVO.userid}</span>
						</td>
						
						<td class="col-lg-1"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noticeVO.regdate}" />
                <span style="font-size: 20px;"></span>
            </td>

					
					</tr>
				</c:forEach>
			</table>
		
		
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
</div>
</body>
</html>
<%@include file="/resources/include/footer.jsp"%>
