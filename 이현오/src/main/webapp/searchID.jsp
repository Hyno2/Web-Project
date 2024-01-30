<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
</head>
<body>
    <h1>아이디 찾기</h1>
    <form id="searchForm">
        이름: <input type="text" name="name"><br>
        휴대폰(- 제외): <input type="tel" name="hp"><br>
        <input type="button" value="찾기" onclick="searchId()">
    </form>

    <script>
        function searchId() {
            var formData = new FormData(document.getElementById("searchForm"));

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "searchID.do", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var responseText = xhr.responseText;

                    if (responseText === 'No matching IDs found.') {
                        alert("입력하신 이름 또는 휴대폰 번호와 일치하는 아이디를 찾을 수 없습니다.");
                    } else {
                        alert(" 아이디는 " + responseText+" 입니다.");
                        window.close();
                    }
                }
            };
            xhr.send(new URLSearchParams(formData));
        }
    </script>
</body>
</html>
