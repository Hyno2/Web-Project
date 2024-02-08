<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javalex.ex.Session.SessionUtil"%>
<%@ page import="com.javalex.ex.DAO.MemberDAO"%>
<%@ page import="com.javalex.ex.DTO.MemberDTO"%>
<%@ page import="java.util.ArrayList"%>
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
<title>My page</title>
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
<style>
.form_group {
	font-family: 'G마켓 산스 Medium';
	max-width: 510px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 150px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 30px;
	box-sizing: border-box;
}

input[type="button"], input[type="submit"], input[type="reset"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	font-size: 16px;
	top: -85px;
}

input[type="button"]:hover, input[type="submit"]:hover, input[type="reset"]:hover
	{
	background-color: #28d0ff;
}

.form_group .text-right {
	text-align: right;
	margin-top: 10px;
}

.form_group .btn-danger {
	background-color: #dc3545;
	color: #fff;
	border: none;
	padding: 10px 15px;
	border-radius: 3px;
	cursor: pointer;
	font-size: 16px;
}

.form_group .btn-danger:hover {
	background-color: #c82333;
}
</style>

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
	<!-- header section start-->
	<%
	String userId = SessionUtil.getLoginId(request);

	if (userId != null) {
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> userInfo = dao.MemberSelectById(userId);

		if (!userInfo.isEmpty()) {
			MemberDTO user = userInfo.get(0);
	%>

	<div class="services_section">
		<div class="container">
			<h1 class="services_text">나의 회원 정보</h1>
		</div>
	</div>

	<div class="services_section_2 layout_padding">
		<div class="container">
			<h1 class="companies_text">마이페이지</h1>
			<div class="services_item ">
				<div class="row"></div>
			</div>
		</div>
	</div>



	<div class="form_group">
		<form id="userInfoForm" action="update.do" method="post">
			<input type="hidden" id="id" name="id" value="<%=user.getId()%>">
			<label for="id">아이디:</label> <input type="text" id="id" name="id"
				value="<%=user.getId()%>" disabled><br> <label for="pw">비밀번호:</label>
			<input type="text" id="pw" name="pw" value="<%=user.getPw()%>"
				disabled><br> <label for="name">이름:</label> <input
				type="text" id="name" name="name" value="<%=user.getName()%>"
				disabled><br> <label for="hp">폰번호:</label> <input
				type="text" id="hp" name="hp" value="<%=user.getHp()%>" disabled><br>

			<label for="email">이메일:</label> <input type="text" id="email"
				name="email" value="<%=user.getEmail()%>" disabled><br>

			<input type="button" value="수정" onclick="enableEdit()"> <input
				type="submit" value="저장" style="display: none;"> <input
				type="button" value="취소" onclick="cancelEdit()"
				style="display: none;"> <br>
		</form>
		<div class="text-right">
			<a href="javascript:void(0);"
				onclick="confirmDelete('<%=user.getId()%>')" class="btn btn-danger">회원탈퇴</a>
		</div>
	</div>

	<!-- footer section start-->
	<div class="footer_section layout_padding">
		<div class="container">
			<h1 class="subscribr_text">구직정보 알림받기</h1>
			<p class="lorem_text">회원가입 없이도 구직정보를 받고싶으시다면 이메일을 입력해 주세요.</p>
			<div class="box_main_2">
				<form action="guest.do" method="post" id="guestForm">
					<input type="text" class="email_bt_2"
						placeholder="Enter Your Email" name="guestEmail" id="guestEmail">

					<input type="submit" value="입력" class="subscribe_bt_2"
						onclick="guestAlert()">
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
	<script>
             function confirmDelete(userId) {
                 var confirmResult = confirm("정말로 삭제하시겠습니까?");
                 if (confirmResult) {
                     // 예를 눌렀을 경우 userId를 delete.do에 전달
                     window.location.href = "delete.do?id=" + userId;
                 }
             }
         </script>

	<script>
    function enableEdit() {
        // 아이디를 제외한 다른 입력란만 활성화
        document.getElementById("pw").disabled = false;
        document.getElementById("name").disabled = false;
        document.getElementById("hp").disabled = false;
        document.getElementById("email").disabled = false;

        // "수정" 버튼 숨기고 "저장"과 "취소" 버튼 표시
        var editButton = document.querySelector('input[value="수정"]');
        var saveButton = document.querySelector('input[value="저장"]');
        var cancelButton = document.querySelector('input[value="취소"]');

        editButton.style.display = 'none';
        saveButton.style.display = 'inline';
        cancelButton.style.display = 'inline';
    }

    function cancelEdit() {
        // 폼의 입력 상태를 초기화하고 disabled 상태로 돌아감
        document.getElementById("pw").value = "<%=user.getPw()%>";
        document.getElementById("name").value = "<%=user.getName()%>";
        document.getElementById("hp").value = "<%=user.getHp()%>";
        document.getElementById("email").value = "<%=user.getEmail()%>";

        // 모든 입력란을 다시 disabled 상태로 변경
        document.getElementById("pw").disabled = true;
        document.getElementById("name").disabled = true;
        document.getElementById("hp").disabled = true;
        document.getElementById("email").disabled = true;

        // "수정" 버튼과 "저장", "취소" 버튼 순서대로 표시
        var editButton = document.querySelector('input[value="수정"]');
        var saveButton = document.querySelector('input[value="저장"]');
        var cancelButton = document.querySelector('input[value="취소"]');

        editButton.style.display = 'inline';
        saveButton.style.display = 'none';
        cancelButton.style.display = 'none';
    }
</script>

	<%
	}
	}
	%>
	<%
	// updateSuccess 파라미터가 true일 경우에만 알림창을 띄움
	String updateSuccess = request.getParameter("updateSuccess");
	if ("true".equals(updateSuccess)) {
	%>
	<script>
		alert("수정이 완료되었습니다.");
	</script>
	<%
	}
	%>
	<!-- 로그아웃 부분 -->
	<script>
		$(document).ready(function(){
		      $(".fancybox").fancybox({
		         openEffect: "none",
		         closeEffect: "none"
		         });
		      // 로그아웃 성공 시에만 alert 표시
		      var logoutSuccess = '<%= request.getParameter("logoutSuccess") %>';
		      if (logoutSuccess === "true") {
		          alert("로그아웃되었습니다.");
		      }
		      });
		        
		
		</script>

	<script src="js/guestAlert.js"></script>
	<script>
	 // 로그아웃 alert 띄우는 기능
	 document.addEventListener("DOMContentLoaded", function () {
	    // 로그아웃 성공 시에만 alert 표시
	    var logoutSuccess = '<%= request.getParameter("logoutSuccess") %>';
	    if (logoutSuccess === "true") {
	      alert("로그아웃되었습니다.");
	    }
	  });
	
	</script>


</body>