<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ID 중복 확인</title>
    <script type="text/javascript" src="checkIdScript.js"></script>
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
