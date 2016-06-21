<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@include file="/resources/include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

   .bs-example:after {
    content: "한자능력검정시험 정보";
    position: absolute;
    top: 15px;
    left: 15px;
    font-size: 12px;
    font-weight: 700;
    color: #bbb;
    text-transform: uppercase;
    letter-spacing: 1px;
    border: 0;
    
}
 .bs-example {
    position: relative;
    padding: 45px 15px 15px;
    /* margin: 0 -15px 15px; */
    background-color: white;
    /* box-shadow: inset 0 3px 6px rgba(0,0,0,.05); */
    border-color: #e5e5e5 #eee #eee;
    border-style: solid;
    border-width: 1px 1px;
}

        .jejuhan { font-family: 'Jeju Hallasan', serif; }
         .hanna { font-family: 'Hanna', serif; }
          .nnb { font-family: 'Nanum Brush Script', serif; }

</style>
<style>

.update-nag{
  display: inline-block;
  font-size: 14px;
  text-align: left;
  background-color: #fff;
  height: 40px;
  -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.2);
  box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
  margin-bottom: 10px;
}

.update-nag:hover{
    cursor: pointer;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.4);
  box-shadow: 0 1px 1px 0 rgba(0,0,0,.3);
}

.update-nag > .update-split{
  background: #337ab7;
  width: 33px;
  float: left;
  color: #fff!important;
  height: 100%;
  text-align: center;
}

.update-nag > .update-split > .glyphicon{
  position:relative;
  top: calc(50% - 9px)!important; /* 50% - 3/4 of icon height */
}
.update-nag > .update-split.update-success{
  background: #5cb85c!important;
}

.update-nag > .update-split.update-danger{
  background: #d9534f!important;
}

.update-nag > .update-split.update-info{
  background: #5bc0de!important;
}



.update-nag > .update-text{
  line-height: 19px;
  padding-top: 11px;
  padding-left: 45px;
  padding-right: 20px;
}
</style>

       </head>




  <body style="width: 100%">



      <!-- Sequence Modern Slider -->
    <div id="sequence-theme" class="sequence-inner">
      <div id="sequence">
        <img class="sequence-prev" src="/resources/img/seq-slider/bt-prev.png" alt="Previous" style="display: inline;">
        <img class="sequence-next" src="/resources/img/seq-slider/bt-next.png" alt="Next" style="display: inline;">

    
        <c:if test="${ empty login }">
    
          <ul class="sequence-canvas">
        
             <li class="animate-out" style="display: list-item; z-index: 1;">
               <div class="info" align="center">
                 <h2 class="jejuhan" style="font-size: 30pt"> ★ 반갑습니다 ★  </h2>
                 <div class="jejuhan" style="font-size: 20pt"> 로그인을 해주세요 </div>
                 <div style="height: 20px;"> </div>
   
              <button class="btn btn-lg btn-info loginbtn"> 로그인 </button>
                 
               </div>
               <img class="sky" src="/resources/img/seq-slider/bg-clouds.png" alt="Blue Sky" style="">
               <img class="balloon" src="/resources/img/라이언1.gif" alt="Balloon" style="">
             </li>
             
               <li class="animate-out" style="display: list-item; z-index: 1;">
               <div class="info" align="center">
                 <h2 class="nnb" style="font-size: 30pt">★ 반갑습니다 ★</h2>
                   <div class="nnb" style="font-size: 20pt"> 로그인을 해주세요 </div>
                 
                 <div style="height: 20px;"> </div>
                 
              <button class="btn btn-lg btn-info loginbtn"> 로그인 </button>
                 
               </div>
               <img class="sky" src="/resources/img/seq-slider/bg-clouds.png" alt="Blue Sky" style="">
               <img class="balloon" src="/resources/img/라이언1.gif" alt="Balloon" style="">
             </li>
          </ul>
       </c:if>



      <c:if test="${not empty login }">
            <ul class="sequence-canvas">

                <li class="animate-out" style="display: list-item; z-index: 1;">
               <div class="info" align="center">
               
                 <h1 class="jejuhan" style="font-size: 50pt">
                      놀자 놀아~♬
                 </h1>
                 
                 <div>
                    <button type="button" class="btn btn-lg btn-info cardbtn" >카드놀이</button>
                 </div>
                 
               </div>
                  <img class="sky" src="/resources/img/seq-slider/bg-clouds.png" alt="Blue Sky" style="">
                  <img class="aeroplane" src="/resources/img/캐릭터1.gif"  style="width: 400px; height: 400px;" alt="Aeroplane" style="">

             </li>
             
             <li class="animate-out" style="display: list-item; z-index: 1;">
               <div class="info" align="center">
               
                 <h1 class="jejuhan" style="font-size: 50pt">
                      공부 할까~~??
                 </h1>
                 
                 <div>
                    <button type="button" class="btn btn-lg btn-info voicebtn" >벽돌깨기</button>
                 </div>
                 
               </div>
                  <img class="sky" src="/resources/img/seq-slider/bg-clouds.png" alt="Blue Sky" style="">
                  <img class="aeroplane" src="/resources/img/라이언2.gif"  style="width: 400px; height: 400px;" alt="Aeroplane" style="">

             </li>
             
             <c:forEach items="${userlist }" var="login">
             
                <li class="animate-out" style="display: list-item; z-index: 1;">
                  <div class="info" align="center">
                  
                       <h3 class="jejuhan" style="font-size: 50pt">  ${login.cname }<img src="/resources/img/캐릭터5.png" width= 80 height= 80/></h3>
                    <div  align="center"> 자녀의 사진을 클릭하면 선택할 수 있습니다. </div>
                  
                    
                    
                  </div>
                     <img class="sky" src="/resources/img/seq-slider/bg-clouds.png" alt="Blue Sky" style="">
                     <img class="balloon img-circle chiceimg" alt="Balloon" style="width: 400px; height: 400px;" 
                     src="/user/child/downimg?fileName=${login.imgpath }"data-idx="${login.cno }" data-userid = "${login.userid}"
                     data-cname="${login.cname }" data-age="${login.cage }" data-clv="${login.clevel }">
                      
                </li>
             
              </c:forEach>
              </ul>
          </c:if>
          
          
         
          
      </div>
    </div>
    <!--/sequence-theme-->
    <!-- End of Sequence Modern Slider -->

