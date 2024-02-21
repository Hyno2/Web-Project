<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javalex.ex.Crawling.CompanyDTO"%>
<%@ page import="com.javalex.ex.Session.SessionUtil"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>


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
<title>직별 구인</title>
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
table {
	width: 100%;
	border-collapse: collapse;
}

 table, th, td {
	border: 1px solid #ddd;
} 

th, td {
	padding: 10px; /* 적절한 패딩 값으로 조절 */
	word-wrap: break-word; /* 글자가 셀 너비를 넘어갈 경우 줄 바꿈 처리 */
	max-width: 430px; /* 적절한 최대 너비 값으로 조절 */
}
</style>

</head>
<body>
<%
// 이 코드는 JSP 페이지 상단에 위치해야 합니다.

// 세션이 없거나 로그인되어 있지 않으면 경고창을 띄우고 로그인 페이지로 이동합니다.
if(SessionUtil.checkLogin(request) == false) {
    // JavaScript를 사용하여 경고창을 표시하고 페이지를 이동합니다.
%>
    <script type="text/javascript">
        alert("로그인이 필요한 서비스입니다.");
        window.location.href = "login.jsp";
    </script>
<%
    // 이후의 코드는 실행되지 않습니다.
    return;
}
%>
	<!-- header section start-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="logo" href="index.jsp"><img src="images/logooriginal.png"></a>
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
	<!-- header  section end-->
	<!-- Recurments  section start-->
	<div class="services_section">
		<div class="container">
			<h1 class="services_text">채용 정보 리스트</h1>
		</div>
	</div>
	<div class="services_section_2 layout_padding">
		<div class="container">
			<h1 class="companies_text">채용 정보</h1>
			<div class="services_item ">
				<div class="row"></div>
			</div>
		</div>
	</div>

	<!--  서비스및 판매업 -->
	<div class="Recurments_section_2">
		<div class="container">
			<div class="product_section">
				<div class="row padding_top_0">
					<div class="col-sm-2">
						<div class="one_text">
							<a href="#">01</a>
						</div>
					</div>

					<div class="col-sm-8">
						<h1 class="software_text">서비스 및 판매업</h1>
						<p class="lorem_ipsum_text">주로 고객에게 서비스를 제공하거나, 판매를 하는 일</p>
					</div>
					<!-- <div class="col-sm-2"> -->
					<button id="toggleRecruitInfoButton" class="apply_now"
						onclick="showRecruitInfo()">채용정보보기</button>

					<!-- 동적으로 추가될 채용정보 테이블 -->
					<div id="recruitInfoTable"></div>

					<!-- </div> -->
				</div>
			</div>
		</div>

		<!-- 제조 및 건설업 -->
		<div class="Recurments_section_2">
			<div class="container">
				<div class="product_section">
					<div class="row padding_top_0">
						<div class="col-sm-2">
							<div class="one_text">
								<a href="#">02</a>
							</div>
						</div>
						<div class="col-sm-8">
							<h1 class="software_text">제조 및 건설업</h1>
							<p class="lorem_ipsum_text">공정,제조 및 건설을 하는 일</p>
						</div>
						<!-- <div class="col-sm-2"> -->
						<button id="toggleRecruitInfoButton2" class="apply_now"
							onclick="showRecruitInfo2()">채용정보보기</button>

						<!-- 동적으로 추가될 채용정보 테이블 -->
						<div id="recruitInfoTable2"></div>
						<!-- 	</div> -->
					</div>
				</div>
			</div>

			<!-- 사무 및 전문직 -->
			<div class="Recurments_section_2">
				<div class="container">
					<div class="product_section">
						<div class="row padding_top_0">
							<div class="col-sm-2">
								<div class="one_text">
									<a href="#">03</a>
								</div>
							</div>
							<div class="col-sm-8">
								<h1 class="software_text">사무 및 전문직</h1>
								<p class="lorem_ipsum_text">행정,사무 및 전문기술을 가지고 하는 일</p>
							</div>
							<!-- <div class="col-sm-2"> -->
							<button id="toggleRecruitInfoButton3" class="apply_now"
								onclick="showRecruitInfo3()">채용정보보기</button>

							<!-- 동적으로 추가될 채용정보 테이블 -->
							<div id="recruitInfoTable3"></div>
							<!-- </div> -->
						</div>
					</div>
				</div>

				<!-- 교육 및 의료업 -->
				<div class="Recurments_section_2">
					<div class="container">
						<div class="product_section">
							<div class="row padding_top_0">
								<div class="col-sm-2">
									<div class="one_text">
										<a href="#">04</a>
									</div>
								</div>
								<div class="col-sm-8">
									<h1 class="software_text">교육 및 의료업</h1>
									<p class="lorem_ipsum_text">사람을 교육 및 의료서비스를 제공하는 일</p>
								</div>
								<!-- 	<div class="col-sm-2"> -->
								<button id="toggleRecruitInfoButton4" class="apply_now" onclick="showRecruitInfo4()">채용정보보기</button>
								<!-- 동적으로 추가될 채용정보 테이블 -->
								<div id="recruitInfoTable4"></div>
								<!-- 	</div> -->
							</div>
						</div>
					</div>
					<!-- Recurments  section end-->
					<!-- footer section start-->
					<div class="footer_section layout_padding">
						<div class="container">
							<h1 class="subscribr_text">구직정보 알림받기</h1>
							<p class="lorem_text">회원가입 없이도 구직정보를 받고싶으시다면 이메일을 입력해 주세요.</p>
							<div class="box_main_2">
								<form action="guest.do" method="post" id="guestForm">
									<input type="text" class="email_bt_2"
										placeholder="Enter Your Email" name="guestEmail"
										id="guestEmail"> <input type="submit" value="입력"
										class="subscribe_bt_2" onclick="guestAlert()">
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

					<script src="js/guestAlert.js"></script>
					<script>
		$(document).ready(function(){
		      $(".fancybox").fancybox({
		         openEffect: "none",
		         closeEffect: "none"
		         });
		      // 로그아웃 성공 시에만 alert 표시
		      var logoutSuccess = '<%=request.getParameter("logoutSuccess")%>';
		      if (logoutSuccess === "true") {
		          alert("로그아웃되었습니다.");
		      }
		      });
