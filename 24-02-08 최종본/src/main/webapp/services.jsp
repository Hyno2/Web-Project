<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javalex.ex.Session.SessionUtil"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>커리어 상담</title>
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
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesoeet" href="css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">

</head>
<body>
	<!-- header section start-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="logo" href="#"><img src="images/logooriginal.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="index.jsp">홈</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="recurments.jsp">채용정보</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="companies.jsp">기업소개</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="services.jsp">커리어상담</a>
				</li>

			</ul>
		</div>
		<!-- 로그인 상태에 따라 다른 링크를 출력 -->
		<%
		if (SessionUtil.checkLogin(request)) {
		%>
		<div id="login_text_last" class="login_text Last">
			<a href="select.do">마이페이지</a>
		</div>
		<div id="login_text" class="login_text">
			<a href="logout.do">로그아웃</a>
		</div>
		<%
		} else {
		%>
		<div class="login_text">
			<a href="login.jsp">로그인</a>
		</div>
		<%
		}
		%>
	</nav>
	
	<!-- header section end-->
	<div class="services_section">
		<div class="container">
			<h1 class="services_text">커리어 및 취업 상담</h1>
		</div>
	</div>
	<div class="services_section_2 layout_padding">
		<div class="container">
			<h1 class="companies_text">상담 신청</h1>
			<center>
			<img src= "images/careermain.png"/>
			</center>
						<div class="join_bt">
							<div class="join_text">
								<p></p>
								<!-- 상담하기 버튼눌렀을때 구글 설문조사로 새 창 띄워줌 -->
								<a href="https://docs.google.com/forms/d/e/1FAIpQLScja7NzUpyWgtMLxTaL9oQS_7rifCiwgAeK-AYwauumP3AK1A/viewform?usp=sf_link"
								   target="_blank" >
								상담하기</a>
						</div>
					</div>
				</div>
			</div>
	<!-- footer section start-->
	<div class="footer_section layout_padding">
		<div class="container">
			<h1 class="subscribr_text">구직정보 알림받기</h1>
			<p class="lorem_text">회원가입 없이도 구직정보를 받고싶으시다면 이메일을 입력해 주세요. </p>
			<div class="box_main_2">
			    <form action="guest.do" method="post" id="guestForm">
			    <input type="text" class="email_bt_2" placeholder="Enter Your Email" name="guestEmail" id="guestEmail"> 
		     
		    <input type="submit" value="입력" class="subscribe_bt_2" onclick="guestAlert()">
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
					<p class="copyright_text">
						Copyright 2024 All Right Reserved By AI TEAM 2.<a
							href="http://www.kb.or.kr/">경북산업직업전문학교</a>
					</p>
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
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<!-- javascript -->
	<script src="js/owl.carousel.js"></script>
	<script
		src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
	<script src="js/logoutAlert.js"></script>
	<script src="js/guestAlert.js"></script>
	
</body>
</html>