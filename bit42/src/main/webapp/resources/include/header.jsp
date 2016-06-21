<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="author" content="cosmic">
    <meta name="keywords" content="Bootstrap 3, Template, Theme, Responsive, Corporate, Business">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>
      	日 就 月 將 
    </title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/theme.css" rel="stylesheet">
    <link href="/resources/css/bootstrap-reset.css" rel="stylesheet">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet">-->

    <!--external css-->
    <link href="/resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/css/flexslider.css"/>
    <link href="/resources/assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="/resources/assets/owlcarousel/owl.carousel.css">
    <link rel="stylesheet" href="/resources/assets/owlcarousel/owl.theme.css">
    <link rel="stylesheet" href="/resources/css/seq-slider/sequencejs-theme.sliding-horizontal-parallax.css">
    
    <link href="/resources/css/superfish.css" rel="stylesheet" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'> -->


    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="/resources/css/component.css">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/style-responsive.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="/resources/css/parallax-slider/parallax-slider.css" />
    <script type="text/javascript" src="/resources/js/parallax-slider/modernizr.custom.28468.js">
    </script>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js">
    </script>
    <script src="js/respond.min.js">
    </script>
    <![endif]-->
  </head>

  <body style="width: 100%">
    <!--header start-->
    <div class='container-fluid' style="width: 100%">
    <header class="head-section">
   
      <div class="navbar navbar-default navbar-static-top container">
          <div class="navbar-header">
              <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
                <a class="navbar-brand" href="/" style=" font-weight: bolder; font-size: 60px;"><span>日 就 月 將</span></a>
          </div>
          <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="index.html">놀이 <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          
                          <li>
                              <a href="/play/">카드로 학습</a>
                          </li>
                          
                          <li>
                              <a href="/play/voice/gradedepth/0,0">음성으로 학습</a>
                          </li>

                      </ul>
                  </li>
                  
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">자료실 <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="/hanza/searchlist/1">한자 자료실</a>
                          </li>
                          <li>
                              <a href="/hanza/8,1">마커 자료실</a>
                          </li>       
                      </ul>
                  </li>
                  
                  <li>
                      <a href="/board/list">자유게시판</a>
                  </li>
                  
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">마이 페이지 <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="/user/child/list/0">자녀 관리</a>
                          </li>
                          <li>
                              <a href="/user/read">개인 정보</a>
                          </li>
                          <li>
                              <a href="/msg/1">메시지 등록하기</a>
                          </li>
                           <li>
                              <a href="/msg/read">메시지보기</a>
                          </li>
                         
                      </ul>
                  </li>
                  
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">Help <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="/qna/list">Q&A</a>
                          </li>
                         
                          <li>
                              <a href="/notice/list">공지사항</a>
                          </li>                           
                      </ul>
                  </li>
                  
                   

                 
                   <li>
                  
                   
                      <c:if test="${not empty login }">
                        <a id="LoginDis" href="/logout">로그아웃</a>
                       
                     </c:if>
               
               <c:if test="${empty login }">
                 <a href="/user/register">회원가입</a>
                 </li>

                   <li>
                       
                   
                  <a id="LoginDis" href="/login">로그인</a>
                  </c:if>
                     
                  </li>
                  

               
                          <c:if test="${not empty login}">                     
                <c:if test="${login.gubun eq 'a'}">
                      <li class="dropdown">
                         <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                         "dropdown" data-toggle="dropdown" href="#">관리자 <i class="fa fa-angle-down"></i>
                         </a>
                         <ul class="dropdown-menu">
                             <li>
                                 <a href="/admin/hanza/8,1">한자관리</a>
                             </li>
                             <li>
                                 <a href="/admin/member/list" >회원관리</a>
                             </li>
                             <li>
                                 <a href="/admin/child/list" >자녀관리</a>
                             </li>
                             <li>
                                 <a href="/admin/marker/list">마커관리</a>
                             </li>
                             <li>
                                 <a href="/stats/list">통계</a>
                             </li>
                         </ul>
                     </li>
                     </c:if>
                  
               </c:if>
             
                  
                  <c:if test="${not empty clogin}">
                      <li class="dropdown">
                  
                         <img class="img-circle" data-close-others="false" data-delay="0" 
                            data-hover="dropdown" data-toggle="dropdown" href="#" 
                            id="briefInfo" style="width: 100px; height: 100px;" 
                            src="/user/child/downimg?fileName=${clogin.s_imgpath }">
                            
                             <ul class="dropdown-menu">
                             <li>
                                 <a id="childName">${clogin.cname}</a>
                             </li>
                             <li>
                                 <a id="childAge">${clogin.cage}세</a>
                             </li>
                            
                             <li>
                               <a id="childLv">${clogin.clevel}급</a>
                             </li>
                             
                         </ul>
                         
                     </li>
                     </c:if>
                     <c:if test="${empty clogin}">
                             <img class="img-circle" data-close-others="false" data-delay="0" 
                            data-hover="dropdown" data-toggle="dropdown" href="#" 
                            id="briefInfo" style="width: 100px; height: 100px;"
                            src="/user/child/downimg?fileName=default.png">
                              
                     </c:if>
                  

              </ul>
          </div>
      </div>
  
    </header>
      </div>
    <!--header end-->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    