<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID 중복 확인</title>
    <script type="text/javascript">
        function sendCheckValue(result) {
            var openJoinfrm = opener.document.joinForm;

            if (result == "1") {
                alert("다른 아이디를 입력해주세요.");
                openJoinfrm.id.focus();
            } else if (result == "0") {
                // 중복체크 결과인 idCheck 값을 전달
                openJoinfrm.idDuplication.value = "idCheck";
                openJoinfrm.dbCheckId.disabled = true;
                openJoinfrm.dbCheckId.style.opacity = 0.6;
                openJoinfrm.dbCheckId.style.cursor = "default";
            } else {
                alert("중복 확인 중 오류가 발생했습니다.");
            }

            window.close();
        }
    </script>
</head>
<body>
    <!-- 중복 확인 결과를 서버에서 가져와서 사용하는 폼 -->
    <form name="checkIdForm">
        <input type="hidden" name="id" value="${param.id}" id="userId" disabled>

        <c:choose>
            <c:when test="${result eq '1'}">
                <p style="color: red">이미 사용 중인 아이디입니다.</p>
                <input type="hidden" name="chResult" value="N"/>
                <script>sendCheckValue("1");</script>
            </c:when>
            <c:when test="${result eq '0'}">
                <p style="color: red">사용가능한 아이디입니다.</p>
                <input type="hidden" name="chResult" value="Y"/>
                <script>sendCheckValue("0");</script>
            </c:when>
            <c:otherwise>
                <p>오류 발생(-1)</p>
                <input type="hidden" name="chResult" value="N"/>
                <script>sendCheckValue("-1");</script>
            </c:otherwise>
        </c:choose>

    </form>
</body>
</html>
