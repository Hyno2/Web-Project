<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javalex.ex.Session.SessionUtil"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Login</title>
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
		<a class="logo" href="index.jsp"><img src="images/klogo.jpg"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="index.jsp">홈</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="recurments.jsp">채용정보</a></li>
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
		<div class="login_text Last">
			<a href="select.do">마이페이지</a>
		</div>
		<div class="login_text">
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
	<!-- login section start-->
	<div class="services_section">
		<div class="container">
			<h1 class="services_text">로그인·회원가입</h1>
		</div>
	</div>
	<div class="login_section">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
					<div class="card card-signin my-5">
						<div class="card-body">
							<h5 class="card-title text-center">로그인</h5>
							<form action="login.do" class="form-signin">
								<div class="form-label-group">
									<input type="text" id="inputId" name="id" class="form-control"
										placeholder="Email address" required autofocus> <label
										for="inputId">아이디 입력</label>
								</div>

								<div class="form-label-group">
									<input type="password" id="inputPassword" name="pw"
										class="form-control" placeholder="Password" required>
									<label for="inputPassword">비밀번호 입력</label>
								</div>

								<button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">로그인 하기</button>
								<hr class="my-4">
								<!--<button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i>구글 계정으로 로그인 하기</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> 페이스북 계정으로 로그인 하기</button>-->
								<p>
									만약 계정이 없으시다면?<a href="SignUp.html"
										style="margin-left: 110px; color: blue"><b>회원가입</b></a>
								</p>
								<a href="#"
									onclick="window.open('searchID.html','아이디찾기','width =00','height=00' )">아이디찾기</a>
								<a href="#"
									onclick="window.open('searchPW.html','비밀번호찾기','width =00','height=00')">비밀번호찾기</a>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
	<!-- login section end-->

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
							Copyright 2020 All Right Reserved By.<a
								href="https://html.design"> Free html Templates</a>
						</p>
					</div>
					<div class="col-md-6">
						<p class="cookies_text">Cookies, Privacy and Terms</p>
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
		
		<script src="js/guestAlert.js"></script>
		 <script>
		 $(document).ready(function(){
      $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
      // 로그인 실패했을때
      var loginError = '<%= request.getParameter("loginError") %>';
      if (loginError === "true") {
          alert("입력하신 정보가 올바르지 않습니다.");
      }
   		// 로그아웃 성공 시에만 alert 표시
      var logoutSuccess = '<%= request.getParameter("logoutSuccess") %>';
      if (logoutSuccess === "true") {
          alert("로그아웃되었습니다.");
      }
      });
		 </script>
</body>
</html>