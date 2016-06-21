<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!--footer start-->
   
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