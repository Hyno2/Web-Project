<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javalex.ex.Session.SessionUtil" %>
<!DOCTYPE html>
<html lang="utf-8">
<head>

<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Pragma" content="no-cache">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>경북인</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">	
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets --> 
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesoeet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">

</head>
<body>
	<!-- header section start-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="logo" href="#"><img src="images/klogo.jpg"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                   <a class="nav-link" href="index.jsp">홈</a>
                </li>
                <li class="nav-item">
                   <a class="nav-link" href="search_jobs.jsp">채용정보</a>
                </li>
                <li class="nav-item">
                   <a class="nav-link" href="recurments.jsp">채용직별 구인</a>
                </li>
                <li class="nav-item">
                   <a class="nav-link" href="companies.jsp">기업정보</a>
                </li>
                <li class="nav-item">
                   <a class="nav-link" href="services.jsp">커리어상담</a>
                </li>
                
             </ul>
        </div>
                    <!-- 로그인 상태에 따라 다른 링크를 출력 -->
                    <% if (SessionUtil.checkLogin(request)) { %>
                     	<div class="login_text Last"><a href="select.do">마이페이지</a></div>
                        <div class="login_text"><a href="logout.do">로그아웃</a></div>
                    <% } else { %>
                        <div class="login_text"><a href="login.jsp">로그인</a></div>
                    <% } %>
              
    </nav>
	<!-- header section start-->
	<!-- banner section start-->
	<div class="banner_section layout_padding">
		<div class="container">
			<h1 class="best_taital">대구·경북 최고의 구직 플랫폼</h1>
			<div class="box_main">
				<!-- day0122 수정 검색할 때 결과가 사람인 페이지로 전달-->
			    <!--  <input type="" class="email_bt" placeholder="Search Job" name="">-->
			    <input type="text" id="search_result" onkeyup="if(window.event.keyCode==13){search()}" class="email_bt" placeholder="Search Job">
			    <button class="subscribe_bt" onclick="search()">검색하기</button>
				<!-- <button class="subscribe_bt"><a href="https://www.saramin.co.kr/zf_user/">검색하기</a></button> -->
				
		    </div>
		    <p class="there_text">나에게 딱 맞는 커리어만 매치! 경북인에서 새로운 기회를 제안 받고 기업정보, 연봉정보, 면접후기 등 취업, 채용에 꼭 필요한 정보를 확인해보세요.</p>
		    <div class="bt_main">
		    	<div class="discover_bt"><a href="#">더 알아보기</a></div>
		    </div>
		</div>
	</div>
	<!-- banner section end-->
	<!-- marketing section start-->
	<div class="marketing_section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="job_section">
					    <h1 class="jobs_text">서비스 및 판매업</h1>
					    <p class="dummy_text">서비스 및 판매업은 제품을 제공하는 것뿐만이 아니라, 주로 고객에 대한 서비스나 제품 판매를 중심으로 하는 산업입니다. 이 분야는 다양한 업종과 직종으로 이루어져 있으며, 소비자와 직접 상호 작용하는 산업군을 포함합니다.</p>
					    <div class="apply_bt"><a href="#">지원하기</a></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="image_1 padding_0"><img src="images/service.png"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- marketing section end-->
	<!-- Industrial section start-->
	<div class="marketing_section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="image_1 padding_0"><img src="images/img-2.png"></div>
				</div>
				<div class="col-md-6">
					<div class="job_section_2">
					    <h1 class="jobs_text">제조 및 건설업</h1>
					    <p class="dummy_text">제조 및 건설업은 제품을 생산하거나 건설 프로젝트를 진행하는 산업으로, 물리적인 제품이나 시설물을 만들어내는 활동을 포함합니다. 이 산업은 다양한 종류의 제조업과 건설업으로 나뉘며, 각각의 분야에서 다양한 직종이 존재합니다.</p>
					    <div class="apply_bt"><a href="#">지원하기</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Industrial section end-->
	<!-- Corporate section start-->
	<div class="marketing_section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="job_section">
					    <h1 class="jobs_text">사무 및 전문직</h1>
					    <p class="dummy_text">사무 및 전문 서비스는 주로 사무실 환경에서 일하는 업종들과 전문적인 서비스를 제공하는 업종들을 포함합니다. 이러한 분야는 다양한 직종이 있으며, 컴퓨터 및 기술을 활용하여 업무를 수행합니다.</p>
					    <div class="apply_bt"><a href="#">지원하기</a></div>
					</div>
				</div>
				<div class="col-md-6 padding_0">
					<div class="image_1"><img src="images/samu.png"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Corporate section end-->
	<!-- Government section start-->
	<div class="marketing_section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 padding_0">
					<div class="image_1"><img src="images/doctor.png"></div>
				</div>
				<div class="col-md-6">
					<div class="job_section_2">
					    <h1 class="jobs_text">교육 및 의료업</h1>
					    <p class="dummy_text">교육 및 의료업은 사회적으로 중요하며, 인간의 교육과 건강을 총괄하는 분야입니다. 각 분야는 전문적인 서비스와 다양한 직종들로 구성되어 있습니다.</p>
					    <div class="apply_bt"><a href="#">지원하기</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Government section end-->
	<!-- footer section start-->
	<div class="footer_section layout_padding">
		<div class="container">
			<h1 class="subscribr_text">구직정보 알림받기</h1>
			<p class="lorem_text">회원가입 없이도 구직정보를 받고싶으시다면 이메일을 입력해 주세요. </p>
			<div class="box_main_2">
			    <form action="guest.do" method="post">
			    <input type="text" class="email_bt_2" placeholder="Enter Your Email" name="guestEmail" id="guestEmail"> 
		     
		    <input type="submit" value="입력" class="subscribe_bt_2">
		    	</form>
		   		 </div>
		   
		</div>
	</div>
	<!-- footer section end-->
	<!-- copyright section start-->
	<div class="copyright_section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<p class="copyright_text">Copyright 2024 All Right Reserved By AI TEAM 2.<a href="http://www.kb.or.kr/">경북산업직업전문학교</a></p>
				</div>
				<div class="col-md-6">
					<p class="cookies_text"></p>
				</div>
			</div>
		</div>
	</div>
	<!-- copyright section end-->


    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <script src="js/searchResult.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <!-- javascript --> 
      <script src="js/owl.carousel.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
      <script src="js/logoutAlert.js"></script>


     
</body>
</html>