<div style="margin-top: 5%"> </div>








<!-- 공지사항 -->
 
      <div class="row mar-b-60">
      
      <!--tab start-->
         <div class="col-lg-4 col-lg-offset-1 head-section" >
                <section class="tab wow fadeInLeft" >
                        <ul class="nav nav-tabs nav-justified ">
                            <li class="active">
                                <a data-toggle="tab" href="#news" style="font-size:16pt;"> 공지사항 </a>
                            </li>
                          
                        </ul>
                    <div class="panel-body">
                        <div class="tab-content tasi-tab">
                        <c:forEach  begin="0" end="2"  items="${list }" var="list"> 
                       
                       
                               <div id="news" class="tab-pane fade in active">
                                   <article class="media">
                                          <a class="pull-left thumb p-thumb">
                                           <img src="resources/img/라이언5.gif" >
                                          </a>
                                    
                                    
                                    <div class="media-body b-btm">
                                        <a href='/notice/read${pageMaker.makeQuery(pageMaker.cri.page)}&nno=${list.nno}' class=" p-head"  style="font-size: 14pt;">  ${list.title} </a>
                                        <p>  ${list.content}  </p>
                                    </div>
                                </article>
                              </div>
                              <p>
                         
                    </c:forEach>
                            
                         </div>
                     </div>
               </section>            
               <!--tab end-->
         </div>

      <!--Today Hanza start-->
         <div class="col-lg-5 col-lg-offset-1 head-section" style="margin-top: -1.5%">
            <div class="about-testimonial boxed-style about-flexslider " >
               <section class="slider wow fadeInRight">
               <ul class="nav nav-tabs nav-justified ">
                            <li class="active">
                                <a data-toggle="tab" href="#news" style="font-size:16pt;"> 오늘의 한자 </a>
                            </li>
                          
                        </ul>
               <div id="owl-demo" class="owl-carousel owl-theme wow fadeIn">

                  <c:forEach items="${Hanzalist}" var="hanzaVO">
                     <div class="item view view-tenth">
                        <div style="font-size: 90pt; text-align: center;">${hanzaVO.hanza}</div>
                        <div style="font-size: 15pt; text-align: center;">${hanzaVO.mean}</div>

                        <div class="mask">
                           <a
                              href="/hanza/searchlist/1?type=hanza&keyword=${hanzaVO.hanza}"
                              class="info" data-toggle="tooltip" data-placement="top"
                              title="${hanzaVO.grade}급"> <i class="fa fa-question">
                           </i>
                           </a>
                        </div>
                     </div>
                  </c:forEach>
               </div>

               </section>
            </div>
            <!--Today Hanza end-->
         </div>

      </div>
   
  
   
   
   <!-- 시험 일정 -->

  <div > 


   <div class="col-lg-6 col-lg-offset-1" style="margin-top: 5%" >
   
   <div class="bs-example" >
            <table class="table">
              <thead>
                <tr>
                  <th>
                    #
                  </th>
                  <th>
                       자격종목
                  </th>
                  <th>
                       시행처
                  </th>
                  <th>
                       수험정보
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>
                    1
                  </td>
                  <td>
                       상공회의소 한자
                  </td>
                  <td>
                       <a onclick="return (this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://license.korcham.net/" target="_blank">대한상공회의소</a>
                  </td>
                  <td>
                       <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.passon.co.kr/kcci/Single/S1Begin.asp" target="_blank" class="btn_txt"  style="margin-right:40px "><span>원서접수</span></a>
                       
                       <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://license.korcham.net/kor/license/schedule.jsp?cd=0401&amp;mm=53" target="_blank" class="btn_txt"  style="margin-right:40px "><span>시험일정</span></a>
                       
                       <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://license.korcham.net/kor/license/ref.jsp?cd=0401&amp;mm=53" target="_blank" class="btn_txt" style="margin-right:40px "><span>관련자료</span></a>
                       
                       <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.passon.co.kr/korcham/pass/SLogin.asp?sc_topmenu=3100" target="_blank" class="btn_txt" style="margin-right:40px "><span>합격자발표</span></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    2
                  </td>
                  <td>
                    한자능력검정
                  </td>
                  <td>
              <a onclick="return (this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.re.kr/" target="_blank">한국어문회</a>
                  </td>
                  <td>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hangum.re.kr/" target="_blank" class="btn_txt" style="margin-right:40px "><span>원서접수</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.re.kr/khes/khGuide/schedule.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>시험일정</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.re.kr/khes/khGuide/standard.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>출제기준</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.re.kr/khes/khRecord/fomPass.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>합격자발표</span></a>
                    
                  </td>
                </tr>
                <tr>
                  <td>
                    3
                  </td>
                  <td>
                    한자급수자격검정
                  </td>
                  <td>
                 <a onclick="href=http://www.hanja.ne.kr/" target="_blank">대한검정회</a>
                  </td>
                  <td>
                     
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.ne.kr/jupsu/jupsu01.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>원서접수</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.ne.kr/info/info01.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>시험일정</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.net/data/data01.asp" target="_blank" class="btn_txt" style="margin-right:40px "> <span>기출문제</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.hanja.ne.kr/announce/announce01.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>합격자발표</span></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    4
                  </td>
                  <td>
                  YBM 상무한검
                  </td>
                  <td>
                 <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.ybmsisa.com/" target="_blank">YBM시사</a>
                  </td>
                  <td>
                     
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="https://apphanja.ybmsisa.com/bizhanja/02_receipt.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>원서접수</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://apphanja.ybmsisa.com/bizhanja/01_schedule.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>시험일정</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://exam.ybmsisa.com/bizhanja/intro/01_introduction.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>출제기준</span></a>
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="https://exam.ybmsisa.com/bizhanja/score/score_front.asp" target="_blank" class="btn_txt" style="margin-right:40px "><span>합격자발표</span></a>
                  </td>
                </tr>
                 <tr>
                  <td>
                    5
                  </td>
                  <td>
                  한국한자검정
                  </td>
                  <td>
                 <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.ikpe.or.kr/" target="_blank">한국평생교육평가원</a>
                  </td>
                  <td>
                     
                    <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.ikpe.or.kr/hanja/request/online_request.asp?p_mode=hanja" target="_blank" class="btn_txt" style="margin-right:40px "><span>원서접수</span></a>
                   <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.ikpe.or.kr/hanja/introduction/schedule.asp?p_mode=hanja" target="_blank" class="btn_txt" style="margin-right:40px "><span>시험일정</span></a>
                   <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.ikpe.or.kr/hanja/question/question_info.asp?p_mode=hanja" target="_blank" class="btn_txt" style="margin-right:40px "><span>출제기준</span></a>
                   <a onclick="return goOtherCR(this,&quot;a=nco_x2h*1&amp;r=1&amp;i=&quot;+urlencode(&quot;00000015_0000000904D6&quot;)+&quot;&amp;u=&quot;+urlencode(this.href));" href="http://www.ikpe.or.kr/hanja/announcement/announcement.asp?p_mode=hanja" target="_blank" class="btn_txt" style="margin-right:40px "><span>합격자발표</span></a>
                  </td>
                </tr>
                <tr>
                <p class="ico_alert">※자세한 정보는 주관기관을 통해 확인하시기 바랍니다.</p>
                </tr>
              </tbody>
            </table>
          </div>
          </div>