</script>
					<!-- 서비스 크롤링 -->
					<%
					// 크롤링할 URL들
					String url = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&loc_mcd=104000%2C111000&cat_kewd=647%2C1401%2C1635%2C401%2C634%2C938%2C655%2C660%2C706%2C713%2C732%2C1263%2C1230";

					// JSoup을 사용하여 웹 페이지 가져오기
					Document doc = Jsoup.connect(url).get();

					// 크롤링한 정보를 담을 리스트 생성
					List<CompanyDTO> companyDTO = new ArrayList<>();

					// 제목과 날짜를 담을 리스트 생성
					List<String> titles = new ArrayList<>(); // 공고내용
					List<String> company = new ArrayList<>(); // 회사이름
					List<String> dates = new ArrayList<>(); // 공고종료일자
					List<String> condition = new ArrayList<>(); // 고용형태(정규직 등)
					List<String> update = new ArrayList<>(); // 공고수정일
					List<String> companyurl = new ArrayList<>(); // 주소?

					// 채용 정보 추출
					Elements jobList = doc.select("div.item_recruit");

					for (Element job : jobList) {

						String title = job.select("h2.job_tit a").text();
						String date = job.select("div.job_date span.date").text();
						String Company = job.select("div.area_corp strong.corp_name a").text();
						String conditionText = job.select("div.job_condition span").text();
						String updateDate = job.select("div.job_sector span.job_day").text();
						String companyUrl = "http://www.saramin.co.kr" + job.select("div.area_corp_info a.btn_info").attr("href");

						titles.add(title);
						dates.add(date);
						company.add(Company);
						condition.add(conditionText);
						update.add(updateDate);
						companyurl.add(companyUrl);

						// 크롤링한 정보를 companyDTO 리스트에 추가
						companyDTO.add(new CompanyDTO(title, Company, date, conditionText, updateDate, companyUrl));
					}
					%>

					<script>
					
    function showRecruitInfo() {
        // 채용 정보를 담고 있는 JavaScript 배열
        var companyDTO = [
               <%-- 반복문을 사용하여 배열에 값 추가 --%>
            <%for (int i = 0; i < titles.size(); i++) {%>
            {
                title: "<%=titles.get(i)%>",
                company: "<%=company.get(i)%>",
                date: "<%=dates.get(i)%>",
                condition: "<%=condition.get(i)%>",
                update: "<%=update.get(i)%>",
                companyurl: "<%=companyurl.get(i)%>"
            },
            <%}%>
        ];

        // 테이블 생성 및 채용 정보 추가
        var tableHtml = '<table id="table" border="1"><tr><th>제목</th><th>회사</th><th>종료일자</th><th>고용형태</th><th>수정일</th><th>링크</th></tr>';
        
        for (var i = 0; i < companyDTO.length; i++) {
        	if(companyDTO[i].title!="" && companyDTO[i].company!="" && companyDTO[i].date!="" && companyDTO[i].condition!="" && companyDTO[i].update!="" && companyDTO[i].companyurl!=""){
            tableHtml += '<tr>';
            tableHtml += '<td>' + companyDTO[i].title + '</td>';
            tableHtml += '<td>' + companyDTO[i].company + '</td>';
            tableHtml += '<td>' + companyDTO[i].date + '</td>';
            tableHtml += '<td>' + companyDTO[i].condition + '</td>';
            tableHtml += '<td>' + companyDTO[i].update + '</td>';
            tableHtml += '<td><a href="' + companyDTO[i].companyurl + '" target="_blank">링크</a></td>';
            tableHtml += '</tr>';
        	}
        }
        tableHtml += '</table>';

        // 동적으로 추가된 테이블을 보여줄 위치에 삽입
        $('#recruitInfoTable').html(tableHtml);
    }
