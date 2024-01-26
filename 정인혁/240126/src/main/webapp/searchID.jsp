<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#searchID {
			text-align: center;
		}

		#name {
			margin-left: 200px;
		}

		#result {
			text-align: center;
			margin-top: 20px;
		}
	</style>
	<script>
		function searchId() {
			var name = document.getElementById("name").value;
			var hp = document.getElementById("hp").value;
			
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "searchID.do", true);
						
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.onreadystatechange = function () {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						var dtoList = xhr.responseText;
						console.log("서버 응답 값: " + dtoList);
						displayResult(dtoList);
					} else {
						console.error("서버 오류가 발생했습니다. 상태 코드: " + xhr.status);
					}
				}
			};

			var data = "name=" + encodeURIComponent(name) + "&hp=" + encodeURIComponent(hp);
			xhr.send(data);
			return false;
		}

		function displayResult(result) {
			console.log("displayResult 함수 호출: " + result);
			var resultContainer = document.getElementById("result");
			//if (!result || result.trim() === "not_found") {
			//	resultContainer.textContent = "일치하는 회원 정보를 찾을 수 없습니다.";
			//} else {
				alert("회원의 아이디는 " + <%=session.getAttribute("id")%> + "입니다.");
			}
		//}
	</script>
</head>

<body>
	<h1 id="searchID">아 이 디 찾 기</h1><br><br>
	<form onsubmit="return searchId();">
		이름: <input type="text" id="name" name="name"><br>
		휴대폰(-제외하고 입력해주세요): <input type="tel" name="hp" id="hp"><br>

		<input type="submit" value="찾기">
	</form>

	<div id="result"></div>
</body>
</html>