<!-- 시험일정 end -->


<!-- 통계 start --> 
<div class="container" >

		<div class="row col-lg-offset-9" style="margin-top: 7%" >


    
      <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-info"><i class="glyphicon glyphicon-log-in"></i></div>
            <div class="update-text">오늘 방문자 수 ${visitToday }</div>
          </div>
        </div>
    
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split"><i class="glyphicon glyphicon-home"></i></div>
            <div class="update-text">전체 방문자 수 ${visitTotal }</div>
          </div>
        </div>

        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-success"><i class="glyphicon glyphicon-user"></i></div>
            <div class="update-text">회원 수 ${memberCount }</div>
          </div>
        </div>
        
          <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-success"><i class="glyphicon glyphicon-heart-empty"></i></div>
            <div class="update-text">자녀 수 ${childCount }</div>
          </div>
        </div>  
        
        <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-danger"><i class="glyphicon glyphicon-globe"></i></div>
            <div class="update-text">한자 수 ${hanzaCount }</div>
          </div>
        </div>  
        
         <div class="col-md-12">
          <div class="update-nag">
            <div class="update-split update-danger"><i class="glyphicon glyphicon-qrcode"></i></div>
            <div class="update-text">마커 수 ${markerCount }</div>
          </div>
        </div>       
        
   </div>
</div>
<!-- 통계 end-->

  
   
    </div>
    

<%@include file="/../resources/include/footer.jsp"%>

</body>
</html>