</script>

					<!-- 제조 및 건설업 크롤링 -->
					<%
					// 크롤링할 URL들
					String url2 = "https://www.saramin.co.kr/zf_user/search?loc_mcd=104000%2C111000&cat_mcls=22&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y";

					// JSoup을 사용하여 웹 페이지 가져오기
					Document doc2 = Jsoup.connect(url2).get();

					// 크롤링한 정보를 담을 리스트 생성
					List<CompanyDTO> companyDTO2 = new ArrayList<>();

					// 제목과 날짜를 담을 리스트 생성
					List<String> titles2 = new ArrayList<>(); // 공고내용
					List<String> company2 = new ArrayList<>(); // 회사이름
					List<String> dates2 = new ArrayList<>(); // 공고종료일자
					List<String> condition2 = new ArrayList<>(); // 고용형태(정규직 등)
					List<String> update2 = new ArrayList<>(); // 공고수정일
					List<String> companyurl2 = new ArrayList<>(); // 주소?

					// 채용 정보 추출
					Elements jobList2 = doc2.select("div.item_recruit");

					for (Element job2 : jobList2) {
						String title = job2.select("h2.job_tit a").text();
						String date = job2.select("div.job_date span.date").text();
						String Company = job2.select("div.area_corp strong.corp_name a").text();
						String conditionText = job2.select("div.job_condition span").text();
						String updateDate = job2.select("div.job_sector span.job_day").text();
						String companyUrl = "http://www.saramin.co.kr" + job2.select("div.area_corp_info a.btn_info").attr("href");

						titles2.add(title);
						dates2.add(date);
						company2.add(Company);
						condition2.add(conditionText);
						update2.add(updateDate);
						companyurl2.add(companyUrl);

						// 크롤링한 정보를 companyDTO 리스트에 추가
						companyDTO2.add(new CompanyDTO(title, Company, date, conditionText, updateDate, companyUrl));
					}
					%>

					<script>
    function showRecruitInfo2() {
        // 채용 정보를 담고 있는 JavaScript 배열
        var companyDTO2 = [
            <%-- 반복문을 사용하여 배열에 값 추가 --%>
            <%for (int i = 0; i < titles2.size(); i++) {%>
                {
                    title: "<%=titles2.get(i)%>",
                    company: "<%=company2.get(i)%>",
                    date: "<%=dates2.get(i)%>",
                    condition: "<%=condition2.get(i)%>",
                    update: "<%=update2.get(i)%>",
                    companyurl: "<%=companyurl2.get(i)%>"
                },
            <%}%>
        ];

        // 테이블 생성 및 채용 정보 추가
        var tableHtml2 = '<table border="1"><tr><th>제목</th><th>회사</th><th>종료일자</th><th>고용형태</th><th>수정일</th><th>링크</th></tr>';
        for (var i = 0; i < companyDTO2.length; i++) {
        	if(companyDTO2[i].title!="" && companyDTO2[i].company!="" && companyDTO2[i].date!="" && companyDTO2[i].condition!="" && companyDTO2[i].update!="" && companyDTO2[i].companyurl!=""){
            tableHtml2 += '<tr>';
            tableHtml2 += '<td>' + companyDTO2[i].title + '</td>';
            tableHtml2 += '<td>' + companyDTO2[i].company + '</td>';
            tableHtml2 += '<td>' + companyDTO2[i].date + '</td>';
            tableHtml2 += '<td>' + companyDTO2[i].condition + '</td>';
            tableHtml2 += '<td>' + companyDTO2[i].update + '</td>';
            tableHtml2 += '<td><a href="' + companyDTO2[i].companyurl + '" target="_blank">링크</a></td>';
            tableHtml2 += '</tr>';
        	}
        }
        tableHtml2 += '</table>';

        // 동적으로 추가된 테이블을 보여줄 위치에 삽입
        $('#recruitInfoTable2').html(tableHtml2);
    }
