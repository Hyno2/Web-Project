<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.OutputStream" %>

<html>
<head>
    <title>채용정보 크롤링 예제</title>
</head>
<body>
    <h1>채용정보 크롤링 결과</h1>

    <%
        // 크롤링할 URL
        String url = "https://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&loc_mcd=104000%2C111000&cat_kewd=647%2C1401%2C1635%2C401%2C634%2C938%2C655%2C660%2C706%2C713%2C732%2C1263%2C1230";

        // JSoup을 사용하여 웹 페이지 가져오기
        Document doc = Jsoup.connect(url).get();
		
        // 제목과 날짜를 담을 리스트 생성
        List<String> titles = new ArrayList<>();    // 공고내용
        List<String> company = new ArrayList<> ();    // 회사이름
        List<String> dates = new ArrayList<>();    // 공고종료일자
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
            String companyUrl = "http://www.saramin.co.kr"+job.select("div.area_corp_info a.btn_info").attr("href"); 

            titles.add(title);
            dates.add(date);
            company.add(Company);
            condition.add(conditionText);
            update.add(updateDate);
            companyurl.add(companyUrl);
        }
    %>
    <table border="1">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>회사</th>
        <th>마감일</th>
        <th>고용형태</th>
        <th>수정일</th>
        <th>기업URL</th>
    </tr>

    <% for (int i = 0; i < 13; i++) { %>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= titles.get(i) %></td>
            <td><%= company.get(i) %></td>
            <td><%= dates.get(i) %></td>
            <td><%= condition.get(i) %></td>
            <td><%= update.get(i) %></td>
            <td><a href="<%= companyurl.get(i) %>">상세 보기</a></td>
        </tr>
    <% } %>
    </table>
</body>
</html>

