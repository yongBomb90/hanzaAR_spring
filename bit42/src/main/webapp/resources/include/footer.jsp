<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!--footer start-->
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-sm-3 address wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">
            <h1>
              contact info
            </h1>
            <address>
              <p><i class="fa fa-home pr-10"></i>Address: 강남역 5번출구 비트컹퓨터</p>
              <p><i class="fa fa-globe pr-10"></i>서울시, 대한민국 </p>
              <p><i class="fa fa-mobile pr-10"></i>Mobile : (010) 9171-1234 </p>
              <p><i class="fa fa-phone pr-10"></i>Phone : (02) 3486-3456 </p>
              <p><i class="fa fa-envelope pr-10"></i>Email :   <a href="javascript:;">team42@naver.com</a></p>
            </address>
          </div>
          <div class="col-lg-3 col-sm-3 wow fadeInUp" data-wow-duration="2s" data-wow-delay=".3s">
            <h1>latest tweet</h1>
              <div class="tweet-box">
                <i class="fa fa-twitter"></i>
                <em>
                  Please follow
                  <a href="javascript:;">@example</a>
                  for all future updates of us!
                  <a href="javascript:;">twitter.com/acme</a>
                </em>
              </div>
              <div class="tweet-box">
                <i class="fa fa-twitter"></i>
                <em>
                  Please follow
                  <a href="javascript:;">@example</a>
                  for all future updates of us!
                  <a href="javascript:;">twitter.com/acme</a>
                </em>
              </div>
              <div class="tweet-box">
                <i class="fa fa-twitter"></i>
                <em>
                  Please follow
                  <a href="javascript:;">@example</a>
                  for all future updates of us!
                  <a href="javascript:;">twitter.com/acme</a>
                </em>
              </div>
          </div>
          <div class="col-lg-3 col-sm-3">
            <div class="page-footer wow fadeInUp" data-wow-duration="2s" data-wow-delay=".5s">
              <h1>
                마법천자문
              </h1>
              <ul class="page-footer-list">                
                <li>
                  <i class="fa fa-angle-right"></i>
                  <a href="/board/list">게시판</a>
                </li>
                <li>
                  <i class="fa fa-angle-right"></i>
                  <a href="/qna/list">QnA</a>
                </li>
                <li>
                  <i class="fa fa-angle-right"></i>
                  <a href="/hanza/8,1">한자게시판</a>
                </li>
                <li>
                  <i class="fa fa-angle-right"></i>
                  <a href="/user/child/list/0">아이 정보</a>
                </li>
                <li>
                  <i class="fa fa-angle-right"></i>
                  <a href="/notice/list">공지사항</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3 col-sm-3">
            <div class="text-footer wow fadeInUp" data-wow-duration="2s" data-wow-delay=".7s">
              <h1>
                재밌는 한자 공부
              </h1>
              <p>
               만든사람들:
               
               </p>
               <p>
               김희선
               하정우
               권영준
               강민성
             
               </p>
               <p>
                   고은비
               박용범
               </p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- footer end -->
   

  <!-- js placed at the end of the document so the pages load faster
<script src="js/jquery.js">
</script>
-->
    <script src="/resources/js/jquery-1.8.3.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resources/js/hover-dropdown.js"></script>
    <script defer="" src="/resources/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="/resources/assets/bxslider/jquery.bxslider.js"></script>

    <script type="text/javascript" src="/resources/js/jquery.parallax-1.1.3.js"></script>
    <script src="/resources/js/wow.min.js"></script>
    <script src="/resources/assets/owlcarousel/owl.carousel.js"></script>


    <script src="/resources/js/jquery.easing.min.js">
    </script>
    <script src="/resources/js/link-hover.js">
    </script>
    <script src="/resources/js/superfish.js">
    </script>
    <script type="text/javascript" src="/resources/js/parallax-slider/jquery.cslider.js">
    </script>
    <script type="text/javascript">
    $(document).ready(function () {
	    
	      $(function() {
	
	        $('#da-slider').cslider({
	          autoplay    : true,
	          bgincrement : 100
	        });
	
	      });
      
    });
    </script>


    <script src="/resources/js/jquery.easing.min.js"></script>
    <script src="/resources/js/link-hover.js"></script>
    <script src="/resources/js/superfish.js"></script>



    <!--common script for all pages-->
    <script src="/resources/js/common-scripts.js">
    </script><i id="back-to-top"></i>

    <!-- Sequence Moder -slider js -->
    <script src="/resources/js/seq-slider/jquery.sequence-min.js">
    </script>
    <script src="/resources/js/seq-slider/sequencejs-options.sliding-horizontal-parallax.js">
    </script>
    <!-- end of sequence slider js-->

    <script type="text/javascript">
      jQuery(document).ready(function() {


        $('.bxslider1').bxSlider({
          minSlides: 5,
          maxSlides: 6,
          slideWidth: 360,
          slideMargin: 2,
          moveSlides: 1,
          responsive: true,
          nextSelector: '#slider-next',
          prevSelector: '#slider-prev',
          nextText: 'Onward →',
          prevText: '← Go back'
        });

      });


    </script>
    <script>
      $('a.info').tooltip();
      $(window).load(function() {
        $('.flexslider').flexslider({
          animation: "slide",
          start: function(slider) {
            $('body').removeClass('loading');
          }
        });
      });



      $(document).ready(function() {

        $("#owl-demo").owlCarousel({

          items : 4

        });

      });

      jQuery(document).ready(function(){
        jQuery('ul.superfish').superfish();
      });

      new WOW().init();


    </script>
    
    <script type="text/javascript">
    $(".loginbtn").on("click", function(){
    		self.location = "/login";
    })
    
    $(".cardbtn").on("click", function(){
    	self.location = "/play/";
    })
    
    $(".voicebtn").on("click", function(){
    	self.location = "/play/voice/gradedepth/0,0";
    })
    
    
      $('.chiceimg').on('click', function(){

          var formData = new FormData();
               
               
              var cno = $(event.target).attr("data-idx");
              var userid = $(event.target).attr("data-userid");
              var cname = $(event.target).attr("data-cname");
              var age = $(event.target).attr("data-age");
              var lv = $(event.target).attr("data-clv");
	   	      
              $("#briefInfo").attr("src",$(event.target).attr("src"));
              $("#childName").html(cname);
	   	      $("#childAge").html(age+"세");
	   	      $("#childLv").html(lv+"급");
	   	      
              console.log("선택: "+cno+userid);
                
              formData.append("userid",userid);
	       	  formData.append("cno", cno);

       
          
          $.ajax({
             url : '/user/child/choice',
             data : formData,
             datatype : 'text',
             processData : false,
             contentType : false,
             type : 'POST',
             success : function(data) {
				alert("선택 완료")


             }
          })  

      
             });
    
    </script>
  </body>
</html>