</script>

					<!-- 사무 및 전문직 크롤링 -->
					<%
					// 크롤링할 URL들
					String url3 = "https://www.saramin.co.kr/zf_user/search?loc_mcd=104000%2C111000&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&cat_mcls=4%2C3&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y";

					// JSoup을 사용하여 웹 페이지 가져오기
					Document doc3 = Jsoup.connect(url3).get();

					// 크롤링한 정보를 담을 리스트 생성
					List<CompanyDTO> companyDTO3 = new ArrayList<>();

					// 제목과 날짜를 담을 리스트 생성
					List<String> titles3 = new ArrayList<>(); // 공고내용
					List<String> company3 = new ArrayList<>(); // 회사이름
					List<String> dates3 = new ArrayList<>(); // 공고종료일자
					List<String> condition3 = new ArrayList<>(); // 고용형태(정규직 등)
					List<String> update3 = new ArrayList<>(); // 공고수정일
					List<String> companyurl3 = new ArrayList<>(); // 주소?

					// 채용 정보 추출
					Elements jobList3 = doc3.select("div.item_recruit");

					for (Element job3 : jobList3) {
						String title = job3.select("h2.job_tit a").text();
						String date = job3.select("div.job_date span.date").text();
						String Company = job3.select("div.area_corp strong.corp_name a").text();
						String conditionText = job3.select("div.job_condition span").text();
						String updateDate = job3.select("div.job_sector span.job_day").text();
						String companyUrl = "http://www.saramin.co.kr" + job3.select("div.area_corp_info a.btn_info").attr("href");

						titles3.add(title);
						dates3.add(date);
						company3.add(Company);
						condition3.add(conditionText);
						update3.add(updateDate);
						companyurl3.add(companyUrl);

						// 크롤링한 정보를 companyDTO 리스트에 추가
						companyDTO3.add(new CompanyDTO(title, Company, date, conditionText, updateDate, companyUrl));
					}
					%>

					<script>
    function showRecruitInfo3() {
        // 채용 정보를 담고 있는 JavaScript 배열
        var companyDTO3 = [
            <%-- 반복문을 사용하여 배열에 값 추가 --%>
            <%for (int i = 0; i < titles3.size(); i++) {%>
                {
                    title: "<%=titles3.get(i)%>",
                    company: "<%=company3.get(i)%>",
                    date: "<%=dates3.get(i)%>",
                    condition: "<%=condition3.get(i)%>",
                    update: "<%=update3.get(i)%>",
                    companyurl: "<%=companyurl3.get(i)%>"
                },
            <%}%>
        ];

        // 테이블 생성 및 채용 정보 추가
        var tableHtml3 = '<table border="1"><tr><th>제목</th><th>회사</th><th>종료일자</th><th>고용형태</th><th>수정일</th><th>링크</th></tr>';
        for (var i = 0; i < companyDTO3.length; i++) {
        	if(companyDTO3[i].title!="" && companyDTO3[i].company!="" && companyDTO3[i].date!="" && companyDTO3[i].condition!="" && companyDTO3[i].update!="" && companyDTO3[i].companyurl!=""){
            tableHtml3 += '<tr>';
            tableHtml3 += '<td>' + companyDTO3[i].title + '</td>';
            tableHtml3 += '<td>' + companyDTO3[i].company + '</td>';
            tableHtml3 += '<td>' + companyDTO3[i].date + '</td>';
            tableHtml3 += '<td>' + companyDTO3[i].condition + '</td>';
            tableHtml3 += '<td>' + companyDTO3[i].update + '</td>';
            tableHtml3 += '<td><a href="' + companyDTO3[i].companyurl + '" target="_blank">링크</a></td>';
            tableHtml3 += '</tr>';
        	}
        }
        tableHtml3 += '</table>';

        // 동적으로 추가된 테이블을 보여줄 위치에 삽입
        $('#recruitInfoTable3').html(tableHtml3);
    }
</script>


					<!-- 교욱 및 의료 크롤링 -->
					<%
					// 크롤링할 URL들
					String url4 = "https://www.saramin.co.kr/zf_user/search?loc_mcd=104000%2C111000&company_cd=0%2C1%2C2%2C3%2C4%2C5%2C6%2C7%2C9%2C10&cat_mcls=6%2C19&panel_type=&search_optional_item=y&search_done=y&panel_count=y&preview=y";

					// JSoup을 사용하여 웹 페이지 가져오기
					Document doc4 = Jsoup.connect(url4).get();

					// 크롤링한 정보를 담을 리스트 생성
					List<CompanyDTO> companyDTO4 = new ArrayList<>();

					// 제목과 날짜를 담을 리스트 생성
					List<String> titles4 = new ArrayList<>(); // 공고내용
					List<String> company4 = new ArrayList<>(); // 회사이름
					List<String> dates4 = new ArrayList<>(); // 공고종료일자
					List<String> condition4 = new ArrayList<>(); // 고용형태(정규직 등)
					List<String> update4 = new ArrayList<>(); // 공고수정일
					List<String> companyurl4 = new ArrayList<>(); // 주소?

					// 채용 정보 추출
					Elements jobList4 = doc4.select("div.item_recruit");

					for (Element job4 : jobList4) {
						String title = job4.select("h2.job_tit a").text();
						String date = job4.select("div.job_date span.date").text();
						String Company = job4.select("div.area_corp strong.corp_name a").text();
						String conditionText = job4.select("div.job_condition span").text();
						String updateDate = job4.select("div.job_sector span.job_day").text();
						String companyUrl = "http://www.saramin.co.kr" + job4.select("div.area_corp_info a.btn_info").attr("href");

						titles4.add(title);
						dates4.add(date);
						company4.add(Company);
						condition4.add(conditionText);
						update4.add(updateDate);
						companyurl4.add(companyUrl);

						// 크롤링한 정보를 companyDTO 리스트에 추가
						companyDTO4.add(new CompanyDTO(title, Company, date, conditionText, updateDate, companyUrl));
					}
					%>

					<script>
    function showRecruitInfo4() {
        // 채용 정보를 담고 있는 JavaScript 배열
        var companyDTO4 = [
            <%-- 반복문을 사용하여 배열에 값 추가 --%>
            <%for (int i = 0; i < titles4.size(); i++) {%>
                {
                    title: "<%=titles4.get(i)%>",
                    company: "<%=company4.get(i)%>",
                    date: "<%=dates4.get(i)%>",
                    condition: "<%=condition4.get(i)%>",
                    update: "<%=update4.get(i)%>",
                    companyurl: "<%=companyurl4.get(i)%>"
                },
            <%}%>
        ];

        // 테이블 생성 및 채용 정보 추가
        var tableHtml4 = '<table border="1"><tr><th>제목</th><th>회사</th><th>종료일자</th><th>고용형태</th><th>수정일</th><th>링크</th></tr>';
        for (var i = 0; i < companyDTO4.length; i++) {
        	if(companyDTO4[i].title!="" && companyDTO4[i].company!="" && companyDTO4[i].date!="" && companyDTO4[i].condition!="" && companyDTO4[i].update!="" && companyDTO4[i].companyurl!=""){
            tableHtml4 += '<tr>';
            tableHtml4 += '<td>' + companyDTO4[i].title + '</td>';
            tableHtml4 += '<td>' + companyDTO4[i].company + '</td>';
            tableHtml4 += '<td>' + companyDTO4[i].date + '</td>';
            tableHtml4 += '<td>' + companyDTO4[i].condition + '</td>';
            tableHtml4 += '<td>' + companyDTO4[i].update + '</td>';
            tableHtml4 += '<td><a href="' + companyDTO4[i].companyurl + '" target="_blank">링크</a></td>';
            tableHtml4 += '</tr>';
        	}
        }
        tableHtml4 += '</table>';

        // 동적으로 추가된 테이블을 보여줄 위치에 삽입
        $('#recruitInfoTable4').html(tableHtml4);
    }
</script>
<script>
$(document).ready(function() {
    // 첫 번째 버튼 클릭 시 테이블 토글
    $('#toggleRecruitInfoButton').click(function() {
        $('#recruitInfoTable').slideToggle(4000); 
    });

    // 두 번째 버튼 클릭 시 테이블 토글
    $('#toggleRecruitInfoButton2').click(function() {
        $('#recruitInfoTable2').slideToggle(4000);
    });

    // 세 번째 버튼 클릭 시 테이블 토글
    $('#toggleRecruitInfoButton3').click(function() {
        $('#recruitInfoTable3').slideToggle(4000);
    });

    // 네 번째 버튼 클릭 시 테이블 토글
    $('#toggleRecruitInfoButton4').click(function() {
        $('#recruitInfoTable4').slideToggle(4000);
    });

    // 초기에 테이블 숨기기
    $('#recruitInfoTable').hide();
    $('#recruitInfoTable2').hide();
    $('#recruitInfoTable3').hide();
    $('#recruitInfoTable4').hide();
});

</script>
</body>
</html>